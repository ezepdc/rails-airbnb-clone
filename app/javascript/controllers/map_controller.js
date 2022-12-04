import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import { end } from "@popperjs/core"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    // <query: String>
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    // console.log(this.queryValue);
    // console.log(this.markersValue);
    // console.log(this.markersValue.length);

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))


    // if (this.markersValue.length == 0) {
    //   const geocoder = new MapboxGeocoder({
    //     accessToken: mapboxgl.accessToken
    //   });
    //   geocoder.query("Buenos Aires");
    //   this.map.addControl(geocoder);
    // } else {
    //   this.#addMarkersToMap()
    //   this.#fitMapToMarkers()
    // }
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 90, maxZoom: 15, duration: 0 })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
}
