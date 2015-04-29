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

class PluginMaps_HookMain extends Hook {

    public function RegisterHook() {

        $this->AddHook('content_field_proccess', 'processFieldMap');
        $this->AddHookTemplate('admin_content_add_field_list', 'addMap', __CLASS__, -10370);
    }

    public function addMap() {
        
        return $this->Viewer_Fetch(
            Plugin::GetTemplatePath(__CLASS__) . 'inject.mapli.tpl'
        );
    }

    public function processFieldMap($aVars) {
        
        if ($aVars['oField']->getFieldType() == 'map') {
            if (isset($_REQUEST['fields'][$aVars['oField']->getFieldId()][0]) && isset($_REQUEST['fields'][$aVars['oField']->getFieldId()][1])) {
                $lat = htmlspecialchars(strip_tags($_REQUEST['fields'][$aVars['oField']->getFieldId()][0]));
                $lng = htmlspecialchars(strip_tags($_REQUEST['fields'][$aVars['oField']->getFieldId()][1]));
                $aVars['sData'] = serialize(array($lat, $lng));
                if ($aVars['oTopic']->_Validate()) {
                    $_REQUEST['fields'][$aVars['oField']->getFieldId()] = serialize(array($lat, $lng));
                }
            }
        }
    }
}

// EOF
