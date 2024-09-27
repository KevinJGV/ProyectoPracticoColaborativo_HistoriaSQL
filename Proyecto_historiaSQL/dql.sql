-- 10 EVENTOS HISTORICOS DETALLANDO NOMBRE, DESCRIPCION, LOCALIDADES, CAUSAS, ALCANCE, TIPO DE CONFLICO, ASPECTOS QUE TRANSFORMO, MOMENTOS IMPORTANTES, QUÉ DOCUMENTACION EXISTE, PERSONAJES EMBLEMATICOS Y LA DECADA EN LA QUE INICIO DICHO EVENTO
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
    -- LIMIT 10

-- Personajes nacidos entre la decada de 1500s y 1800s que hayan contribuido en algun evento transformador en el area Juridica y su edad de fallecimiento
SELECT
    p.id_Personajes,
    p.Nombre,
    p.Fecha_Nacimiento,
    (p.Fecha_Fallecimiento - p.Fecha_Nacimiento) AS Edad_de_Fallecimiento
FROM
    Personajes p
    JOIN Eventos_Personajes ep ON p.id_Personajes = ep.id_Personajes
    JOIN Eventos e ON ep.id_Evento = e.id_Evento
    JOIN Eventos_AspectoTransformado eat ON e.id_Evento = eat.id_Evento
    JOIN AspectoTransformado at ON eat.id_AspectoTransformado = at.id_AspectoTransformado
WHERE
    p.Fecha_Nacimiento BETWEEN 1500 AND 1800
    AND at.Aspecto = 'Jurídico';

-- ¿Existe documentacion Cartografica sobre la llegada del hombre a la luna?
SELECT
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM Eventos e
            JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
            JOIN Documentacion d ON ed.id_Documentacion = d.id_Documentacion
            WHERE e.Nombre = "Llegada del hombre a la Luna" AND d.Nombre = "Cartográfica"
        ) THEN "Verdadero"
        ELSE "Falso"
    END AS "¿Existe documentación cartográfica sobre la llegada del hombre a la luna?"

-- ¿Cual es el tipo de conflico mas comun?
SELECT
    Tc.Nombre AS "Tipo de conflicto",
    COUNT(*) AS "Coincidencias"
FROM
    Eventos e
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
GROUP BY
    Tc.Nombre
ORDER BY
    COUNT(*) DESC

-- Mostrar unicamente los Eventos historicos con 4 o más personajes implicados
SELECT
    e.id_Evento,
    e.Nombre,
    COUNT(*) AS "# Personajes"
FROM
    Eventos e
    JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
GROUP BY
    e.id_Evento
HAVING
    COUNT(*) >= 4
ORDER BY
    COUNT(*) DESC

-- Personajes que a dia de hoy no hayan fallecido o que lleven menos de 2 decadas fallecidos
SELECT
    id_Personajes,
    Nombre,
    Fecha_Nacimiento
FROM
    Personajes
WHERE
    Fecha_Fallecimiento IS NULL
    OR (YEAR(CURDATE()) - Fecha_Fallecimiento) < 20
ORDER BY        
    Fecha_Nacimiento ASC

-- Eventos historicos de caracter global o mundial
SELECT
    e.id_Evento,
    e.Nombre,
    CASE
        WHEN tc.Nombre = "Guerra Mundial" THEN CONCAT("Tipo De Conflicto: ", tc.Nombre)
        WHEN a.Tipo = "Global" THEN CONCAT("Alcance: ", a.Tipo)
    END AS "Caracter"
FROM
    Eventos e
    JOIN TipoConflicto tc ON e.id_TipoConflicto = tc.id_TipoConflicto
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
WHERE
    tc.Nombre = "Guerra Mundial" OR a.Tipo = "Global"

-- Momentos emblematicos con sus eventos historicos ocurridos antes del siglo XVII con su fecha exacta de ejecución
SELECT
    s.id_SubEventos,
    s.Nombre AS "Momento Emblematico",
    e.Nombre AS "Evento",
    s.Fecha
FROM
    SubEventos s
    JOIN Eventos_SubEventos es ON s.id_SubEventos = es.id_SubEventos
    JOIN Eventos e ON es.id_Evento = e.id_Evento
WHERE
    YEAR(Fecha) < 1600
ORDER BY
    Fecha ASC

-- SubEventos ocurridos en el 3er trimestre de 1789 y su detalle
SELECT
    id_SubEventos,
    Nombre,
    Fecha,
    Descripcion
FROM
    SubEventos
WHERE
    YEAR(Fecha) = 1789 AND
    MONTH(Fecha) BETWEEN 07 AND 09

-- ¿Cúal es el evento mas reciente?
SELECT
    e.id_Evento,
    e.Nombre,
    d.Decada
FROM
    Eventos e
    JOIN Decada d ON e.id_Decada = d.id_Decada
ORDER BY
    ABS(CAST(LEFT(d.Decada, 4) AS SIGNED) - YEAR(CURDATE())) ASC
LIMIT 1

-- Eventos historicos que desatarón un conflico internacional por motivos Ideologicos en el presente milenio
SELECT
    e.id_Evento,
    e.Nombre,
    d.Decada
FROM
    Eventos e
    JOIN TipoConflicto tc ON e.id_TipoConflicto = tc.id_TipoConflicto
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
WHERE
    tc.Nombre = "Conflicto Internacional"
    AND a.Tipo = "Ideológico"

-- Eventos historicos sucedidos entre la decada de 1910 y 1930 que hayan transformado al mundo economicamente
SELECT
    e.id_Evento,
    e.Nombre,
    d.Decada
FROM
    Eventos e
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN Eventos_AspectoTransformado eat ON e.id_Evento = eat.id_Evento
    JOIN AspectoTransformado at ON eat.id_AspectoTransformado = at.id_AspectoTransformado
WHERE
    at.Aspecto = "Económico"
    AND CAST(LEFT(d.Decada, 4) AS UNSIGNED) BETWEEN 1910 AND 1930