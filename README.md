# Analisis Wisatawan dengan Metode Matriks Fuzzy menggunakan MATLAB

Repositori ini berisi skrip MATLAB `intelekgen3.m` yang digunakan untuk melakukan analisis data wisatawan berdasarkan rentang usia dan atribut/penilaian dari para ahli menggunakan pendekatan fuzzy logic.

## 📊 Deskripsi Singkat

Analisis dilakukan dengan pendekatan **Matriks Fuzzy Refined Time Dependent (RTD)** dan **Cumulative Effective Analysis Data (CEAD)**, untuk mengevaluasi dampak dari berbagai kelompok umur terhadap delapan faktor yang telah dinilai oleh para ahli.

## 🧮 Metode dan Langkah Perhitungan

1. **Membentuk matriks data mentah awal**  
   Matriks A<sub>ij</sub> dibentuk, di mana:
   - `i = 1, 2, ..., m` → interval kelompok umur  
   - `j = 1, 2, ..., n` → atribut/faktor yang diberikan oleh ahli

2. **Transformasi data ke dalam matriks Fuzzy**  
   Setiap elemen A<sub>ij</sub> dibagi dengan panjang interval usia:  
   **F<sub>ij</sub> = A<sub>ij</sub> / b<sub>i</sub>**,  
   dengan b<sub>i</sub> = batas atas - batas bawah + 1

3. **Menghitung Mean dan Standard Deviasi**  
   Untuk setiap kolom (atribut) dari matriks F<sub>ij</sub>:
   - **μ<sub>j</sub>** = rata-rata  
   - **σ<sub>j</sub>** = standar deviasi

4. **Fuzzyfikasi dengan Parameter Alpha (α-cut)**  
   Nilai α dipilih dari interval [0, 1]. Matriks Refined Time Dependent (RTD) dibangun berdasarkan:
   e_ij =
-1, jika f_ij ≤ μ_j - α * σ_j
0, jika μ_j - α * σ_j < f_ij < μ_j + α * σ_j
1, jika f_ij ≥ μ_j + α * σ_j

5. **Menjumlahkan baris pada Matriks Fuzzy**  
Nilai skor per kelompok umur dihitung dengan:
**S<sub>i</sub> = ∑ a<sub>ij</sub> untuk j = 1 s.d. 8**

6. **Membangun Matriks CEAD (Cumulative Effective Analysis Data)**  
Dengan menjumlahkan seluruh matriks RTD dari berbagai nilai α:
CEAD = RTD(α1) + RTD(α2) + ... + RTD(αk)

## 📈 Output Visualisasi

Skrip akan menghasilkan dua grafik:
- **Kiri**: Grafik RTD (Refined Time Dependent) untuk berbagai nilai α
- **Kanan**: Grafik CEAD (Cumulative Effective Analysis Data) sebagai gabungan nilai RTD

## 🧾 File

- `intelekgen3.m` – Skrip utama MATLAB untuk menjalankan seluruh proses analisis. Skrip yang sama digunakan untuk faktor lainnya baik sosial, penguasaan dan stimulus

## 💻 Cara Menjalankan

1. Buka MATLAB
2. Pindahkan ke folder tempat file `intelekgen3.m` berada
3. Jalankan dengan:
```matlab
intelekgen3

✅ Ketergantungan
MATLAB (R2018 atau lebih baru)

Tidak membutuhkan toolbox tambahan

👤 Kontributor
Nurliyah Indah — Penulis Script dan Analisis

