import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper/bundle"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper('.swiper')
    new Swiper('.swiper', {
      // Paramètres de Swiper
      slidesPerView: 3,
      spaceBetween: 30,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    });
    swiper.init()
    console.log("Hello, Stimulus!", swiper)
  }
}
