```mermaid
erDiagram

siswa {
    int id_siswa PK
    string nama
    int id_kelas FK
}

kelas {
    int id_kelas PK
    string nama_kelas
}

siswa }|--|| kelas: "memiliki"
```
