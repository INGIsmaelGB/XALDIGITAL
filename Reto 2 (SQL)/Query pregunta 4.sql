---4. �Cu�les son las aerol�neas que tienen mas de 2 vuelos por d�a?
select al.nombre_aerolinea, a.vuelosxdia, a.dia from aerolinea al
inner join (select id_aerolinea, count(*) vuelosxdia, dia from vuelos
group by id_aerolinea, dia
having count(*)>2) as a
on a.id_aerolinea=al.id_aerolinea
