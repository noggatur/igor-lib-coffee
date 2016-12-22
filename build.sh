#! /bin/sh

# Устанавливаем все зависимости
if [ ! -d "node_modules" ]; then
  npm install
fi

# Создаём папку lib-js
if [ ! -d "lib-js" ]; then
  mkdir lib-js
fi

# Создаём папку build
if [ ! -d "build" ]; then
  mkdir build
fi

# Компилируем CoffeeScript в JavaScript
coffee -co lib-js lib-coffee

# Собираем все файлы в один
browserify lib-js/igor-lib.js -o build/igor-lib.js

# Сжимаем выходной файл
uglifyjs build/igor-lib.js -o build/igor-lib.min.js