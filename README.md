# ExploreWithMe project
Сервис для обмена информацией о событиях и поиска участников

## Описание
Бэкэнд (rest api) микросервисного приложения:
- Основной сервис ewm-server:
    - предусмотрена работа для разных типов пользователей: администратор, зарегистрированный пользователь, посетитель;
    - просмотр событий;
    - поиск событий по различным параметрам;
    - создание и управление категориями;
    - создание и модерации событий;
    - запросы на участие в событии с подтверждением и отклонением;
    - создание и управление подборок событий по темам;
    - сохранение и получении информации о запросах событий в сервис статистики;
    - создание локаций (координаты + радиус), поиск событий, попадающих в радиус локации.
- Сервис статистики ewm-stats:
    - хранит количество просмотров uri событий;
    - отдает статистику просмотров в соответствии параметрами запросов.

## Технологии
- Java 11, Lombok;
- Spring Boot
- Hibernate, JPA, QueryDSL;
- PostgreSQL, SQL, FlyBase;
- Swagger;
- Junit, Mockito, Testcontainers;
- Docker, docker-compose;
- Maven (multi-module project);
- Postman.

## Запуск и тестирование проекта
**приложение использует порты 8080, 9090, 6541, 6540.**
1. git clone https://github.com/Ascejorn/java-explore-with-me.git
2. mvn package
3. docker-compose up

Список эндпоинтов доступен в swagger после запуска приложения по ссылке:
- ewm-server: http://localhost:8080/swagger.html
- ewm-stats: http://localhost:9090/swagger.html

Для тестирования приложения можно воспользоваться коллекцией Postman в одноименной папке.