import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static targets = ["startDate", "endDate", "day", "total", "totalWithFees"]
  static values = {
    price: Number,
    fees: Number
  }

  connect() {
    console.log(typeof this.feesValue);
    console.log(this.feesValue);
  }

  calc () {
    if (this.startDateTarget.value === "" || this.endDateTarget.value === "") {
      this.dayTarget.innerText = 0
      this.totalTarget.innerText = 0
    } else {
      this.dayTarget.innerText = (Date.parse(this.endDateTarget.value) - Date.parse(this.startDateTarget.value)) / 3600000 / 24
      this.totalTargets.forEach((target) => {
        target.innerText = (Date.parse(this.endDateTarget.value) - Date.parse(this.startDateTarget.value)) / 3600000 / 24 * this.priceValue
      })
      this.totalWithFeesTarget.innerText = (Date.parse(this.endDateTarget.value) - Date.parse(this.startDateTarget.value)) / 3600000 / 24 * this.priceValue + this.feesValue
    }
  }
}
