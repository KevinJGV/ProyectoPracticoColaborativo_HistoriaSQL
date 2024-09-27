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

-- Muestra la relacion entre Eventos y TipoConflicto
SELECT 
	e.id_Evento, 
	e.Nombre AS Evento_Nombre, 
	e.Descripcion AS Evento_Descripcion,
    tc.Nombre AS Tipo_Conflicto
FROM
	Eventos e
JOIN
	TipoConflicto tc ON tc.id_TipoConflicto = e.id_TipoConflicto;

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
	
-- Muestra la relacion de Eventos con todas las tablas relacionadas
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
GROUP BY
    e.id_Evento;

-- Eventos que tuieron lugar en europa con Alcance global
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	l.Nombre = "Europa" AND
	a.Tipo = "Global"
GROUP BY
    e.id_Evento

-- Eventos que hallan tenido un aspecto transformado politico y tengan documentacion cartografica y por audio.
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	aT.Aspecto = "Político" AND 
	(do.Nombre = "Cartográfica" OR 
	do.Nombre = "Audio")
GROUP BY
    e.id_Evento

-- Eventos que hallan pasado entre los años 1780s y 1830s con aspecto transformado social.
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	d.Decada BETWEEN "1780s" AND "1830s" AND 
	aT.Aspecto = "Social"
GROUP BY
    e.id_Evento

-- Eventos del ultimo milenio que tengan un aspecto transformador económico
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	d.Decada  > "1920s" AND 
	aT.Aspecto = "Económico"
GROUP BY
    e.id_Evento

-- Eventos que hallan tenido como tipo de conflicto Guerra civil y Mundial que tengan documentacion Judicial y Memorias
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	(Tc.Nombre = "Guerra Civil" OR 
	Tc.Nombre = "Guerra Mundial") AND 
	(do.Nombre = "Judicial" OR
	do.Nombre = "Memorias o diarios personales")
GROUP BY
    e.id_Evento

-- Eventos antes de los 2000s que tengan documentacion testimonial, grafica y oficial
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	d.Decada  < "2000s" AND 
	(do.Nombre = "Testimonial" OR
	do.Nombre = "Gráfica" OR
	do.Nombre = "Oficial")
GROUP BY
    e.id_Evento

-- Eventos que hallan tenido como tipo de conflicto Conflicto Internacional y que esten entre los 1940s y 1980s
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	d.Decada BETWEEN "1940s" AND "1980s" AND 
	Tc.Nombre = "Conflicto Internacional"
GROUP BY
    e.id_Evento

-- Eventos que tengan documentacion fotografica y correspondencia y que tengan de tipo de conflicto guerra tecnologica
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	(do.Nombre = "Fotográfica" OR
	do.Nombre = "Correspondencia") AND 
	Tc.Nombre = "Guerra Tecnológica"
GROUP BY
    e.id_Evento

-- Eventos que tengan localizacion en Luna, versalles y Nueva York y que tengan alcanze tecnologico
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	(l.Nombre = "Luna" OR
	l.Nombre = "Versalles" OR
	l.Nombre = "Nueva York") AND 
	a.Tipo = "Tecnológico"
GROUP BY
    e.id_Evento

-- Eventos que tengan un aspecto transformado militar y un alcance Global
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	aT.Aspecto = "Militar" AND
	a.Tipo = "Global"
GROUP BY
    e.id_Evento

-- Eventos que tengan como causa Colapso de sistemas políticos
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	c.Nombre = "Colapso de sistemas políticos"
GROUP BY
    e.id_Evento

-- Eventos que tengan como causa Revoluciones sociales y económicas y documentacion con diplomas o titulos y analizis academico
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	c.Nombre = "Revoluciones sociales y económicas" AND
	(do.Nombre = "Diplomas o títulos" OR
	do.Nombre = "Análisis académico")
GROUP BY
    e.id_Evento

-- Eventos con documentacion cinematografica y periodistica con 2 o mas subeventos
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT(DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT(DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT(DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT(DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT(DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT(DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE
	do.Nombre = "Cinematográfica" OR
	do.Nombre = "Periodística"
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT se.id_SubEventos) >= 2

-- Eventos que no sean de Alcance Global y que no tenga Documentacion Cinematografica, fotografica y periodistica
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	a.Tipo != "Global"
GROUP BY
    e.id_Evento
HAVING
    COUNT(CASE WHEN do.Nombre IN ("Cinematográfica", "Fotográfica", "Periodística") THEN 1 END) = 0

-- Eventos que tengan mas de 6 documentacion y que esten entre los 1840s y 1940s
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	d.Decada BETWEEN "1840s" AND "1940s"
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT do.id_Documentacion) > 6

-- Eventos que tengan Alcance territorial y tengan 2 o mas Aspectos transformados
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE 
	a.Tipo = "Territorial"
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT aT.Aspecto) >= 2

-- Eventos que 2 o mas personas, mas de 7 documentaciones, con 2 subeventos y mas de 4 aspectos transformado
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    GROUP_CONCAT (DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT (DISTINCT c.Nombre SEPARATOR ", ") AS Causas,
    a.Tipo AS Alcance,
    GROUP_CONCAT (DISTINCT aT.Aspecto SEPARATOR ", ") AS Aspectos_Tranformados,
    GROUP_CONCAT (DISTINCT se.id_SubEventos SEPARATOR ", ") AS id_SubEventos,
    GROUP_CONCAT (DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion,
    GROUP_CONCAT (DISTINCT p.id_Personajes SEPARATOR ", ") AS id_Personajes,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    LEFT JOIN Causas c ON ec.id_Causa = c.id_Causa
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT p.id_Personajes) >= 2 AND
    COUNT(DISTINCT do.id_Documentacion) > 7 AND
    COUNT(DISTINCT se.id_SubEventos) = 2 AND
    COUNT(DISTINCT aT.id_AspectoTransformado) >= 4