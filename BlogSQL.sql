 DROP TABLE IF EXISTS Content_en;
 DROP TABLE IF EXISTS Content_pl;
 DROP TABLE IF EXISTS Article;
 DROP TABLE IF EXISTS Code;
 CREATE TABLE Code (
 code_id int NOT NULL,
 code VARCHAR(800) NOT NULL,
 PRIMARY KEY (code_id)
 );
 CREATE TABLE Article (
 article_id int NOT NULL,
 release_date DATE NOT NULL,
 category_pl VARCHAR(60) NOT NULL,
 category_en VARCHAR(60) NOT NULL,
 title_pl VARCHAR(60) NOT NULL,
 title_en VARCHAR(60) NOT NULL,
 code_id int NOT NULL,
 PRIMARY KEY (article_id),
 FOREIGN KEY (code_id) REFERENCES Code(code_id)
 );
 CREATE TABLE Content_pl (
 content_id int NOT NULL,
 article_id int NOT NULL,
 text varchar(3000) NOT NULL,
 div_number int NOT NULL,
 PRIMARY KEY (content_id),
 FOREIGN KEY (article_id) REFERENCES Article(article_id)
);
 CREATE TABLE Content_en (
 content_id int NOT NULL,
 article_id int NOT NULL,
 text varchar(3000) NOT NULL,
 div_number int NOT NULL,
 PRIMARY KEY (content_id),
 FOREIGN KEY (article_id) REFERENCES Article(article_id)
); 


INSERT INTO Code VALUES (1, "Streams");
INSERT INTO Code VALUES (2, "SharedPreferences");
INSERT INTO Article
VALUES (1, curdate(), "Flutter", "Flutter", "Streams - przesyłanie danych do oddległych widgetów" ,"Streams - sending values to remote widgets", 1); 
INSERT INTO Content_pl
VALUES (1, 1, "Dzięki programowaniu opartemu na zdarzeniach możesz wysyłać dane nawet do bardzo odległych widżetów podrzędnych", 1); 
INSERT INTO Content_pl
VALUES (2, 1, "Klasa Stream służy do programowania opartego na zdarzeniach", 2); 
INSERT INTO Content_en
VALUES (1, 1, "Through event based programing you can send data even to extremely remote children widgets", 1); 
INSERT INTO Content_en
VALUES (2, 1, "Stream class is used for event based programing", 2);
INSERT INTO Article
VALUES (2, curdate(), "Flutter", "Flutter", "SharedPreferences - zapisywanie historii wyszukiwania użytkownika" ,"SharedPreferences - saving user's search history", 2); 
INSERT INTO Content_pl
VALUES (3, 2, "Listy najlepiej zapisywać do SharedPreferences jako json", 1); 
INSERT INTO Content_pl
VALUES (4, 2, "Proste typu zmiennych można zapisać do SharedPreferences", 2); 
INSERT INTO Content_en
VALUES (3, 2, "It is best to save lists to SharedPreferences as json", 1); 
INSERT INTO Content_en
VALUES (4, 2, "Simple variable type can be written to SharedPreferences", 2);