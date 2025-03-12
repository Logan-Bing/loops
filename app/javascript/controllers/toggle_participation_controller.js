import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-participation"
export default class extends Controller {
  static targets = ["add", "deduct"]

  showAdd() {
    this.addTarget.style.display = "block"
    this.deductTarget.style.display = "none"
  }

  showDeduct() {
    this.addTarget.style.display = "none"
    this.deductTarget.style.display = "block"
  }
}
