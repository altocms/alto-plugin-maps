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

class PluginMaps_ModuleTopic_EntityField extends PluginMaps_Inherit_ModuleTopic_EntityField {

    public function getCoord($obj, $iIndex = null) {

        if (is_object($obj)) {
            $sData = $obj->getValue();
            if ($sData) {
                $aValue = @unserialize($sData);
                if (is_array($aValue) && reset($aValue) !== '') {
                    if (!is_null($iIndex)) {
                        if (isset($aValue[$iIndex])) {
                            return $aValue[$iIndex];
                        }
                    } elseif(sizeof($aValue) > 1) {
                        return $aValue;
                    }
                }
            }
        }

        return null;
    }
}

// EOF