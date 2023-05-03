# Компонентная архитектура
<!-- Состав и взаимосвязи компонентов системы между собой и внешними системами с указанием протоколов, ключевые технологии, используемые для реализации компонентов.
Диаграмма контейнеров C4 и текстовое описание. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375783368
-->
## Контейнерная диаграмма

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

AddElementTag("microService", $shape=EightSidedShape(), $bgColor="CornflowerBlue", $fontColor="white", $legendText="microservice")
AddElementTag("storage", $shape=RoundedBoxShape(), $bgColor="lightSkyBlue", $fontColor="white")

LAYOUT_TOP_DOWN()

Person(usr, "Пользователь")

System_Boundary(conf, "helloconf.mts.ru") {
    Container(web, "Веб-приложение", "html, JavaScript, React", "Портал конференции")
    Boundary(auth, "Управление профилем участника") {
        Container(user_service, "User Service", "Java, Spring Boot", "Сервис обработки информации о пользователях", $tags = "microService")
        ContainerDb(user_db, "User Catalog", "Apache Cassandra", "Хранение информации о пользователях", $tags = "storage")
    }

    Boundary(time, "Управление расписанием") {
        Container(timetable_service, "Timetable Service", "Java, Spring Boot", "Сервис управления расписанием", $tags = "microService")
        ContainerDb(timetable_db, "Timetable Catalog", "Apache Cassandra", "Хранение информации о расписаниях конференций, а также установленных уведомлениях пользователей", $tags = "storage")
    }

    Boundary(repo, "Работа с докладами и рецензиями") {
        Container(report_service, "Report Service", "Java, Spring Boot", "Сервис работы с докладами и рецензиями", $tags = "microService")
        ContainerDb(report_db, "Report Catalog", "Apache Cassandra", "Хранение информации о докладах и рецензиях", $tags = "storage")
    }

    Boundary(fbck, "Управление обращениями пользователей") {
         Container(feedback_service, "Feedback Service", "Java, Spring Boot", "Сервис работы с обратной связью", $tags = "microService")
         ContainerDb(feedback_db, "Feedback Catalog", "PostgreSQL", "Хранение обратной связи", $tags = "storage")
    }

    Boundary(trln, "Предоставление видеоконтента") {
        Container(video_service, "Video Service", "Java, Spring Boot", "Сервис обработки видеотрансляций", $tags = "microService")
    }

    Boundary(noti, "Управление уведомлениями") {
        Container(email_service, "Email Service", "Java, Spring Boot", "Сервис e-mail рассылки", $tags = "microService")
        ContainerDb(email_db, "Email History", "PostgreSQL", "Хранение информации о выполненных рассылках", $tags = "storage")
    }

    Container(message_bus, "Message Bus", "RabbitMQ", "Брокер сообщений")
}

System_Ext(ytb, "Видеохостинг", "Внешняя система, которая осуществляет стриминг конференции, а также предоставляет доступ к записям докладом")

Rel(usr, web, "Работа с порталом", "HTTPS")

Rel(web, user_service, "Просмотр и данных о пользователе", "REST API")
Rel(web, timetable_service, "Управление и просмотр расписания, установка уведомлений", "REST API")
Rel(web, report_service, "Получение информации о докладах и рецензировании", "REST API")
Rel(web, video_service, "Получение трансляции", "REST API")
Rel(web, feedback_service, "Оставление обратной связи", "REST API")

Rel(user_service, user_db, "Сохранение данных о пользователях", "CQL")
Rel(timetable_service, timetable_db, "Сохранение данных о расписаниях, а также об уведомлениях", "CQL")
Rel(email_service, email_db, "Сохранение данных о рассылках", "SQL")
Rel(report_service, report_db, "Сохранение данных о докладах и рецензиях", "CQL")
Rel(feedback_service, feedback_db, "Сохранение данных об обратной связи", "SQL")

Rel(user_service, message_bus, "Отправка данных о пользователях", "AMPQ")
Rel(timetable_service, message_bus, "Получение информации о пользователях, докладах. Отправка данных о расписании и уведомлениях", "AMPQ")
Rel(email_service, message_bus, "Получение данных для рассылки", "AMPQ")
Rel(report_service, message_bus, "Получение информации о пользователях. Отправка информации о докладах и рецензиях", "AMPQ")
Rel(feedback_service, message_bus, "Отправка информации об оставленной обратной связи", "AMPQ")

Rel(web, video_service, "Получение видео, отправка и получение комментариев", "HLS, REST API")
Rel(video_service, ytb, "Трансляция выступлений, комментарии", "HLS, REST API")

SHOW_LEGEND()
@enduml

```









## Список компонентов
| Компонент             | Роль/назначение                  |
|:----------------------|:---------------------------------|
| *Название компонента* | *Описание назначения компонента* |

