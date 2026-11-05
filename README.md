### A. IDENTITAS
- Nama: Muhammad Rafli Wijaya
- NIM: 4243250017
- Kelas: PSIK 24D

### B. Screenshot Mode Terang & Gelap
- Mode Terang
![Terang](./assets/images/terang.png)
- Mode Gelap
![Gelap](./assets/images/gelap.png)

### c. Diagram Widget Tree

Berikut adalah diagram hierarki widget (*Widget Tree*) pada halaman Menu UMKM dengan penanda komponen **Stateless** dan **Stateful**:

```mermaid
flowchart TD
    App["AplikasiUtama [Stateful: Pengatur Tema & Tab]"] --> MatApp["MaterialApp"]
    MatApp --> ScaffoldRoot["Scaffold"]
    ScaffoldRoot --> Nav["NavigationBar [M3 Bottom Nav]"]
    ScaffoldRoot --> UMKM["HalamanUmkm [Stateless]"]

    subgraph Header & Kontak
        UMKM --> CustomScroll["CustomScrollView"]
        CustomScroll --> SBar["SliverAppBar: Foto & Nama Toko [Stateless]"]
        CustomScroll --> SBox["SliverToBoxAdapter"]
        SBox --> ColMain["Column"]
        ColMain --> TeksDesc["Text: Deskripsi Usaha [Stateless]"]
        ColMain --> CardKontak["Card Kontak: 3x ListTile [Stateless]"]
    end

    subgraph Daftar Menu UMKM
        ColMain --> Menu1["KartuMenu: Soto Daging Sapi [Stateless]"]
        ColMain --> Menu2["KartuMenu: Soto Ayam Kampung [Stateless]"]
        ColMain --> Menu3["KartuMenu: Perkedel Kentang [Stateless]"]
        ColMain --> Menu4["KartuMenu: Es Jeruk Murni [Stateless]"]
    end

    subgraph Bagian Interaktif
        Menu1 --> Fav1["TombolFavorit [Stateful: Ikon Hati]"]
        Menu2 --> Fav2["TombolFavorit [Stateful: Ikon Hati]"]
        Menu3 --> Fav3["TombolFavorit [Stateful: Ikon Hati]"]
        Menu4 --> Fav4["TombolFavorit [Stateful: Ikon Hati]"]
        UMKM --> FAB["FloatingActionButton: Pesan [Stateless]"]
    end

    classDef stateful fill:#ffcdd2,stroke:#c62828,stroke-width:2px,color:#000000;
    classDef stateless fill:#bbdefb,stroke:#1565c0,stroke-width:2px,color:#000000;
    class App,Fav1,Fav2,Fav3,Fav4 stateful;
    class UMKM,SBar,TeksDesc,CardKontak,Menu1,Menu2,Menu3,Menu4,FAB stateless;
```

> **Keterangan Diagram:**
> * Kotak berwarna **Merah Muda / [Stateful]**: Memiliki data yang dapat berubah saat ditekan pengguna.
> * Kotak berwarna **Biru Muda / [Stateless]**: Komponen tampilan statis yang tidak berubah sendiri.

### D. Penjelasan Arsitektur Tiga Pohon & Alasan Pemilihan Widget (191 Kata)

Di balik layar, Flutter mengelola tampilan menggunakan tiga struktur pohon:
1. **Widget Tree**: Berperan sebagai cetak biru (*blueprint*) konfigurasi antarmuka. Widget bersifat ringan, tidak dapat diubah (*immutable*), dan dibuat ulang setiap kali ada pembaruan tampilan.
2. **Element Tree**: Berperan sebagai jembatan yg menyimpan memori dan mengelola *State*. Pohon ini bertahan lama dan mencocokkan widget lama dengan yang baru agar tidak membuang resource secara percuma atu sia-sia.
3. **RenderObject Tree**: Berperan sebagai pelaksana teknis yang menghitung ukuran dan posisi tata letak (*layout*), lalu menggambar piksel visual ke layar hp atau mobile.

**Alasan Pemilihan Stateless dan Stateful:**
 Antarmuka seperti `HalamanUmkm`, `KartuMenu`, informasi kontak, dan teks deskripsi dibuat sebagai **StatelessWidget**. Alasannya, data tersebut bersifat statis dan tampilannya tidak berubah setelah dimuat, sehingga lebih hemat memori dan cepat.

kemudian, **StatefulWidget** hanya diterapkan pada komponen terkecil yang memiliki interaksi data, yaitu `TombolFavorit` (ikon hati) dan `AplikasiUtama` (untuk tema dan navigasi tab). Dengan memisahkan tombol favorit ke widget kecilnya sendiri, saat tombol ditekan, fungsi `setState()` hanya membangun ulang (*rebuild*) tombol hati itu aja. Bagian kartu menu, gambar header, dan kontak tidak ikut dibangun ulang secara sia-sia, sehingga performa aplikasi tetap mulus.

### Informasi Tambahan
Aplikasi ini menggabungkan hasil Praktikum (Kartu nama digital mahasiswa) dan TR 5 (Menu UMKM kuliner medan) dihubungkan menggunakan komponen modern NavigationBar (Material 3) di bagian bawah layar.

### E. Pernyataan Penggunaan AI
Saya menggunakan ai untuk membantu memberikan gambaran dari file apa aja yg ada di projek aplikasi ini, kemudian harus seperti apa isinya, saya juga menggunakan ai untuk menyatukan halaman pratikum kartu nama dengan halaman tugas rutin kuliner UMKM, saya juga menggunakan ai untuk membuat poin C diagram widget tree dengan kode mermaid.