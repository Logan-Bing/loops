import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = ["nextButton", "step2", "step1"]

  connect() {
    console.log("connected")
  }

  display(event){
    event.preventDefault()
    this.step1Target.classList.add("hidden")
    this.step2Target.classList.remove("hidden")
  }
}
