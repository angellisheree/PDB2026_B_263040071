

-- ============================================
-- 1. MEMBUAT DATABASE
-- ============================================

IF DB_ID('LatihanFK') IS NULL
BEGIN
    CREATE DATABASE LatihanFK;
END;
GO

USE LatihanFK;
GO

-- ============================================
-- 2. MENGHAPUS TABEL LAMA JIKA ADA
-- ============================================

DROP TABLE IF EXISTS dbo.PesananDetail;
DROP TABLE IF EXISTS dbo.PesananHeader;
DROP TABLE IF EXISTS dbo.Pelanggan;
DROP TABLE IF EXISTS dbo.Produk;
GO

-- ============================================
-- 3. MEMBUAT TABEL PELANGGAN
-- ============================================

CREATE TABLE dbo.Pelanggan (
    PelangganID INT IDENTITY(1,1) PRIMARY KEY,
    NamaPelanggan VARCHAR(100) NOT NULL
);
GO

-- ============================================
-- 4. MEMBUAT TABEL PRODUK
-- ============================================

CREATE TABLE dbo.Produk (
    ProdukID INT IDENTITY(1,1) PRIMARY KEY,
    NamaProduk VARCHAR(100) NOT NULL
);
GO

-- ============================================
-- 5. MEMBUAT TABEL PESANAN HEADER
-- ============================================

CREATE TABLE dbo.PesananHeader (
    PesananID INT IDENTITY(1,1) PRIMARY KEY,
    PelangganID INT NOT NULL,

    CONSTRAINT FK_Header_Pelanggan
    FOREIGN KEY (PelangganID)
    REFERENCES dbo.Pelanggan(PelangganID)
);
GO

-- ============================================
-- 6. MEMBUAT TABEL PESANAN DETAIL
-- ============================================

CREATE TABLE dbo.PesananDetail (
    PesananDetailID INT IDENTITY(1,1) PRIMARY KEY,
    PesananID INT NOT NULL,
    ProdukID INT NOT NULL,
    Jumlah INT NOT NULL,

    CONSTRAINT FK_Detail_Header
    FOREIGN KEY (PesananID)
    REFERENCES dbo.PesananHeader(PesananID),

    CONSTRAINT FK_Detail_Produk
    FOREIGN KEY (ProdukID)
    REFERENCES dbo.Produk(ProdukID)
);
GO

-- ============================================
-- 7. MENGUJI DROP TABLE PELANGGAN
-- ============================================

PRINT 'Mencoba menghapus Pelanggan...';

BEGIN TRY
    DROP TABLE dbo.Pelanggan;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- ============================================
-- 8. MENGUJI DROP TABLE PESANAN HEADER
-- ============================================

PRINT 'Mencoba menghapus PesananHeader...';

BEGIN TRY
    DROP TABLE dbo.PesananHeader;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- ============================================
-- 9. MENGHAPUS TABEL ANAK
-- ============================================

PRINT 'Menghapus PesananDetail...';

DROP TABLE dbo.PesananDetail;
GO

-- ============================================
-- 10. MENGHAPUS TABEL PESANAN HEADER
-- ============================================

PRINT 'Menghapus PesananHeader...';

DROP TABLE dbo.PesananHeader;
GO

-- ============================================
-- 11. MENGHAPUS TABEL PELANGGAN
-- ============================================

PRINT 'Menghapus Pelanggan...';

DROP TABLE dbo.Pelanggan;
GO

-- ============================================
-- 12. MENAMPILKAN HASIL
-- ============================================

PRINT 'Proses penghapusan tabel selesai!';
GO

