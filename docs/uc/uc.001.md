# UC.001 Зарегистрироваться в системе
<!-- Подробное описание сценария использования системы с привязкой к ролям участников и задействованным бизнес-сущностям 
https://confluence.mts.ru/pages/viewpage.action?pageId=375782119 
-->
| Название | Зарегистрироваться в системе |
|:---------|:-----------------------------|
| Описание | В данном сценарии пользователь регистрируется в системе для получения доступа к ее функционалу |
| Участники | Пользователь |
| Предусловия | Пользователь находится на сайте helloconf.mts.ru |
| Триггер | Пользователь нажимает на кнопку "Зарегистрироваться" |
| Успешный сценарий | 1. Система запрашивает у пользователя необходимые данные для регистрации (имя, фамилию, адрес электронной почты, название организации, пароль) |
|| 2. Пользователь вводит свои данные и подтверждает ввод |
|| 3. Система проверяет корректность введенных данных |
|| 4. **Если** введенный адрес электронной почты еще не зарегистрирован, управление переходит на следующий шаг |
|| 5. Система отправляет письмо с кодом подтверждения на указанный адрес электронной почты |
|| 6. **Если** письмо с кодом подтверждения отправлено успешно, управление переходит на следующий шаг |
|| 7. Пользователь вводит полученный код подтверждения в соответствующее поле и подтверждает ввод |
|| 8. Система проверяет правильность введенного кода |
|| 9. Система отображает окно с выбором роли пользователя (слушатель или спикер) |
|| 10. **Если** пользователь выбирает роль спикера, управление переходит к [UC.003 Подать заявку на участие в роли спикера](./uc.003.md) |
|| 11. Система регистрирует пользователя в роли слушателя |
|| 12. Система отображает уведомление об успешной регистрации |
|| 13. Система перенаправляет пользователя на главную страницу |
|| 14. Управление переходит к сценарию [UC.009 Отправить уведомления](./uc.009.md) |
|| 15. Вариант использования завершает работу |
| Альтернативный сценарий | 4а. Введенный пользователем адрес электронной почты уже зарегистрирован в системе |
|| 1. Система выводит сообщение об ошибке и предлагает ввести другой адрес электронной почты |
|| 2. Управление переходит на шаг 3 основного потока |
| Сценарий исключений | 6а. Система не может отправить письмо на указанный адрес электронной почты |
|| 1. Система выводит сообщение об ошибке и предлагает попробовать зарегистрироваться позже |
|| 2. Вариант использования завершает работу |
| Постусловия | Пользователь зарегистрирован в системе и получает доступ к ее функционалу |
| Требования | FR.001, FR.002, FR.017 |
