import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-checkboxes"
export default class extends Controller {

  static targets = [ ""]

  set_project_list() {
    console.log("Connected to index-checkboxes controller")
  }
}
