---3. �En qu� d�a se han tenido mayor n�mero de vuelos?

select TOP 1 dia Dia_con_mas_vuelos, count(*) cuantos_vuelos from vuelos
group by dia
order by cuantos_vuelos DESC