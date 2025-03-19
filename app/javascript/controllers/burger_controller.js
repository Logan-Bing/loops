import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burger"
export default class extends Controller {

  static targets = ["menu", "close"]

  toggle(){
    this.menuTarget.classList.toggle('active')
  }

  close() {
    this.menuTarget.classList.remove('active')
    this.closeTarget.classList.remove('active')
  }

}
