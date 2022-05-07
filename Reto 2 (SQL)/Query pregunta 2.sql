---2. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
select al.nombre_aerolinea, a.Vecesquevolo from aerolinea al
inner join (select id_aerolinea, count(*) Vecesquevolo from vuelos 
group by id_aerolinea
having count(*)=
(select max(contador) from (
select count(*) contador from vuelos 
group by id_aerolinea) T)) as a
on a.id_aerolinea=al.id_aerolinea
