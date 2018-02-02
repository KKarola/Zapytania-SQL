-- tables
-- Table: Adres
CREATE TABLE Adres (
    Id_Adres int  NOT NULL,
    Miasto_Id_Miasto int  NOT NULL,
    Ulica varchar(50)  NOT NULL,
    Nr_dzialki int  NOT NULL,
    Kod_pocztowy varchar(50)  NOT NULL,
    CONSTRAINT Adres_pk PRIMARY KEY (Id_Adres)
);

-- Table: Druzyna
CREATE TABLE Druzyna (
    Id_Druzyna int  NOT NULL,
    Trener_Id_Trener int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    Piosenka varchar(50)  NULL,
    CONSTRAINT Druzyna_pk PRIMARY KEY (Id_Druzyna)
);

-- Table: Hala
CREATE TABLE Hala (
    Id_Hala varchar(50)  NOT NULL,
    Adres_Id_Adres int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    CONSTRAINT Hala_pk PRIMARY KEY (Id_Hala)
);

-- Table: Klasa_trenerska
CREATE TABLE Klasa_trenerska (
    Id_Klasa int  NOT NULL,
    Klasa int  NULL,
    CONSTRAINT Klasa_trenerska_pk PRIMARY KEY (Id_Klasa)
);

-- Table: Mecz
CREATE TABLE Mecz (
    Id_Mecz int  NOT NULL,
    Hala_Id_Hala varchar(50)  NOT NULL,
    Druzyna_Id_Druzyna int  NOT NULL,
    Druzyna_2_Id_Druzyna int  NOT NULL,
    Sedzia_Id_sedzia int  NOT NULL,
    Termin date  NOT NULL,
    CONSTRAINT Mecz_pk PRIMARY KEY (Id_Mecz)
);

-- Table: Miasto
CREATE TABLE Miasto (
    Id_Miasto int  NOT NULL,
    Miasto varchar(50)  NOT NULL,
    CONSTRAINT Miasto_pk PRIMARY KEY (Id_Miasto)
);

-- Table: Osoba
CREATE TABLE Osoba (
    Id_Osoba int  NOT NULL,
    Urzad_Id_Urzad int  NOT NULL,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    Data_urodzenia date  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (Id_Osoba)
);

-- Table: Sedzia
CREATE TABLE Sedzia (
    Id_sedzia int  NOT NULL,
    CONSTRAINT Sedzia_pk PRIMARY KEY (Id_sedzia)
);

-- Table: Statystyka
CREATE TABLE Statystyka (
    Id_Statystyka int  NOT NULL,
    Mecz_Id_Mecz int  NOT NULL,
    Ilosc_zdobytych_punktow int  NULL,
    CONSTRAINT Statystyka_pk PRIMARY KEY (Id_Statystyka)
);

-- Table: Tabela_wynikow
CREATE TABLE Tabela_wynikow (
    Druzyna_Id_Druzyna int  NOT NULL,
    Mecz_Id_Mecz int  NOT NULL,
    Punkty_w_I_secie int  NULL,
    Punkty_w_II_secie int  NULL,
    Punkty_w_III_secie int  NULL,
    Punkty_w_IV_secie int  NULL,
    Punkty_w_V_secie int  NULL,
    CONSTRAINT Tabela_wynikow_pk PRIMARY KEY (Druzyna_Id_Druzyna,Mecz_Id_Mecz)
);

-- Table: Trener
CREATE TABLE Trener (
    Id_Trener int  NOT NULL,
    Klasa_trenerska_Id_Klasa int  NOT NULL,
    Uprawnienia date  NULL,
    CONSTRAINT Trener_pk PRIMARY KEY (Id_Trener)
);

-- Table: Urzad
CREATE TABLE Urzad (
    Id_Urzad int  NOT NULL,
    Adres_Id_Adres int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    CONSTRAINT Urzad_pk PRIMARY KEY (Id_Urzad)
);

-- Table: Zawodnik
CREATE TABLE Zawodnik (
    Id_Zawodnik int  NOT NULL,
    Nr_na_koszulce int  NULL,
    CONSTRAINT Zawodnik_pk PRIMARY KEY (Id_Zawodnik)
);

-- Table: Zawodnik_w_druzynie
CREATE TABLE Zawodnik_w_druzynie (
    Druzyna_Id_Druzyna int  NOT NULL,
    Zawodnik_Id_Zawodnik int  NOT NULL,
    Statystyka_Id_Statystyka int  NOT NULL,
    CONSTRAINT Zawodnik_w_druzynie_pk PRIMARY KEY (Druzyna_Id_Druzyna,Zawodnik_Id_Zawodnik)
);

