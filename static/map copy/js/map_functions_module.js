var solMap = (function() {
	/* Survey of London Whitechapel Map Functions */

	/* Config */


	/* Building Footprint Styles */

	var baseStyle = {
		"color": "#F58D16",
		"weight": 1,
		"opacity": 0.4
	};

	var hoverStyle = {
		"opacity": 1,
		"weight": 1.5
	};

	var highlightStyle = {
		"color": "#2262cc",
		"weight": 1.5
	};

	/* Raster Tiles */

	var	streets = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Crop/{z}/{x}/{y}.png');

	/* Building Footprints */

	/* var geojson;

	$.getJSON('features/', function(data) {
		geojson = data;
	});

	buildings = L.geoJson(geojson);*/

	// var buildings = L.mapbox.featureLayer().loadURL('features/');


	/* Controls */

	var infobox = L.Control.extend({
		options: {
			position: 'topright',
		},
		onAdd: function(map) {
			var container = L.DomUtil.create('div', 'infobox-control row');
			return container;
		}
	});

	/* Initialise Map */

	var map = L.map('map', {
		zoom: 1,
	});


	streets.addTo(map);

	/* Style Building Footprints */

	function styleBuildingFootprints(buildings) {

	}

	function setOpacity(buildings) {

	}

	/* Load overview of a building */

	function getDocument(id) {
		$.get('feature/' + id + '/', function(data) {
			$('.infobox-control').html(data);
		});
	}

	return {
		
		streets: streets,

		map: map, 

		styleBuildingFootprints: styleBuildingFootprints,
	}

}() );