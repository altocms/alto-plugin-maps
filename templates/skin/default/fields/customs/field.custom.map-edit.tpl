{if $oField}
    {$sMapType=Config::Get('plugin.maps.map_type')}
    {$aMapDefaultCenter=F::Array_Str2Array(Config::Get('plugin.maps.map_center'))}
    {include file="./maps/$maptype/edit.tpl" oField=$oField}
{/if}