-- foreign keys
-- Reference: Adres_Miasto (table: Adres)
ALTER TABLE Adres ADD CONSTRAINT Adres_Miasto
    FOREIGN KEY (Miasto_Id_Miasto)
    REFERENCES Miasto (Id_Miasto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Druzyna_Trener (table: Druzyna)
ALTER TABLE Druzyna ADD CONSTRAINT Druzyna_Trener
    FOREIGN KEY (Trener_Id_Trener)
    REFERENCES Trener (Id_Trener)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Hala_Adres (table: Hala)
ALTER TABLE Hala ADD CONSTRAINT Hala_Adres
    FOREIGN KEY (Adres_Id_Adres)
    REFERENCES Adres (Id_Adres)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Mecz_Druzyna (table: Mecz)
ALTER TABLE Mecz ADD CONSTRAINT Mecz_Druzyna
    FOREIGN KEY (Druzyna_Id_Druzyna)
    REFERENCES Druzyna (Id_Druzyna)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Mecz_Druzyna1 (table: Mecz)
ALTER TABLE Mecz ADD CONSTRAINT Mecz_Druzyna1
    FOREIGN KEY (Druzyna_2_Id_Druzyna)
    REFERENCES Druzyna (Id_Druzyna)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Mecz_Hala (table: Mecz)
ALTER TABLE Mecz ADD CONSTRAINT Mecz_Hala
    FOREIGN KEY (Hala_Id_Hala)
    REFERENCES Hala (Id_Hala)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Mecz_Sedzia (table: Mecz)
ALTER TABLE Mecz ADD CONSTRAINT Mecz_Sedzia
    FOREIGN KEY (Sedzia_Id_sedzia)
    REFERENCES Sedzia (Id_sedzia)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Osoba_Urzad (table: Osoba)
ALTER TABLE Osoba ADD CONSTRAINT Osoba_Urzad
    FOREIGN KEY (Urzad_Id_Urzad)
    REFERENCES Urzad (Id_Urzad)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Sedzia_Osoba (table: Sedzia)
ALTER TABLE Sedzia ADD CONSTRAINT Sedzia_Osoba
    FOREIGN KEY (Id_sedzia)
    REFERENCES Osoba (Id_Osoba)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Statystyka_Mecz (table: Statystyka)
ALTER TABLE Statystyka ADD CONSTRAINT Statystyka_Mecz
    FOREIGN KEY (Mecz_Id_Mecz)
    REFERENCES Mecz (Id_Mecz)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Tabela_wynikow_Druzyna (table: Tabela_wynikow)
ALTER TABLE Tabela_wynikow ADD CONSTRAINT Tabela_wynikow_Druzyna
    FOREIGN KEY (Druzyna_Id_Druzyna)
    REFERENCES Druzyna (Id_Druzyna)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Tabela_wynikow_Mecz (table: Tabela_wynikow)
ALTER TABLE Tabela_wynikow ADD CONSTRAINT Tabela_wynikow_Mecz
    FOREIGN KEY (Mecz_Id_Mecz)
    REFERENCES Mecz (Id_Mecz)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Trener_Klasa_trenerska (table: Trener)
ALTER TABLE Trener ADD CONSTRAINT Trener_Klasa_trenerska
    FOREIGN KEY (Klasa_trenerska_Id_Klasa)
    REFERENCES Klasa_trenerska (Id_Klasa)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Trener_Osoba (table: Trener)
ALTER TABLE Trener ADD CONSTRAINT Trener_Osoba
    FOREIGN KEY (Id_Trener)
    REFERENCES Osoba (Id_Osoba)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Urzad_Adres (table: Urzad)
ALTER TABLE Urzad ADD CONSTRAINT Urzad_Adres
    FOREIGN KEY (Adres_Id_Adres)
    REFERENCES Adres (Id_Adres)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawodnik_Osoba (table: Zawodnik)
ALTER TABLE Zawodnik ADD CONSTRAINT Zawodnik_Osoba
    FOREIGN KEY (Id_Zawodnik)
    REFERENCES Osoba (Id_Osoba)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawodnik_w_druzynie_Druzyna (table: Zawodnik_w_druzynie)
ALTER TABLE Zawodnik_w_druzynie ADD CONSTRAINT Zawodnik_w_druzynie_Druzyna
    FOREIGN KEY (Druzyna_Id_Druzyna)
    REFERENCES Druzyna (Id_Druzyna)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawodnik_w_druzynie_Statystyka (table: Zawodnik_w_druzynie)
ALTER TABLE Zawodnik_w_druzynie ADD CONSTRAINT Zawodnik_w_druzynie_Statystyka
    FOREIGN KEY (Statystyka_Id_Statystyka)
    REFERENCES Statystyka (Id_Statystyka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawodnik_w_druzynie_Zawodnik (table: Zawodnik_w_druzynie)
ALTER TABLE Zawodnik_w_druzynie ADD CONSTRAINT Zawodnik_w_druzynie_Zawodnik
    FOREIGN KEY (Zawodnik_Id_Zawodnik)
    REFERENCES Zawodnik (Id_Zawodnik)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.