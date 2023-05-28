# Описание
Сквозной проект, разрабатываемый в рамках Школы Архитекторов Basic 2023

## Контекст
Вы решили запустить конференцию helloconf.mts.ru и столкнулись с огромным количеством желающих подать доклад. Работа с докладчиками не такая уж и простая – нужно отрецензировать доклады, дать обратную связь, скомпоновать в программу конференции.

Приложение должно содержать как минимум следующие функциональные блоки:
- Работа с докладчиками
- Работа с расписаниями
- Проведение конференции (трансляция, сбор обратной связи)

## Содержимое репозитория
- [Архитектурная документация](./docs/README.md)
- [[Модуль 04] Пример интеграционного сервиса](./module_04/README.md)
  - [Компонентная диаграмма](./docs/components/components.md)
  - [ADR.001 Решение о классификации системы](./docs/adr/adr.001.md)
  - [ADR.002 Выбор шаблона интеграции](./docs/adr/adr.002.md)
- [[Модуль 06] Сервисы для оценки влияния кэширования на производительность реляционной БД](./module_06/)
- [[Модуль 07] Сервисы для сравнения производительности MariaDB и MongoDB](./module_07/)
  - [ADR.003 Принятие решения о переходе на MongoDB](/docs/adr/adr.003.md)
  - [Скрин-подтверждение заливки данных в MongoDB](/module_07/screen_import_mongodb.png), а также [скрипт заливки](./module_07/import_data.py)
  - [Результаты нагрузочного тестирования MongoDB, а также сравнение с MariaDB](./module_07/mariadb_vs_mongodb.md)
  - [Описание применения терминов со слайда 13](/module_07/mongodb_operations.md)
- [[Модуль 08] Сервисы, реализующий паттерн Circuit Breaker](./module_08/)
  - [Лог-файл](/module_08/service_main_homework.log)