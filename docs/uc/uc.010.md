# UC.010 Просмотреть трансляцию
<!-- Подробное описание сценария использования системы с привязкой к ролям участников и задействованным бизнес-сущностям 
https://confluence.mts.ru/pages/viewpage.action?pageId=375782119 
-->
| Название | Просмотреть трансляцию |
|:---------|:-----------------------|
| Описание | Сценарий описывает процесс просмотра трансляции конференции в режиме реального времени или в записи |
| Участники | Участник конференции |
| Предусловия | Участник авторизован в системе |
| Триггер | Участник переходит в карточку выбранного доклада |
| Успешный сценарий | 1. Система отображает информацию о докладе в карточке |
|| 2. **Если** выступление с докладом идет в настоящий момент, то управление переходит на следующий шаг |
|| 3. Участник смотрит трансляцию |
|| 4. **Если** участник хочет задать вопрос спикеру, оставив комментарий к трансляции, то управление переходит к [UC.012 Оставить комментарий](uc/uc.012.md) |
|| 5. Вариант использования завершает работу |
| Альтернативный сценарий | 2а. Выступление с докладом уже прошло и запись трансляции доступна |
|| 1. Система отображает в карточке запись трансляции |
|| 2. Участник смотрит выступление с докладом в записи |
|| 3. Управление переходит на шаг 5 основного потока |
| Сценарий исключений | 2б. Выступление с докладом ещё не началось, либо прошло, но запись с докладом ещё не доступна |
|| 1. Система отображает соответствующее сообщение, что просмотр записи в настоящий момент недоступен |
|| 2. Вариант использования завершает работу |
| Постусловия | Пользователь просматривает трансляцию конференции в режиме реального времени или в записи |
| Требования | FR.013, FR.014 |