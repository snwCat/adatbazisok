CREATE TABLE barbershops (
  [ID] int(11),
  [Name] nvarchar(20),
  [AddressZip] int,
  [AddressCity] nvarchar(20),
  [AddressStreet] nvarchar(20)
) ;

INSERT INTO barbershops (ID, Name, AddressZip, AddressCity, AddressStreet) VALUES
(1, 'Budafoki Fejszobrászat', 1221, 'Budapest', 'Kossuth Lajos utca 1'),
(2, 'Kelenföldi Fodrászat', 1111, 'Budapest', 'Tétényi út 22');

CREATE TABLE clients (
  [ID] int,
  [FirstName] nvarchar(50),
  [FamilyNam] nvarchar(50),
  [HairStyle] nvarchar(50)
) ;

INSERT INTO clients (ID, FirstName, FamilyName, HairStyle) VALUES
(1, 'Blanka', 'Hisztis', 'Félkopaszra nyírt hippi stílus'),
(2, 'Lajos', 'Szkinhead', 'kopasz'),
(3, 'Géza', 'Mézga', 'Kopasz átfésült'),
(4, 'Bogi', 'Gucci', 'Fekete lófarkas.'),
(5, 'Paula', 'Rezovics', 'Kontyos');

CREATE TABLE hairdressers (
  [ID] int,
  [FirstName] nvarchar(50),
  [FamilyName] nvarchar(50),
  [HourlyRate] int,
  [BarberShopID] int
) ;

INSERT INTO hairdressers (ID, FirstName, FamilyName, HourlyRate, BarberShopID) VALUES
(1, 'Lajos', 'Nagy', 5500, 1),
(2, 'Géza', 'Kiss', 5750, 2),
(3, 'Éva', 'Olló', 6120, 1),
(4, 'Bianka', 'Fehér', 4950, 2);

CREATE TABLE services (
  [ID] int,
  [Description] nvarchar(20),
  [Price] int
) ;

INSERT INTO services (ID, Description, Price) VALUES
(1, 'Vágás - férfi', 5000),
(2, 'Vágás - noi', 7000),
(3, 'Festés', 15000);

CREATE TABLE transactions (
  [ID] int,
  [ServiceID] int,
  [BarberShopID] int,
  [ClientID] int,
  [HairdresserID] int,
  [DateOfService] nvarchar(20)
) ;

INSERT INTO transactions (ID, ServiceID, BarberShopID, ClientID, HairdresserID, DateOfService) VALUES
(1, 2, 1, 1, 1, '2024-05-14'),
(2, 1, 1, 2, 2, '2024-05-14'),
(3, 3, 2, 4, 4, '2024-05-13'),
(4, 3, 2, 5, 4, '2024-05-13'),
(5, 2, 1, 3, 3, '2024-05-12');