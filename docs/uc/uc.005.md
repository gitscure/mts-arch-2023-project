# UC.005 Сформировать расписание докладов
<!-- Подробное описание сценария использования системы с привязкой к ролям участников и задействованным бизнес-сущностям 
https://confluence.mts.ru/pages/viewpage.action?pageId=375782119 
-->
| Название | Выполнить рецензию доклада |
|:---------|:---------------------------|
| Описание | Данный сценарий использования позволяет сформировать или изменить расписание докладов для конференции на основе перечня докладов, уже находящихся в системе |
| Участники | Организатор конференции |
| Предусловия | В системе имеется перечень докладов |
| Триггер | Организатор открыл раздел управления расписанием докладов |
| Успешный сценарий | 1. Система отображает текущее состояние расписания, а также перечень доступных докладов |
|| 2. Организатор добавляет либо удаляет доклады в конференции |
|| 3. Организатор указывает дату, а также время начала и окончания каждого доклада |
|| 4. Система отображает вносимые организатором изменения |
|| 5. Организатор конференции подтверждает формирование или изменение расписания докладов |
|| 6. Система проверяет корректность дат и диапазонов времени в расписании |
|| 7. **Если** расписание сформировано верно, то управление переходит на следующий шаг |
|| 8. Система отображает созданное расписание докладов |
|| 9. Управление переходит к сценарию [UC.009 Отправить уведомления](./uc.009.md) |
|| 10. Вариант использования завершает работу |
| Альтернативный сценарий | 7a. Организатор выбрал пересекающиеся диапазоны времени докладов |
|| 1. Система отображает сообщение в ошибкой в диапазонах времени |
|| 2. Управление переходит на шаг основного 3 потока |
| Сценарий исключений | 7a. Система не может сохранить измененое расписание докладов |
|| 1. Система отображает сообщение с ошибкой при сохранении расписания |
|| 2. Вариант использования завершает работу |
| Постусловия | Сохранено расписание докладов для конференции, которое отображает порядок выступлений, дату, время начала и окончания каждого доклада |
| Требования | FR.003, FR.009, FR.020 |