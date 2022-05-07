---1. ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
select ap.nombre_aeropuerto, a.movs from aeropuerto ap
inner join (
	select id_aeropuerto, count(*) Movs from vuelos 
	group by id_aeropuerto
	having count(*)=
	(select max(contador) from (
	select count(*) contador from vuelos 
	group by id_aeropuerto) T)) as a 
on a.id_aeropuerto=ap.id_aeropuerto