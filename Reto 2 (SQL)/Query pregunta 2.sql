---2. �Cu�l es el nombre aerol�nea que ha realizado mayor n�mero de vuelos durante el a�o?
select al.nombre_aerolinea, a.Vecesquevolo from aerolinea al
inner join (select id_aerolinea, count(*) Vecesquevolo from vuelos 
group by id_aerolinea
having count(*)=
(select max(contador) from (
select count(*) contador from vuelos 
group by id_aerolinea) T)) as a
on a.id_aerolinea=al.id_aerolinea
