CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,
    genre VARCHAR(100) NOT NULL,
    descriptions VARCHAR(255)
);

CREATE TABLE rack_book (
    id_rack SERIAL PRIMARY KEY,
    locations VARCHAR(100) NOT NULL
);

CREATE TABLE staff (
    id_staff SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
);

CREATE TABLE member (
    id_member SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE book (
    id_book SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    editions VARCHAR(50),
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
    return_date DATE,

    FOREIGN KEY (id_book) REFERENCES book(id_book),
    FOREIGN KEY (id_member) REFERENCES member(id_member),
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);

INSERT INTO category (genre, descriptions) VALUES
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

INSERT INTO member (nama, phone) VALUES
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