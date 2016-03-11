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

var feature_legend = L.Control.extend({
	options: {
		position: 'bottomleft',
	},
	onAdd: function(map) {
		var container = L.DomUtil.create('div', 'feature-legend');
		return container;
	}
})

var myStyle = {
	"color": "#F58D16",
	"weight": 2,
	"opacity": 0.4
};

var hoverStyle = {
	"opacity": 1,
	"weight": 2.5
}

var highlightStyle = {
	"color": "#1AA9FF",
	"weight": 2.5
};


function setDocNumberStyle(layer) {
	var count = layer.feature.properties.count
	if (count == 0) {
		layer.setStyle({fillOpacity: 0});
	} else if (count >= 1 && count <= 2) {
		layer.setStyle({fillOpacity: 0.2});
	} else if (count >= 3 && count <= 6) {
		layer.setStyle({fillOpacity: 0.3});
	} else if (count >= 7 && count <= 10) {
		layer.setStyle({fillOpacity: 0.8});
	}
}

function resetColours(vectorlayer) {
	vectorlayer.eachLayer(function(layer) {
		layer.setStyle(myStyle);
	})
}

function getDocument(id) {
	$('.infobox-control').html('');
	$.get('feature/' + id + '/', function(data) {
		$('.infobox-control').html(data);
		$('.infobox-control').show();
	});
	$.get('feature/' + id + '/legend/', function(data) {
		$('.feature-legend').html('');
		$('.feature-legend').html(data);
		$('.feature-legend').show();
	})
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
		map.fitBounds(layer.getBounds());
		getDocument(layer.feature.id);
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
		var hl = getUrlVars()['highlight'];
		if (feature.id == hl) {
			highlight = layer;
			layer.setStyle(highlightStyle);
			getDocument(feature.id);
			console.log(highlight);
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


function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}


var map;
var geojson;
var oslayer;
var neonlayer;
var sketchylayer;
var buildings;
var highlight;

function loadFeatures(jsonUrl) {

	function initMap(layers) {
		map = L.map('map', {
			zoom: 17,
			minZoom: 15,
			zoomControl: false,
			layers: layers
		});
	};

	$.getJSON(jsonUrl).done(function(data) {
		
		if (map == null) {

			geojson = data;

			sketchylayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Crop_New_Fonts/{z}/{x}/{y}.png');

			// oslayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Crop/{z}/{x}/{y}.png');

			// neonlayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/OS_OpenMap_Local_Whitechapel_Neon/{z}/{x}/{y}.png');

			buildings = L.geoJson(geojson, {
				onEachFeature: onEachFeature,
				style: myStyle
			});

			layers = [/*oslayer,*/ /*neonlayer,*/ sketchylayer, buildings];

			initMap(layers);

			map.fitBounds(buildings);

			map.attributionControl.addAttribution("Contains OS data &copy; Crown copyright and OpenMap Local 2016 | Address Information &copy; OpenStreetMap Contributors, ODBL www.opendatacommons.org/licenses/odbl");

			var baseMaps = {
				/*"Ordnance Survey OpenMap Local": oslayer,*/
				// "Neon Layer": neonlayer,
				"Sketchy Layer": sketchylayer,
			};
			
			var overlayMaps = {
				"Buildings": buildings
			};

			if (highlight != undefined) {
				map.fitBounds(highlight.getBounds());
			}

			L.control.layers(baseMaps, overlayMaps, {
				"position": "bottomleft"
			}).addTo(map);

			L.control.zoom({
				"position": "bottomleft",
			}).addTo(map);
			
			map.addControl(new infobox());
			map.addControl(new feature_legend());

			$('.leaflet-control').mouseover(function() {
				buildings.eachLayer(function(layer) {
					if (layer.options['color'] != '#1AA9FF') {
						layer.setStyle(myStyle);
					}
				layer.removeEventListener();
				})
			});

			$('.leaflet-control').mouseout(function() {
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
		} else {
			$.getJSON(jsonUrl).done(function(data) {
				buildings.clearLayers();
				buildings.addData(data);
				map.fitBounds(buildings);
			})
		}
	});
}