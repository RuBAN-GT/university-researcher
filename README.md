# Genbank - Research

Проект работает на Ruby on Rails.

## Требования

* Ruby 2.3.1
* PostgreSQL 9 / MySQL
* Redis

## Установка

Загрузка зависимостей:

> $ bundle install

Генерация БД и её заполнение:

> $ rake db:setup

## Использование

Запуск стандартного сервера Puma:

> $ rails server

Развёртывание:

> $ cap vsu deploy
