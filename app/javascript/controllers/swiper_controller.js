import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper(".swiper")
    console.log(swiper)
  }
}
