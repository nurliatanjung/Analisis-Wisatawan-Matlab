# Analisis Wisatawan dengan Metode Matriks Fuzzy menggunakan MATLAB

Repositori ini berisi script MATLAB untuk menganalisis distribusi wisatawan berdasarkan kelompok umur dan faktor-faktor yang dinilai oleh para ahli, dengan pendekatan pemodelan matriks fuzzy.

## 🧮 Deskripsi Metode

1. **Matriks Data Mentah**  
   Membentuk matriks awal `A_ij` di mana:  
   - `i = 1, 2, ..., m` adalah indeks kelompok umur  
   - `j = 1, 2, ..., n` adalah atribut atau faktor yang dinilai oleh para ahli  

2. **Transformasi Matriks A**  
   Setiap elemen matriks `A_ij` ditransformasikan menjadi: F_ij = a_ij / b_i
   dengan `b_i = batas atas - batas bawah + 1`, yaitu panjang interval usia.  

3. **Perhitungan Mean dan Standard Deviasi**  
Untuk setiap kolom `j` pada `F_ij`, dihitung:  
- Rata-rata:  
  ```
  μ_j = (∑ x_i) / n
  ```
- Simpangan baku:  
  ```
  σ_j = sqrt(∑ (x_i - μ_j)^2 / n)
  ```
Di mana `n = 8` (jumlah atribut), dan `i = 1,...,5` (jumlah kelompok umur).

4. **Fuzzyfikasi: Matriks RTD**  
Diberikan nilai alpha (α) dalam [0, 1], maka matriks **Refined Time Dependent (RTD)** dihitung:
e_ij =
-1 jika f_ij ≤ μ_j - α * σ_j
0 jika μ_j - α * σ_j < f_ij < μ_j + α * σ_j
1 jika f_ij ≥ μ_j + α * σ_j


5. **Skor Total per Kelompok Umur (RTD row sum)**  
Menjumlahkan elemen tiap baris dari RTD:
S_i = ∑ a_ij untuk j = 1,...,8


6. **Matriks CETD**  
Matriks kumulatif dibentuk dari penjumlahan beberapa RTD dengan nilai alpha berbeda:  CETD = ∑ RTD(α_k), untuk k = 1,...,k

7. **Visualisasi**  
- Grafik **RTD** untuk tiap alpha terhadap titik tengah usia  
- Grafik **CETD** kumulatif untuk analisis gabungan  

## 📂 Struktur Folder
analisis-wisatawan-matlab/
├── src/
│ └── analisis_wisatawan.m # Script utama MATLAB
├── README.md # Dokumentasi ini
├── LICENSE # Lisensi (MIT)
└── results/ # Folder hasil grafik (opsional)

## 🚀 Cara Menjalankan

1. Clone repositori:
   ```intelekgen3.m

Jalankan script dan lihat hasil visualisasi
✅ Ketergantungan
MATLAB (R2018 atau lebih baru)
Tidak membutuhkan toolbox tambahan

👤 Kontributor
Nurliyah Indah — Penulis Script dan Analisis




