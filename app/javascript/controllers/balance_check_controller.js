import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="balance-check"
export default class extends Controller {
  static targets = ["balance", "value", "button", "message"]

  balanceCheck() {
    if (this.valueTarget.value > this.balanceTarget.innerHTML) {
      this.messageTarget.innerHTML = "Balance insufficient"
      this.buttonTarget.disabled = true;
    } else {
      this.messageTarget.innerHTML = ""
      this.buttonTarget.disabled = false;
    }
  }
}
