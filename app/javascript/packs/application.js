// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import toggleDateInputs from 'plugins/init_flatpickr.js';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
    // Call your functions here, e.g:
    // initSelect2();
    toggleDateInputs();
});

import Typed from 'typed.js';
var options = {
  strings: ["Le site qui vous permet d'accéder aux <mark>plus belles oeuvres d'art</mark>",
  "Le site qui vous permet d'accéder aux <mark>tableaux de maître</mark>",
  "Le site qui vous permet d'accéder aux <mark>sculptures d'exceptions</mark>",
  "Le site qui vous permet de <mark>rentabiliser vos investissements d'Art</mark>",
  "Le site qui vous permet <mark>d'épater vos amis</mark>" ],
  typeSpeed: 40,
  loop: true,
  smartBackspace: true
};

var typed = new Typed('#home-title', options);
