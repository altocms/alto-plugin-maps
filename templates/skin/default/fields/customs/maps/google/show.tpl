<p>
    <b>{$oField->getFieldName()}</b>:

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
    $(function() {
        var myOptions = {
            zoom: {Config::Get('plugin.maps.map_zoom')},
            center: new google.maps.LatLng({$aMapDefaultCenter.0}, {$aMapDefaultCenter.1}),
            panControl: true,
            zoomControl: true,
            scaleControl: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var gmap = new google.maps.Map(document.getElementById("ItemMap"), myOptions);
        var bounds = new google.maps.LatLngBounds();
        var marker;

        {foreach $aMapPlaces as $iIndex => $aPlace}
        // begin -- #{$iIndex}
        var myLatLng = new google.maps.LatLng({$aPlace.coord.0}, {$aPlace.coord.1});
        var contentString = "<b>{$aPlace.title}</b> ";
        var infoWindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 400
        });

        marker = new google.maps.Marker({
            position: myLatLng,
            map: gmap,
            title: '{$aPlace.title}'
        });
        bounds.extend(myLatLng);

        // end -- #{$iIndex}
        {/foreach}

        {if sizeof($aMapPlaces) > 1}
        gmap.fitBounds(bounds);
        {else}
        gmap.setCenter(myLatLng);
        {/if}

    });

	</script>

	<div id="ItemMap" style="width:{Config::Get('plugin.maps.map_width')};height:{Config::Get('plugin.maps.map_height')};"></div>
</p>