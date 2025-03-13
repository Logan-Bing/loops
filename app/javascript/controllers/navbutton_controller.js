import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbutton"
export default class extends Controller {

  static targets = ["navElement"]

  connect() {
    this.highlightSidebar()
  }

  change(event){
    const link = event.currentTarget.querySelector("a")
    link.click();
  }


  highlightSidebar = () => {
    this.navElementTargets.forEach ((e) => {

      e.classList.remove("active")
    });

    const path = window.location.pathname
    this.navElementTargets.forEach ((e) => {
      // if (e.querySelector())
      if (e.querySelector("a").getAttribute("href") === path) {
        e.classList.add("active")
      }
    });

  }
}
