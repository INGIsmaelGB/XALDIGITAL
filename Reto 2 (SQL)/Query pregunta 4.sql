---4. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
select al.nombre_aerolinea, a.vuelosxdia, a.dia from aerolinea al
inner join (select id_aerolinea, count(*) vuelosxdia, dia from vuelos
group by id_aerolinea, dia
having count(*)>2) as a
on a.id_aerolinea=al.id_aerolinea
