-- създаваме си схемата коята ще ползваме и сет-нете search_path:
DROP SCHEMA IF EXISTS shano CASCADE;
CREATE SCHEMA  shano;
SET search_path = shano;

SHOW SEARCH_PATH;
-- 1. Дефинирайте следните релации:

-- а) Product(maker, model, type), където моделът е низ от
-- точно 4 символа, maker - един символ,
-- а type - низ до 7 символа;

CREATE TABLE product(
    maker varchar,
    model char(4),
    type varchar(7)
);


-- б) Printer(code, model, color, price),
-- където code е цяло число, color е 'y' или 'n'
-- и по подразбиране е 'n', price - цена с точност
-- до два знака след десетичната запетая;

DROP TABLE printer;

CREATE TABLE printer(
    code INTEGER,
    model varchar,
    color BOOLEAN DEFAULT FALSE,
    price numeric(8, 2)
);

-- в) Classes(class, type), където class е до
-- 50 символа, а type може да бъде 'bb' или 'bc'.

CREATE TABLE classes(
    class varchar(50),
    type char(2) CHECK ( type IN ('bb', 'bc')));



SELECT * FROM classes;

-- 2. Добавете кортежи с примерни данни към
-- новосъздадените релации. Добавете информация за принтер,
-- за когото знаем само кода и модела.
-- Добавете кортежи с примерни данни към
-- новосъздадените релации по ваша преценка

INSERT INTO classes
VALUES ('Nai ludiq', 'bb');

INSERT INTO printer(code, model, price)
VALUES  (23904, 'qk', 4.25),
        (239044, 'mega qk', 4.256);

INSERT INTO printer(code, model, color, price)
VALUES (243, 'ludnica', 'y', 321.434 );


INSERT INTO printer(code, model)
VALUES (53, 'besen');

-- Добавете информация за принтер (сложете стойност на някое празно поле),
-- за когото знаем само кода и модела:

UPDATE printer
SET price = 500.00
WHERE price IS NULL ;


-- 3. Добавете към Classes атрибут bore - число с плаваща запетая.

ALTER TABLE classes ADD COLUMN bore DOUBLE PRECISION;

-- 4. Напишете заявка, която премахва атрибута price от Printer.

ALTER TABLE printer DROP COLUMN price;

-- 5. Изтрийте всички таблици, които сте създали в това упражнение.

DROP TABLE printer;
DROP TABLE classes;
DROP TABLE product;
DROP SCHEMA shano;