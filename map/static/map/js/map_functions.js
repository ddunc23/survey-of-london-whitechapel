L.mapbox.accessToken = 'pk.eyJ1IjoiZGR1bmMyMyIsImEiOiJxQVhaaVhjIn0.T7vhn1bLeeQoHCsWZ_mp2g';

// var geojson = {{ os_features|geojsonfeature:"osm_id,count,address"|safe }}

var infobox = L.Control.extend({
	options: {
		position: 'topright',
	},
	onAdd: function(map) {
		var container = L.DomUtil.create('div', 'infobox-control row');
		return container;
	}
});

var myStyle = {
	"color": "#F58D16",
	"weight": 1.5,
	"opacity": 0.4
};

var hoverStyle = {
	"opacity": 1,
	"weight": 2
}

var highlightStyle = {
	"color": "#1AA9FF",
	"weight": 2
};


function setDocNumberStyle(layer) {
	var count = layer.feature.properties.count
	if (count == 0) {
		layer.setStyle({fillOpacity: 0});
	} else if (count >= 1 && count <= 2) {
		layer.setStyle({fillOpacity: 0.2});
	} else {
		layer.setStyle({fillOpacity: 0.4});
	}
}

function resetColours(vectorlayer) {
	vectorlayer.eachLayer(function(layer) {
		layer.setStyle(myStyle);
	})
}

function getDocument(id) {
	$.get('feature/' + id + '/', function(data) {
		$('.infobox-control').html('');
		$('.infobox-control').html(data);
	});
}

function setFootprintColour(layer, e) {
	if (e.type == 'mouseover') {
		layer.setStyle(hoverStyle);
	} else if (e.type == 'mouseout') {
		if (layer.options['color'] != '#1AA9FF') {
			layer.setStyle(myStyle);
		}
	} else if (e.type == 'click') {
		resetColours(buildings);
		layer.setStyle(highlightStyle);
		map.panTo(e.latlng);
		getDocument(layer.feature.id);
		$('.infobox-control').show();
	}
}

function onEachFeature(feature, layer) {
	if (feature.properties) {
		if (feature.properties.name) {
			layer.bindPopup(feature.properties.name);
		}
		else if (feature.properties.address) {
			layer.bindPopup(feature.properties.address);
		}
	}
	layer.on("mouseover", function(e) {
		setFootprintColour(layer, e);
	})
	layer.on("mouseout", function(e) {
		setFootprintColour(layer, e);
	})
	setDocNumberStyle(layer);
	layer.on("click", function(e) {
		setFootprintColour(layer, e);
	});
}

var map;
var geojson;
var oslayer;
var neonlayer;
var sketchylayer;
var buildings;

function initMap(layers) {
	map = L.map('map', {
		zoom: 17,
		layers: layers,
		minZoom: 15,
	});
}

$.getJSON('features/').done(function(data) {
	
	geojson = data;

	sketchylayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Crop_Sketchy/{z}/{x}/{y}.png');

	oslayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Crop/{z}/{x}/{y}.png');

	neonlayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Neon/{z}/{x}/{y}.png');

	buildings = L.geoJson(geojson, {
		onEachFeature: onEachFeature,
		style: myStyle
	});
	
	layers = [oslayer, sketchylayer, buildings, neonlayer];

	initMap(layers);
	
	map.fitBounds(buildings);
	
	map.attributionControl.addAttribution("Contains OS data &copy; Crown copyright and OpenMap Local 2016 | Address Information &copy; OpenStreetMap Contributors, ODBL www.opendatacommons.org/licenses/odbl");

	var baseMaps = {
		"Ordnance Survey OpenMap Local": oslayer,
		"Sketchy Layer": sketchylayer,
		"Neon Layer": neonlayer,
	};
	
	var overlayMaps = {
		"Buildings": buildings
	};
	
	L.control.layers(baseMaps, overlayMaps, {
		"position": "bottomleft"
	}).addTo(map);
	
	map.addControl(new infobox());

	$('.infobox-control').mouseover(function() {
		buildings.eachLayer(function(layer) {
			if (layer.options['color'] != '#1AA9FF') {
				layer.setStyle(myStyle);
			}
		layer.removeEventListener();
		})
	});

	$('.infobox-control').mouseout(function() {
		buildings.eachLayer(function(layer) {			
			if (layer.feature.properties) {
				if (layer.feature.properties.name) {
					layer.bindPopup(layer.feature.properties.name);
				}
				else if (layer.feature.properties.address) {
					layer.bindPopup(layer.feature.properties.address);
				}
			}
			layer.on("mouseover", function(e) {
				setFootprintColour(layer, e);
			})
			layer.on("mouseout", function(e) {
				setFootprintColour(layer, e);
			})
			layer.on("click", function(e) {
				layer.openPopup(e.latlng);
				setFootprintColour(layer, e);
			})
		})
	});
});