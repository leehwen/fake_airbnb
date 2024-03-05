import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  static targets = ["togglableElement", "heart"]
  static values = {link: String}

  connect() {
  }

  fire (e) {
    e.preventDefault()

    console.log(this.heartTarget.classList.value);

    fetch(this.linkValue, {
      method: 'POST',
      headers: { "Accept": "application/json" }
    })
    .then((response) => {
      console.log(response.ok)
        if (response.ok) {
          if (this.heartTarget.innerHTML.includes('fa-solid')) {
            this.heartTarget.innerHTML = `<i class="fa-regular fa-heart"></i>`
            this.heartTarget.classList.value = 'childiconn'
          } else {
            this.heartTarget.innerHTML = `<i class="fa-solid fa-heart"></i>`
            this.heartTarget.classList.value = 'childiconp'
          }
        }
    })
  }
}
