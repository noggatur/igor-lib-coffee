# Работа с датой и временем

h = require './helpers.js'
date = new Date()

module.exports =
  # Российский формат даты
  rusDate: (day, month, year) ->
    # Формат — ("after", 2, "months") или ("today")
    if day is "today" or day is "after" or day is "before" or !h.isset(day)
      if day is "after"
        if year is "days"
          date.setDate(date.getDate() + month)

        if year is "months"
          date.setDate(date.getMonth() + month)

        if year is "years"
          date.setDate(date.getFullYear() + month)

      if day is "before"
        if year is "days"
          date.setDate(date.getDate() - month)

        if year is "months"
          date.setDate(date.getMonth() - month)

        if year is "years"
          date.setDate(date.getFullYear() - month)

      # Определяем числа по заданным параметрам
      day = (if (date.getDate() + "").length is 1 then "0" else "") + date.getDate()

      m = date.getMonth() + 1
      month = (if (m + "").length is 1 then "0" else "") + m

      year = date.getFullYear()

    # Иначе — формат (22.12.1992)

    day + "." + month + "." + year

  # Ход часов
  updateClock: (clock) ->
    do set_time = ->
      # Обновляем время
      ct = new Date()

      # Вытаскиваем часы, минуты и секунды
      h = ct.getHours()
      m = ct.getMinutes()
      s = ct.getSeconds()

      # Настраиваем отображение часов и минут
      if h < 10 then h = "0"+h
      if m < 10 then m = "0"+m

      # Обновляем часы (jQuery-объект clock)
      clock.text h+":"+m

      # Для отладки смотрим точное время в консоли
      # console.log h+":"+m+":"+if s < 10 then "0"+s else s

      # Синхронизация времени с часами на компьютере
      interval = 60 - s

      # Задаём периодичность обновления часов на сайте
      setTimeout(set_time, interval * 1000)