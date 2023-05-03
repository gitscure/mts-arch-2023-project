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

Strategy_ValueStream(vs1, "1. Partner Engagement")
Strategy_ValueStream(vs2, "2_Product_Creation==========================")
Strategy_ValueStream(vs3, "3. Customer Engagement")
Strategy_ValueStream(vs4, "4. Offering")
Strategy_ValueStream(vs5, "5. Ordering")
Strategy_ValueStream(vs6, "6_Support=========")


Person(usr, "Пользователь", "Пользователь helloconf.mts.ru")
Person(prt, "Участник", "Участник конференции, выступающий в роли слушателя")
Person(spk, "Спикер", "Участник конференции, выступающий в роли спикера")
Person(org, "Организатор", "Член организационного комитета")
Person(org2, "Организатор", "Член организационного комитета")
Person(rvw, "Рецензент", "Член программного комитета")


Container(auth, "Управление профилем участника", "Capability 2.2.1 Управление аутентификацией и авторизацией", "Регистрация, аутентификация и авторизация клиентов")
Container(time, "Управление расписанием", "Capability 2.2.2 Управление каналами самообслуживания", "Управление расписанием конференции")
Container(repo, "Работа с докладами и рецензиями", "Capability 2.4.6 Управление документами клиентов", "Загрузка документов на платформу, рецензирование поступивших докладов и предоставление обратной связи")
Container(fbck, "Управление обращениями пользователей", "Capability 2.4.4 Управление обращениями клиентов", "Обработка заявок и обратной связи")
Container(trln, "Предоставление видеоконтента", "Capability 2.5.7 Управление партнерским сервисом", "Обеспечение просмотра выступлений как онлайн, так и в записи, с возможностью оставлять комментарии")
Container(noti, "Управление уведомлениями", "Capability 2.2.3 Управление каналами рассылки", "Обеспечение возможности рассылки уведомлений о событиях")

Container_Ext(ytb, "Видеохостинг", "Software System", "Внешняя система, которая осуществляет стриминг конференции, а также предоставляет доступ к записям докладом")

Lay_D(prt, vs1)
Lay_D(vs1, trln)
Lay_D(trln, ytb)

Lay_D(spk, vs2)
Lay_R(spk, org)
Lay_D(org, vs2)
Lay_D(vs2, repo)
Lay_R(repo, time)
Lay_D(vs2, time)
Lay_D(usr, vs3)
Lay_D(spk, repo)
Lay_D(org, time)
Lay_U(spk, rvw)

Lay_D(usr, vs3)
Lay_D(vs3, auth)

Lay_D(org2, vs6)
Lay_D(vs6, fbck)
Lay_D(fbck, noti)

Lay_R(vs1, vs2)
Lay_R(vs2, vs3)
Lay_R(vs3, vs4)
Lay_R(vs4, vs5)
Lay_R(vs5, vs6)

@enduml
```