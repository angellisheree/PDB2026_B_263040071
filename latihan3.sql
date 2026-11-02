CREATE TABLE PesananHeader (
    PesananID INT IDENTITY(1,1) PRIMARY KEY,
    TanggalPesanan DATETIME2 NOT NULL,
    PelangganID INT NOT NULL,
    StatusPesanan VARCHAR(10) NOT NULL,

    -- Mendefinisikan constraint FOREIGN KEY (out-of-line)
    CONSTRAINT FK_PesananHeader_Pelanggan
        FOREIGN KEY (PelangganID)
        REFERENCES Pelanggan(PelangganID)
);