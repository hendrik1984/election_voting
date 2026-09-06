import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-top"
export default class extends Controller {
  connect() {
    window.scrollTo({
      top: 0,
      behavior: "instant"
    })
  }
}
