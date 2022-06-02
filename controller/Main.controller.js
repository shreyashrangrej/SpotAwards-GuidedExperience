sap.ui.define(["sap/ui/core/mvc/Controller","sap/ui/model/json/JSONModel","sap/m/MessageBox","sap/ui/core/Fragment","sap/ui/core/InvisibleMessage","sap/ui/core/library"],function(e,t,r,o,a,s){"use strict";var i=s.InvisibleMessageMode;const n="sap-icon://person-placeholder";const d="/rest/experience";return e.extend("workzone2.workzonehr.sap.sf.workflow.spotaward.controller.Main",{onInit:function(){this.oInvisibleMessage=a.getInstance();this._wizard=this.byId("SpotAward");this._oNavContainer=this.byId("wizardNavContainer");this._oWizardContentPage=this.byId("wizardContentPage");this._oDescriptionPage=this.byId("descriptionPage");sap.ui.core.Fragment.load({name:"workzone2.workzonehr.sap.sf.workflow.spotaward.view.ApprovalStatus",controller:this,id:"wizardReviewFragment"}).then(e=>{this.approvalStatusPage=e;this._oNavContainer.addPage(this.approvalStatusPage)});this.initialContext()},initialContext:function(){var e=this.getOwnerComponent().getManifestEntry("sap.card").configuration.parameters;var r=this.getView();var o=new t;r.setModel(o);o.setProperty("/parameters",e);o.setProperty("/workflowDefinitionId",e.workflowDefinitionId.value);this._qualtricsURL=e.qualtricsURL.value;if(this._qualtricsURL){o.setProperty("/needQualtrics",true)}else{o.setProperty("/needQualtrics",false)}o.setProperty("/useCustomOpt",false);o.setProperty("/spotAwardProgram",{});o.setProperty("/commentForReceiver","");o.setProperty("/commentForApprovers","");this.byId("msgToRecip").setValue("");this.byId("msgToApprover").setValue("")},navigateToWizardPage(){this._oNavContainer.to(this._oWizardContentPage)},handleWizardCancel(){this.backToWizard()},nominationSuggest:function(e){this.candidateFlag=Math.random();var t=e.getSource();var r=this.getView();var o=r.getModel();var a=e.getParameter("suggestValue");o.setProperty("/suggestItems",[]);t.destroySuggestionItems();this.findCandidate(a,1,0,o,this.candidateFlag)},candidateFlag:0,findCandidate:function(e,t,r,o,a){if(t==1){o.setProperty("/suggestItems",[])}let s={};s.searchValue=e;s.page=t;s.startIndex=r;this.getOwnerComponent().card.request({url:`{{destinations.apiDestination}}${d}/workzone/v1/EmployeeInfo`,method:"POST",withCredentials:true,parameters:s}).then(r=>{let s=this.byId("noUserLabel");s.setText("");let d=new Array;let l=0;r.items.forEach(e=>{if(e.employments.length>1){e.employments.forEach(t=>{d[l]={...e};d[l].employments=new Array;d[l].employments[0]=t;d[l].assignmentId=t.assignmentId;l++})}else{d[l++]=e}});var g=d.map(e=>`'${e.assignmentId}'`).join();if(!g&&this.candidateFlag===a){let e=this.getView().getModel("i18n").getResourceBundle().getText("NO_USER");s.setText(e);this.oInvisibleMessage.announce(e,i.Assertive);return}for(let e=0;e<d.length;e++){if(d[e].photo===null){d[e].photo=n}}if(this.candidateFlag===a){o.setProperty("/suggestItems",o.getProperty("/suggestItems").concat(d))}if(r.hasMore&&this.candidateFlag===a){this.findCandidate(e,t+1,d[d.length-1].indexRef+1,o,a)}})},clearInput:function(){let e=this.byId("searchInput");let t=this.byId("noUserLabel");if(!e.getValue()){t.setText("")}},addCandidate:function(e){var t=this.getView();var r=t.getModel();var o=e.getParameters("selectedItem").selectedRow.getBindingContextPath();var a=r.getProperty(o);let s=()=>{if(!r.getProperty("/chosenEmployees")){r.setProperty("/chosenEmployees",{assignmentIds:[],data:[]})}var e=r.getProperty("/chosenEmployees");if(!e.assignmentIds.includes(a.assignmentId)&&a.name!==this.getView().getModel("i18n").getResourceBundle().getText("NO_USER")){e.assignmentIds.push(a.assignmentId);e.data.push(a);this.byId("candidateList").getBinding("items").refresh(true);this.fetchSpotAwardProgram(e.assignmentIds)}this.byId("searchInput").setValue("")};this.confirmMessageforModifyProgress("SelectSpotAwardProgram",s,()=>this.byId("searchInput").setValue(""))},fetchSpotAwardProgram:function(e){var t=this.getView();var r=t.getModel();let o=this.byId("spotAwardProgramGridList");o.removeSelections(true);var a=this.byId("SelectSpotAwardProgram");a.setValidated(false);if(e.length===0){r.setProperty("/spotAwardProgram",{})}else{o.setBusy(true);let t=e.join(",");this.getOwnerComponent().card.request({url:"{{destinations.apiDestination}}"+"/odatav4/SpotAwardService.svc/$batch",method:"POST",withCredentials:true,batch:{default:{method:"GET",url:`getSpotAwardProgramsForUsers(userIds='${t}')?$format=json`,headers:{Accept:"application/json"}}}}).then(e=>e.default).then(e=>{var t=e.value;this.fetchSpotAwardProgramImage(t);r.setProperty("/spotAwardProgram",t);r.setProperty("/chosenSpotAwardProgram",{});r.refresh(true);o.setBusy(false)}).catch(e=>{this.getMessageBox4APIError()})}},fetchSpotAwardProgramImage:function(e){let t=/attachmentId=\d*/;let r=e.map(e=>{let r=null;if(e.imageUrl){let o=e.imageUrl.match(t);if(o){r=o[0].split("=")[1];e.imageId=r}}return r}).filter(e=>e).join(",");this.fetchImage(e,r,"imageId")},fetchImage:function(e,t,r){if(!t){return}this.getOwnerComponent().card.request({url:`{{destinations.apiDestination}}/odata/v2/Attachment?$format=json&$select=attachmentId,fileContent,mimeType&$filter=attachmentId in ${t}`,withCredentials:true}).then(t=>{t.d.results.forEach(t=>{e.forEach(e=>{if(t.attachmentId===e[`${r}`]){e.image=t}})});this.getView().getModel().refresh(true)})},deleteCandidate:function(e){var t=this.getView();var r=t.getModel();var o=r.getProperty("/chosenEmployees");let a=()=>{var t=o.assignmentIds.indexOf(e);o.assignmentIds.splice(t,1);for(let r=0;r<o.data.length;r++){if(o.data[r].assignmentId===e){t=r;break}}o.data.splice(t,1);this.byId("candidateList").getBinding("items").refresh(true);this.fetchSpotAwardProgram(o.assignmentIds)};this.confirmMessageforModifyProgress("SelectSpotAwardProgram",a,()=>{})},chooseSpotAwardProgram:function(e){var t=e.getParameter("listItem");var r=t.getBindingContext().getPath();var o=this.getView();var a=o.getModel();let s=e.getSource();let i=()=>{var e=a.getProperty(r);let o=e.recordId;a.setProperty("/chosenSpotAwardProgram",e);a.setProperty("/chosenSpotAwardProgramItem",t.getId());this.getOwnerComponent().card.request({url:"{{destinations.apiDestination}}"+"/odatav4/SpotAwardService.svc/SpotAwardProgram('"+o+"')?$format=json&$expand=categories,levels,advancedSettings&$select=recordId,categories,levels,advancedSettings",method:"GET",withCredentials:true}).then(e=>{a.getProperty("/chosenSpotAwardProgram").advancedSettings=e.advancedSettings;let t=e.categories;a.setProperty("/spotAwardCategory",t);let r=e.levels;a.setProperty("/spotAwardLevel",r);if(a.getProperty("/chosenSpotAwardProgram")&&a.getProperty("/chosenEmployeesLength")>0){var o=this.byId("SelectSpotAwardProgram");o.setValidated(true)}this.fetchImage(t,t.map(e=>e.categoryImage).filter(e=>e).join(","),"categoryImage");this.fetchImage(r,r.map(e=>e.levelImage).filter(e=>e).join(","),"levelImage")}).catch(e=>{var t=this.byId("SelectSpotAwardProgram");t.setValidated(false);this.getMessageBox4APIError()});if(a.getProperty("/chosenSpotAwardProgram")&&a.getProperty("/chosenEmployees").assignmentIds.length>0){var s=this.byId("SelectSpotAwardProgram");s.setValidated(true)}};this.confirmMessageforModifyProgress("SelectSpotAwardProgram",i,()=>s.setSelectedItemById(a.getProperty("/chosenSpotAwardProgramItem")))},showProgramInformation:function(e,r){var o=r.getSource();sap.ui.core.Fragment.load({name:"workzone2.workzonehr.sap.sf.workflow.spotaward.view.ProgramDesc",controller:this}).then(function(r){this.getView().addDependent(r);r.setModel(new t({info:e}));r.openBy(o)}.bind(this))},chooseSpotAwardCategory:function(e){var t=e.getParameter("listItem");var r=t.getBindingContext().getPath();var o=this.getView();var a=o.getModel();let s=e.getSource();let i=()=>{a.setProperty("/chosenSpotAwardCategory",a.getProperty(r));a.setProperty("/chosenSpotAwardCategoryItem",t.getId());if(a.getProperty("/chosenSpotAwardCategory")&&a.getProperty("/chosenSpotAwardLevel")){var e=this.byId("CategoryLevel");this.getSpotAwardGuidelineAmountForUser(e)}};this.confirmMessageforModifyProgress("CategoryLevel",i,()=>s.setSelectedItemById(a.getProperty("/chosenSpotAwardCategoryItem")))},chooseSpotAwardLevel:function(e){var t=e.getParameter("listItem");var r=t.getBindingContext().getPath();var o=this.getView();var a=o.getModel();let s=e.getSource();let i=()=>{a.setProperty("/chosenSpotAwardLevel",a.getProperty(r));a.setProperty("/chosenSpotAwardLevelItem",t.getId());if(a.getProperty("/chosenSpotAwardCategory")&&a.getProperty("/chosenSpotAwardLevel")){var e=this.byId("CategoryLevel");this.getSpotAwardGuidelineAmountForUser(e)}};this.confirmMessageforModifyProgress("CategoryLevel",i,()=>s.setSelectedItemById(a.getProperty("/chosenSpotAwardLevelItem")))},getSpotAwardGuidelineAmountForUser:function(e){var t=this.getView();var r=t.getModel();var o=r.getProperty("/chosenSpotAwardProgram");var a=o.recordId;var s=r.getProperty("/chosenSpotAwardCategory");var i=s.recordId;var n=r.getProperty("/chosenSpotAwardLevel");var d=n.recordId;var l=r.getProperty("/chosenEmployees/data");var g=l.map(e=>e.assignmentId).join(",");let c="programId='"+a+"',categoryId='"+i+"',levelId='"+d+"',userIds='"+g+"'";this.getOwnerComponent().card.request({url:"{{destinations.apiDestination}}"+"/odatav4/SpotAwardService.svc/$batch",method:"POST",withCredentials:true,batch:{default:{method:"GET",url:`getSpotAwardGuidelineAmountForUser(${c})?$format=json`,headers:{Accept:"application/json"}}}}).then(e=>e.default).then(t=>{r.setProperty("/spotAwardGuidelineAmount",t);e.setValidated(true)}).catch(t=>{this.getMessageBox4APIError();e.setValidated(false)})},beforeAmountStep:function(e){var t=e.getSource();var r=this.getView();var o=r.getModel();var a=o.getProperty("/chosenSpotAwardProgram");var s=o.getProperty("/chosenEmployees/data");var i=this.getView().getModel("i18n").getResourceBundle().getText("STEP3_CUSTOM_AMOUNT");let n=o.getProperty("/spotAwardGuidelineAmount");var d=n.value;s.forEach(e=>{d.forEach(t=>{if(e.assignmentId===t.userId){let r=t.possibleAmounts;let o=[];t.possibleAmounts.forEach(e=>{o.push({amountKey:e,amountText:e})});if(a.advancedSettings.canOverrideGuidelineAmount){o.push({amountKey:"CUSTOM",amountText:i})}t.possibleAmounts=o;e.ruleInfo=t;e.amountSelection=t.recommendedAmount;e.maxGuidelineAmount=Math.max.apply(null,r);this.setEmployeeAmount(e,t.recommendedAmount)}})});t.setBusy(false);o.refresh(true)},storeAmount:function(e){let t=this.getView().getModel();let r=e.getSource();let o=r.getBindingContext().getPath();let a=t.getProperty(o);let s=()=>{console.log("amountPath",o);let e=r.getSelectedKey();a.amountSelection=e;this.setEmployeeAmount(a,e==="CUSTOM"?a.customAmount:e)};this.confirmMessageforModifyProgress("Amount",s,()=>r.setSelectedKey(a.amountSelection))},storeCustomAmount:function(e,t){let r=this.getView().getModel();let o=e.getSource();let a=o.getBindingContext().getPath();let s=r.getProperty(a);let i=()=>{s.customAmount=t;this.setEmployeeAmount(s,t)};this.confirmMessageforModifyProgress("Amount",i,()=>o.setValue(s.amount))},validateDescStep:function(){var e=this.getView();var t=e.getModel();var r=this.byId("Description");let o=t.getProperty("/useCustomOpt");let a=this.byId("msgToRecip");let s=this.byId("msgToApprover");let i=a.getValue().length>0;let n=s.getValue().length>0;if(i&&o&&n||i&&!o){r.setValidated(true)}else{r.setValidated(false)}let d=()=>{a.setValue(t.getProperty("/commentForReceiver"));s.setValue(t.getProperty("/commentForApprovers"))};this.confirmMessageforModifyProgress("Description",()=>{},d)},completeDescStep:function(){var e=this.getView();var t=e.getModel();t.setProperty("/commentForReceiver",this.byId("msgToRecip").getValue());t.setProperty("/commentForApprovers",this.byId("msgToApprover").getValue())},completeWizard:function(){let e=this.byId("SpotAward");e.setBusyIndicatorDelay(0);e.setBusy(true);var t=this;var r=this.getView();var o=r.getModel();var a=this.getOwnerComponent().card;let s=a.getCombinedParameters().loginUser;var i=o.getProperty("/chosenEmployees/data");var n=o.getProperty("/chosenSpotAwardProgram").internalId.toString();var l=o.getProperty("/chosenSpotAwardCategory");var g=l.categoryInternalId.toString();var c=o.getProperty("/chosenSpotAwardLevel");var p=c.levelInternalId.toString();var u=o.getProperty("/commentForReceiver");var h=o.getProperty("/commentForApprovers");var m=[];o.setProperty("/upsertedSpotAward",m);var f=[];o.setProperty("/upsertedWfRequestId",f);for(let r=0;r<i.length;r++){let l={};const c=i[r];l.spotAwardProgram=n;l.category=g;l.level=p;l.commentForReceiver=u;l.awardAmount=c.amount;l.currency=c.ruleInfo.currency;l.userId=c.assignmentId;if(c.isMsgToApproverRequired){l.commentForApprovers=h}a.request({url:"{{destinations.apiDestination}}"+"/odatav4/SpotAwardService.svc/SpotAward",headers:{"content-type":"application/json"},method:"POST",withCredentials:true,parameters:l}).then(r=>{let i=r.recordId;m.push(i);c.recordId=i;e.setBusy(false);t._oNavContainer.to(t.approvalStatusPage);a.request({url:"{{destinations.apiDestination}}"+"/odatav4/SpotAwardService.svc/SpotAward('"+i+"')?$format=json",method:"GET",withCredentials:true}).then(t=>{let r=t.externalCode;a.request({url:"{{destinations.apiDestination}}"+d+"/workzone/v1/SpotAwardWorkflowRequestId?externalCode="+r,method:"GET",withCredentials:true}).then(e=>{let t=e.getSpotAwardWorkflowRequestId;c.wfRequestId=t;if(!t){return}f.push(t);let r=o.getProperty("/workflowDefinitionId");var n={definitionId:r,context:{wfRequestId:t,recordId:i,nominatorId:s}};o.setProperty("/tokenStatus",true);a.request({url:"{{destinations.wfDestination}}/rest/v1/workflow-instances",headers:{"Content-Type":"application/json"},method:"POST",withCredentials:true,parameters:n})}).catch(t=>{this.getMessageBox4APIError();e.setBusy(false)})}).catch(t=>{this.getMessageBox4APIError();e.setBusy(false)})}).catch(t=>{this.getMessageBox4APIError();e.setBusy(false)})}},getWorkflowStatus:function(e){if(e.getParameters().toId!=="wizardReviewFragment--wizardReviewPage"){return}var t=this.getView();var r=t.getModel();let o=t.getModel("i18n");var a=r.getProperty("/chosenEmployees/data");var s=setInterval(n,3e3,r);this._pollingId=s;var i=this.getOwnerComponent().card;function n(e){var t=e.getProperty("/upsertedSpotAward");var r="'"+t.join("','")+"'";i.request({url:`{{destinations.apiDestination}}/odatav4/SpotAwardService.svc/SpotAward?$format=json&$select=approvalStatus&$filter=recordId in (${r})`,method:"GET",withCredentials:true}).then(function(t){let r=true;let i=t.value;i.forEach(e=>{if(e.approvalStatus!=="APPROVED"&&e.approvalStatus!=="REJECTED"){r=false}a.forEach(t=>{if(t.recordId===e.recordId){switch(e.approvalStatus){case"INPROCESS":t.statusInfo=o.getResourceBundle().getText("WORKFLOW_STATUS_INFO_INPROGRESS");t.statusInfoState="Information";break;case"APPROVED":t.statusInfo=o.getResourceBundle().getText("WORKFLOW_STATUS_INFO_APPROVED");t.statusInfoState="Success";break;case"REJECTED":t.statusInfo=o.getResourceBundle().getText("WORKFLOW_STATUS_INFO_REJECTED");t.statusInfoState="Error";break}}})});e.refresh(true);if(r){clearInterval(s)}});let n=e.getProperty("/upsertedWfRequestId").join(",");if(!n||!n.length){return}i.request({url:`{{destinations.apiDestination}}/odata/v2/WfRequestComments?$format=json&$filter=actionType in 'DECLINE','APPROVE' and wfRequestId in ${n}&$orderby=lastModifiedDateTime&$select=wfRequestCommentId,wfRequestId,wfRequestStepId,comments,lastModifiedDateTime,actionType`,method:"GET",withCredentials:true}).then(function(t){let r=t.d.results;r.forEach(e=>{a.forEach(t=>{if(t.wfRequestId===e.wfRequestId){t.comments=e.comments}})});e.refresh(true)})}this.renderQualtrics()},backToWizard:function(){clearInterval(this._pollingId);var e=this.byId("SpotAward");var t=e.getSteps()[0];e.discardProgress(t);t.setValidated(false);e.goToStep(t);this.initialContext();this.getView().getModel().refresh(true);this._oNavContainer.to(this._oDescriptionPage)},renderQualtrics:function(){var e=document.createElement("DIV");console.log("onAfterRendering --------");e.setAttribute("id","spotAwardInsertion---app--awardLink");setTimeout(()=>{sap.ui.core.Fragment.byId("wizardReviewFragment","awardLink").getDomRef().appendChild(e);this.embedWebsiteFeedbackStarter();this.registerWebsiteFeedbackLoadedEvent()},200)},embedWebsiteFeedbackStarter:function(){console.log("embedWebsiteFeedbackStarter --------");let e=this._qualtricsURL;let t="QSI_S_"+e.split("=")[1];var r=function(e,t,r,o){this.get=function(e){for(var e=e+"=",t=document.cookie.split(";"),r=0,o=t.length;r<o;r++){for(var a=t[r];" "==a.charAt(0);)a=a.substring(1,a.length);if(0==a.indexOf(e))return a.substring(e.length,a.length)}return null};this.set=function(e,t){var r="",r=new Date;r.setTime(r.getTime()+6048e5);r="; expires="+r.toGMTString();document.cookie=e+"="+t+r+"; path=/; "};this.check=function(){var o=this.get(r);if(o)o=o.split(":");else if(100!=e)"v"==t&&(e=Math.random()>=e/100?0:100),o=[t,e,0],this.set(r,o.join(":"));else return!0;var a=o[1];if(100==a)return!0;switch(o[0]){case"v":return!1;case"r":return a=o[2]%Math.floor(100/a),o[2]++,this.set(r,o.join(":")),!a}return!0};this.go=function(){if(this.check()){var e=document.createElement("script");e.type="text/javascript";e.src=o;document.body&&document.body.appendChild(e)}};this.start=function(){var e=this;"complete"!==document.readyState?window.addEventListener?window.addEventListener("load",function(){e.go()},!1):window.attachEvent&&window.attachEvent("onload",function(){e.go()}):e.go()}};try{new r(100,"r",t,e).start()}catch(e){}},registerWebsiteFeedbackLoadedEvent:function(){var e=1;window.addEventListener("qsi_js_loaded",t,false);function t(){console.log("pre "+e);if(e===1){var t=document.getElementById("spotAwardInsertion---app--awardLink");t.setAttribute("height","450px");if(QSI.API){QSI.API.unload();QSI.API.load()}e=e-1;console.log("after "+e)}}},setEmployeeAmount(e,t){t=parseFloat(t);t=!t&&t!==0?null:t;e.amount=t;let r=this.getView().getModel().getProperty("/chosenSpotAwardProgram");if(r){e.isMsgToApproverRequired=this.isMsgToApproverRequiredFor(e,r);this.validateAmountStep();this.updateMsgToApproverBox()}this.getView().getModel().refresh()},isMsgToApproverRequiredFor(e,t){const r=t.advancedSettings;const o=r.messageToApproverVisibility;if(!o){console.error("No valid messageToApproverVisibility found:",o);return false}let a=false;switch(o){case"ALWAYS":a=true;break;case"NEVER":a=false;break;case"WHEN_RECOMMENDED_AMOUNT_OVERRIDDEN":a=e.amount>e.maxGuidelineAmount;break;default:console.error("unknown messageToApproverVisibility");a=false}return a},updateMsgToApproverBox(){const e=this.getView().getModel();let t=false;const r=e.getProperty("/chosenEmployees/data");if(r&&r.length){t=r.reduce((e,t)=>e||t.isMsgToApproverRequired,false)}e.setProperty("/useCustomOpt",t)},validateAmountStep(){const e=this.getView().getModel().getProperty("/chosenEmployees/data");let t=false;if(e&&e.length){t=e.reduce((e,t)=>e&&(t.amount>=0&&t.amount!==null),true)}this.byId("Amount").setValidated(t)},getMessageBox4APIError:function(){r.warning(this.getView().getModel("i18n").getResourceBundle().getText("API_ERROR_INFO"))},confirmMessageforModifyProgress:function(e,t,o){let a=this.byId("SpotAward");let s=this.byId(e);if(a.getCurrentStep()===s.getId()){t()}else{let i=this.getView().getModel("i18n").getResourceBundle().getText("SPOT_AWARD_MODIFY_PROGRESS");r.confirm(i,{onClose:r=>this.confirmMessageAction(r,a,s,e,t,o)})}},confirmMessageAction:function(e,t,o,a,s,i){if(r.Action.OK===e){t.discardProgress(o);this.cleanSucceedingStepData(a);s()}else{i()}},cleanSucceedingStepData:function(e){let t=this.getView().getModel();let r=()=>{this.byId("spotAwardCategoryGridList").removeSelections(true);this.byId("spotAwardLevelGridList").removeSelections(true);t.setProperty("/chosenSpotAwardCategory",null);t.setProperty("/chosenSpotAwardLevel",null)};let o=()=>{this.byId("amountList").getItems().forEach(e=>{e.getContent()[0].getItems()[1].getItems()[1].setValue(null)})};let a=()=>{this.byId("msgToRecip").setValue(null);this.byId("msgToApprover").setValue(null)};switch(e){case"SelectSpotAwardProgram":r();case"CategoryLevel":o();case"Amount":a();case"Description":break}}})});