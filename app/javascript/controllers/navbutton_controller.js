import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbutton"
export default class extends Controller {

  static targets = ["navElement"]

  change(event){
    this.navElementTargets.forEach ((e) => {
      e.classList.remove("active")
    });
    event.currentTarget.classList.add("active")
  }
}

// Event.currentTarget.classList.add("active");

//  <   this.navElementTarget.classList.add("active")>
