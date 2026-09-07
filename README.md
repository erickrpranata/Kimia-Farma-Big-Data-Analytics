# Kimia Farma Big Data Analytics

## Project Overview

Project ini merupakan bagian dari Virtual Internship Big Data Analytics bersama Rakamin Academy dengan studi kasus Kimia Farma.

Project ini bertujuan untuk menganalisis kinerja bisnis Kimia Farma selama periode 2020–2023 menggunakan data transaksi, produk, dan kantor cabang.

## Objectives

Analisis dilakukan untuk:

- Memahami tren pendapatan Kimia Farma selama 2020–2023.
- Menganalisis performa penjualan berdasarkan wilayah.
- Mengidentifikasi produk dengan kontribusi penjualan dan profit terbesar.
- Menganalisis profitabilitas berdasarkan transaksi, produk, dan wilayah.
- Mengevaluasi performa cabang dan rating transaksi.

## Dataset

Dataset yang tersedia dalam challenge terdiri dari:

- `kf_final_transaction`
- `kf_inventory`
- `kf_kantor_cabang`
- `kf_product`

Dalam proses pembuatan tabel analisa, digunakan tiga dataset yang relevan:

- `kf_final_transaction`
- `kf_kantor_cabang`
- `kf_product`

Dataset `kf_inventory` tidak digunakan karena tidak diperlukan dalam pembentukan kolom maupun perhitungan yang ditentukan pada challenge.

## Tools

- Google BigQuery
- SQL
- Looker Studio
- GitHub

## Data Processing

Data transaksi digabungkan dengan informasi kantor cabang dan produk menggunakan `LEFT JOIN`.

Beberapa perhitungan yang dilakukan meliputi:

- Persentase gross laba berdasarkan harga aktual.
- Nett sales setelah memperhitungkan diskon.
- Nett profit berdasarkan nett sales dan persentase gross laba.

## Analysis

Analisis mencakup:

1. Tren pendapatan Kimia Farma tahun 2020–2023.
2. Analisis Transaksi Terbesar di provinsi Indonesia.
3. Analisis Nett Sales terbaik di provinsi Indonesia.
4. Analisis jenis produk paling laris.
5. Analisis performa cabang dan rating transaksi.

## Dashboard

Hasil analisis divisualisasikan menggunakan Looker Studio dalam bentuk dashboard interaktif.

## Repository Contents

- `KF_TabelAnalisa.sql` — Query untuk membuat tabel analisa Kimia Farma.
- `README.md` — Dokumentasi project.
