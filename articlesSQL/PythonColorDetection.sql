INSERT INTO category (name_pl, name_en) VALUES ("Python", "Python");

INSERT INTO code (text, article_id)
VALUES ("lower = np.array([128, 0, 230], dtype = 'uint8')", 6);
INSERT INTO code (text, article_id)
VALUES ("upper = np.array([255, 30, 255], dtype = 'uint8')", 6);
INSERT INTO code (text, article_id)
VALUES ("mask = cv2.inRange(image, lower, upper)", 6);
INSERT INTO code (text, article_id)
VALUES ("output_image = cv2.bitwise_and(image, image, mask = mask)", 6);
INSERT INTO code (text, article_id)
VALUES ("cv2.imshow('images', np.hstack([image, output_image]))", 6);

INSERT INTO article (release_date, title_pl, title_en, category_id)
VALUES (curdate(), "OpenCV - wykrywanie kolorów przy pomocy Pythona",
        "OpenCV - color detection in Python", 6);

INSERT INTO content_pl (article_id, text, div_number)
VALUES (6, "Wykrywanie kolorów w filmach jest niezwykle przydatne, prawdopodobnie nawet bardziej niż wykrywanie kształtów.
Za każdym razem, gdy testujesz ruchomy sprzęt, wykrywanie kolorów może być używane do śledzenia obiektu,
np. śledzenie drona lub zdalnie sterowanego samochodu.
Ich kształt jest skomplikowany, więc trudno byłoby go opisać w kodzie.
Jeśli chodzi o ich kolor, możesz przykleić do nich kolorowe markery.
Pamiętaj, że kolory powinny odbiegać do kolorów otoczenia.", 1);
INSERT INTO content_pl (article_id, text, div_number)
VALUES (6,  "Każdy film składa się z klatek, dlatego należy wykrywać znaczniki kolorów w każdej klatce - w każdym obrazie.
Początkowo, trzeba ustawić dolną i górną granicę wykrywanych kolorów, niestety w BGR. OpenCV wymaga, aby granice kolorów były typu NumPy arrays.
Jako, że wartości pikseli (luminescencja) są mniejsze lub równe 255, limity kolorów są konwertowane na 8-bitowe liczby całkowite.
Powyżej znajduje się granica dla magenta. Nastepnie, korzystając z ramek i granic kolorów, tworzona jest maska.
Maska to czarno-biały (binarny) obraz, który pokazuje kolor w zadeklarowanej granicy jako biały, a wszystko inne jako czarne.
Trzecim krokiem jest nałożenie maski na obraz za pomocą funkcji cv2.bitwise_and.
Zwraca ona obraz, w którym 'zapalone' są tylko pixele, które były białe w masce. Ostatnia funkcja wyświetla przefiltrowany obraz.", 2);

INSERT INTO content_en (article_id, text, div_number)
VALUES (6, "Color detection in movies is extremely useful, probably even more than shape detection.
Whenever you are testing a moveable gear, color detection can be use for tracking the object,
like tracking a drone or remote-controlled car.
Their shape is complicated, so it would be difficult to describe it in code.
When it comes to color, you can stick some brightly color markers to them.
Remember that colors should not much the surroundings.", 1);
INSERT INTO content_en (article_id, text, div_number)
VALUES (6,
        "Every movie consists of frames, so you should detect color markers in each frame - each image.
First, you need to set lower and upper color boundaries, unfortunately in BGR.
OpenCV requires that color boundaries are the type of NumPy arrays.
As pixels' values (luminescence) is less or equal to 255, color limits are convert to 8-bit integers.
Above, is the boundary for magenta. Secondly, you create a mask using the frame and color boundaries.
Mask is a black-and-white (binary) image that shows the color in declared boundary as white and everything else as black.
The third step is to apply the mask on the image by cv2.bitwise_and function.
It returns an image that shows only the pixels that are white in the mask.
The last function just displays the filtered image.", 2);