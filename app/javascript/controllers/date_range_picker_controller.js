import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="date-range-picker"
export default class extends Controller {
  static targets = [
    "startDate",
    "endDate"
  ];

  connect() {
    this.startDatePicker = flatpickr(this.startDateTarget, { minDate: "today"})
    this.endDatePicker = flatpickr(this.endDateTarget, { minDate: this.getNextDay(new Date())})

    console.log(this.getNextDay(new Date()))
  }

  update() {
    console.log(this.startDatePicker);
    if (this.endDateTarget.value) this.startDatePicker.config.maxDate = this.endDateTarget.value;
    if (this.startDateTarget.value) this.endDatePicker.config.minDate = this.getNextDay(new Date(this.startDateTarget.value));

  }

  getNextDay(date) {
    date.setDate(date.getDate()+1);

    return date;
  }
}
