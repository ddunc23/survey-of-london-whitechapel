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
		container.innerHTML += '<a href="/map/" class="all_btn btn btn-primary btn-sm">Show All Places</a>';
		return container;
	}
})

var myStyle = {
	"color": "#F58216",
	"fillColor": "#F58216",
	"weight": 2,
	"opacity": 0.6
};

var openSpaceStyle = {
	"color": "#9CD351",
	"fillColor": "#9CD351",
	"weight": 2,
	"opacity": 0.6
}

var placeStyle = {
	"color": "#B750A8",
	"fillColor": "#B750A8",
	"weight": 1.5,
	"opacity": 0.6,
	"dashArray": "5, 5"
}

var extraMurosStyle = {
	"color": "#454545",
	"fillColor": "#454545",
	"weight": 1,
	"opacity": 0.6
}

var hoverStyle = {
	"opacity": 1,
	"weight": 3,
	"color": "#1AA9FF",
}

var highlightStyle = {
	"opacity": 1,
	"color": "#1AA9FF",
	"fillColor": "#1AA9FF",
	"weight": 4.5
};


function setDocNumberStyle(layer) {
	var count = layer.feature.properties.count
	if (count == 0) {
		layer.setStyle({fillOpacity: 0});
	} else if (count >= 1 && count <= 2) {
		layer.setStyle({fillOpacity: 0.2});
	} else if (count >= 3 && count <= 6) {
		layer.setStyle({fillOpacity: 0.6});
	} else if (count >= 7) {
		layer.setStyle({fillOpacity: 0.8});
	}
}

