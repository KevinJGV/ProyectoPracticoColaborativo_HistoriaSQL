-- Muestra la relacion entre Eventos y Alcance
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    al.Tipo AS Alcance_Tipo
FROM Eventos e
JOIN Alcance al ON e.id_Alcance = al.id_Alcance;

-- Muestra la relacion entre Eventos y Decada
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    d.Decada AS Decada_Año
FROM Eventos e
JOIN Decada d ON e.id_Decada = d.id_Decada;

-- Muestra la relacion entre Eventos y TipoConflicto
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    tc.Nombre AS Tipo_Conflicto
FROM Eventos e
JOIN TipoConflicto tc ON e.id_TipoConflicto = tc.id_TipoConflicto;

-- Muestra la relacion entre Eventos y Documentacion
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    GROUP_CONCAT(DISTINCT d.Nombre SEPARATOR ', ') AS Documentacion_Nombre
FROM Eventos e
JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
JOIN Documentacion d ON ed.id_Documentacion = d.id_Documentacion
GROUP BY e.id_Evento;

-- Muestra la relacion entre Eventos y Personajes
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    pe.Nombre AS Personaje_Nombre,
    pe.Fecha_Nacimiento AS Personaje_Nacimiento,
    pe.Fecha_Fallecimiento AS Personaje_Fallecimiento
FROM Eventos e
JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
JOIN Personajes pe ON ep.id_Personajes = pe.id_Personajes;

-- Muestra la relacion entre Eventos y Locaciones
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    l.Nombre AS Locacion_Nombre
FROM Eventos e
JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
JOIN Locaciones l ON el.id_Locacion = l.id_Locacion;

-- Muestra la relacion entre Eventos y Causas
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    ca.Nombre AS Causa_Nombre
FROM Eventos e
JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
JOIN Causas ca ON ec.id_Causa = ca.id_Causa;

-- Muestra la relacion entre Eventos y AspectoTransformado
SELECT 
    e.id_Evento, 
    e.Nombre AS Evento_Nombre, 
    GROUP_CONCAT(DISTINCT ast.Aspecto SEPARATOR ', ') AS Aspecto_Transformado
FROM Eventos e
JOIN Eventos_AspectoTransformado east ON e.id_Evento = east.id_Evento
JOIN AspectoTransformado ast ON east.id_AspectoTransformado = ast.id_AspectoTransformado
GROUP BY e.id_Evento;

-- Muestra la relacion entre Eventos y SubEventos
SELECT 
    e.id_Evento,
    e.Nombre AS Evento_Nombre, 
    sube.Nombre AS SubEvento_Nombre,
    sube.Fecha AS SubEvento_Fecha
FROM Eventos e
JOIN Eventos_SubEventos esube ON e.id_Evento = esube.id_Evento
JOIN SubEventos sube ON esube.id_SubEventos = sube.id_SubEventos;
    
-- Eventos que tuvieron lugar en Europa con Alcance global
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    l.Nombre AS Locacion,
    a.Tipo AS Alcance
FROM Eventos e
JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
JOIN Alcance a ON e.id_Alcance = a.id_Alcance
WHERE l.Nombre = 'Europa' AND a.Tipo = 'Global';

-- Eventos que hallan tenido un aspecto transformado politico y tengan documentacion cartografica y por audio
SELECT DISTINCT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    aT.Aspecto AS Aspecto_Transformado,
    GROUP_CONCAT(DISTINCT d.Nombre SEPARATOR ', ') AS Documentacion
FROM Eventos e
JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
JOIN Documentacion d ON ed.id_Documentacion = d.id_Documentacion
WHERE aT.Aspecto = 'Político' AND d.Nombre IN ('Cartográfica', 'Audio')
GROUP BY e.id_Evento
HAVING COUNT(DISTINCT d.Nombre) = 2;

-- Eventos que hallan pasado entre los años 1780s y 1830s con aspecto transformado social
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    d.Decada,
    aT.Aspecto AS Aspecto_Transformado
FROM Eventos e
JOIN Decada d ON e.id_Decada = d.id_Decada
JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
WHERE d.Decada BETWEEN '1780s' AND '1830s' AND aT.Aspecto = 'Social';

-- Eventos del ultimo milenio que tengan un aspecto transformador económico
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    d.Decada,
    aT.Aspecto AS Aspecto_Transformado
FROM Eventos e
JOIN Decada d ON e.id_Decada = d.id_Decada
JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
WHERE d.Decada > '1920s' AND aT.Aspecto = 'Económico';

