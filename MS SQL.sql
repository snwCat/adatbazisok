/*1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!

Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA*/
create view vszoba
as
select sz.*,
		szh.szallas_nev,
        szh.hely,
        szh.csillagok_szama
from szoba sz join szallashely szh on sz.szallas_fk = szh.szallas_id

/*2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'
*/
create or alter proc spugyfelfoglalasok
--paraméterek:
@ugyfel nvarchar(100)
AS
BEGIN
	select *
    from Foglalas
    where ugyfel_fk = @ugyfel
end

/*
3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!
*/
create or alter function udfferohely
(
	--paraméterek:
  @fazon int
)
returns int 
AS
BEGIN
	declare @ferohely int 
	SELECT @ferohely = sz.ferohely
    from foglalas f join szoba sz on f.szoba_fk = sz.szoba_id
    where f.foglalas_pk = @fazon
	return @ferohely
end