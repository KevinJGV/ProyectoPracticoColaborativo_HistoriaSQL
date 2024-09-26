-- Muestra la relacion entre Eventos y Alcance
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    al.Tipo AS Alcance_Tipo
FROM
	Eventos e
JOIN
	Alcance al ON e.id_Alcance = al.id_Alcance;

-- Muestra la relacion entre Eventos y Decada
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    d.Decada AS Decada_Año
FROM
	Eventos e
JOIN
	Decada d ON e.id_Decada = d.id_Decada;

-- Muestra la relacion entre Eventos y Documentacion
SELECT 
	e.id_Evento AS ID, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    GROUP_CONCAT (DISTINCT d.Nombre SEPARATOR ", ") AS Documentacion_Nombre
FROM
	Eventos_Documentacion ed
JOIN
	Documentacion d ON ed.id_Documentacion = d.id_Documentacion
JOIN
	Eventos e ON ed.id_Evento = e.id_Evento
GROUP BY
	e.id_Evento;

-- Muestra la relacion entre Eventos y TipoConflicto
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    tc.Nombre AS Tipo_Conflicto
FROM
	Eventos_TipoConflicto etc
JOIN
	TipoConflicto tc ON etc.id_TipoConflicto = tc.id_TipoConflicto
JOIN
	Eventos e ON etc.id_Evento = e.id_Evento;

-- Muestra la relacion entre Eventos y Personajes
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    pe.Nombre AS Personaje_Nombre,
    pe.Fecha_Nacimiento AS Personaje_Nacimiento,
    pe.Fecha_Fallecimiento AS Personaje_Fallecimiento
FROM
	Eventos_Personajes ep
JOIN
	Personajes pe ON ep.id_Personajes = pe.id_Personajes
JOIN
	Eventos e ON ep.id_Evento = e.id_Evento;

-- Muestra la relacion entre Eventos y Locaciones
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    l.Nombre AS Locacion_Nombre
FROM
	Eventos_Locaciones el
JOIN
	Locaciones l ON el.id_Locacion = l.id_Locacion
JOIN
	Eventos e ON el.id_Evento = e.id_Evento;

-- Muestra la relacion entre Eventos y Causas
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    ca.Nombre AS Causa_Nombre
FROM
	Eventos_Causas ec
JOIN
	Causas ca ON ec.id_Causa = ca.id_Causa
JOIN
	Eventos e ON ec.id_Evento = e.id_Evento;

-- Muestra la relacion entre Eventos y AspectoTransformado
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    GROUP_CONCAT(DISTINCT ast.Aspecto SEPARATOR ", ") AS Aspecto_Transformado
FROM
	Eventos_AspectoTransformado east
JOIN
	AspectoTransformado ast ON east.id_AspectoTransformado = ast.id_AspectoTransformado
JOIN
	Eventos e ON east.id_Evento = e.id_Evento
GROUP BY
	e.id_Evento;

-- Muestra la relacion entre Eventos y AspectoTransformado
SELECT 
	e.id_Evento,
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
	sube.Nombre AS SUbEvento_Nombre,
	sube.Descripcion AS SUbEvento_Descripcion,
	sube.Fecha AS SUbEvento_Fecha
FROM
	Eventos_SubEventos esube
JOIN
	SubEventos sube ON esube.id_SubEventos = sube.id_SubEventos
JOIN
	Eventos e ON esube.id_Evento = e.id_Evento;