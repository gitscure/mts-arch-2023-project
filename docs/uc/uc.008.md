# UC.008 Подписаться на уведомение о начале доклада
<!-- Подробное описание сценария использования системы с привязкой к ролям участников и задействованным бизнес-сущностям 
https://confluence.mts.ru/pages/viewpage.action?pageId=375782119 
-->
| Название | Подписаться на уведомление о начале доклада |
|:---------|:--------------------------------------------|
| Описание | Данный сценарий использования позволяет участнику конференции подписаться на уведомление о начале доклада, чтобы не пропустить интересующий его доклад |
| Участники | Участник конференции |
| Предусловия | Участник конференции находится на странице с расписанием, либо просматривает карточку заинтересовавшего его доклада |
| Триггер | Участник определился с интересующим его докладом |
| Успешный сценарий | 1. Участник выбирает интересующий его доклад на странице расписания или в карточке доклада |
|| 2. Участник выбирает опцию "Подписаться на уведомление о начале доклада" |
|| 3. Система запрашивает подтверждение на информирование по электронной почте |
|| 4. **Если** участник подтверждает отправку уведомлений, то управление переходит на следующий шаг |
|| 5. Система добавляет подписку на уведомление о начале доклада |
|| 6. Управление переходит к сценарию [UC.009 Отправить уведомления](./uc.009.md) |
|| 7. Вариант использования завершает работу |
| Сценарий исключений | 4а. Участник отменяет разрешение на отправку уведомлений о начале доклада |
|| 1. Система закрывает окно с подтверждением отправки уведомлений |
|| 2. Вариант использования завершает работу |
| Постусловия | Участник подписывается на уведомления о начале доклада |
| Требования | FR.012, FR.021 |
