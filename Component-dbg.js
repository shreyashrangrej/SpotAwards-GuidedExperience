sap.ui.define(['sap/ui/core/UIComponent', 'sap/ui/model/json/JSONModel'],
  function (UIComponent, JSONModel) {
    "use strict";

    var Component = UIComponent.extend("workzone2.workzonehr.sap.sf.workflow.spotaward.Component", {

      metadata: {
        manifest: "json"
      },
      init: function () {
        // call the base component's init function
        UIComponent.prototype.init.apply(this, arguments);

        //set data model
        var oModel = new JSONModel();
        sap.ui.getCore().setModel(oModel, "workflowModel");

      },
      onCardReady: function (oCard) {

        let cardWrapper = {
          __proto__: oCard.__proto__,
          request: (config) => {
            if (!config.headers) {
              config.headers = {};
            }
            config.headers["successfactors-employment-id"] = oCard.getCombinedParameters().loginUser;
            return oCard.request(config);
          }
        };

        // Holds the card for use inside the controller
        Object.assign(cardWrapper, oCard);
        this.card = cardWrapper;

        // Can get all parameters with method getCombinedParameters
        oCard.getCombinedParameters();

        // Get any section of the card manifest with method getManifestEntry
        oCard.getManifestEntry("/sap.card");
      }
    });

    return Component;

  });
