# TUGAS ETS PRAKTIKUM

## Pengembangan Praktikum 3 sampai 5

### Langkah‑langkah Pembuatan Aplikasi BMI Calculator
#### 1. Persiapan Project
- Install Flutter & Dart di komputer.
- Buat project baru: flutter create bmi_calculator.
- Atur struktur folder: models, services, screens, widgets.

#### 2. Entry Point
- Edit main.dart → set tema aplikasi, arahkan ke UserInputScreen.

#### 3. Model Data
- Buat file bmi_category.dart → class BmiCategory dengan properti min, max, label, advice, serta getter color dan icon.

#### 4. Service
- Buat bmi_service.dart → ambil kategori BMI dari JSON/endpoint.
- Buat storage_service.dart → simpan dan load tinggi/berat dengan SharedPreferences.

#### 5. Input Screen
- Buat user_input.dart:
- Tambahkan widget GenderToggle.
- Tambahkan TextField + Slider untuk tinggi dan berat.
- Tombol Calculate → navigasi ke BmiResultScreen.

#### 6. Result Screen
- Buat bmi_result.dart:
- Hitung BMI dengan rumus.
- Tentukan kategori menggunakan BmiCategory.
- Tampilkan nilai BMI, kategori, advice, warna, dan ikon.

7. Widget Reusable
- Buat gender_toggle.dart: widget toggle interaktif untuk memilih gender.

#### 8. Testing
- Jalankan aplikasi dengan flutter run.
- Uji input tinggi/berat manual dan slider.
- Pastikan hasil BMI sesuai kategori.
<<<<<<< HEAD
=======

  ## Halaman Utama
  <img width="1920" height="1080" alt="halaman_utama" src="https://github.com/user-attachments/assets/aedaf18a-49f8-4cee-b1a5-407a64645e54" />

  ## Halaman Result
  <img width="1920" height="1080" alt="halaman_result" src="https://github.com/user-attachments/assets/203a2199-5812-4367-9a4f-347f8bd27007" />
  
>>>>>>> 871dfab (simpan readme lokal)
