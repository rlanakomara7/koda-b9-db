CREATE TABLE kelas (
    id_kelas INT PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL
);

CREATE TABLE siwsa (
    id_siswa INT PRIMARY KEY,
    nama VARCHAR(50) not null,
    id_kelas INT,
    FOREIGN KEY (id_kelas) REFERENCES kelas(id_kelas)
);

INSERT INTO kelas (id_kelas, nama_kelas)
VALUES (1 , 'Mataram');

SELECT * FROM kelas;