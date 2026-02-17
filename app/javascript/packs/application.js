require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
window.$ = require("jquery")
window.jQuery = require("jquery")

require("@nathanvda/cocoon")
 
import 'bootstrap'
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.css";
import { Portuguese } from "flatpickr/dist/l10n/pt.js";

window.addEventListener("turbolinks:load", function() {
  flatpickr(".datetimepicker", {
    enableTime: true,
    altInput: true,
    altFormat: "d \\d\\e F \\à\\s H:i",
    dateFormat: "Y-m-d H:i", 
    minDate: "today",
    time_24hr: true,
    locale: Portuguese
  });
});



