import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-reset"
export default class extends Controller {
  connect() {
    console.log('form-reset connected')
  }

  reset() {
    this.element.reset();
  }
}
