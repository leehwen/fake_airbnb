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
    this.endDatePicker = flatpickr(this.endDateTarget, { minDate: "today"})
  }

  update() {
    console.log(this.startDatePicker);
    if (this.endDateTarget.value) this.startDatePicker.config.maxDate = this.endDateTarget.value;
    if (this.startDateTarget.value) this.endDatePicker.config.minDate = this.startDateTarget.value;
  }
}
