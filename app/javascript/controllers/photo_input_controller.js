import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-input"
export default class extends Controller {
  static targets = ["file", "photo", "button", "validate", "check", "loading"]
  connect() {
    console.log("hello")
    this.photoTarget.addEventListener("change", this.afficherNomFichier.bind(this));


  }
  addPhoto() {
    if (this.photoTarget.files.length > 0) {
      this.validateTarget.click()
      document.body.innerHTML = "";
      this.loadingTarget.style.display = "block"
    } else {
      this.photoTarget.click()
    }
    }

  afficherNomFichier() {
    if (this.photoTarget.files.length > 0) {
      this.fileTarget.textContent = this.photoTarget.files[0].name;
      this.checkTarget.style.display = "block"
      this.buttonTarget.textContent = "Valider"
    } else {
      this.fileTarget.textContent = "";
    }
  }
}
