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
    Container(user_service, "User Service", "Java, Spring Boot", "Сервис обработки информации о пользователях", $tags = "microService")   
    Container(timetable_service, "Timetable Service", "Java, Spring Boot", "Сервис управления расписанием", $tags = "microService") 
    Container(email_service, "Email Service", "Java, Spring Boot", "Сервис e-mail рассылки", $tags = "microService")
    Container(report_service, "Report Service", "Java, Spring Boot", "Сервис работы с докладами", $tags = "microService")
    Container(review_service, "Review Service", "Java, Spring Boot", "Сервис работы с рецензиями", $tags = "microService")
    Container(video_service, "Video Service", "Java, Spring Boot", "Сервис обработки видеотрансляций", $tags = "microService")
    Container(notification_service, "Notification Service", "Java, Spring Boot", "Работы с уведомлениями", $tags = "microService")

    ContainerDb(user_db, "User Catalog", "Apache Cassandra", "Хранение информации о пользователях", $tags = "storage")
    ContainerDb(timetable_db, "Timetable Catalog", "Apache Cassandra", "Хранение информации о расписаниях конференций", $tags = "storage")
    ContainerDb(email_db, "Email History", "PostgreSQL", "Хранение информации о выполненных рассылках", $tags = "storage")
    ContainerDb(report_db, "Report Catalog", "Apache Cassandra", "Хранение информации о докладах", $tags = "storage")
    ContainerDb(review_db, "Review Catalog", "Apache Cassandra", "Хранение информации о рецензиях", $tags = "storage")
    ContainerDb(notification_db, "Notification Catalog", "Apache Cassandra", "Хранение уведомлений", $tags = "storage")
    
    Container(message_bus, "Message Bus", "RabbitMQ", "Брокер сообщений")
}

System_Ext(ytb, "Видеохостинг", "Внешняя система, которая осуществляет стриминг конференции, а также предоставляет доступ к записям докладом")

Rel(usr, web, "Работа с порталом", "HTTPS")

Rel(web, user_service, "Просмотр и данных о пользователе", "REST API")
Rel(web, timetable_service, "Управление и просмотр расписания", "REST API")
Rel(web, report_service, "Получение информации о докладах", "REST API")
Rel(web, review_service, "Рецензирование докладов", "REST API")
Rel(web, notification_service, "Установка уведомлений", "REST API")
Rel(web, video_service, "Получение трансляции", "REST API")

Rel(user_service, user_db, "Сохранение данных о пользователях", "CQL")
Rel(timetable_service, timetable_db, "Сохранение данных о расписаниях", "CQL")
Rel(email_service, email_db, "Сохранение данных о выполненных рассылках", "SQL")
Rel(report_service, report_db, "Сохранение данных о докладах", "CQL")
Rel(review_service, review_db, "Сохранение данных о рецензиях", "CQL")
Rel(notification_service, notification_db, "Сохранение данных об уведомлениях", "CQL")

Rel(user_service, message_bus, "Отправка данных о пользователях", "AMPQ")
Rel(timetable_service, message_bus, "Получение информации о пользователях, докладах, уведомлениях. Отправка данных о расписании", "AMPQ")
Rel(email_service, message_bus, "Получение данных для рассылки", "AMPQ")
Rel(report_service, message_bus, "Получение информации о пользователях, рецензиях. Отправка информации о докладах", "AMPQ")
Rel(review_service, message_bus, "Получение информации о пользователях. Отправка рецензий", "AMPQ")
Rel(notification_service, message_bus, "Получение информации о пользователях, расписании. Отправка данных для рассылки", "AMPQ")

Rel(web, video_service, "Получение видео", "HLS")
Rel(video_service, ytb, "Трансляция выступлений", "HLS")

SHOW_LEGEND()
@enduml

```









## Список компонентов
| Компонент             | Роль/назначение                  |
|:----------------------|:---------------------------------|
| *Название компонента* | *Описание назначения компонента* |

