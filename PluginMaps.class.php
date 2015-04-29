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

if (!class_exists('Plugin')) {
  die('Hacking attemp!');
}

class PluginMaps extends Plugin {

    protected $aInherits
        = array(
            'action' => array(
                'ActionContent'
            ),
            'entity' => array(
                'ModuleTopic_EntityField'
            )
        );

    protected $aDelegates
        = array(
            'template' => array(
                'fields/customs/field.custom.map-edit.tpl',
                'fields/customs/field.custom.map-show.tpl',
            ),
        );

    public function Init() {

        $this->Topic_AddFieldType('map');
        return true;
    }

    public function Activate() {

        return true;
    }

    public function Deactivate() {
        return true;
    }
}

// EOF