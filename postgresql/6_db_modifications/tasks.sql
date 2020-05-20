-- Използвайте редуцираните скриптове за Movies, PC и Ships от папката ReducedScripts, в които няма ограничения за референтна цялост и т.н.
SET SEARCH_PATH = movies, pc, ships;

-- Да се добави информация за актрисата Nicole Kidman. За нея знаем само, че е родена на 20-и юни 1967.
INSERT INTO movies.moviestar(name, birthdate)
VALUES
('Nicole Kidman', '1967-06-20');

-- Да се изтрият всички продуценти с печалба (networth) под 10 милиона.
DELETE FROM movieexec
WHERE networth < 10000000;
-- Да се изтрие информацията за всички филмови звезди, за които не се знае адреса.

DELETE FROM moviestar
WHERE address IS NULL ;
-- Използвайки две INSERT заявки, съхранете в базата данни факта, че персонален компютър модел 1100 е направен от производителя C, има процесор 2400 MHz, RAM 2048 MB, твърд диск 500 GB, 52x DVD устройство и струва $299. Нека новият компютър има код 12. Забележка: моделът и CD са от тип низ.
-- Упътване: самото вмъкване на данни е очевидно как ще стане, помислете в какъв ред е по-логично да са двете заявки.
INSERT INTO product(maker, model, type)  VALUES ('C', '1100', 'PC');
INSERT INTO pc(code, model, speed, ram, hd, cd, price) VALUES (12, '1100', 2400, 2048, 500, '52x', 299);
-- Да се изтрие всичката налична информация за компютри модел 1100.

DELETE FROM pc
WHERE model = '1100' ;

DELETE FROM product
WHERE model = '1100';
-- За всеки персонален компютър се продава и 15-инчов лаптоп със същите параметри, но с $500 по-скъп. Кодът на такъв лаптоп е със 100 по-голям от кода на съответния компютър. Добавете тази информация в базата.
INSERT INTO laptop(code, model, speed, ram, hd, price, screen)
SELECT code + 100, model , speed, ram, hd, price + 500, 15
FROM pc;
-- Да се изтрият всички лаптопи, направени от производител, който не произвежда принтери.
-- Упътване: Мислете си, че решавате задача от познат тип - "Да се изведат всички лаптопи, ...". Накрая ще е нужна съвсем малка промяна. Ако започнете директно да триете, много е вероятно при някой грешен опит да изтриете всички лаптопи и ще трябва често да възстановявате таблицата или да работите на сляпо.
DELETE FROM laptop
WHERE model IN (SELECT
                laptop.model
                FROM laptop
                JOIN product p ON laptop.model = p.model
                WHERE p.maker NOT IN (SELECT maker FROM product JOIN printer p2 ON product.model = p2.model))
RETURNING
*;
-- Производител А купува производител B. На всички продукти на В променете производителя да бъде А.

UPDATE product
SET maker = 'A'
WHERE maker = 'B';

-- Да се намали два пъти цената на всеки компютър и да се добавят по 20 GB към всеки твърд диск. Упътване: няма нужда от две отделни заявки.

UPDATE pc
SET price = price / 2,
    hd = hd + 20;

-- За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.

UPDATE laptop
SET screen = screen + 1
WHERE model IN (SELECT laptop.model FROM laptop JOIN product p ON laptop.model = p.model WHERE maker = 'B');

-- Два британски бойни кораба от класа Nelson - Nelson и Rodney
-- - са били пуснати на вода едновременно през 1927 г. Имали са девет 16-инчови оръдия (bore)
-- и водоизместимост от 34 000 тона (displacement). Добавете тези факти към базата от данни.

INSERT INTO classes(class, type, country, numguns, bore, displacement) VALUES
('Nelosn', 'bb','Gt. Britain', 9, 16, 34000);

INSERT INTO ships(name, class, launched) VALUES
('Nelson', 'Nelson', 1927),
('Rodney', 'Nelson', 1927);

-- Изтрийте от Ships всички кораби, които са потънали в битка.

DELETE FROM ships
WHERE name IN (SELECT name FROM ships JOIN outcomes o ON ships.name = o.ship WHERE result = 'sunk');

-- Променете данните в релацията Classes така, че калибърът (bore) да се измерва в сантиметри
-- (в момента е в инчове, 1 инч ~ 2.5 см) и водоизместимостта да се измерва в метрични тонове (1 м.т. = 1.1 т.)

UPDATE classes
SET bore = bore * 2.5,
    displacement = displacement * 1.1;

-- Изтрийте всички класове, от които има по-малко от три кораба.

DELETE FROM classes
WHERE class IN (SELECT class FROM ships GROUP BY class HAVING count(class) < 3);

-- Променете калибъра на оръдията и водоизместимостта на класа Iowa, така че да са същите като тези на класа Bismarck.

UPDATE classes
SET bore = t.bore,
    displacement = t.displacement
FROM (SELECT bore, displacement FROM classes WHERE class = 'Bismarck') t
WHERE class = 'Iowa';