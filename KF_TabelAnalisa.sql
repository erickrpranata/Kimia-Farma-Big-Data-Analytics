--  ==========================================================
-- Membuat/memperbarui tabel analisa Kimia Farma
-- Menggabungkan 3 tabel: transaksi, kantor cabang, dan produk
-- Dataset kf_inventory tidak digunakan karena tidak ada kolom
-- ==========================================================

CREATE OR REPLACE TABLE `kimia_farma.tabel_analisa` AS

WITH kf AS (  -- Menggunakan CTE (WITH) agar bisa dihitung sekali di sini, lalu dipakai ulang untuk menghitung
  SELECT
    ft.transaction_id,
    ft.date,
    kacab.branch_id,
    kacab.branch_name,
    kacab.kota,
    kacab.provinsi,
    kacab.rating AS rating_cabang,
    ft.customer_name,
    p.product_id,
    p.product_name,
    ft.price AS actual_price,           -- harga aktual saat transaksi (bukan harga master produk)
    ft.discount_percentage,

    -- Menentukan persentase gross laba berdasarkan tier harga aktual (ft.price)
    CASE
      WHEN ft.price <= 50000 THEN 0.10
      WHEN ft.price BETWEEN 50000 AND 100000 THEN 0.15
      WHEN ft.price BETWEEN 100000 AND 300000 THEN 0.20
      WHEN ft.price BETWEEN 300000 AND 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,

    -- Nett sales = harga aktual dikurangi diskon
    (ft.price - (ft.price * ft.discount_percentage)) AS nett_sales,

    ft.rating AS rating_transaksi

  FROM `kimia_farma.kf_final_transaction` AS ft

-- LEFT JOIN agar semua transaksi tetap muncul walau data cabang/produk tidak lengkap
  LEFT JOIN `kimia_farma.kf_kantor_cabang` AS kacab ON ft.branch_id = kacab.branch_id
  LEFT JOIN `kimia_farma.kf_product` AS p ON ft.product_id = p.product_id
)

SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  actual_price,
  discount_percentage,
  persentase_gross_laba,
  nett_sales,
  -- Nett profit dihitung dari nett_sales dikali persentase_gross_laba
  nett_sales * persentase_gross_laba AS nett_profit,  
  rating_transaksi
FROM kf
