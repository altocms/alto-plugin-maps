<p>
    <b>{$sMapLabel}</b>:
    <div>
    <script src="http://api-maps.yandex.ru/2.0/?load=package.full&mode=release&lang=ru-RU" type="text/javascript"></script>

    <script type="text/javascript">
        ymaps.ready(function () {
			var ymap = new ymaps.Map("ItemMap", {
				// Центр карты
				center: {json var=$aMapDefaultCenter},
				// Коэффициент масштабирования
				zoom: {Config::Get('plugin.maps.map_zoom')},
				// Тип карты
				type: "yandex#map"
			});
            var myPlacemark;

			ymap.controls.add("typeSelector").add("zoomControl");

            {$aBounds=array()}
            {foreach $aMapPlaces as $iIndex => $aPlace}
            // begin -- #{$iIndex}
            myPlacemark = new ymaps.Placemark({json var=$aPlace.coord}, {
                balloonContentHeader: "{$aPlace.title}",
                balloonContentBody: ''
            }, {
                // Опции
                preset: 'twirl#blueStretchyIcon' // иконка растягивается под контент
            });

            // Добавляем метку на карту
            ymap.geoObjects.add(myPlacemark);
            myPlacemark.balloon.open();
            // end -- #{$iIndex}
            {if $aPlace@first}
            {$aBounds=array($aPlace.coord, $aPlace.coord)}
            {else}
            {if $aBounds.0.0>$aPlace.coord.0}{$aBounds.0.0=$aPlace.coord.0-0.002}{/if}
            {if $aBounds.0.1>$aPlace.coord.1}{$aBounds.0.1=$aPlace.coord.1-0.002}{/if}
            {if $aBounds.1.0<$aPlace.coord.0}{$aBounds.1.0=$aPlace.coord.0+0.002}{/if}
            {if $aBounds.1.1<$aPlace.coord.1}{$aBounds.1.1=$aPlace.coord.1+0.002}{/if}
            {/if}
            {/foreach}

            {if sizeof($aMapPlaces) > 1}
            ymap.setBounds({json var=$aBounds}, {
                checkZoomRange: true
            });
            {else}
            ymap.setCenter({json var=$aPlace.coord});
            {/if}
		});

	</script>

	<div id="ItemMap" style="width:{Config::Get('plugin.maps.map_width')};height:{Config::Get('plugin.maps.map_height')};"></div>

	</div>
</p>