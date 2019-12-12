
#CONSULTA 2 - Cantidad de barcos fuera de puertos.
DELIMITER;
CREATE FUNCTION 'barcos_fuera_puerto'() RETURNS INT (11)
BEGIN

	DECLARE cantidad INT;
	
	CREATE TEMPORARY TABLE tempUltPos (id_barco INT, posicion INT)

	INSERT INTO tempUltPos VALUES

	(select b.id_barco,m.posicion
	from derrotero d
		join barco b on b.id_barco=d.fk_barco
		join mediciones m on m.fk_derrotero=d.id_derrotero
	where m.fecha=(select MAX(m.fecha) from mediciones m where d.id_derrotero=m.fk_derrotero))
		

	(select count(id_barco)
	from tempUltPos tup
	where not exists (
		select * from puerto p
		where ST_WITHIN(tup.posicion,p.poligono)=1
	      ));

	INTO cantidad;

	DROP table tempUltPost

	RETURN cantidad;
	
END;;
DELIMITER;


#CONSULTA 4 - Generar una alerta de los barcos que se saltearon un punto del derrotero.

DELIMITER;
CREATE FUNCTION 'barcos_salto_punto_derrotero'() RETURNS INT (11)
BEGIN

	DECLARE cantidad INT;

	(select count(id_barco)
	from barco b
	where exists (select b.id_barco from derrotero d
				     where b.id_barco=d.fk_barco and ST_Equals(d.puntos_viaje,d.trayecto_real)=0))

	INTO cantidad;

	RETURN cantidad;
	
END;;
DELIMITER;


#CONSULTA 6- cantidad barcos que cruzaron la latitud 33

DELIMITER;
CREATE FUNCTION 'barcos_latitud_33'() RETURNS INT (11)
BEGIN

	DECLARE cantidad INT;

	(select count(id_barco)
	from barco b
	where exists (select id_barco from derrotero d
		      where b.id_barco=d.fk_barco and ST_Intersects(ST_MakeLine(ST_MakePoint(-150.0,-33.0),ST_MakePoint(150.0,-33.0)),d.trayecto_real)=1))

	INTO cantidad;

	RETURN cantidad;
	
END;;
DELIMITER;



#CONSULTA 8- Decir que empresa pescó más merluza en el última semana.

DELIMITER;
CREATE FUNCTION 'empresa_mas_merluza'() RETURNS varchar (50)
BEGIN

	DECLARE empresa varchar(50);
	#select e.id_empresa, sum(p.cantidad)as 'sumemp' from empresa e
	select e.nombre from empresa e
			join barco b on b.fk_empresa=e.id_empresa
			join derrotero d on d.fk_barco=b.id_barco
			join pescado p on p.fk_derrotero=d.id_derrotero
	where d.fecha_arribo>(NOW()- INTERVAL 7 DAY) and p.tipo='merluza' 
	GROUP BY e.id_empresa
	HAVING sum(p.cantidad)
	ORDER by sum(p.cantidad) desc
	Limit 1
	
	INTO empresa;

	RETURN empresa;
	
END;;
DELIMITER;
