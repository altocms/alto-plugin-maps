<p>
    {assign var=field_id value=$oField->getFieldId()}
    <label for="item_map">{$oField->getFieldName()}:</label>
    <div id="map">
        <script src="http://api-maps.yandex.ru/2.0/?load=package.full&mode=release&lang=ru-RU" type="text/javascript"></script>

        <script type="text/javascript">
            ymaps.ready(function () {
                var ymap = new ymaps.Map("ItemMap", {
                    center: {json var=Config::Get('plugin.maps.map_center')},
                    zoom: {Config::Get('plugin.maps.map_zoom')},
                    type: "yandex#map"
                });
                var myPlacemark;

                ymap.controls.add("typeSelector").add("mapTools").add("zoomControl").add("searchControl");

                {if ($_aRequest.fields.$field_id.1 != '')}
                myPlacemark = new ymaps.Placemark([ {$_aRequest.fields.$field_id.0}, {$_aRequest.fields.$field_id.1} ]);
                ymap.geoObjects.add(myPlacemark);
                ymap.setCenter([ {$_aRequest.fields.$field_id.0}, {$_aRequest.fields.$field_id.1} ]);
                {/if}

                ymap.events.add('click', function (e) {
                    var coords = e.get('coordPosition');
                    $("#item_lat").attr("value", coords[0].toPrecision(6));
                    $("#item_lng").attr("value", coords[1].toPrecision(6));
                    if(myPlacemark){
                        ymap.geoObjects.remove(myPlacemark);
                    }
                    myPlacemark = new ymaps.Placemark(coords);
                    ymap.geoObjects.add(myPlacemark);
                });
            });
        </script>

<div id="ItemMap" style="width:{Config::Get('plugin.maps.map_width')};height:{Config::Get('plugin.maps.map_height')};"></div>

<input type="hidden" id="item_lat" name="fields[{$oField->getFieldId()}][0]" value="{$_aRequest.fields.$field_id.0}"/>
<input type="hidden" id="item_lng" name="fields[{$oField->getFieldId()}][1]" value="{$_aRequest.fields.$field_id.1}"/>


</div>
<span class="note">{$oField->getFieldDescription()}</span>
</p>