-- Eventos que hallan tenido como tipo de conflicto Guerra civil y Mundial que tengan documentacion Judicial y Memorias
SELECT DISTINCT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    GROUP_CONCAT(DISTINCT d.Nombre SEPARATOR ', ') AS Documentacion
FROM Eventos e
JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
JOIN Documentacion d ON ed.id_Documentacion = d.id_Documentacion
WHERE Tc.Nombre IN ('Guerra Civil', 'Guerra Mundial') 
  AND d.Nombre IN ('Judicial', 'Memorias o diarios personales')
GROUP BY e.id_Evento
HAVING COUNT(DISTINCT d.Nombre) = 2;

-- Eventos antes de los 2000s que tengan documentacion testimonial, grafica y oficial
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    d.Decada,
    GROUP_CONCAT(DISTINCT do.Nombre SEPARATOR ', ') AS Documentacion
FROM Eventos e
JOIN Decada d ON e.id_Decada = d.id_Decada
JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
JOIN Documentacion do ON ed.id_Documentacion = do.id_Documentacion
WHERE d.Decada < '2000s' AND do.Nombre IN ('Testimonial', 'Gráfica', 'Oficial')
GROUP BY e.id_Evento
HAVING COUNT(DISTINCT do.Nombre) = 3;

-- Eventos que hallan tenido como tipo de conflicto Conflicto Internacional y que esten entre los 1940s y 1980s
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    d.Decada
FROM Eventos e
JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
JOIN Decada d ON e.id_Decada = d.id_Decada
WHERE d.Decada BETWEEN '1940s' AND '1980s' AND Tc.Nombre = 'Conflicto Internacional';

-- Eventos que tengan documentacion fotografica y correspondencia y que tengan de tipo de conflicto guerra tecnologica
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    GROUP_CONCAT(DISTINCT do.Nombre SEPARATOR ', ') AS Documentacion
FROM Eventos e
JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
JOIN Documentacion do ON ed.id_Documentacion = do.id_Documentacion
WHERE do.Nombre IN ('Fotográfica', 'Correspondencia') AND Tc.Nombre = 'Guerra Tecnológica'
GROUP BY e.id_Evento
HAVING COUNT(DISTINCT do.Nombre) = 2;

-- Eventos que tengan localizacion en Luna, versalles y Nueva York y que tengan alcanze tecnologico
SELECT
    e.id_Evento,
    e.Nombre AS Evento,
    e.Descripcion AS Descripcion_Evento,
    GROUP_CONCAT(DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    a.Tipo AS Alcance
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
WHERE 
    l.Nombre IN ("Luna", "Versalles", "Nueva York") AND 
    a.Tipo = "Tecnológico"
GROUP BY
    e.id_Evento;

-- Eventos que tengan un aspecto transformado militar y un alcance Global
SELECT
    e.id_Evento,
    e.Nombre AS Evento_Nombre
FROM Eventos e
JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
JOIN Alcance a ON e.id_Alcance = a.id_Alcance
WHERE aT.Aspecto = 'Militar' AND a.Tipo = 'Global';

-- Eventos que tengan como causa Colapso de sistemas políticos
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    JOIN Causas c ON ec.id_Causa = c.id_Causa
WHERE 
    c.Nombre = "Colapso de sistemas políticos"
GROUP BY
    e.id_Evento

-- Eventos que tengan como causa Revoluciones sociales y económicas y documentacion con diplomas o titulos y analizis academico
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
    JOIN Causas c ON ec.id_Causa = c.id_Causa
    JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
WHERE 
    c.Nombre = "Revoluciones sociales y económicas" AND
    (do.Nombre = "Diplomas o títulos" OR
    do.Nombre = "Análisis académico")
GROUP BY
    e.id_Evento

-- Eventos con documentacion cinematografica y periodistica con 2 o mas subeventos
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
WHERE
    do.Nombre IN ("Cinematográfica", "Periodística")
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT se.id_SubEventos) >= 2

-- Eventos que no sean de Alcance Global y que no tenga Documentacion Cinematografica, fotografica y periodistica
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
WHERE 
    a.Tipo != "Global"
GROUP BY
    e.id_Evento
HAVING
    COUNT(CASE WHEN do.Nombre IN ("Cinematográfica", "Fotográfica", "Periodística") THEN 1 END) = 0

-- Eventos que tengan mas de 6 documentacion y que esten entre los 1840s y 1940s
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
WHERE 
    d.Decada BETWEEN "1840s" AND "1940s"
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT do.id_Documentacion) > 6

-- Eventos que tengan Alcance territorial y tengan 2 o mas Aspectos transformados
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
WHERE 
    a.Tipo = "Territorial"
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT aT.Aspecto) >= 2

