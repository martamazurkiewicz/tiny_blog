UPDATE code
SET 
    text = "
    StreamController streamController = StreamController.broadcast(); <br>
    StreamSubscription subscription = streamController.stream.listen(some_function); <br>
    void triggerEvent() => streamController.sink.add(null);"
WHERE
    id = 1;

UPDATE article
SET
    title_pl = "Streams - przesyłanie danych do odległych widgetów potomnych",
    title_en = "Streams - sending values to remote child widgets"
WHERE
    id = 1;

UPDATE content_en
SET
    text = "Through event-based programming, you can send data even to extremely remote children widgets.
    Stream class in Flutter is an example of event-based programming. A stream is a sequence of asynchronous events,
    which means that stream notify you (all of its listeners) when its event is triggered.
    The first advantage of streams is that they reduce a number of variables that are sent across widgets - their constructors are much shorter."

WHERE
    id = 1;
UPDATE content_en
SET

    text = "Let's imagine there is a Main class in which an object that shows some map sector is created.
    In Main, you also create an object which contains some buttons - one of them should recenter the map.
    Without event-base programming, you would have to send the map object as a button class constructor parameter.
    With it, you can define a stream in the Main class, create stream listener in map class and trigger event in button class.
    You just sent stream as parameter to both child classes. This method is also a bit more in line with the SOLID Open-closed principle.
    If you need to have more than just one stream listener, you need an instance of StreamController class,
    which is initialized with StreamController.broadcast() function. Listeners are objects of StreamSubscription class.
    They listen for notification that an event was triggered, and then they perform some_function.
    In order to trigger the event, you need to add it to StreamController's sink."
WHERE
    id = 2;

UPDATE content_pl
SET
    text = "Dzięki programowaniu opartemu na zdarzeniach możesz wysyłać dane nawet do bardzo odległych widżetów potomnych.
     Klasa Stream we Flutterze jest przykładem programowania opartego na zdarzeniach. Strumień to sekwencja zdarzeń asynchronicznych,
     co oznacza, że strumień powiadamia Cię (wszystkich słuchaczy) o wyzwoleniu jego zdarzenia.
     Pierwszą zaletą strumieni jest to, że zmniejszają liczbę zmiennych przesyłanych przez widżety - ich konstruktory są znacznie krótsze."

WHERE
    id = 1;
UPDATE content_pl
SET

    text = "Wyobraźmy sobie, że istnieje klasa Main, w której tworzony jest obiekt, który pokazuje jakiś sektor mapy.
     W Main tworzysz również obiekt, który zawiera kilka przycisków - jeden z nich powinien wyśrodkowywać mapę.
     Bez programowania opartego na zdarzeniach musiałbyś wysłać obiekt mapy jako parametr konstruktora klasy przycisku.
     Dzięki niemu możesz zainicjalizować strumień w klasie Main, utworzyć obiekt nasłuchujący w klasie mapy i wywołać zdarzenie w klasie przycisku.
     Jako parametr do obu klas potomnych wysyłasz tylko strumień. Ta metoda jest również nieco bardziej zgodna z zasadą SOLID Otwarty-zamknięty.
     Jeśli potrzebujesz więcej niż jednego obiektu nasłuchującego, potrzebujesz instancji klasy StreamController,
     która jest inicjowana przy pomocy funkcji StreamController.broadcast(). Odbiorniki to obiekty klasy StreamSubscription.
     Nasłuchują one czy zdarzenie zostało wyzwolone, a następnie wykonują some_function.
     Aby wyzwolić zdarzenie, musisz dodać je do zlewu (sink) obiektu StreamControllera."
WHERE
    id = 2;

UPDATE code
SET
    text =
    "SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); <br>
    String jsonString = jsonEncode(this.toJson()); <br>
    await sharedPreferences.setString('searchHistory', jsonString); <br>
    Map<String, dynamic> searchHistoryMap = jsonDecode(await sharedPreferences.getString('searchHistory') ?? '{}'); <br>
    final searchHistory = SearchHistory.fromJson(searchHistoryMap);" 
WHERE
    id = 2;
