--minitask 3

CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,
    genre VARCHAR(100) NOT NULL,
    descriptions VARCHAR(255)
);

CREATE TABLE rack_book (
    id_rack SERIAL PRIMARY KEY,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE staff (
    id_staff SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE member (
    id_member SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE book (
    id_book SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    edition VARCHAR(50),
    publishing VARCHAR(100),
    publication_date DATE,
    author VARCHAR(100),
    id_category INT NOT NULL,
    id_rack INT NOT NULL,

    FOREIGN KEY (id_category) REFERENCES category(id_category),
    FOREIGN KEY (id_rack) REFERENCES rack_book(id_rack)
);

CREATE TABLE borrowing (
    id_borrow SERIAL PRIMARY KEY,
    id_book INT NOT NULL,
    id_member INT NOT NULL,
    id_staff INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,

    FOREIGN KEY (id_book) REFERENCES book(id_book),
    FOREIGN KEY (id_member) REFERENCES member(id_member),
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);

INSERT INTO category (genre, description) VALUES
('Teknologi', 'Buku tentang teknologi'),
('Sains', 'Buku tentang ilmu pengetahuan'),
('Sejarah', 'Buku tentang sejarah'),
('Novel', 'Buku cerita fiksi'),
('Pendidikan', 'Buku tentang pendidikan'),
('Ekonomi', 'Buku tentang ekonomi'),
('Agama', 'Buku tentang keagamaan'),
('Psikologi', 'Buku tentang psikologi'),
('Kesehatan', 'Buku tentang kesehatan'),
('Biografi', 'Buku tentang perjalanan hidup tokoh');

INSERT INTO rack_book (location) VALUES
('Rak A1'),
('Rak A2'),
('Rak B1'),
('Rak B2'),
('Rak C1'),
('Rak C2'),
('Rak D1'),
('Rak D2'),
('Rak E1'),
('Rak E2');

INSERT INTO staff (name) VALUES
('Andi'),
('Budi'),
('Citra'),
('Dewi'),
('Eko'),
('Fajar'),
('Gita'),
('Hendra'),
('Indah'),
('Joko');

INSERT INTO member (name, phone) VALUES
('Rizky', '081234567801'),
('Aldi', '081234567802'),
('Siti', '081234567803'),
('Rina', '081234567804'),
('Dimas', '081234567805'),
('Putri', '081234567806'),
('Rafi', '081234567807'),
('Nanda', '081234567808'),
('Aulia', '081234567809'),
('Fikri', '081234567810');

INSERT INTO book
(title, edition, publishing, publication_date, author, id_category, id_rack)
VALUES
('Belajar Database', '1', 'Informatika', '2024-01-10', 'Andi Setiawan', 1, 1),
('Dasar Sains', '2', 'Edukasi Press', '2023-03-15', 'Budi Santoso', 2, 2),
('Sejarah Indonesia', '1', 'Nusantara', '2022-05-20', 'Citra Dewi', 3, 3),
('Laskar Pelangi', '3', 'Bentang', '2021-07-10', 'Andrea Hirata', 4, 4),
('Strategi Belajar', '1', 'Edu Media', '2024-02-12', 'Dewi Lestari', 5, 5),
('Dasar Ekonomi', '2', 'Ekonomi Press', '2023-06-21', 'Eko Wijaya', 6, 6),
('Pendidikan Agama', '1', 'Ilmu Press', '2022-08-17', 'Fajar Rahman', 7, 7),
('Psikologi Dasar', '2', 'Media Ilmu', '2024-04-11', 'Gita Sari', 8, 8),
('Hidup Sehat', '1', 'Sehat Media', '2023-09-09', 'Hendra Putra', 9, 9),
('Biografi Tokoh', '1', 'Nusantara', '2022-12-01', 'Indah Sari', 10, 10);

INSERT INTO borrowing
(id_book, id_member, id_staff, borrow_date, return_date)
VALUES
(1, 1, 1, '2026-09-01', '2026-09-08'),
(2, 2, 2, '2026-09-02', '2026-09-09'),
(3, 3, 3, '2026-09-03', '2026-09-10'),
(4, 4, 4, '2026-09-04', '2026-09-11'),
(5, 5, 5, '2026-09-05', '2026-09-12'),
(6, 6, 6, '2026-09-06', '2026-09-13'),
(7, 7, 7, '2026-09-07', '2026-09-14'),
(8, 8, 8, '2026-09-08', '2026-09-15'),
(9, 9, 9, '2026-09-09', '2026-09-16'),
(10, 10, 10, '2026-09-10', '2026-09-17');

SELECT * FROM category;
SELECT * FROM rack_book;
SELECT * FROM staff;
SELECT * FROM member;
SELECT * FROM book;
SELECT * FROM borrowing;


------------------------------------------------------------------------------------
----------------MINITASK 4--------------------------------------

--MINITASK 4   

CREATE TABLE "movies" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(100) NOT NULL,
  "release_date" DATE NOT NULL,
  "rating" INT,
  "director_id" INT REFERENCES  "directors"("id"),
  "genre_id" INT REFERENCES "genres"("id") 
);
SELECT * FROM "movies";

CREATE TABLE "actors" (
  "id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(100) NOT NULL,
  "last_name" VARCHAR(100)
);
SELECT * FROM "actors";

CREATE TABLE "movies_actors" (
  "movie_id" INT REFERENCES "movies"("id"),
  "actor_id" INT REFERENCES "actors"("id"),
  "role" VARCHAR(100)
);
SELECT * FROM "movies_actors";

CREATE TABLE "directors" (
  "id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(100) NOT NULL,
  "last_name" VARCHAR(100)
);
SELECT * FROM "directors";

CREATE TABLE "genres" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL
);
SELECT * FROM "genres";

ALTER TABLE "movies_actors" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "movies_actors" ADD FOREIGN KEY ("actor_id") REFERENCES "actors" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "movies" ADD FOREIGN KEY ("director_id") REFERENCES "directors" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "movies" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id") DEFERRABLE INITIALLY IMMEDIATE;


--GENRES 

INSERT INTO genres (name) VALUES ('Comedy');
INSERT INTO genres (name) VALUES ('Crime|Drama|Film-Noir');
INSERT INTO genres (name) VALUES ('Drama|War');
INSERT INTO genres (name) VALUES ('Comedy');
INSERT INTO genres (name) VALUES ('Drama');
INSERT INTO genres (name) VALUES ('Drama');
INSERT INTO genres (name) VALUES ('Horror|Thriller');
INSERT INTO genres (name) VALUES ('Horror');
INSERT INTO genres (name) VALUES ('Horror');
INSERT INTO genres (name) VALUES ('Comedy');
INSERT INTO genres (name) VALUES ('Documentary');
INSERT INTO genres (name) VALUES ('Action|Crime|Thriller');
INSERT INTO genres (name) VALUES ('Documentary');
INSERT INTO genres (name) VALUES ('Comedy');
INSERT INTO genres (name) VALUES ('Comedy');
INSERT INTO genres (name) VALUES ('Children|Comedy');
INSERT INTO genres (name) VALUES ('Comedy|Crime|Romance|Thriller');
INSERT INTO genres (name) VALUES ('Horror|Mystery');
INSERT INTO genres (name) VALUES ('Drama');
INSERT INTO genres (name) VALUES ('Comedy|Drama');


--DIRECTORS

INSERT INTO directors (first_name, last_name) VALUES ('Nikita', 'Piatti');
INSERT INTO directors (first_name, last_name) VALUES ('Norris', 'Durram');
INSERT INTO directors (first_name, last_name) VALUES ('Abbott', 'Marrison');
INSERT INTO directors (first_name, last_name) VALUES ('Tam', 'Leist');
INSERT INTO directors (first_name, last_name) VALUES ('Harold', 'Idiens');
INSERT INTO directors (first_name, last_name) VALUES ('Sterling', 'Calbreath');
INSERT INTO directors (first_name, last_name) VALUES ('Sancho', 'Van Salzberger');
INSERT INTO directors (first_name, last_name) VALUES ('Bucky', 'Boyall');
INSERT INTO directors (first_name, last_name) VALUES ('Clyve', 'Bosden');
INSERT INTO directors (first_name, last_name) VALUES ('Dennet', 'Szymonowicz');
INSERT INTO directors (first_name, last_name) VALUES ('Charles', 'Carren');
INSERT INTO directors (first_name, last_name) VALUES ('Hillyer', 'Millar');
INSERT INTO directors (first_name, last_name) VALUES ('Alistair', 'Kropach');
INSERT INTO directors (first_name, last_name) VALUES ('Sanders', 'Tregensoe');
INSERT INTO directors (first_name, last_name) VALUES ('Seward', 'Griffithe');
INSERT INTO directors (first_name, last_name) VALUES ('Steward', 'Kenyam');
INSERT INTO directors (first_name, last_name) VALUES ('Rurik', 'Mesnard');
INSERT INTO directors (first_name, last_name) VALUES ('Jorgan', 'Wedlock');
INSERT INTO directors (first_name, last_name) VALUES ('Rutter', 'Kilmurry');
INSERT INTO directors (first_name, last_name) VALUES ('Gav', 'Agget');

--MOVIES_ACTORS

INSERT INTO movies_actors (role) VALUES ('Construction Worker');
INSERT INTO movies_actors (role) VALUES ('Supervisor');
INSERT INTO movies_actors (role) VALUES ('Architect');
INSERT INTO movies_actors (role) VALUES ('Construction Foreman');
INSERT INTO movies_actors (role) VALUES ('Architect');
INSERT INTO movies_actors (role) VALUES ('Construction Worker');
INSERT INTO movies_actors (role) VALUES ('Electrician');
INSERT INTO movies_actors (role) VALUES ('Construction Manager');
INSERT INTO movies_actors (role) VALUES ('Surveyor');
INSERT INTO movies_actors (role) VALUES ('Estimator');
INSERT INTO movies_actors (role) VALUES ('Electrician');
INSERT INTO movies_actors (role) VALUES ('Electrician');
INSERT INTO movies_actors (role) VALUES ('Construction Foreman');
INSERT INTO movies_actors (role) VALUES ('Architect');
INSERT INTO movies_actors (role) VALUES ('Surveyor');
INSERT INTO movies_actors (role) VALUES ('Construction Manager');
INSERT INTO movies_actors (role) VALUES ('Construction Manager');
INSERT INTO movies_actors (role) VALUES ('Supervisor');
INSERT INTO movies_actors (role) VALUES ('Architect');
INSERT INTO movies_actors (role) VALUES ('Architect');
UPDATE movies_actors
SET movie_id = floor(random() * 20 + 1);
UPDATE movies_actors
SET actor_id = floor(random() * 20 + 1);

--ACTORS

INSERT INTO actors (first_name, last_name) VALUES ('Thurston', 'Proffer');
INSERT INTO actors (first_name, last_name) VALUES ('Hewie', 'Stairmond');
INSERT INTO actors (first_name, last_name) VALUES ('Yevette', 'Alleyn');
INSERT INTO actors (first_name, last_name) VALUES ('Renado', 'Trace');
INSERT INTO actors (first_name, last_name) VALUES ('Jerry', 'Janiszewski');
INSERT INTO actors (first_name, last_name) VALUES ('Gradey', 'Hooban');
INSERT INTO actors (first_name, last_name) VALUES ('Pris', 'Fenech');
INSERT INTO actors (first_name, last_name) VALUES ('Agretha', 'Pettko');
INSERT INTO actors (first_name, last_name) VALUES ('Lulu', 'Scantlebury');
INSERT INTO actors (first_name, last_name) VALUES ('Danie', 'Butterfield');
INSERT INTO actors (first_name, last_name) VALUES ('Baxter', 'Arkow');
INSERT INTO actors (first_name, last_name) VALUES ('Caspar', 'Yerrill');
INSERT INTO actors (first_name, last_name) VALUES ('Jennie', 'Ditchett');
INSERT INTO actors (first_name, last_name) VALUES ('Gaby', 'Ornells');
INSERT INTO actors (first_name, last_name) VALUES ('Orsa', 'Ivel');
INSERT INTO actors (first_name, last_name) VALUES ('Daron', 'Crackel');
INSERT INTO actors (first_name, last_name) VALUES ('Michale', 'Belhome');
INSERT INTO actors (first_name, last_name) VALUES ('Alfredo', 'Guillard');
INSERT INTO actors (first_name, last_name) VALUES ('Tamqrah', 'Huckstepp');
INSERT INTO actors (first_name, last_name) VALUES ('Ryun', 'Asey');

--MOVIES

INSERT INTO movies (title, release_date, rating) VALUES ('Long Absence, The (Une aussi longue absence)', '2020-09-13', 4);
INSERT INTO movies (title, release_date, rating) VALUES ('Summer of the Monkeys', '2006-12-23', 9);
INSERT INTO movies (title, release_date, rating) VALUES ('Magic Sword, The', '2017-01-28', 7);
INSERT INTO movies (title, release_date, rating) VALUES ('Back from Eternity', '2017-03-10', 8);
INSERT INTO movies (title, release_date, rating) VALUES ('Double Confession', '2019-10-23', 4);
INSERT INTO movies (title, release_date, rating) VALUES ('21 and Over', '2019-02-20', 1);
INSERT INTO movies (title, release_date, rating) VALUES ('Far From Home: The Adventures of Yellow Dog', '2006-09-08', 3);
INSERT INTO movies (title, release_date, rating) VALUES ('Tora-san''s Love Call (Otoko wa tsurai yo: Torajiro koiuta)', '2007-10-22', 3);
INSERT INTO movies (title, release_date, rating) VALUES ('State Witness, The (Swiadek koronny)', '2005-09-20', 6);
INSERT INTO movies (title, release_date, rating) VALUES ('World War II: When Lions Roared', '2009-08-22', 1);
INSERT INTO movies (title, release_date, rating) VALUES ('Chatroom', '2009-08-05', 2);
INSERT INTO movies (title, release_date, rating) VALUES ('Humble Pie (American Fork)', '2019-12-28', 4);
INSERT INTO movies (title, release_date, rating) VALUES ('Uninvited, The', '2009-07-13', 7);
INSERT INTO movies (title, release_date, rating) VALUES ('Snow (Snijeg)', '2005-08-12', 4);
INSERT INTO movies (title, release_date, rating) VALUES ('27 Club, The', '2015-04-13', 3);
INSERT INTO movies (title, release_date, rating) VALUES ('Conjuring, The', '2007-05-05', 10);
INSERT INTO movies (title, release_date, rating) VALUES ('Cage aux Folles II, La', '2011-11-24', 7);
INSERT INTO movies (title, release_date, rating) VALUES ('Dunwich Horror, The', '2017-06-28', 10);
INSERT INTO movies (title, release_date, rating) VALUES ('Ray Harryhausen: Special Effects Titan', '2016-11-13', 3);
INSERT INTO movies (title, release_date, rating) VALUES ('Postman, The', '2005-02-14', 5);
UPDATE movies 
SET director_id = floor(random() * 20 + 1);
UPDATE movies 
SET genre_id = floor(random() * 20 + 1);