function resetColours(vectorlayer) {
	vectorlayer.eachLayer(function(layer) {
		if (layer.feature.properties.feature_type == 'OPEN_SPACE') {
			layer.setStyle(openSpaceStyle);
		} else if (layer.feature.properties.feature_type == 'PLACE') {
			layer.setStyle(placeStyle);
		} else if (layer.feature.properties.feature_type == 'GREATER_WHITECHAPEL') {
			layer.setStyle(extraMurosStyle);
		} else {
			layer.setStyle(myStyle);
		}
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
		var key = Object.keys(layer._layers)[0];
		if (layer._layers[key].options.fillColor == '#1AA9FF') {
			layer.setStyle(hoverStyle);
		} else if (layer.feature.properties.feature_type == 'OPEN_SPACE') {
			layer.setStyle(openSpaceStyle);
		} else if (layer.feature.properties.feature_type == 'PLACE') {
			layer.setStyle(placeStyle);
		} else if (layer.feature.properties.feature_type == 'GREATER_WHITECHAPEL') {
			layer.setStyle(extraMurosStyle);
		} else if (layer.feature.properties.feature_type == 'WHITECHAPEL_BUILDING') {
			layer.setStyle(myStyle);
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
    var snippet;
    if (properties) {
    	if (properties.b_name) {
    		snippet = properties.b_name;
    	} else {
    		snippet = properties.address;
    	}
    }
    this._div.innerHTML =  (properties ? '<b>' + snippet + '</b>' : '');
};


function onEachFeature(feature, layer) {
	if (feature.properties) {
		var hl = getUrlVars()['highlight'];
		if (feature.id == hl) {
			highlight = layer;
			layer.setStyle(highlightStyle);
			getDocument(feature.id);
		} else if (feature.properties.feature_type == 'OPEN_SPACE') {
			layer.setStyle(openSpaceStyle);
		} else if (feature.properties.feature_type == 'PLACE') {
			layer.setStyle(placeStyle);
		} else if (feature.properties.feature_type == 'GREATER_WHITECHAPEL') {
			layer.setStyle(extraMurosStyle);
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


	var titlebox = L.Control.extend({
		options: {
			position: 'topleft',
		},
		onAdd: function(map) {
			var container = L.DomUtil.create('div', 'titlebox-control row');
			container.innerHTML += title_box_title;
			if (allFeatures == false) {
				container.innerHTML += ' | <a href="/map/">Show All</a>';
			}
			return container;
		}
	});

	if (mapType == 'main') {

		function initMap(layers) {
			map = L.map('map', {
				zoom: 16,
				minZoom: 14,
				maxZoom: 20,
				zoomControl: false,
				layers: layers
			});
		};

		$.getJSON(jsonUrl).done(function(data) {
			
			if (map == null) {

				geojson = data;

				sketchylayer = L.tileLayer('https://{s}.surveyoflondon.org/tileserver.php?/index.json?/whitechapel_september_2016/{z}/{x}/{y}.png', {maxZoom: 20});

				scanlayer = L.tileLayer('https://{s}.surveyoflondon.org/tileserver.php?/index.json?/os_1873/{z}/{x}/{y}.png', {maxZoom: 20});

				rocquelayer = L.tileLayer('https://{s}.surveyoflondon.org/tileserver.php?/index.json?/rocque/{z}/{x}/{y}.png', {maxZoom: 20});
				
				/*rocquelayer = L.tileLayer('http://tile.casa.ucl.ac.uk/duncan/Whitechapel/OS_1873/{z}/{x}/{y}.png', {maxZoom: 20});*/

				buildings = L.geoJson(geojson, {
					onEachFeature: onEachFeature,
				});

				if (geojson.features.length > 0) {
					layers = [sketchylayer, /*scanlayer,*/ buildings];
					initMap(layers);
					map.fitBounds(buildings);
				} else {
					layers = [sketchylayer,]
					initMap(layers);
					map.setView([51.5161, -0.067], 16);
					var q = getUrlVars()['q'];
					title_box_title = 'No results for "' + q + '"';
				}

				map.attributionControl.addAttribution("Contains OS data &copy; Crown copyright and OpenMap Local 2016, &copy; Environment Agency copyright and/or database right 2015");

				var baseMaps = {
					"Base Map": sketchylayer,
					"Ordnance Survey 1873": scanlayer,
					"Rocque 1746": rocquelayer,
				};
				
				var overlayMaps = {
					"Buildings and Places": buildings
				};

				if (highlight != undefined) {
					var bounds = highlight.getBounds();
					map.fitBounds(bounds);
					highlight.openPopup();
				}

				L.control.zoom({
					"position": "bottomright",
				}).addTo(map);

				L.control.layers(baseMaps, overlayMaps, {
					"position": "bottomright"
				}).addTo(map);
				
				map.addControl(new infobox());
				
				/*if (allFeatures == false) {
					map.addControl(new show_all_buildings());
				}*/

				if (title_box_title != '') {
					map.addControl(new titlebox());
					$('.titlebox-control').show();
				}

				info.addTo(map);
				

				$('.leaflet-control').mouseover(function() {
					buildings.eachLayer(function(layer) {
					layer.removeEventListener();
					})
				});

				$('.leaflet-control').mouseout(function() {
					buildings.eachLayer(function(layer) {			
						/*if (layer.feature.properties) {
							if (layer.feature.properties.b_name) {
								layer.bindPopup('<a href="feature/' + layer.feature.id + '/detail/">' + layer.feature.properties.b_name + '</a>');
							}
							else if (layer.feature.properties.address) {
								layer.bindPopup('<a href="feature/' + layer.feature.id + '/detail/">' + layer.feature.properties.address + '</a>');
							}
						}*/
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

				/* This pair of functions ensures that when someone presses their 'back' button from a 'detail' view, map interaction is enabled */
				$('.navbar').mouseenter(function() {
					buildings.eachLayer(function(layer) {
						layer.removeEventListener();
					})
				});

				$('.navbar').mouseleave(function() {
					buildings.eachLayer(function(layer) {			
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
			map.attributionControl.addAttribution("Contains OS data &copy; Crown copyright and OpenMap Local 2016");
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