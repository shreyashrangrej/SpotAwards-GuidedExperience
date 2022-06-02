sap.ui.define(["sap/ui/integration/Designtime"
], function (Designtime) {
  "use strict";

  var DT = Designtime.extend("workzone2.workzonehr.sap.sf.workflow.spotaward.AdvancedDesigntime");

  DT.prototype.create = function () {
    return {
      form: {
        items: {
          "cardTitle": {
            "manifestpath": "/sap.card/header/title",
            "label": "{i18n>SPOT_AWARD_CARD_TITLE_LABEL}",
            "type": "string",
            "translatable": true
          },
          "cardSubtitle": {
            "manifestpath": "/sap.card/header/subTitle",
            "label": "{i18n>SPOT_AWARD_CARD_SUBTITLE_LABEL}",
            "type": "string",
            "translatable": true
          },
          "lastPageGroup": {
            "label": "{i18n>LAST_PAGE}",
            "type": "group"
          },
          "qualtricsURL": {
            "manifestpath": "/sap.card/configuration/parameters/qualtricsURL/value",
            "defaultValue": "",
            "label": "{i18n>PARAM_QUALTRICS_URL}",
            "type": "string",
            "translatable": false,
            "visible": true,
            "required": false
          }                  
        }
      },
      preview: {
        modes: "None"
      }
    };
  };

  return DT;
});
