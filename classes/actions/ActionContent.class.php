<?php
/*-------------------------------------------------------
*
*   Plugin "Maps"
*   Author: Vladimir Yuriev (extravert)
*   Official site: altocms.ru
*   Contact e-mail: support@lsmods.ru
*
---------------------------------------------------------
* Adopted for Alto CMS v.1.+ by aVadim
*/

class PluginMaps_ActionContent extends PluginMaps_Inherits_ActionContent {

    protected function EventEdit() {
        parent::EventEdit();
        $sTopicId = $this->GetParam(0);
        if (!($oTopic = $this->Topic_GetTopicById($sTopicId))) {
            return parent::EventNotFound();
        }
        if ($this->oType && $oTopic && !isset($_REQUEST['submit_topic_publish']) && !isset($_REQUEST['submit_topic_save'])) {

            foreach ($this->oType->getFields() as $oField) {
                if ($oTopic->getField($oField->getFieldId())) {
                    if ($oField->getFieldType() == 'map') {
                        $sValue = $oTopic->getField($oField->getFieldId())->getValueSource();
                        $sValue = unserialize($sValue);
                        $_REQUEST['fields'][$oField->getFieldId()] = $sValue;
                    }
                }
            }
        }
    }


}

// EOF