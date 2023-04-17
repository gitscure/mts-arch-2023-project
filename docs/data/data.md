# Модель предметной области
<!-- Логическая модель, содержащая бизнес-сущности предметной области, атрибуты и связи между ними. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375782602

Используется диаграмма классов UML. Документация: https://plantuml.com/class-diagram 
-->

```plantuml
@startuml
namespace helloconf {
  class Conference {
    id: string
    name: string
    dateStart: datetime
    dateEnd: datetime
    organisationCommittee: Organizer[]
    programCommittee: Reviewer[]
    participants: Participant[]
    timetable: Timetable
    feedbackList: Feedback[]
    createdAt: datetime
    updatedAt: datetime
  }

  class User {
    id: string
    firstName: string
    lastName: string
    company: string
    email: string
    type: Role
    createdAt: datetime
    updatedAt: datetime
  }

  class Speaker {
    report: Report
    status: boolean
  }

  enum Role {
    organizer
    reviewer
    participant
    speaker
  }

  class Organizer {
    conferenceLink: string
  }
  
  class Reviewer {
    expertThemes: Theme[]
  }

  class Participant {

  }

  class Timetable {
    id: string
    name: string
    talkList: Talk[]
    createdAt: datetime
    updatedAt: datetime
  }

  class Talk {
    id: string
    title: string
    author: Speaker
    report: Report
    start: datetime
    end: datetime
    translationLink: Translation
    commentList: Comment[]
    createdAt: datetime
    updatedAt: datetime
  }

  class Report {
    id: string
    title: string
    description: string
    author: Speaker
    status: string
    reviewer: Reviewer
    review: string
    createdAt: datetime
    updatedAt: datetime
  }

  class Theme {
    id: string
    name: string
  }

  class Feedback {
    id: string
    author: User
    title: string
    body: string
    createdAt: datetime
  }

  class Comment {
    id: string
    author: User
    body: string
    createdAt: datetime
  }

  class Email {
    id: string
    from: string
    to: User[]
    subject: string
    body: string
    createdAt: datetime
    updatedAt: datetime
  }

  User <|-- Speaker
  User <|-- Participant
  User <|-- Organizer
  User <|-- Reviewer
  User -- Role

  Conference "1..*"*--"1..*" Organizer
  Conference "1..*"*--"1..*" Reviewer
  Conference "1..*"*--"0..*" Participant
  Conference "1..*"*--"1" Timetable
  Conference "1..*"*--"0..*" Feedback

  Timetable "1..*"*--"1..*" Talk
  Talk "1..*"*--"1..*" Report
  Talk "1"*--"0..*" Comment

  Report "1..*"*--"1..*" Theme
  Reviewer "1..*"*--"1..*" Theme
  Speaker "1"*--"1..*" Report

  Reviewer --> Report: Рецензирует
  Speaker --> Talk: Участвует в
  Participant --> Talk: Участвует в
  User --> Email: Получает расссылку
  User --> Feedback: Оставляет
  User --> Comment: Оставляет
}

namespace video_platform {
  class Translation {

  }
  helloconf.Talk ..> Translation: ref
}

@enduml
```
