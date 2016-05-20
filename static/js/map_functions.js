/* Leaflet Functions */

L.mapbox.accessToken = 'pk.eyJ1IjoiZGR1bmMyMyIsImEiOiJxQVhaaVhjIn0.T7vhn1bLeeQoHCsWZ_mp2g';

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

var show_all_buildings = L.Control.extend({
	options: {
		position: 'bottomright'
	},
	onAdd: function(map) {
		var container = L.DomUtil.create('div', 'show-buildings');
		container.innerHTML += '<a href="/map/" class="all_btn btn btn-default btn-sm">Show All Buildings</a>';
		return container;
	}
})

var titlebox = L.Control.extend({
	options: {
		position: 'bottomright',
	},
	onAdd: function(map) {
		var container = L.DomUtil.create('div', 'titlebox-control row');
		container.innerHTML += title_box_title;
		return container;
	}
});


var myStyle = {
	"color": "#F58D16",
	"fillColor": "#F58D16",
	"weight": 2.5,
	"opacity": 0.4
};

var hoverStyle = {
	"opacity": 1,
	"weight": 2.5,
	"color": "#1AA9FF",
}

var highlightStyle = {
	"color": "#1AA9FF",
	"fillColor": "#1AA9FF",
	"weight": 2.5
};


function setDocNumberStyle(layer) {
	var count = layer.feature.properties.count
	if (count == 0) {
		layer.setStyle({fillOpacity: 0});
	} else if (count >= 1 && count <= 2) {
		layer.setStyle({fillOpacity: 0.8});
	} else if (count >= 3 && count <= 6) {
		layer.setStyle({fillOpacity: 0.8});
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
		for (var prop in layer._layers) {
			if (layer._layers[prop].options.fillColor != '#1AA9FF') {
				layer.setStyle(myStyle);
			}
			break;
		}
	} else if (e.type == 'click') {
		resetColours(buildings);
		layer.setStyle(highlightStyle);
		map.fitBounds(layer.getBounds());
		getDocument(layer.feature.id);
	}
}

var info = L.control({'position': 'topleft'});

info.onAdd = function(map) {
    this._div = L.DomUtil.create('div', 'info');
    this.update();
    return this._div;
};

info.update = function(properties) {
    this._div.innerHTML =  (properties ?
        '<b>' + properties.address + '</b>' : 'Hover over a place');
};


function onEachFeature(feature, layer) {
	if (feature.properties) {
		if (feature.properties.b_name) {
			layer.bindPopup('<a href="feature/' + feature.id + '/detail/">' + feature.properties.b_name + '</a>');
		}
		else if (feature.properties.address) {
			layer.bindPopup('<a href="feature/' + feature.id + '/detail/">' + feature.properties.address + '</a>');
		}
		var hl = getUrlVars()['highlight'];
		if (feature.id == hl) {
			highlight = layer;
			layer.setStyle(highlightStyle);
			getDocument(feature.id);
		} else {
			layer.setStyle(myStyle);
		}
	}
	layer.on("mouseover", function(e) {
		setFootprintColour(layer, e);
		info.update(layer.feature.properties);
	})
	layer.on("mouseout", function(e) {
		setFootprintColour(layer, e);
		info.update()
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
var sketchylayer;
var buildings;
var highlight;

function loadFeatures(jsonUrl, mapType, allFeatures) {

	if (mapType == 'main') {
		
		function initMap(layers) {
			map = L.map('map', {
				zoom: 17,
				minZoom: 17,
				maxZoom: 20,
				zoomControl: false,
				layers: layers
			});
		};

		$.getJSON(jsonUrl).done(function(data) {
			
			if (map == null) {

				geojson = data;

				sketchylayer = L.tileLayer('https://surveyoflondonmaps.org/tileserver.php?/index.json?/whitechapel_building_footprints_with_open_spaces/{z}/{x}/{y}.png', {maxZoom: 20});

				buildings = L.geoJson(geojson, {
					onEachFeature: onEachFeature,
				});

				layers = [sketchylayer, buildings];

				initMap(layers);

				info.addTo(map);

				map.fitBounds(buildings);

				map.attributionControl.addAttribution("Contains OS data &copy; Crown copyright and OpenMap Local 2016 | Addresses &copy; OpenStreetMap Contributors");

				var baseMaps = {
					"Base Map": sketchylayer,
				};
				
				var overlayMaps = {
					"Places": buildings
				};

				if (highlight != undefined) {
					var bounds = highlight.getBounds();
					map.fitBounds(bounds);
					highlight.openPopup();
				}

				L.control.zoom({
					"position": "bottomleft",
				}).addTo(map);

				L.control.layers(baseMaps, overlayMaps, {
					"position": "bottomleft"
				}).addTo(map);
				
				map.addControl(new infobox());
				map.addControl(new feature_legend());
				if (allFeatures == false) {
					map.addControl(new show_all_buildings());
				}
				
				title_box_title = '';

				if (title_box_title != '') {
					map.addControl(new titlebox());
					$('.titlebox-control').show();
				}
			

				/*$('.all_btn').click(function() {
					var jsonUrl = "/map/api/features/";
					loadFeatures(jsonUrl, 'main');
					$('.infobox-control').hide();
					$('.titlebox-control').hide();
				});*/
				

				$('.leaflet-control').mouseover(function() {
					buildings.eachLayer(function(layer) {
						if (layer._options['color'] != '#1AA9FF') {
							layer.setStyle(myStyle);
						}
					layer.removeEventListener();
					})
				});

				$('.leaflet-control').mouseout(function() {
					buildings.eachLayer(function(layer) {			
						if (layer.feature.properties) {
							if (layer.feature.properties.b_name) {
								layer.bindPopup(layer.feature.properties.b_name);
							}
							else if (layer.feature.properties.address) {
								layer.bindPopup(layer.feature.properties.address);
							}
						}
						layer.on("mouseover", function(e) {
							setFootprintColour(layer, e);
							info.update(layer.feature.properties);
						})
						layer.on("mouseout", function(e) {
							setFootprintColour(layer, e);
							info.update()
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
	} else if (mapType == 'detail') {

		function initDetailMap(layers) {
			map = L.map('map', {
				zoom: 17,
				zoomControl: false,
				layers: layers,
			});
			map.dragging.disable();
			map.touchZoom.disable();
			map.doubleClickZoom.disable();
			map.scrollWheelZoom.disable();
			map.keyboard.disable();
			map.fitBounds(buildings);
			map.attributionControl.addAttribution("Contains OS data &copy; Crown copyright and OpenMap Local 2016 | Addresses &copy; OpenStreetMap Contributors");
		}

		$.getJSON(jsonUrl).done(function(data) {
			if (map == null) {
				geojson = data;
				
				sketchylayer = L.tileLayer('http://dev.local/tileserver.php?/index.json?/all_footprints_boring/{z}/{x}/{y}.png', {maxZoom: 20, opacity: 0.5,});
				
				buildings = L.geoJson(geojson, {
					style: highlightStyle,
				});
				
				layers = [sketchylayer, buildings];

				initDetailMap(layers);
			}
		});


	}
}