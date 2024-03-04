import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  static targets = ["togglableElement"]
  static values = {link: String}

  fire (e) {
    e.preventDefault()

    console.log('hello');

    fetch(this.linkValue, {
      method: 'POST',
      headers: { "Accept": "application/json" }
    })


    // check if there is an entry in the table?
    // if there is, then we delete the entry

    // if do not have, then we add an try


  }
}
