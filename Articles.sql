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
Flutter Stream class is an example of event-based programming. A stream is a sequence of asynchronous events,
which means that stream notify you (all of its listeners) when its event is triggered.
The first advantage of streams is that they reduce a number of variables that are sent across widgets - constructors are much shorter.
Let''s imagine there is a Main class in which an object that shows some map sector is created.
In Main, you also create an object which contains some buttons - one of them should recenter the map.
Without event-base programming, you would have to send the map object as a button class constructor parameter.
With it, you can defy a stream in the Main class, create stream listener in map class and trigger event in button class.
You just sent stream as parameter to both child classes. This method is also a bit more in line with the SOLID Open-closed principle."
WHERE
    id = 1;
UPDATE content_en
SET
    text = "If you need to have more than just one stream listener, you need an instance of StreamController class,
    which is initialized with StreamController.broadcast() function. Listeners are objects of StreamSubscription class.
    They listen for notification that an event was triggered, and then they perform some_function.
    In order to trigger the event, you need to add it to StreamController's sink."
WHERE
    id = 2