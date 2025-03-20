import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reward-card"
export default class extends Controller {
  static targets = ["link"]
  connect() {
    console.log("hello")
  }

  cardClick(event) {
    // Trouver le lien dans la carte cliquée
    const link = event.currentTarget.querySelector("[data-reward-card-target='link']");

    if (link) {
      // Simuler un clic sur le lien
      link.click();
    } else {
      console.error("Link not found in card.");
    }
  }
}
