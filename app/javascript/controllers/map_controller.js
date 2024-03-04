import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Array
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    })

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));

    this.map.on('dragend', () => {
      const swCorner = this.map.getBounds().toArray()[0];
      const neCorner = this.map.getBounds().toArray()[1];
      console.log(swCorner, neCorner);

      // fetch("/listings/locationresults") is this correct way to call listings_controller?
        // .then(response => response.json())
        // .then((data) => {
        //   console.log(data);
        // });
    })

    this.map.on('zoomend', () => {
      const swCorner = this.map.getBounds().toArray()[0];
      const neCorner = this.map.getBounds().toArray()[1];
      console.log(swCorner, neCorner)
      });
  }

  #addMarkersToMap() {
    this.markerValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
