INSERT INTO code (text,article_id) VALUES ("{% include 'index/article.html.twig' with {'article': article} %}", 3);
INSERT INTO code (text,article_id) VALUES ("{% include 'offer/offer_type.html.twig' with {'type': offer.offerType} %}",3);

INSERT INTO category (name_pl, name_en) VALUES ("Symfony", "Symfony");
INSERT INTO article (release_date, title_pl, title_en, category_id)
VALUES (curdate(), "Symfony - dodawanie szablon Twig w widoku" ,"Symfony - including Twig template in a view", 2);

UPDATE content_en
SET
    text = "In Symfony views are based on reusable Twig templates.
Reusability makes code easier to read, generates less of it, and works well with DRY principle.
Instead of writing a new bunch of divs in crowded view, you can move them to a template, give your template a meaningful name and include it in the view.
Fellow programmers will understand your code much quicker if you split view into templates."
WHERE
        id = 5;
UPDATE content_en
SET
    text = "You can use template in view using {% include %} statement.
The part before slash points to a directory in templates directory and the part after slash point to the exact template.
Statement with {''key'': value} is used for passing parameters from one template to another.
Including templates work really well, for example in loops.
For each object, like article or offer type, you can include a template.
In the template, passed parameter can be accessed by key, like article or type.
If you are using if-else statement in view (with is not recommended - logic should stay in controllers),
statement body should be defined in another template and included to view."
WHERE
        id = 6;

UPDATE content_pl
SET
    text = "W Symfony widoki oparte są na szablonach Twig. Jeden szablon może być używany w wielu widokach.
Ponowne użycie szablonów jest zgodne z zasadą DRY, sprawia, że kod jest łatwiejszy do czytania i generuje go mniej.
Zamiast pisać nową grupę elementów div w zatłoczonym widoku, możesz przenieść je do szablonu, nadać szablonowi opisową nazwę i uwzględnić go w widoku.
Inni programiści zrozumieją Twój kod znacznie szybciej, jeśli podzielisz widok na szablony."

WHERE
        id = 5;
UPDATE content_pl
SET

    text = "Możesz dołączyć szablon do widoku za pomocą wyrażenia {% include %}.
Część przed ukośnikiem wskazuje na folder w katalogu templates, a część po ukośniku wskazuje dokładny szablon.
Instrukcja with {''klucz'': wartość} służy do przekazywania parametrów z jednego szablonu do drugiego.
Dołączanie szablonów działa naprawdę dobrze, na przykład w pętlach.
Do każdego obiektu, takiego jak artykuł lub typ oferty, można dołączyć szablon.
W szablonie do przekazanego parametru można uzyskać dostęp za pomocą klucza, takiego jak artykuł lub typ.
Jeśli używasz instrukcji if-else w widoku (nie jest zalecane - logika powinna pozostać w kontrolerach),
ciało instrukcji powinno być zdefiniowane w innym szablonie i dołączone do widoku."
WHERE
        id = 6;