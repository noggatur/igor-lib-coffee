window.$ = window.jQuery = require('jquery');
var igor = require("../lib-js/igor-lib.js");

$(document).ready(function() {
  // Вспомогательные функции
  if (igor.helpers.isset(igor)) {
    $("#ifVarExist").hide();
  } else {
    $("#ifVarExist").show();
  }

  // Преобразования чисел
  $("#delimNum").html(igor.numbers.delim_num($("#delimNum").text()));
  $("#myNum").html(igor.numbers.pretty_tel($("#myNum").text()));
  $("#myMoney").html($("#myMoney").text() + " (" + igor.numbers.to_literal($("#myMoney").text()) + ")");

  // Работа с датой и временем
  $("#today").html(igor.date.rusDate());
  igor.date.updateClock($("#time"));
});