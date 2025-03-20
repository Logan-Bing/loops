import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="history"
export default class extends Controller {

  static targets = ["add", "deduct", "addbar", "deductbar", "deductmain", "addmain"]

  change(){
    this.deductTarget.classList.add("active-text")
    this.addTarget.classList.remove("active-text")
    this.deductbarTarget.classList.add("active-bar")
    this.deductbarTarget.id = "left-bar"
    this.addbarTarget.classList.remove("active-bar")
    this.addmainTarget.classList.add("hidden-main")
    this.deductmainTarget.classList.remove("hidden-main")
  }

  secondChange(){
    this.deductTarget.classList.remove("active-text")
    this.addTarget.classList.add("active-text")
    this.deductbarTarget.classList.remove("active-bar")
    this.addbarTarget.classList.add("active-bar")
    this.deductmainTarget.classList.add("hidden-main")
    this.addmainTarget.classList.remove("hidden-main")
  }

}
