-- 1

CREATE TABLE IF NOT EXISTS categories (
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	count INTEGER NOT NULL,
	category_id INTEGER REFERENCES categories(category_id) ON DELETE SET NULL
);

-- INSERT INTO

INSERT INTO categories (name) VALUES
('Elekrtonika'),
('Kiyim'),
('Poyabzallar'),
('Kitoblar'),
('Maishiy texnika');

INSERT INTO products (name, price, count, category_id) VALUES
('ASUS Vivobook', 665, 5, 1),
('iPhone 16 Pro Max', 1200, 10, 1),
('Samsung Galaxy S22', 800, 15, 1),
('Qishki kurtka', 150, 20, 2),
('Yozgi futbolka', 20, 50, 2),
('Etiklar', 100, 15, 3),
('Krossovkalar', 120, 30, 3),
('Dunyoni o‘zgartirgan kitoblar', 35, 25, 1), 
('Fantastika kitobi', 25, 40, 2), 
('Kuzgi palto', 250, 8, 2),
('Kir yuvish mashinasi', 450, 5, 3),
('Pazandalik kurslari DVD', 15, 20, NULL), 
('Qo‘l soati', 200, 12, NULL), 
('Stol lampasi', 50, 10, NULL), 
('Kichik o‘yinchoq mashina', 10, 50, NULL), 
('Qog‘oz daftar', 5, 100, NULL);

-- 1.1 

SELECT * FROM categories JOIN products ON categories.category_id = products.category_id;

-- 1.2

SELECT * FROM categories LEFT JOIN products ON categories.category_id = products.category_id;

-- 1.3

SELECT * FROM products LEFT JOIN categories ON categories.category_id = products.category_id;

-- 1.3

SELECT * FROM products LEFT JOIN categories ON categories.category_id = products.category_id WHERE products.category_id IS NULL;

-- 1.4

SELECT * FROM categories LEFT JOIN products ON categories.category_id = products.category_id WHERE products.category_id IS NULL;

-- 1.5

SELECT * FROM categories FULL JOIN products ON categories.category_id = products.category_id;

-- 1.6

SELECT * FROM categories FULL JOIN products ON categories.category_id = products.category_id WHERE products.category_id IS NULL;

-- 1.7 

SELECT * FROM categories CROSS JOIN products;

-- 1.8

SELECT * FROM categories NATURAL JOIN products;

-- 2

CREATE TABLE IF NOT EXISTS teachers (
	id SERIAL PRIMARY KEY,
	fullname VARCHAR(100) NOT NULL,
	teacher_id INTEGER REFERENCES teachers(id)
);

INSERT INTO teachers (fullname, teacher_id) VALUES
('Toxir Toxirov', NULL),
('Sobir Sobirov', 1),
('Bakir Bakirov', 2);

SELECT teacher.fullname, teachers.fullname FROM teachers JOIN teachers AS teacher ON teachers.id = teacher.teacher_id;

-- 3

CREATE TABLE IF NOT EXISTS actors (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	lastname VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS movies (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS movie_actor (
	actor_id INTEGER REFERENCES actors(id),
	movie_id INTEGER REFERENCES movies(id)
);

INSERT INTO actors (name, lastname) VALUES
('Toxir', 'Toxirov'),
('Sobir', 'Sobirov'),
('Bakir', 'Bakirov');

INSERT INTO movies (name) VALUES
('O''g''irlangan kelin'),
('Nafs'),
('Iqror');

INSERT INTO movie_actor (actor_id, movie_id) VALUES
(1, 2),
(1, 1),
(2, 3),
(2, 2),
(3, 3),
(3, 1);

SELECT actors.name, actors.lastname, movies.name 
FROM actors
JOIN movie_actor ON actors.id = movie_actor.actor_id
JOIN movies ON movies.id = movie_actor.movie_id;
