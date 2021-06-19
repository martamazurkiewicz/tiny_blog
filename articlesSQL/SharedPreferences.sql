INSERT INTO code (text,article_id) VALUES (
    "String jsonString = jsonEncode(this.toJson());",2);
INSERT INTO code (text,article_id) VALUES (
    "SharedPreferences sharedPreferences = await SharedPreferences.getInstance();",2);
INSERT INTO code (text,article_id) VALUES (
    "await sharedPreferences.setString('searchHistory', jsonString);",2);
INSERT INTO code (text,article_id) VALUES (
    "Map<String, dynamic> searchHistoryMap = jsonDecode(await sharedPreferences.getString('searchHistory') ?? '{}');",2);
INSERT INTO code (text,article_id) VALUES (
    "final searchHistory = SearchHistory.fromJson(searchHistoryMap);",2);

INSERT INTO article (code_id, release_date, title_pl, title_en, category_id)
VALUES (2, curdate(), "SharedPreferences - zapisywanie historii wyszukiwania użytkownika" ,"SharedPreferences - saving user's search history", 1);

UPDATE content_en
SET
    text ="Shared Preferences is a Flutter plugin for storing simple data, like chosen theme, language and user''s settings.
    Storage is persistent, so data can be restored after the app was closed.
    Data is stored as key-value pair and asynchronically read and written.
    No critical data should be stored in Shared Preferences, because asynchronous saving may not get the chance to write data before the app is closed."

WHERE
    id = 3;
UPDATE content_en
SET

    text = "Simple data are integers, string, chars, so mostly value types.
In order to save user''s search history, you need to save an array of strings or integers, e.g. list of searched buildings'' IDs.
There is a way to store lists in Shared Preferences, and it is done by saving a JSON string.
First, you should save the list of IDs as JSON, and then save JSON string by Shared Preferences plugin.
Encoding an object to JSON string is done by jsonEncode(this.toJson()), and it requirs special constructor and some annotations.
The plugin for generating code to and from JSON is called json_serializable.
To read or write to Shared Preferences, you need and instance of its class - SharedPreferences.getInstance();.
Saving is done by setting a JSON string with the right key - here the key is ''searchHistory''.
Decoding works similarly, to get a Map<String, dynamic>  you need is and instance of Shared Preferences and key for JSON string.
The last step is to generate an object from Map using fromJson function."
WHERE
    id = 4;

UPDATE content_pl
SET
    text = "Shared Preferences to wtyczka Fluttera do przechowywania prostych danych, takich jak wybrany motyw, język i ustawienia użytkownika.
Pamięć Shared Preferences jest trwała, więc dane można przywrócić po zamknięciu aplikacji.
Dane są przechowywane jako para klucz-wartość oraz asynchronicznie odczytywane i zapisywane.
Dane krytyczne nie powinny być przechowywane w Shared Preferences,
ponieważ asynchroniczne zapisywanie może nie dostać szansy na zapisanie danych przed zamknięciem aplikacji."

WHERE
    id = 3;
UPDATE content_pl
SET

    text = "Proste dane to liczby całkowite, łańcuchy znaków, litery, a więc głównie typy wartościowe.
Aby zapisać historię wyszukiwania użytkownika należy zapisać tablicę ciągów znaków lub liczb całkowitych, np. lista wyszukiwanych identyfikatorów budynków.
Istnieje sposób na przechowywanie list w SharedPreferences i odbywa się to poprzez zapisanie JSON string.
Najpierw należy zapisać listę identyfikatorów jako JSON, a następnie zapisać JSON string za pomocą wtyczki Shared Preferences.
Kodowanie obiektu do JSON string odbywa się za pomocą jsonEncode(this.toJson()) i wymaga specjalnego konstruktora i adnotacji.
Wtyczka do generowania kodu do i z JSONa nazywa się json_serializable.
Aby czytać lub pisać w Shared Preferences, potrzebujesz i instancji jego klasy - SharedPreferences.getInstance();.
Zapisywanie odbywa się poprzez ustawienie JSON string z odpowiednim kluczem - tutaj kluczem jest ''searchHistory''.
Dekodowanie działa podobnie, aby uzyskać Map<String, dynamic> potrzebna jest instancja Shared Preferences i klucz dla odpowiedniego JSON string.
Ostatnim krokiem jest wygenerowanie obiektu z Map za pomocą funkcji fromJson."
WHERE
    id = 4;