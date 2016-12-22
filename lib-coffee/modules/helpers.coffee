# Вспомогательные функции
module.exports =
  # Проверка, существует ли переменная
  isset: (variable) ->
    typeof variable != "undefined" && variable != null