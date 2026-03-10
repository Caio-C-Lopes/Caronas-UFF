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
import 'select2'
import 'select2/dist/css/select2.css'

window.addEventListener("turbolinks:load", function() {
  const dateInput = document.querySelector(".datetimepicker");
  if (dateInput) {
    flatpickr(".datetimepicker", {
      enableTime: true,
      altInput: true,
      altFormat: "d \\d\\e F \\à\\s H:i",
      dateFormat: "Y-m-d H:i",
      minDate: dateInput.value || "today",
      time_24hr: true,
      locale: Portuguese
    });
  }

  //arquivo separado (organização)
  function showSelect(target) {
    const selectWrapper = $(`.${target}-select-wrapper`);
    const mySelect2 = selectWrapper.find('select');
    selectWrapper.show();
    mySelect2.prop('disabled', false);
    initSelect2(mySelect2);
    mySelect2.next('.select2-container').show();
  }

  function hideSelect(target) {
    const selectWrapper = $(`.${target}-select-wrapper`);
    const mySelect2 = selectWrapper.find('select');
    selectWrapper.hide();
    mySelect2.prop('disabled', true);
    mySelect2.next('.select2-container').hide();
  }

  function showText(target) {
    const textWrapper = $(`.${target}-text-wrapper`);
    const textEl = textWrapper.find('input');
    textWrapper.show();
    textEl.prop('disabled', false);
  }

  function hideText(target) {
    const textWrapper = $(`.${target}-text-wrapper`);
    const textEl = textWrapper.find('input');
    textWrapper.hide();
    textEl.prop('disabled', true);
  }

  function initSelect2(mySelect2) {
    if (mySelect2.hasClass('select2-hidden-accessible')) return;

    mySelect2.select2({
      ajax: {
        url: mySelect2.data('url'),
        dataType: 'json',
        delay: 1000,
        data: function(params) { return { q: params.term }; },
        processResults: function(data) { return { results: data }; },
        cache: true
      },
      minimumInputLength: 1,
      width: '100%',
      placeholder: 'Busque um campus...',
      language: {
        inputTooShort: function () { return "Digite pelo menos 1 caractere"; },
        noResults: function () { return "Nenhum campus encontrado"; },
        searching: function () { return "Buscando..."; }
      }
    });
  }

  function setSelectValue(mySelect2, text) {
    if (!text) return;
    mySelect2.empty();
    const newOption = new Option(text, text, true, true);
    mySelect2.append(newOption).trigger('change');
  }  

  ['departure', 'destination'].forEach(function(target) {
    const selectWrapper = $(`.${target}-select-wrapper`);
    const mySelect2 = selectWrapper.find('select');
    const selected = mySelect2.data('selected');

    if (selectWrapper.is(':visible')) {
      initSelect2(mySelect2);
      if (selected) setSelectValue(mySelect2, selected);
      hideText(target);
    } else {
      hideSelect(target);
    }
  });

  $('.campus-toggle').on('change', function() {
    const target = $(this).data('target');
    const isCampus = $(this).is(':checked');

    if (isCampus) {
      hideText(target);
      showSelect(target);
    } else {
      hideSelect(target);
      showText(target);
    }
  });

  const campusSearch = $('#campus-search');
  if (campusSearch.length) {
    initSelect2(campusSearch);
    campusSearch.on('select2:select', function(e) {
      const campusText = e.params.data.text;
      window.location.href = `/campi?q=${encodeURIComponent(campusText)}`;
    });
  }
  
});
