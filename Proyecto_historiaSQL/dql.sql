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