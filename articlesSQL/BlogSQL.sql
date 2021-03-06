
INSERT INTO code (text) VALUES ("Streams");
INSERT INTO code (text) VALUES ("SharedPreferences");
INSERT INTO category (name_pl, name_en) VALUES ("Flutter", "Flutter");

INSERT INTO article (code_id, release_date, title_pl, title_en, category_id)
VALUES (1, curdate(), "Streams - przesyłanie danych do oddległych widgetów" ,"Streams - sending values to remote widgets", 1);


INSERT INTO content_pl (article_id, text, div_number)
VALUES (1, "Dzięki programowaniu opartemu na zdarzeniach możesz wysyłać dane nawet do bardzo odległych widżetów podrzędnych", 1);
INSERT INTO content_pl (article_id, text, div_number)
VALUES (1,  "Klasa Stream służy do programowania opartego na zdarzeniach", 2);

INSERT INTO content_en (article_id, text, div_number)
VALUES (1, "Through event based programing you can send data even to extremely remote children widgets", 1);
INSERT INTO content_en (article_id, text, div_number)
VALUES (1, "Stream class is used for event based programing", 2);


