import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="redeem-points"
export default class extends Controller {
  static targets = ["balance", "points", "reward", "pop", "overlay"]

  connect() {
    console.log("hello")
  }

  createRedeem() {
    this.popTarget.style.display = "block"
    this.overlayTarget.style.display = "block"
  }

  cancelRedeem() {
    this.popTarget.style.display = "none"
    this.overlayTarget.style.display = "none"
  }
}
