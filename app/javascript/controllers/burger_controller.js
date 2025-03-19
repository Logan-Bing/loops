import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burger"
export default class extends Controller {

  static targets = ["menu"]

  connect() {
    alert("Stimulus OK ✅");
  }

  toggle(){
    this.menuTarget.classList.toggle('active')
  }
}

