import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-input"
export default class extends Controller {
  static targets = ["file", "photo", "button", "validate", "check", "loading"]
  connect() {
    console.log("hello")
    this.photoTarget.addEventListener("change", this.afficherNomFichier.bind(this));
  }

  replace () {
    document.body.innerHTML = "";
    document.body.innerHTML = `
    <div id="loading-container" data-photo-input-target="loading">
      <div id="loading-page">
        <div id="loading-text">
          <h1>Scan en cours</h1>
        </div>

        <div id="loading-img">
          <p>. . . . . .</p>
        </div>
      </div>
    </div>
    `;
  }

  addPhoto() {
    if (this.photoTarget.files.length > 0) {
      this.validateTarget.click()
      this.replace()
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
