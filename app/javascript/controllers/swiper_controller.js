import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper(".swiper")
    new Swiper('.swiper', {
      // Paramètres de Swiper
      slidesPerView: 3,
      spaceBetween: 30,
      // Ajoutez d'autres options de configuration selon vos besoins
    });
    console.log("Hello, Stimulus!", swiper)
  }
}
