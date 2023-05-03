# Контекст решения
<!-- Окружение системы (роли, участники, внешние системы) и связи системы с ним. Диаграмма контекста C4 и текстовое описание. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375783261
-->
```plantuml
@startuml
!include <archimate/Archimate>
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

LAYOUT_WITH_LEGEND()

skinparam roundcorner 25

Person(prt, "Участник", "Участник конференции, выступающий в роли слушателя")
Person(spk, "Спикер", "Участник конференции, выступающий в роли спикера")
Person(org, "Организатор", "Член организационного комитета")
Person(rvw, "Рецензент", "Член программного комитета")
Person(usr, "Пользователь", "Пользователь helloconf.mts.ru")
Person(org2, "Организатор", "Член организационного комитета")

Boundary(b1,"1. Partner Engagement") {
    Container(trln, "Предоставление видеоконтента", "Capability 2.5.7 Управление партнерским сервисом", "Обеспечение просмотра выступлений как онлайн, так и в записи, с возможностью оставлять комментарии")
    Container_Ext(ytb, "Видеохостинг", "Software System", "Внешняя система, которая осуществляет стриминг конференции, а также предоставляет доступ к записям докладом")
}

Boundary(b2, "2. Product Creation") {
    Container(time, "Управление расписанием", "Capability 2.2.2 Управление каналами самообслуживания", "Управление расписанием конференции, а также установленными пользователями уведомлениями")
    Container(repo, "Работа с докладами и рецензиями", "Capability 2.4.6 Управление документами клиентов", "Загрузка документов на платформу, рецензирование поступивших докладов и предоставление обратной связи")
}

Boundary(b3, "3. Customer Engagement") {
    Container(auth, "Управление профилем участника", "Capability 2.2.1 Управление аутентификацией и авторизацией", "Регистрация, аутентификация и авторизация клиентов")
}

Boundary(b6, "6. Support") {
    Container(fbck, "Управление обращениями пользователей", "Capability 2.4.4 Управление обращениями клиентов", "Обработка заявок и обратной связи")
    Container(noti, "Управление уведомлениями", "Capability 2.2.3 Управление каналами рассылки", "Обеспечение возможности рассылки уведомлений о событиях")
}

prt -down-> trln
Lay_D(trln, ytb)

Lay_U(spk, rvw)
Lay_R(spk, org)
spk -down-> repo
rvw -down-> repo
org -down-> time
Lay_R(repo, time)

usr -down-> auth
Lay_D(trln, ytb)

org2 -down-> fbck

Lay_R(prt, spk)
Lay_R(org, usr)
Lay_R(usr, org2)

Rel(trln, ytb, "Трансляция выступлений, комментарии", "HLS, REST API")

Rel(auth, noti, "Данные пользователей", "AMPQ")
Rel(auth, time, "Данные пользователей", "AMPQ")
Rel(auth, repo, "Данные пользователей", "AMPQ")
Rel(auth, fbck, "Данные пользователей", "AMPQ")

Rel(time, noti, "Данные о расписании и уведомлениях", "AMPQ")
Rel(auth, noti, "Данные для рассылки", "AMPQ")

Rel(repo, time, "Информация о докладах и рецензиях", "AMPQ")
Rel(repo, noti, "Данные для рассылки", "AMPQ")

Rel(fbck, noti, "Данные для рассылки", "AMPQ")

@enduml
```