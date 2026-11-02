-- 1. Menambahkan Primary Key ke tabel Produk
-- Pastikan ProdukID tidak berisi NULL atau duplikat.
ALTER TABLE Produk
ALTER COLUMN ProdukID INT NOT NULL;
GO

ALTER TABLE Produk
ADD CONSTRAINT PK_Produk PRIMARY KEY (ProdukID);
GO

-- 2. Menambahkan kolom NoTelepon ke tabel Pelanggan
ALTER TABLE Pelanggan
ADD NoTelepon VARCHAR(20) NULL;
GO

-- 3. Mengubah kolom Harga di Produk agar wajib diisi
-- Pastikan tidak ada nilai NULL di Harga sebelum menjalankan perintah ini.
ALTER TABLE Produk
ALTER COLUMN Harga DECIMAL(10, 2) NOT NULL;
GO