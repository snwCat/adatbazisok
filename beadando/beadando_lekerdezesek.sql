//az egyes üzletek bevétele
select b.name, sum(s.price)
from barbershops b join transactions t on b.ID = t.BarberShopID
	join services s on t.ServiceID = s.ID
group by b.name
order by sum(s.price) desc

//legnagyobb bevételű üzlet
select b.name, max(s.price)
from barbershops b join transactions t on b.ID = t.BarberShopID
	join services s on t.ServiceID = s.ID
group by b.name

//legkisebb bevételű üzlet
select b.name, min(s.price)
from barbershops b join transactions t on b.ID = t.BarberShopID
	join services s on t.ServiceID = s.ID
group by b.name

//milyen szolgáltatásokat vettek igénybe a Géza nevű emberek
select s.description
from services s join transactions t on t.ServiceID = s.ID
	join clients c on t.ClientID = c.ID
WHERE c.FirstName = "Géza"

//kik vettek igénybe olyan szolgáltatásokat mint a Géza nevű emberek
select c.FirstName, c.LastName
from clients c join transactions t on c.ID = t.ClientID
	join services s on t.ServiceID = s.ID
where s.description = 
(
  select s.description
from services s join transactions t on t.ServiceID = s.ID
	join clients c on t.ClientID = c.ID
WHERE c.FirstName = "Géza"
)

//legnagyobb bevételű fodrász
select h.FirstName, max(s.price)
from hairdressers h join transactions t on h.ID = t.HairdresserID
	join services s on t.ServiceID = s.ID
group by h.FirstName

//legkisebb bevételű fodrász
select h.FirstName, min(s.price)
from hairdressers h join transactions t on h.ID = t.HairdresserID
	join services s on t.ServiceID = s.ID
group by h.FirstName

//fodrászok bevétele növekvően
select h.FirstName, sum(s.price)
from hairdressers h join transactions t on h.ID = t.HairdresserID
	join services s on t.ServiceID = s.ID
group by h.FirstName
order by sum(s.price)

//van e azonos nevű fodrász és ügyfél
select c.FirstName, h.FirstName
from clients c join transactions t on c.ID = t.ClientID
    join hairdressers h on t.HairdresserID = h.ID
where c.FirstName = h.FirstName