-- Eventos que 2 o mas personas, mas de 7 documentaciones, con 2 subeventos y mas de 4 aspectos transformado
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
    JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    JOIN SubEventos se ON ese.id_SubEventos = se.id_SubEventos
    JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT p.id_Personajes) >= 2 AND
    COUNT(DISTINCT do.id_Documentacion) > 7 AND
    COUNT(DISTINCT se.id_SubEventos) = 2 AND
    COUNT(DISTINCT aT.id_AspectoTransformado) >= 4

-- Personaje nacido en la decada de 1930 que haya tenido participacion en eventos politicos entre el siglo XX y siglo XXI
SELECT
    e.id_Evento,
    e.Nombre,
    Tc.Nombre AS Tipo_De_Conflicto,
    e.Descripcion,
    a.Tipo AS Alcance,
    p.Nombre,
    p.Fecha_Nacimiento,
    d.Decada
FROM
    Eventos e
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    LEFT JOIN Eventos_SubEventos ese ON e.id_Evento = ese.id_Evento
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
WHERE
    a.Tipo = "Político" AND
    p.Fecha_Nacimiento BETWEEN 1931 AND 1941 AND
    d.Decada BETWEEN "1900s" AND "2000s" AND 
    p.Nombre IN (
        SELECT p2.Nombre
        FROM Eventos_Personajes ep2
        JOIN Personajes p2 ON ep2.id_Personajes = p2.id_Personajes
        WHERE p2.Fecha_Nacimiento BETWEEN 1931 AND 1941
        GROUP BY p2.Nombre
        HAVING COUNT(DISTINCT ep2.id_Evento) > 1
    )
GROUP BY
    e.id_Evento,
    p.Nombre,
    p.Fecha_Nacimiento

-- Eventos entre 1870s y 1940s con 2 aspectos transformados, 2 personajes y 8 o mas documentaciones
SELECT
    e.id_Evento,
    e.Nombre AS Evento,
    GROUP_CONCAT(DISTINCT l.Nombre SEPARATOR ", ") AS Locaciones,
    GROUP_CONCAT(DISTINCT do.Nombre SEPARATOR ", ") AS Documentacion
FROM
    Eventos e
    LEFT JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    LEFT JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    LEFT JOIN Eventos_Documentacion edo ON e.id_Evento = edo.id_Evento
    LEFT JOIN Documentacion do ON edo.id_Documentacion = do.id_Documentacion
    LEFT JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
    LEFT JOIN Personajes p ON ep.id_Personajes = p.id_Personajes
    LEFT JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    LEFT JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    JOIN Decada d ON e.id_Decada = d.id_Decada
WHERE
    d.Decada BETWEEN "1870s" AND "1940s"
GROUP BY
    e.id_Evento
HAVING
    COUNT(DISTINCT p.id_Personajes) = 2 AND
    COUNT(DISTINCT do.id_Documentacion) >= 8 AND
    COUNT(DISTINCT aT.id_AspectoTransformado) = 2;

-- 10 EVENTOS HISTORICOS DETALLANDO NOMBRE, DESCRIPCION, LOCALIDADES, CAUSAS, ALCANCE, TIPO DE CONFLICO, ASPECTOS QUE TRANSFORMO, MOMENTOS IMPORTANTES, QUÉ DOCUMENTACION EXISTE, PERSONAJES EMBLEMATICOS Y LA DECADA EN LA QUE INICIO DICHO EVENTO
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
LIMIT 10

-- Personajes nacidos entre la decada de 1500s y 1800s que hayan contribuido en algun evento transformador en el area Juridica y su edad de fallecimiento
SELECT
    p.id_Personajes,
    p.Nombre,
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
    Nombre
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
    Fecha
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
    e.Nombre
FROM
    Eventos e
    JOIN TipoConflicto tc ON e.id_TipoConflicto = tc.id_TipoConflicto
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    JOIN Decada d ON e.id_Decada = d.id_Decada
WHERE
    tc.Nombre = "Conflicto Internacional"
    AND a.Tipo = "Ideológico"
    AND CAST(LEFT(d.Decada, 4) AS UNSIGNED) >= 2000

-- Eventos historicos sucedidos entre la decada de 1910 y 1930 que hayan transformado al mundo economicamente
SELECT
    e.id_Evento,
    e.Nombre
FROM
    Eventos e
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN Eventos_AspectoTransformado eat ON e.id_Evento = eat.id_Evento
    JOIN AspectoTransformado at ON eat.id_AspectoTransformado = at.id_AspectoTransformado
WHERE
    at.Aspecto = "Económico"
    AND CAST(LEFT(d.Decada, 4) AS UNSIGNED) BETWEEN 1910 AND 1930