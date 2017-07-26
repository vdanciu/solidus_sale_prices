//= require jquery-ui-timepicker-addon

SpreeSalePrices = {
  handleDatetimePickerFields: function() {
    $('.datetimepicker').datetimepicker({
      dateFormat: Spree.translations.date_picker,
      timeFormat: "hh:mm tt",
      dayNames: Spree.translations.abbr_day_names,
      dayNamesMin: Spree.translations.abbr_day_names,
      firstDay: Spree.translations.first_day,
      monthNames: Spree.translations.month_names,
      prevText: Spree.translations.previous,
      nextText: Spree.translations.next,
      showOn: "focus",
      oneLine: true
    });
  },

  init: function() {
    SpreeSalePrices.handleDatetimePickerFields();
  }
}

$(document).ready(function() {
  SpreeSalePrices.init();
});
