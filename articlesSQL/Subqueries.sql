INSERT INTO category (name_pl, name_en) VALUES ("Bazy danych", "Database");
INSERT INTO category (name_pl, name_en) VALUES ("Oracle", "Oracle");
INSERT INTO category (name_pl, name_en) VALUES ("UML", "UML");

INSERT INTO article (release_date, title_en, title_pl, category_id)
VALUES (curdate(), "What are subqueries?" ,"Co to podzapytania (subqueries)?", 3);

INSERT INTO code (text,article_id) VALUES ("SELECT LONG FROM STATION WHERE LAT = (SELECT MAX(LAT) FROM STATION WHERE LAT < 137.2345);", 4);
INSERT INTO code (text,article_id) VALUES ("SELECT * FROM Boats WHERE price < (SELECT max(price) FROM Cars);", 4);

INSERT INTO content_pl (article_id, text, div_number)
VALUES (4, "Subqueries (podzapytania) to zapytania zagnieżdżone. Można je umieścić we wszystkich operacjach CRUD.
Najpopularniejszym i najbardziej intuicyjnym sposobem użycia podzapytań jest wykorzystanie ich jako warunek w instrukcji WHERE.
W wielu przypadkach mogą być zastąpione przez instrukcję JOIN, ale zwykle podzapytania są łatwiejsze do zrozumienia.
Przeważnie wydajność jest taka sama dla JOIN i podzapytania.", 1);
INSERT INTO content_pl (article_id, text, div_number)
VALUES (4,  "Pierwsze zapytanie zwraca długość geograficzną (LONG) dla największej szerokości geograficznej (LAT) na stacji STATION, której szerokość jest mniejsza niż 137,2345.
Podzapytanie mogłoby zostać zastąpione przez JOIN, ale wyglądałoby skomplikowanie. Musiałyby wystąpić co najmniej 2 warunki.
W zapytaniu można zagnieździć dowolną liczbę podzapytań, a ponieważ,
czytamy je głównie jako osobne zapytania, nadal bylibyśmy w stanie szybko wyłapać znaczenie zapytania.
Drugie zapytanie zwraca wszystkie informacje o każdej łodzi, która jest tańsza od najdroższego samochodu zarejestrowanego w bazie danych.", 2);
INSERT INTO content_en (article_id, text, div_number)
VALUES (4, "Subqueries are nested queries. They can be placed inside all CRUD statements.
The most common and intuitive way of using subqueries is as a condition in WHERE statement.
In a lot of cases they can be replaced with JOIN statement, but, usually, subqueries are easier to grasp.
Mostly, the performance is the same for JOIN and subquery.", 1);
INSERT INTO content_en (article_id, text, div_number)
VALUES (4, "The first query returns longitude (LONG) for the largest latitude (LAT) in the STATION that is less than 137.2345 LAT.
The subquery could be replaced by JOIN, but it would look complicated. There would have to be at least 2 conditions.
Any number of subqueries can be nested in the query, and, because,
we mostly read them as separate queries, we would still be able to quickly catch the meaning of the query.
The second query returns all information about every boat which is cheaper than the most expensive car registered in the database.", 2);