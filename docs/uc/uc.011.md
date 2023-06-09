# UC.011 Оставить обратную связь
<!-- Подробное описание сценария использования системы с привязкой к ролям участников и задействованным бизнес-сущностям 
https://confluence.mts.ru/pages/viewpage.action?pageId=375782119 
-->
| Название | Оставить обратную связь по конференции |
|:---------|:---------------------------------------|
| Описание | Сценарий  описывает шаги, которые необходимы для того, чтобы участник конференции мог оставить обратную связь |
| Участники | Участник конференции |
| Предусловия | Участник принимает участие в конференции |
| Триггер | Участник конференции открывает форму обратной связи |
| Успешный сценарий | 1. Система отображает форму обратной связи |
|| 1. Участник заполняет поля: свои данные, тему и текст обратной связи |
|| 2. Участник выбирает отправить обратную связь |
|| 3. **Если** все обязательные поля заполнены, то управление переходит на следующий шаг |
|| 4. **Если** сохранение обратной связи проходит успешно, то управление переходит на следующий шаг |
|| 5. Система выводит сообщение пользователю о том, что обратная связь успешно оставлена |
|| 6. Управление переходит к сценарию [UC.009 Отправить уведомления](./uc.009.md) |
|| 7. Вариант использования завершает работу |
| Альтернативный сценарий | 3а. Пользователь не заполнил все обязательные поля |
|| 1. Система выводит сообщение об ошибке и подсвечивает поля, которые необходимо заполнить |
|| 2. Пользователь заполняет необходимые поля |
|| 3. Управление переходит на шаг 2 основного потока |
| Сценарий исключений | 4а. Система не может сохранить обратную связь |
|| 1. Система выводит сообщение об ошибке и просит пользователя повторить попытку позже |
|| 2. Вариант использования завершает работу |
| Постусловия | Обратная связь по конференции успешно сохранена |
| Требования | FR.016, FR.022 |