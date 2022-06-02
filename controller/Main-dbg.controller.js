/* eslint-disable no-console */
sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/MessageBox",
  "sap/ui/core/Fragment",
  'sap/ui/core/InvisibleMessage',
  'sap/ui/core/library'
], function (Controller, JSONModel, MessageBox, Fragment, InvisibleMessage, library) {
  "use strict";
  var InvisibleMessageMode = library.InvisibleMessageMode;
  const DEFAULT_PHOTO = 'sap-icon://person-placeholder';
  const EML_BASE_URL = "/rest/experience";
  return Controller.extend("workzone2.workzonehr.sap.sf.workflow.spotaward.controller.Main", {
    onInit: function () {
      this.oInvisibleMessage = InvisibleMessage.getInstance();
      this._wizard = this.byId("SpotAward");
      this._oNavContainer = this.byId("wizardNavContainer");
      this._oWizardContentPage = this.byId("wizardContentPage");
      this._oDescriptionPage = this.byId("descriptionPage");

      sap.ui.core.Fragment.load({
        name: "workzone2.workzonehr.sap.sf.workflow.spotaward.view.ApprovalStatus",
        controller: this,
        id: "wizardReviewFragment"
      }).then((approvalStatusPage) => {
        this.approvalStatusPage = approvalStatusPage;
        this._oNavContainer.addPage(this.approvalStatusPage);
      });

      this.initialContext();
    },

    initialContext: function () {
      var parameters = this.getOwnerComponent().getManifestEntry("sap.card").configuration.parameters;
      var view = this.getView();
      var model = new JSONModel();
      view.setModel(model);
      model.setProperty("/parameters", parameters);
      model.setProperty("/workflowDefinitionId", parameters.workflowDefinitionId.value);
      this._qualtricsURL = parameters.qualtricsURL.value;
      if (this._qualtricsURL) {
        model.setProperty("/needQualtrics", true);
      } else {
        model.setProperty("/needQualtrics", false);
      }

      model.setProperty("/useCustomOpt", false);
      model.setProperty("/spotAwardProgram", {});

      model.setProperty("/commentForReceiver", "");
      model.setProperty("/commentForApprovers", "");

      this.byId("msgToRecip").setValue("");
      this.byId("msgToApprover").setValue("");
    },

    navigateToWizardPage() {
      this._oNavContainer.to(this._oWizardContentPage);
    },

    handleWizardCancel() {
      this.backToWizard();
    },

    nominationSuggest: function (event) {
      this.candidateFlag = Math.random();
      var source = event.getSource();
      var view = this.getView();
      var model = view.getModel();
      var inputValue = event.getParameter("suggestValue");
      model.setProperty("/suggestItems", []);
      source.destroySuggestionItems();
      this.findCandidate(inputValue, 1, 0, model, this.candidateFlag);
    },
    /**
     * use this flag to avoid candidate model confict
     */
    candidateFlag: 0,

    /**
     * call SF API to search award candidate
     * @param inputValue user input in the UI
     * @param page for person search API pagenation
     * @param startIndex for person search API pagenation
     * @param model model for binding
     * @param candidateFlag flag to avoid candidate model confict
     */
    findCandidate: function (inputValue, page, startIndex, model, candidateFlag) {
      // ("data/personSimpleSearch.json")
      if (page == 1) {
        model.setProperty("/suggestItems", []);
      }
      let payload = {};
      payload.searchValue = inputValue;
      payload.page = page;
      payload.startIndex = startIndex;
      this.getOwnerComponent().card.request({
        url: `{{destinations.apiDestination}}${EML_BASE_URL}/workzone/v1/EmployeeInfo`,
        method: 'POST',
        withCredentials: true,
        parameters: payload
      }).then(result => {
        let noUserLabel = this.byId("noUserLabel");
        noUserLabel.setText("");
        let personList = new Array();
        let index = 0;
        result.items.forEach(i => {
          if (i.employments.length > 1) {
            i.employments.forEach(e => {
              personList[index] = {...i};
              personList[index].employments = new Array();
              personList[index].employments[0] = e;
              personList[index].assignmentId = e.assignmentId;
              index++;
            });
          } else {
            personList[index++] = i;
          }
        });
        var userIds = personList.map(i => `'${i.assignmentId}'`).join();
        if (!userIds && this.candidateFlag === candidateFlag) {
          let noUserText = this.getView().getModel("i18n").getResourceBundle().getText('NO_USER');
          noUserLabel.setText(noUserText);
          this.oInvisibleMessage.announce(noUserText, InvisibleMessageMode.Assertive);
          return;
        }
        for (let j = 0; j < personList.length; j++) {
          if (personList[j].photo === null) {
            personList[j].photo = DEFAULT_PHOTO;
          }
        }
        if (this.candidateFlag === candidateFlag) {
          model.setProperty("/suggestItems", model.getProperty("/suggestItems").concat(personList));
        }
        // has more person in next page
        if (result.hasMore && this.candidateFlag === candidateFlag) {
          this.findCandidate(inputValue, page + 1, personList[personList.length - 1].indexRef + 1, model, candidateFlag);
        }
      });
    },

    clearInput: function() {
      let searchInput = this.byId("searchInput");
      let noUserLabel = this.byId("noUserLabel");
      if(!searchInput.getValue()) {
        noUserLabel.setText("");
      }
    },

    addCandidate: function (event) {
      var view = this.getView();
      var model = view.getModel();
      var path = event.getParameters("selectedItem").selectedRow.getBindingContextPath();
      var candidate = model.getProperty(path);

      let positiveFunc = () => {
        if (!model.getProperty("/chosenEmployees")) {
          model.setProperty("/chosenEmployees", { 'assignmentIds': [], 'data': [] });
        }
        var chosenEmployees = model.getProperty("/chosenEmployees");
        if (!chosenEmployees.assignmentIds.includes(candidate.assignmentId)
          && candidate.name !== this.getView().getModel("i18n").getResourceBundle().getText('NO_USER')) {
          chosenEmployees.assignmentIds.push(candidate.assignmentId);
          chosenEmployees.data.push(candidate);
          this.byId("candidateList").getBinding("items").refresh(true);
          this.fetchSpotAwardProgram(chosenEmployees.assignmentIds);
        }
        this.byId("searchInput").setValue("");
      };
      this.confirmMessageforModifyProgress('SelectSpotAwardProgram', positiveFunc, () => this.byId("searchInput").setValue(""));
    },

    fetchSpotAwardProgram: function (assignmentIds) {
      var view = this.getView();
      var model = view.getModel();
      let programList = this.byId('spotAwardProgramGridList');
      programList.removeSelections(true);
      var selectSpotAwardProgramStep = this.byId("SelectSpotAwardProgram");
      selectSpotAwardProgramStep.setValidated(false);

      if (assignmentIds.length === 0) {
        model.setProperty("/spotAwardProgram", {});
      } else {
        programList.setBusy(true);

        let userIds = assignmentIds.join(',');

        // ("data/programByUser.json")
        this.getOwnerComponent().card.request({
          url: '{{destinations.apiDestination}}' + "/odatav4/SpotAwardService.svc/$batch",
          method: 'POST',
          withCredentials: true,
          batch: {
            default: {
              method: "GET",
              url: `getSpotAwardProgramsForUsers(userIds='${userIds}')?$format=json`,
              headers: {
                Accept: "application/json"
              }
            }
          }
        }).then(result => result.default)
          .then(result => {
            var spotAwardProgram = result.value;
            this.fetchSpotAwardProgramImage(spotAwardProgram);
            model.setProperty("/spotAwardProgram", spotAwardProgram);
            model.setProperty("/chosenSpotAwardProgram", {});
            model.refresh(true);
            programList.setBusy(false);
          }).catch(e => {
          this.getMessageBox4APIError();
        });
      }
    },

    fetchSpotAwardProgramImage: function (spotAwardPrograms) {
      let re = /attachmentId=\d*/;
      let attachmentIds = spotAwardPrograms.map(propram => {
        let id = null;
        if (propram.imageUrl) {
          let group = propram.imageUrl.match(re);
          if (group) {
            id = group[0].split('=')[1];
            propram.imageId = id;
          }
        }
        return id;
      }).filter(i => i).join(',');
      this.fetchImage(spotAwardPrograms, attachmentIds, 'imageId');
    },

    fetchImage: function (entities, attachmentIds, prop) {
      if (!attachmentIds) {
        return;
      }
      this.getOwnerComponent().card.request({
        url: `{{destinations.apiDestination}}/odata/v2/Attachment?$format=json&$select=attachmentId,fileContent,mimeType&$filter=attachmentId in ${attachmentIds}`,
        withCredentials: true
      }).then(response => {
        response.d.results.forEach(image => {
          entities.forEach(entity => {
            if (image.attachmentId === entity[`${prop}`]) {
              entity.image = image;
            }
          });
        });
        this.getView().getModel().refresh(true);
      });
    },

    deleteCandidate: function (asmIdDel) {
      var view = this.getView();
      var model = view.getModel();
      var chosenEmployees = model.getProperty("/chosenEmployees");

      let positiveFunc = () => {
        var index = chosenEmployees.assignmentIds.indexOf(asmIdDel);
        chosenEmployees.assignmentIds.splice(index, 1);
        for (let i = 0; i < chosenEmployees.data.length; i++) {
          if (chosenEmployees.data[i].assignmentId === asmIdDel) {
            index = i;
            break;
          };
        }
        chosenEmployees.data.splice(index, 1);
        this.byId("candidateList").getBinding("items").refresh(true);
        this.fetchSpotAwardProgram(chosenEmployees.assignmentIds);
      };
      this.confirmMessageforModifyProgress('SelectSpotAwardProgram', positiveFunc, () => { });
    },

    chooseSpotAwardProgram: function (event) {
      var item = event.getParameter("listItem");
      var path = item.getBindingContext().getPath();
      var view = this.getView();
      var model = view.getModel();
      let src = event.getSource();

      let positiveFunc = () => {
        var program = model.getProperty(path);
        let recordId = program.recordId;
        model.setProperty("/chosenSpotAwardProgram", program);
        model.setProperty("/chosenSpotAwardProgramItem", item.getId());

        // ("data/program.json")
        this.getOwnerComponent().card.request({
          url: '{{destinations.apiDestination}}' + "/odatav4/SpotAwardService.svc/SpotAwardProgram('" + recordId + "')?$format=json&$expand=categories,levels,advancedSettings&$select=recordId,categories,levels,advancedSettings",
          method: 'GET',
          withCredentials: true
        }).then(result => {
          model.getProperty("/chosenSpotAwardProgram").advancedSettings = result.advancedSettings;

          let categories = result.categories;
          model.setProperty("/spotAwardCategory", categories);

          let levels = result.levels;
          model.setProperty("/spotAwardLevel", levels);

          if (model.getProperty("/chosenSpotAwardProgram") && model.getProperty("/chosenEmployeesLength") > 0) {
            var selectSpotAwardProgramStep = this.byId("SelectSpotAwardProgram");
            selectSpotAwardProgramStep.setValidated(true);
          }

          this.fetchImage(categories, categories.map(i => i.categoryImage).filter(i => i).join(','), 'categoryImage');
          this.fetchImage(levels, levels.map(i => i.levelImage).filter(i => i).join(','), 'levelImage');
        }).catch(e => {
          var selectSpotAwardProgramStep = this.byId("SelectSpotAwardProgram");
          selectSpotAwardProgramStep.setValidated(false);
          this.getMessageBox4APIError();
        });

        if (model.getProperty("/chosenSpotAwardProgram") && model.getProperty("/chosenEmployees").assignmentIds.length > 0) {
          var selectSpotAwardProgramStep = this.byId("SelectSpotAwardProgram");
          selectSpotAwardProgramStep.setValidated(true);
        }
      };
      this.confirmMessageforModifyProgress('SelectSpotAwardProgram', positiveFunc, () => src.setSelectedItemById(model.getProperty('/chosenSpotAwardProgramItem')));
    },

    showProgramInformation: function (desc, event) {
      var button = event.getSource();

      // create popover
      sap.ui.core.Fragment.load({
        name: "workzone2.workzonehr.sap.sf.workflow.spotaward.view.ProgramDesc",
        controller: this
      }).then(function (popover) {
        this.getView().addDependent(popover);
        popover.setModel(new JSONModel({ info: desc }));
        popover.openBy(button);
      }.bind(this));
    },

    chooseSpotAwardCategory: function (event) {
      var item = event.getParameter("listItem");
      var path = item.getBindingContext().getPath();
      var view = this.getView();
      var model = view.getModel();
      let src = event.getSource();

      let positiveFunc = () => {
        model.setProperty("/chosenSpotAwardCategory", model.getProperty(path));
        model.setProperty("/chosenSpotAwardCategoryItem", item.getId());

        if (model.getProperty("/chosenSpotAwardCategory") && model.getProperty("/chosenSpotAwardLevel")) {
          var categoryLevelStep = this.byId("CategoryLevel");
          this.getSpotAwardGuidelineAmountForUser(categoryLevelStep);
        }
      };
      this.confirmMessageforModifyProgress('CategoryLevel', positiveFunc, () => src.setSelectedItemById(model.getProperty('/chosenSpotAwardCategoryItem')));
    },

    chooseSpotAwardLevel: function (event) {
      var item = event.getParameter("listItem");
      var path = item.getBindingContext().getPath();
      var view = this.getView();
      var model = view.getModel();
      let src = event.getSource();

      let positiveFunc = () => {
        model.setProperty("/chosenSpotAwardLevel", model.getProperty(path));
        model.setProperty("/chosenSpotAwardLevelItem", item.getId());

        if (model.getProperty("/chosenSpotAwardCategory") && model.getProperty("/chosenSpotAwardLevel")) {
          var categoryLevelStep = this.byId("CategoryLevel");
          this.getSpotAwardGuidelineAmountForUser(categoryLevelStep);
        }
      };
      this.confirmMessageforModifyProgress('CategoryLevel', positiveFunc, () => src.setSelectedItemById(model.getProperty('/chosenSpotAwardLevelItem')));
    },

    getSpotAwardGuidelineAmountForUser: function(CategoryLevelStep) {
      var view = this.getView();
      var model = view.getModel();

      // TODO: categoryCode and levelCode will be used to fetch the rule
      // TODO: the user id is also used to fetch the rule
      var program = model.getProperty("/chosenSpotAwardProgram");
      var programCode = program.recordId;

      var category = model.getProperty("/chosenSpotAwardCategory");
      var categoryCode = category.recordId;

      var level = model.getProperty("/chosenSpotAwardLevel");
      var levelCode = level.recordId;

      var chosenEmployees = model.getProperty("/chosenEmployees/data");
      var userIds = chosenEmployees.map(e => e.assignmentId).join(",");

      let filter = "programId='" + programCode + "',categoryId='" + categoryCode + "',levelId='" + levelCode + "',userIds='" + userIds + "'";
      // ("data/getSpotAwardGuidelineAmountForUser.json")
      this.getOwnerComponent().card.request({
        url: '{{destinations.apiDestination}}' + "/odatav4/SpotAwardService.svc/$batch",
        method: 'POST',
        withCredentials: true,
        batch: {
          default: {
            method: "GET",
            url: `getSpotAwardGuidelineAmountForUser(${filter})?$format=json`,
            headers: {
              Accept: "application/json"
            }
          }
        }
      }).then(result => result.default)
        .then(result => {
          model.setProperty("/spotAwardGuidelineAmount", result);
          CategoryLevelStep.setValidated(true);
      }).catch(e => {
        this.getMessageBox4APIError();
        CategoryLevelStep.setValidated(false);
      });
    },

    beforeAmountStep: function (event) {
      var item = event.getSource();
      var view = this.getView();
      var model = view.getModel();
      // TODO: categoryCode and levelCode will be used to fetch the rule
      // TODO: the user id is also used to fetch the rule
      var program = model.getProperty("/chosenSpotAwardProgram");
      var chosenEmployees = model.getProperty("/chosenEmployees/data");
      var custome = this.getView().getModel("i18n").getResourceBundle().getText('STEP3_CUSTOM_AMOUNT');
      let result = model.getProperty("/spotAwardGuidelineAmount");
      var guideLineRules = result.value;
      chosenEmployees.forEach(chosenEmployee => {
        guideLineRules.forEach(guideLineRule => {
          if (chosenEmployee.assignmentId === guideLineRule.userId) {
            let originalPossibleAmounts = guideLineRule.possibleAmounts;

            let amountList = [];
            guideLineRule.possibleAmounts.forEach(amount => {
              amountList.push({ amountKey: amount, amountText: amount });
            });
            if (program.advancedSettings.canOverrideGuidelineAmount) {
              amountList.push({ amountKey: "CUSTOM", amountText: custome });
            }
            guideLineRule.possibleAmounts = amountList;
            chosenEmployee.ruleInfo = guideLineRule;
            chosenEmployee.amountSelection = guideLineRule.recommendedAmount;
            chosenEmployee.maxGuidelineAmount = Math.max.apply(null, originalPossibleAmounts);
            this.setEmployeeAmount(chosenEmployee, guideLineRule.recommendedAmount);
          }
        });
      });
      item.setBusy(false);
      model.refresh(true);
    },

    storeAmount: function (event) {
      let model = this.getView().getModel();
      let inputAmount = event.getSource();
      let amountPath = inputAmount.getBindingContext().getPath();
      let employee = model.getProperty(amountPath);

      let positiveFunc = () => {
        console.log("amountPath", amountPath);
        let amountSelection = inputAmount.getSelectedKey();
        employee.amountSelection = amountSelection;
        this.setEmployeeAmount(employee, amountSelection === 'CUSTOM' ? employee.customAmount : amountSelection);
      };

      this.confirmMessageforModifyProgress('Amount', positiveFunc, () => inputAmount.setSelectedKey(employee.amountSelection));
    },

    storeCustomAmount: function (event, value) {
      let model = this.getView().getModel();
      let inputAmount = event.getSource();
      let path = inputAmount.getBindingContext().getPath();
      let chosenEmployee = model.getProperty(path);

      let positiveFunc = () => {
        chosenEmployee.customAmount = value;
        this.setEmployeeAmount(chosenEmployee, value);
      };

      this.confirmMessageforModifyProgress('Amount', positiveFunc, () => inputAmount.setValue(chosenEmployee.amount));
      // let possibleAmounts = chosenEmployee.ruleInfo.possibleAmounts;
      // let minValue = parseFloat(possibleAmounts[0].amountKey);
      // let maxValue = parseFloat(possibleAmounts[possibleAmounts.length - 2].amountKey);
      // if (value && (value >= minValue && value <= maxValue)) {
      //     chosenEmployee.amount = value;
      //     this.byId("Amount").setValidated(true);
      //     src.setValueState("Success");
      // } else {
      //     let errorMSG = this.getView().getModel("i18n").getResourceBundle().getText('STEP3_INVALID_AMOUNT_MSG', [minValue, maxValue]);
      //     src.setValueState("Error");
      //     src.setValueStateText(errorMSG);
      //     this.byId("Amount").setValidated(false);
      // }
    },

    validateDescStep: function () {
      var view = this.getView();
      var model = view.getModel();
      var descStep = this.byId("Description");
      let useCustomOpt = model.getProperty("/useCustomOpt");
      let msgToRecip = this.byId("msgToRecip");
      let msgToApprover = this.byId("msgToApprover");
      let msgToRecipLen = msgToRecip.getValue().length > 0;
      let msgToApproverLen = msgToApprover.getValue().length > 0;
      if ((msgToRecipLen && useCustomOpt && msgToApproverLen) || (msgToRecipLen && !useCustomOpt)) {
        descStep.setValidated(true);
      } else {
        descStep.setValidated(false);
      }
      let negtiveFunc = () => {
        msgToRecip.setValue(model.getProperty("/commentForReceiver"));
        msgToApprover.setValue(model.getProperty("/commentForApprovers"));
      };
      this.confirmMessageforModifyProgress('Description', () => { }, negtiveFunc);
    },

    completeDescStep: function () {
      var view = this.getView();
      var model = view.getModel();
      model.setProperty("/commentForReceiver", this.byId("msgToRecip").getValue());
      model.setProperty("/commentForApprovers", this.byId("msgToApprover").getValue());
    },

    completeWizard: function () {
      let wizardBusy = this.byId("SpotAward");
      wizardBusy.setBusyIndicatorDelay(0);
      wizardBusy.setBusy(true);
      var context = this;
      var view = this.getView();
      var model = view.getModel();

      var card = this.getOwnerComponent().card;
      let loginUser = card.getCombinedParameters().loginUser;

      var chosenEmployee = model.getProperty("/chosenEmployees/data");

      var program = model.getProperty("/chosenSpotAwardProgram").internalId.toString();
      var category = model.getProperty("/chosenSpotAwardCategory");
      var categoryCode = category.categoryInternalId.toString();
      var level = model.getProperty("/chosenSpotAwardLevel");
      var levelCode = level.levelInternalId.toString();

      var commentForReceiver = model.getProperty("/commentForReceiver");
      var commentForApprovers = model.getProperty("/commentForApprovers");

      var upsertedSpotAward = [];
      model.setProperty("/upsertedSpotAward", upsertedSpotAward);

      var upsertedWfRequestId = [];
      model.setProperty("/upsertedWfRequestId", upsertedWfRequestId);

      for (let i = 0; i < chosenEmployee.length; i++) {
        let payload = {};
        const candidate = chosenEmployee[i];
        payload.spotAwardProgram = program;
        payload.category = categoryCode;
        payload.level = levelCode;
        payload.commentForReceiver = commentForReceiver;
        payload.awardAmount = candidate.amount;
        payload.currency = candidate.ruleInfo.currency;
        payload.userId = candidate.assignmentId;

        if (candidate.isMsgToApproverRequired) {
          payload.commentForApprovers = commentForApprovers;
        }

        // fetch("data/upsertResult.json")
        card.request({
          url: '{{destinations.apiDestination}}' + "/odatav4/SpotAwardService.svc/SpotAward",
          headers: {
            "content-type": "application/json"
          },
          method: 'POST',
          withCredentials: true,
          parameters: payload
        })
          .then(result => {
            let recordId = result.recordId;
            upsertedSpotAward.push(recordId);
            candidate.recordId = recordId;

            wizardBusy.setBusy(false);
            context._oNavContainer.to(context.approvalStatusPage);

            // fetch("data/spotAward.json")
            card.request({
              url: '{{destinations.apiDestination}}' + "/odatav4/SpotAwardService.svc/SpotAward('" + recordId + "')?$format=json",
              method: 'GET',
              withCredentials: true
            })
              .then(result => {
                let externalCode = result.externalCode;

                // EML API SpotAwardWorkflowRequestId
                card.request({
                  url: '{{destinations.apiDestination}}' + EML_BASE_URL + "/workzone/v1/SpotAwardWorkflowRequestId?externalCode=" + externalCode,
                  method: 'GET',
                  withCredentials: true
                })
                  .then(result => {
                    let wfRequestId = result.getSpotAwardWorkflowRequestId;
                    candidate.wfRequestId = wfRequestId;
                    if (!wfRequestId) {
                      return;
                    }
                    upsertedWfRequestId.push(wfRequestId);
                    let workflowDefinitionId = model.getProperty("/workflowDefinitionId");
                    var instancePayload = {
                      definitionId: workflowDefinitionId,
                      context: { wfRequestId: wfRequestId, recordId: recordId, nominatorId: loginUser }
                    };
                    model.setProperty("/tokenStatus", true);
                    card.request({
                      url: '{{destinations.wfDestination}}/rest/v1/workflow-instances',
                      headers: { 'Content-Type': 'application/json' },
                      method: 'POST',
                      withCredentials: true,
                      parameters: instancePayload
                    });
                  }).catch(e => {
                    this.getMessageBox4APIError();
                    wizardBusy.setBusy(false);
                  });
              }).catch(e => {
                this.getMessageBox4APIError();
                wizardBusy.setBusy(false);
              });
          })
          .catch(e => {
            this.getMessageBox4APIError();
            wizardBusy.setBusy(false);
          });
      }
    },

    getWorkflowStatus: function (event) {

      if (event.getParameters().toId !== "wizardReviewFragment--wizardReviewPage") {
        return;
      }

      var view = this.getView();
      var model = view.getModel();
      let i18nModel = view.getModel("i18n");
      var chosenEmployees = model.getProperty("/chosenEmployees/data");

      var pollingId = setInterval(Polling, 3000, model);
      this._pollingId = pollingId;
      var oCard = this.getOwnerComponent().card;
      function Polling(model) {
        // ("data/spotAwardStatus.json")
        var upsertedSpotAward = model.getProperty("/upsertedSpotAward");
        var codes = "'" + upsertedSpotAward.join("','") + "'";
        oCard.request({
          url: `{{destinations.apiDestination}}/odatav4/SpotAwardService.svc/SpotAward?$format=json&$select=approvalStatus&$filter=recordId in (${codes})`,
          method: 'GET',
          withCredentials: true
        }).then(function (result) {
            let allApproved = true;
            let items = result.value;
            items.forEach(item => {
              if (item.approvalStatus !== "APPROVED" && item.approvalStatus !== "REJECTED") {
                allApproved = false;
              }
              chosenEmployees.forEach(employee => {
                if (employee.recordId === item.recordId) {
                  switch (item.approvalStatus) {
                    case 'INPROCESS':
                      employee.statusInfo = i18nModel.getResourceBundle().getText('WORKFLOW_STATUS_INFO_INPROGRESS');
                      employee.statusInfoState = 'Information';
                      break;
                    case 'APPROVED':
                      employee.statusInfo = i18nModel.getResourceBundle().getText('WORKFLOW_STATUS_INFO_APPROVED');
                      employee.statusInfoState = 'Success';
                      break;
                    case 'REJECTED':
                      employee.statusInfo = i18nModel.getResourceBundle().getText('WORKFLOW_STATUS_INFO_REJECTED');
                      employee.statusInfoState = 'Error';
                      break;
                  }
                }
              });
            });
            model.refresh(true);
            if (allApproved) {
              clearInterval(pollingId);
            }
          });

        // get workflow comment for approved and rejected status
        let wfRequestIds = model.getProperty("/upsertedWfRequestId").join(',');
        if (!wfRequestIds || !wfRequestIds.length) {
          return;
        }
        oCard.request({
          url: `{{destinations.apiDestination}}/odata/v2/WfRequestComments?$format=json&$filter=actionType in 'DECLINE','APPROVE' and wfRequestId in ${wfRequestIds}&$orderby=lastModifiedDateTime&$select=wfRequestCommentId,wfRequestId,wfRequestStepId,comments,lastModifiedDateTime,actionType`,
          method: 'GET',
          withCredentials: true
        }).then(function (result) {
            let items = result.d.results;
            items.forEach(item => {
              chosenEmployees.forEach(employee => {
                if (employee.wfRequestId === item.wfRequestId) {
                  employee.comments = item.comments;
                }
              });
            });
            model.refresh(true);
          });
      }
      this.renderQualtrics();
    },

    backToWizard: function () {
      clearInterval(this._pollingId);
      var wizard = this.byId("SpotAward");
      var firstStep = wizard.getSteps()[0];
      wizard.discardProgress(firstStep);
      firstStep.setValidated(false);
      wizard.goToStep(firstStep);
      this.initialContext();
      this.getView().getModel().refresh(true);
      this._oNavContainer.to(this._oDescriptionPage);
    },

    renderQualtrics: function () {
      var oChild = document.createElement("DIV");
      console.log("onAfterRendering --------");
      oChild.setAttribute("id", "spotAwardInsertion---app--awardLink");
      setTimeout(() => {
        sap.ui.core.Fragment.byId("wizardReviewFragment", "awardLink").getDomRef().appendChild(oChild);
        this.embedWebsiteFeedbackStarter();
        this.registerWebsiteFeedbackLoadedEvent();
      }, 200);
    },

    embedWebsiteFeedbackStarter: function () {
      /* eslint-disable */
      //BEGIN QUALTRICS WEBSITE FEEDBACK SNIPPET
      console.log("embedWebsiteFeedbackStarter --------");

      let qualtricsURL = this._qualtricsURL;
      let qualtricsParam = 'QSI_S_' + qualtricsURL.split('=')[1];

      var g = function (e, h, f, g) {
        this.get = function (a) { for (var a = a + "=", c = document.cookie.split(";"), b = 0, e = c.length; b < e; b++) { for (var d = c[b]; " " == d.charAt(0);)d = d.substring(1, d.length); if (0 == d.indexOf(a)) return d.substring(a.length, d.length) } return null };
        this.set = function (a, c) { var b = "", b = new Date; b.setTime(b.getTime() + 6048E5); b = "; expires=" + b.toGMTString(); document.cookie = a + "=" + c + b + "; path=/; " };
        this.check = function () { var a = this.get(f); if (a) a = a.split(":"); else if (100 != e) "v" == h && (e = Math.random() >= e / 100 ? 0 : 100), a = [h, e, 0], this.set(f, a.join(":")); else return !0; var c = a[1]; if (100 == c) return !0; switch (a[0]) { case "v": return !1; case "r": return c = a[2] % Math.floor(100 / c), a[2]++, this.set(f, a.join(":")), !c }return !0 };
        this.go = function () { if (this.check()) { var a = document.createElement("script"); a.type = "text/javascript"; a.src = g; document.body && document.body.appendChild(a) } };
        this.start = function () { var t = this; "complete" !== document.readyState ? window.addEventListener ? window.addEventListener("load", function () { t.go() }, !1) : window.attachEvent && window.attachEvent("onload", function () { t.go() }) : t.go() };
      };
      try { (new g(100, "r", qualtricsParam, qualtricsURL)).start() } catch (i) { }
      // //END WEBSITE FEEDBACK SNIPPET
      /* eslint-enable */
    },

    registerWebsiteFeedbackLoadedEvent: function () {
      //Make sure to be notified once intercept API has been loaded
      /* eslint-disable sap-forbidden-window-property*/
      var i = 1;
      window.addEventListener(
        "qsi_js_loaded",
        interceptLoaded,
        false
      );
      function interceptLoaded() {
        console.log("pre " + i);
        if (i === 1) {
          var oFeedBack = document.getElementById("spotAwardInsertion---app--awardLink");
          oFeedBack.setAttribute("height", "450px");
          if (QSI.API) {
            QSI.API.unload();
            QSI.API.load();
          }
          i = i - 1;
          console.log("after " + i);
        }
      };
      /* eslint-enable sap-forbidden-window-property*/
    },

    setEmployeeAmount(employee, amount) {
      amount = parseFloat(amount);
      amount = (!amount && amount !== 0) ? null : amount;

      employee.amount = amount;
      let chosenProgram = this.getView().getModel().getProperty("/chosenSpotAwardProgram");
      if (chosenProgram) {
        employee.isMsgToApproverRequired = this.isMsgToApproverRequiredFor(employee, chosenProgram);
        this.validateAmountStep();
        this.updateMsgToApproverBox();
      }
      this.getView().getModel().refresh();
    },

    isMsgToApproverRequiredFor(employee, chosenProgram) {
      const advancedSettings = chosenProgram.advancedSettings;
      const messageToApproverVisibility = advancedSettings.messageToApproverVisibility;

      if (!messageToApproverVisibility) {
        console.error("No valid messageToApproverVisibility found:", messageToApproverVisibility);
        return false;
      }

      let bMsgToApproverRequired = false;

      switch (messageToApproverVisibility) {
        case "ALWAYS":
          bMsgToApproverRequired = true;
          break;

        case "NEVER":
          bMsgToApproverRequired = false;
          break;

        case "WHEN_RECOMMENDED_AMOUNT_OVERRIDDEN":
          bMsgToApproverRequired = employee.amount > employee.maxGuidelineAmount;
          break;

        default:
          console.error("unknown messageToApproverVisibility");
          bMsgToApproverRequired = false;
      }

      return bMsgToApproverRequired;
    },

    updateMsgToApproverBox() {
      const model = this.getView().getModel();

      let bMsgToMessageBoxShouldShow = false;

      const chosenEmployees = model.getProperty("/chosenEmployees/data");

      if (chosenEmployees && chosenEmployees.length) {
        bMsgToMessageBoxShouldShow = chosenEmployees.reduce((acc, cur) => acc || cur.isMsgToApproverRequired, false);
      }

      model.setProperty("/useCustomOpt", bMsgToMessageBoxShouldShow);
    },

    validateAmountStep() {
      const chosenEmployees = this.getView().getModel().getProperty("/chosenEmployees/data");
      let bValid = false;

      if (chosenEmployees && chosenEmployees.length) {
        bValid = chosenEmployees.reduce(
          (isValid, currentEmployee) => isValid && (currentEmployee.amount >= 0 && currentEmployee.amount !== null), true);
      }

      this.byId("Amount").setValidated(bValid);
    },

    getMessageBox4APIError: function () {
      MessageBox.warning(this.getView().getModel("i18n").getResourceBundle().getText('API_ERROR_INFO'));
    },

    confirmMessageforModifyProgress: function (wizardStepId, positiveHandlerFunc, negativeHandlerFunc) {
      let wizard = this.byId('SpotAward');
      let wizardStep = this.byId(wizardStepId);
      if (wizard.getCurrentStep() === wizardStep.getId()) {
        positiveHandlerFunc();
      } else {
        let msg = this.getView().getModel("i18n").getResourceBundle().getText('SPOT_AWARD_MODIFY_PROGRESS');
        MessageBox.confirm(msg, {
          onClose: (action) => this.confirmMessageAction(action, wizard, wizardStep, wizardStepId, positiveHandlerFunc, negativeHandlerFunc)
        });
      }
    },

    confirmMessageAction: function (action, wizard, wizardStep, wizardStepId, positiveHandlerFunc, negativeHandlerFunc) {
      if (MessageBox.Action.OK === action) {
        wizard.discardProgress(wizardStep);
        this.cleanSucceedingStepData(wizardStepId);
        positiveHandlerFunc();
      } else {
        negativeHandlerFunc();
      }
    },

    cleanSucceedingStepData: function (wizardStepId) {
      let model = this.getView().getModel();
      let cleanCategoryLevel = () => {
        this.byId('spotAwardCategoryGridList').removeSelections(true);
        this.byId('spotAwardLevelGridList').removeSelections(true);
        model.setProperty("/chosenSpotAwardCategory", null);
        model.setProperty("/chosenSpotAwardLevel", null);
      };
      let cleanAmount = () => {
        this.byId("amountList").getItems().forEach(item => {item.getContent()[0].getItems()[1].getItems()[1].setValue(null);});
      };
      let cleanDesc = () => {
        this.byId("msgToRecip").setValue(null);
        this.byId("msgToApprover").setValue(null);
      };
      switch (wizardStepId) {
        case 'SelectSpotAwardProgram':
          cleanCategoryLevel();
        case 'CategoryLevel':
          cleanAmount();
        case 'Amount':
          cleanDesc();
        case 'Description':
          break;
      }
    }
  });
});

