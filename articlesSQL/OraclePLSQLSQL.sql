INSERT INTO code (text, article_id)
VALUES ("DECLARE", 5);
INSERT INTO code (text, article_id)
VALUES ("message VARCHAR2 (100) := 'Hello World!';", 5);
INSERT INTO code (text, article_id)
VALUES ("BEGIN", 5);
INSERT INTO code (text, article_id)
VALUES ("DBMS_OUTPUT.put_line (message);",
        5);
INSERT INTO code (text, article_id)
VALUES ("END;", 5);

INSERT INTO article (release_date, title_pl, title_en, category_id)
VALUES (curdate(), "Czym różnią się SQL i PL/SQL?",
        "Key differences between SQL and PL/SQL", 4);

INSERT INTO content_pl (article_id, text, div_number)
VALUES (5, "PL/SQL jest językiem programowania baz danych opracowanym, używanym tylko w Oracle Database.
Jest to proceduralne rozszerzenie SQL, które daje programistom możliwość używania instrukcji warunkowych,
pętli, zmiennych, bloków kodu, procedur i wyzwalaczy wewnątrz bazy danych.
Oba języki mogą pobierać i modyfikować dane, ale tylko PL/SQL może być używany do zarządzania i optymalizacji bazy danych.
Inne bazy danych używają równoważnych języków proceduralnych, np. SQL Server używa T-SQL.", 1);
INSERT INTO content_pl (article_id, text, div_number)
VALUES (5,  "Powyżej widnieje blok kodu PL\SQL.
Istnieją bloki nazwane - funkcje i procedury oraz blok anonimowy, taki jak ten.
Bloki definiowane są słowami kluczowymi DECLARE, BEGIN, EXCEPTION i END.
Sekcja EXCEPTION jest odpowiednikiem catch i jest opcjonalna.
W sekcji DECLARE deklarujesz lokalne zmienne i stałe.
Pamiętaj, że musisz jawnie zadeklarować ich typy.
BEGIN oznacza początek sekcji wykonywalnej. Procedura DBMS_OUTPUT.put_line wyświetla tekst.
Jest używana głównie do debugowania - do wysyłania wiadomości z innych procedur, wyzwalaczy i pakietów.
END zamyka wykonywalną część bloku. Bloki są wykonywane jeden naraz, więc wszystkie zawarte w nich instrukcje zostaną wykonane.
Nawet jeśli zawarte w nich instrukcje są czystym SQL. Z drugiej strony w SQL możesz wykonać jedno zapytanie lub polecenie naraz.
Bloki mogą być zagnieżdżane w innych instrukcjach blokowych w sekcji BEGIN-END.", 2);

INSERT INTO content_en (article_id, text, div_number)
VALUES (5, "PL/SQL is a database programming language developed by Oracle and used only in Oracle Database.
It is a procedural extension for SQL, that brings developers the ability to use if statements,
loops, variables, blocks of code, procedures and triggers inside the database.
Both languages can fetch and modify data, but only PL\SQL can be used for managing and optimizing database.
Other databases use equivalent procedural languages, e.g. SQL Server uses T-SQL.", 1);
INSERT INTO content_en (article_id, text, div_number)
VALUES (5, "Above, you can see a PL\SQL block.
There are named block - functions and procedures, and anonymous block like this one.
Blocks is defined with keywords DECLARE, BEGIN, EXCEPTION and END. EXCEPTION section is an equivalent of catch and is optional.
In DECLARE section, you declare local variables and constants.
Note that you must explicitly write their types. BEGIN marks the begging of executable section.
DBMS_OUTPUT.put_line procedure displays text.
It is mostly used for debugging - to send messages from other procedures, triggers and packages.
END closes the executable part of the block.
Blocks are executed as one, so all the statements inside them will be executed.
Even if the statements inside are pure SQL.
In SQL, on the other hand, you can execute a single query or a command at once.
Blocks can be nested within other block statement in BEGIN-END section.", 2);