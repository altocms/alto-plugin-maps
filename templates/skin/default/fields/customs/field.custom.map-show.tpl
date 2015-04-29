{if $oField}
	{$sMapType=Config::Get('plugin.maps.map_type')}
    {$aMapDefaultCenter=F::Array_Str2Array(Config::Get('plugin.maps.map_center'))}
    {$sMapLabel=$oField->getFieldName()}

    {$aPlace.coord=$oField->getCoord($oTopic->getField($oField->getFieldId()))}
    {$aPlace.title=$oTopic->getTitle()|escape:'html'}

    {*
    {$aMapPlaces[]=$aPlace}
    {$aPlace.coord=array(56.75703,36.61614)}
    {$aPlace.title='test'}
    {$aMapPlaces[]=$aPlace}
    *}

	{include file="./maps/$sMapType/show.tpl" aMapPlaces=$aMapPlaces}
{/if}