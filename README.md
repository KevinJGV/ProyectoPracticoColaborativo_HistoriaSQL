# Proyecto_HistoriaSQL

## Descripción

La base de datos contiene información sobre eventos históricos, incluyendo detalles como:

* Nombres y descripciones de eventos
* Períodos de tiempo (décadas)
* Ubicaciones
* Causas
* Alcance del impacto
* Tipos de conflictos
* Aspectos transformados
* Momentos importantes (sub-eventos)
* Documentación disponible
* Figuras clave involucradas

Las consultas en esta colección están diseñadas para extraer información específica y obtener perspectivas de este rico conjunto de datos.

## Consultas y sus Propósitos

1. **Consultas de Relación de Eventos** :
   Estas consultas muestran las relaciones entre eventos y varios atributos como alcance, década, tipo de conflicto, documentación, figuras clave, ubicaciones, causas y aspectos transformados.
2. **Consultas de Eventos Filtrados** :
   Estas consultas filtran eventos basados en criterios específicos, como ubicación, período de tiempo, tipo de conflicto y documentación.
3. **Consultas de Eventos Complejos** :
   Estas consultas combinan múltiples criterios para encontrar eventos con características específicas, como tener un cierto número de figuras clave, documentaciones o aspectos transformados.
4. **Consultas de Figuras Históricas** :
   Estas consultas se centran en encontrar información sobre figuras históricas involucradas en eventos, como sus fechas de nacimiento, fechas de fallecimiento y los eventos en los que participaron.
5. **Consultas de Documentación** :
   Estas consultas verifican la existencia de tipos específicos de documentación para ciertos eventos.
6. **Consultas Estadísticas** :
   Estas consultas proporcionan perspectivas sobre los tipos de conflictos más comunes, eventos con más figuras clave, etc.
7. **Consultas de Línea de Tiempo** :
   Estas consultas se centran en encontrar eventos o sub-eventos que ocurrieron durante períodos de tiempo específicos.
8. **Consultas de Alcance e Impacto** :
   Estas consultas identifican eventos con impacto global o generalizado.

## Consultas

1. **Relación entre Eventos y Alcance**

   - Muestra la relación entre los eventos y su alcance

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       al.Tipo AS Alcance_Tipo
   FROM Eventos e
   JOIN Alcance al ON e.id_Alcance = al.id_Alcance LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Alcance_Tipo |
   | --------- | -------------------------------------------------------- | ------------ |
   | 1         | Descubrimiento de América                               | Territorial  |
   | 2         | Conquista de Tenochtitlán                               | Territorial  |
   | 3         | Batalla de Alcántara                                    | Político    |
   | 4         | Guerra Civil Inglesa                                     | Político    |
   | 5         | Independencia de Estados Unidos                          | Territorial  |
   | 6         | Revolución Francesa                                     | Político    |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Territorial  |
   | 8         | Guerra de los Pasteles                                   | Comercial    |
   | 9         | Guerra Civil Americana                                   | Territorial  |
   | 10        | Unificación de Alemania                                 | Político    |
   | 11        | Primera Guerra Mundial                                   | Militar      |
   | 12        | Gran Depresión                                          | Económico   |
   | 13        | Segunda Guerra Mundial                                   | Global       |
   | 14        | Guerra de Corea                                          | Militar      |
   | 15        | Llegada del hombre a la Luna                             | Tecnológico |
   | 16        | Caída del Muro de Berlín                               | Político    |
   | 17        | Disolución de la Unión Soviética                      | Político    |
   | 18        | Atentados del 11 de septiembre                           | Ideológico  |
   | 19        | Pandemia de COVID-19                                     | Sanitario    |
   | 20        | Revolución Industrial                                   | Industria    |
2. **Relación entre Eventos y Década**

   - Muestra la relación entre los eventos y la década a la que pertenecen.

   ```sql
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
       AND CAST(LEFT(d.Decada, 4) AS UNSIGNED) BETWEEN 1910 AND 1930 LIMIT 100
   ```

   | id_Evento | Nombre          |
   | --------- | --------------- |
   | 12        | Gran Depresión |
3. **Relación entre Eventos y Tipo de Conflicto**

   - Muestra la relación entre los eventos y el tipo de conflicto relacionado.

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       tc.Nombre AS Tipo_Conflicto
   FROM Eventos e
   JOIN TipoConflicto tc ON e.id_TipoConflicto = tc.id_TipoConflicto LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Tipo_Conflicto          |
   | --------- | -------------------------------------------------------- | ----------------------- |
   | 1         | Descubrimiento de América                               | Conquista               |
   | 2         | Conquista de Tenochtitlán                               | Conquista               |
   | 3         | Batalla de Alcántara                                    | Conflicto Político     |
   | 4         | Guerra Civil Inglesa                                     | Guerra Civil            |
   | 5         | Independencia de Estados Unidos                          | Guerra de Independencia |
   | 6         | Revolución Francesa                                     | Revolución             |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Guerra de Independencia |
   | 8         | Guerra de los Pasteles                                   | Guerra Económica       |
   | 9         | Guerra Civil Americana                                   | Guerra Civil            |
   | 10        | Unificación de Alemania                                 | Guerra Territorial      |
   | 11        | Primera Guerra Mundial                                   | Guerra Mundial          |
   | 12        | Gran Depresión                                          | Crisis Económica       |
   | 13        | Segunda Guerra Mundial                                   | Guerra Mundial          |
   | 14        | Guerra de Corea                                          | Conflicto Internacional |
   | 15        | Llegada del hombre a la Luna                             | Guerra Tecnológica     |
   | 16        | Caída del Muro de Berlín                               | Conflicto Político     |
   | 17        | Disolución de la Unión Soviética                      | Conflicto Político     |
   | 18        | Atentados del 11 de septiembre                           | Conflicto Internacional |
   | 19        | Pandemia de COVID-19                                     | Crisis Sanitaria        |
   | 20        | Revolución Industrial                                   | Guerra Económica       |
4. **Relación entre Eventos y Documentación**

   - Muestra la relación entre los eventos y la documentación asociada.

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       GROUP_CONCAT(DISTINCT d.Nombre SEPARATOR ', ') AS Documentacion_Nombre
   FROM Eventos e
   JOIN Eventos_Documentacion ed ON e.id_Evento = ed.id_Evento
   JOIN Documentacion d ON ed.id_Documentacion = d.id_Documentacion
   GROUP BY e.id_Evento LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Documentacion_Nombre                                                                                                                                                                |
   | --------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | 1         | Descubrimiento de América                               | Análisis académico, Cartográfica, Correspondencia, Gráfica, Literaria, Manuscritos, Pinturas o murales históricos, Testimonial                                                 |
   | 2         | Conquista de Tenochtitlán                               | Análisis académico, Arqueológica, Cartográfica, Correspondencia, Gráfica, Manuscritos, Oficial, Pinturas o murales históricos, Testimonial                                    |
   | 3         | Batalla de Alcántara                                    | Análisis académico, Cartográfica, Correspondencia, Gráfica, Oficial, Testimonial                                                                                                |
   | 4         | Guerra Civil Inglesa                                     | Análisis académico, Cartográfica, Correspondencia, Memorias o diarios personales, Oficial, Pinturas o murales históricos, Testimonial                                           |
   | 5         | Independencia de Estados Unidos                          | Análisis académico, Cartográfica, Correspondencia, Gráfica, Memorias o diarios personales, Oficial, Testimonial                                                                 |
   | 6         | Revolución Francesa                                     | Análisis académico, Cartográfica, Correspondencia, Gráfica, Memorias o diarios personales, Testimonial                                                                          |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Análisis académico, Correspondencia, Gráfica, Memorias o diarios personales, Oficial                                                                                             |
   | 8         | Guerra de los Pasteles                                   | Análisis académico, Correspondencia, Oficial, Periodística, Testimonial                                                                                                          |
   | 9         | Guerra Civil Americana                                   | Análisis académico, Cartográfica, Correspondencia, Fotográfica, Gráfica, Judicial, Memorias o diarios personales, Oficial, Periodística, Testimonial                          |
   | 10        | Unificación de Alemania                                 | Análisis académico, Cartográfica, Correspondencia, Fotográfica, Gráfica, Oficial, Periodística, Testimonial                                                                   |
   | 11        | Primera Guerra Mundial                                   | Análisis académico, Audio, Cartográfica, Cinematográfica, Correspondencia, Fotográfica, Gráfica, Judicial, Memorias o diarios personales, Oficial, Periodística, Testimonial |
   | 12        | Gran Depresión                                          | Análisis académico, Audio, Cinematográfica, Correspondencia, Fotográfica, Gráfica, Memorias o diarios personales, Oficial, Periodística, Testimonial                          |
   | 13        | Segunda Guerra Mundial                                   | Análisis académico, Audio, Cartográfica, Cinematográfica, Correspondencia, Fotográfica, Gráfica, Judicial, Memorias o diarios personales, Oficial, Periodística, Testimonial |
   | 14        | Guerra de Corea                                          | Análisis académico, Audio, Cinematográfica, Correspondencia, Fotográfica, Judicial, Memorias o diarios personales, Oficial, Periodística, Testimonial                          |
   | 15        | Llegada del hombre a la Luna                             | Análisis académico, Audio, Cinematográfica, Correspondencia, Fotográfica, Oficial, Periodística, Testimonial                                                                   |
   | 16        | Caída del Muro de Berlín                               | Análisis académico, Audio, Cartográfica, Cinematográfica, Correspondencia, Fotográfica, Gráfica, Oficial, Periodística, Testimonial                                          |
   | 17        | Disolución de la Unión Soviética                      | Análisis académico, Audio, Correspondencia, Fotográfica, Gráfica, Judicial, Oficial, Periodística, Testimonial                                                                 |
   | 18        | Atentados del 11 de septiembre                           | Análisis académico, Audio, Cinematográfica, Correspondencia, Fotográfica, Gráfica, Judicial, Oficial, Periodística, Testimonial                                               |
   | 19        | Pandemia de COVID-19                                     | Análisis académico, Audio, Cinematográfica, Fotográfica, Memorias o diarios personales, Oficial, Periodística, Testimonial                                                     |

   | 20 | Revolución Industrial | Análisis académico, Cartográfica, Correspondencia, Diplomas o títulos, Gráfica, Literaria, Manuscritos, Pinturas o murales históricos, Testimonial |
   | -- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
5. **Relación entre Eventos y Personajes**

   - Muestra la relación entre los eventos y los personajes que participaron en ellos.

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       pe.Nombre AS Personaje_Nombre,
       pe.Fecha_Nacimiento AS Personaje_Nacimiento,
       pe.Fecha_Fallecimiento AS Personaje_Fallecimiento
   FROM Eventos e
   JOIN Eventos_Personajes ep ON e.id_Evento = ep.id_Evento
   JOIN Personajes pe ON ep.id_Personajes = pe.id_Personajes LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Personaje_Nombre              | Personaje_Nacimiento | Personaje_Fallecimiento |
   | --------- | -------------------------------------------------------- | ----------------------------- | -------------------- | ----------------------- |
   | 18        | Atentados del 11 de septiembre                           | Osama bin Laden               | 1957                 | 2011                    |
   | 18        | Atentados del 11 de septiembre                           | George W. Bush                | 1946                 |                         |
   | 3         | Batalla de Alcántara                                    | Felipe II de España          | 1527                 | 1598                    |
   | 3         | Batalla de Alcántara                                    | Antonio, Prior de Crato       | 1531                 | 1595                    |
   | 16        | Caída del Muro de Berlín                               | Mijaíl Gorbachov             | 1931                 | 2022                    |
   | 16        | Caída del Muro de Berlín                               | Ronald Reagan                 | 1911                 | 2004                    |
   | 16        | Caída del Muro de Berlín                               | Helmut Kohl                   | 1930                 | 2017                    |
   | 2         | Conquista de Tenochtitlán                               | Hernán Cortés               | 1485                 | 1547                    |
   | 2         | Conquista de Tenochtitlán                               | Moctezuma II                  | 1466                 | 1520                    |
   | 2         | Conquista de Tenochtitlán                               | Cuauhtémoc                   | 1496                 | 1525                    |
   | 1         | Descubrimiento de América                               | Cristóbal Colón             | 1451                 | 1506                    |
   | 1         | Descubrimiento de América                               | Isabel I de Castilla          | 1451                 | 1504                    |
   | 1         | Descubrimiento de América                               | Fernando II de Aragón        | 1452                 | 1516                    |
   | 17        | Disolución de la Unión Soviética                      | Boris Yeltsin                 | 1931                 | 2007                    |
   | 17        | Disolución de la Unión Soviética                      | Mijaíl Gorbachov             | 1931                 | 2022                    |
   | 12        | Gran Depresión                                          | Herbert Hoover                | 1874                 | 1964                    |
   | 12        | Gran Depresión                                          | Franklin D. Roosevelt         | 1882                 | 1945                    |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Miguel Hidalgo y Costilla     | 1753                 | 1811                    |
   | 7         | Grito de Dolores e inicio de la Independencia de México | José María Morelos          | 1765                 | 1815                    |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Ignacio Allende               | 1769                 | 1811                    |
   | 9         | Guerra Civil Americana                                   | Abraham Lincoln               | 1809                 | 1865                    |
   | 9         | Guerra Civil Americana                                   | Robert E. Lee                 | 1807                 | 1870                    |
   | 9         | Guerra Civil Americana                                   | Ulysses S. Grant              | 1822                 | 1885                    |
   | 4         | Guerra Civil Inglesa                                     | Oliver Cromwell               | 1599                 | 1658                    |
   | 4         | Guerra Civil Inglesa                                     | Carlos I de Inglaterra        | 1600                 | 1649                    |
   | 14        | Guerra de Corea                                          | Kim Il-sung                   | 1912                 | 1994                    |
   | 14        | Guerra de Corea                                          | Harry S. Truman               | 1884                 | 1972                    |
   | 14        | Guerra de Corea                                          | Syngman Rhee                  | 1875                 | 1965                    |
   | 8         | Guerra de los Pasteles                                   | Anastasio Bustamante          | 1780                 | 1853                    |
   | 8         | Guerra de los Pasteles                                   | Luis Felipe I de Francia      | 1773                 | 1850                    |
   | 5         | Independencia de Estados Unidos                          | George Washington             | 1732                 | 1799                    |
   | 5         | Independencia de Estados Unidos                          | Thomas Jefferson              | 1743                 | 1826                    |
   | 5         | Independencia de Estados Unidos                          | Benjamin Franklin             | 1706                 | 1790                    |
   | 15        | Llegada del hombre a la Luna                             | Neil Armstrong                | 1930                 | 2012                    |
   | 15        | Llegada del hombre a la Luna                             | Buzz Aldrin                   | 1930                 |                         |
   | 15        | Llegada del hombre a la Luna                             | Michael Collins               | 1930                 | 2021                    |
   | 19        | Pandemia de COVID-19                                     | Xi Jinping                    | 1953                 |                         |
   | 19        | Pandemia de COVID-19                                     | Anthony Fauci                 | 1940                 |                         |
   | 19        | Pandemia de COVID-19                                     | Tedros Adhanom Ghebreyesus    | 1965                 |                         |
   | 11        | Primera Guerra Mundial                                   | Woodrow Wilson                | 1856                 | 1924                    |
   | 11        | Primera Guerra Mundial                                   | Kaiser Guillermo II           | 1859                 | 1941                    |
   | 11        | Primera Guerra Mundial                                   | Francisco Fernando de Austria | 1863                 | 1914                    |
   | 6         | Revolución Francesa                                     | Maximilien Robespierre        | 1758                 | 1794                    |
   | 6         | Revolución Francesa                                     | Luis XVI de Francia           | 1754                 | 1793                    |
   | 6         | Revolución Francesa                                     | María Antonieta              | 1755                 | 1793                    |
   | 20        | Revolución Industrial                                   | James Watt                    | 1736                 | 1819                    |
   | 20        | Revolución Industrial                                   | Adam Smith                    | 1723                 | 1790                    |
   | 20        | Revolución Industrial                                   | Richard Arkwright             | 1732                 | 1792                    |
   | 13        | Segunda Guerra Mundial                                   | Adolf Hitler                  | 1889                 | 1945                    |
   | 13        | Segunda Guerra Mundial                                   | Winston Churchill             | 1874                 | 1965                    |
   | 13        | Segunda Guerra Mundial                                   | Franklin D. Roosevelt         | 1882                 | 1945                    |
   | 13        | Segunda Guerra Mundial                                   | Joseph Stalin                 | 1878                 | 1953                    |
   | 10        | Unificación de Alemania                                 | Otto von Bismarck             | 1815                 | 1898                    |
   | 10        | Unificación de Alemania                                 | Guillermo I de Alemania       | 1797                 | 1888                    |
6. **Relación entre Eventos y Locaciones**

   - Muestra la relación entre los eventos y las locaciones donde ocurrieron.

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       l.Nombre AS Locacion_Nombre
   FROM Eventos e
   JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
   JOIN Locaciones l ON el.id_Locacion = l.id_Locacion LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Locacion_Nombre   |
   | --------- | -------------------------------------------------------- | ----------------- |
   | 3         | Batalla de Alcántara                                    | Alcántara        |
   | 16        | Caída del Muro de Berlín                               | Berlín           |
   | 19        | Pandemia de COVID-19                                     | China             |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Dolores Hidalgo   |
   | 9         | Guerra Civil Americana                                   | Estados Unidos    |
   | 11        | Primera Guerra Mundial                                   | Europa            |
   | 13        | Segunda Guerra Mundial                                   | Europa            |
   | 5         | Independencia de Estados Unidos                          | Filadelfia        |
   | 4         | Guerra Civil Inglesa                                     | Inglaterra        |
   | 1         | Descubrimiento de América                               | Isla Guanahaní   |
   | 15        | Llegada del hombre a la Luna                             | Luna              |
   | 8         | Guerra de los Pasteles                                   | México           |
   | 17        | Disolución de la Unión Soviética                      | Moscú            |
   | 12        | Gran Depresión                                          | Nueva York        |
   | 18        | Atentados del 11 de septiembre                           | Nueva York        |
   | 6         | Revolución Francesa                                     | París            |
   | 14        | Guerra de Corea                                          | Peninsula Coreana |
   | 20        | Revolución Industrial                                   | Reino Unido       |
   | 2         | Conquista de Tenochtitlán                               | Tenochtitlán     |
   | 10        | Unificación de Alemania                                 | Versalles         |
7. **Relación entre Eventos y Causas**

   - Muestra la relación entre los eventos y las causas que los originaron.

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       ca.Nombre AS Causa_Nombre
   FROM Eventos e
   JOIN Eventos_Causas ec ON e.id_Evento = ec.id_Evento
   JOIN Causas ca ON ec.id_Causa = ca.id_Causa LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Causa_Nombre                                      |
   | --------- | -------------------------------------------------------- | ------------------------------------------------- |
   | 18        | Atentados del 11 de septiembre                           | Ataques terroristas                               |
   | 3         | Batalla de Alcántara                                    | Conflictos dinásticos y sucesión al trono       |
   | 16        | Caída del Muro de Berlín                               | Colapso de sistemas políticos                    |
   | 2         | Conquista de Tenochtitlán                               | Conquista de nuevas tierras                       |
   | 1         | Descubrimiento de América                               | Exploración y expansión territorial             |
   | 17        | Disolución de la Unión Soviética                      | Colapso de sistemas políticos                    |
   | 12        | Gran Depresión                                          | Colapso económico                                |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Resistencia al dominio colonial                   |
   | 9         | Guerra Civil Americana                                   | Guerra civil por divisiones internas              |
   | 4         | Guerra Civil Inglesa                                     | Lucha por el control político y poder            |
   | 14        | Guerra de Corea                                          | Conflicto ideológico (comunismo vs. capitalismo) |
   | 8         | Guerra de los Pasteles                                   | Reclamaciones económicas entre naciones          |
   | 5         | Independencia de Estados Unidos                          | Independencia y autodeterminación                |
   | 15        | Llegada del hombre a la Luna                             | Competencia tecnológica o científica            |
   | 19        | Pandemia de COVID-19                                     | Pandemias y crisis sanitarias                     |
   | 11        | Primera Guerra Mundial                                   | Tensiones entre alianzas militares                |
   | 6         | Revolución Francesa                                     | Revoluciones sociales y económicas               |
   | 20        | Revolución Industrial                                   | Revoluciones sociales y económicas               |
   | 13        | Segunda Guerra Mundial                                   | Invasión territorial                             |
   | 10        | Unificación de Alemania                                 | Unificación de territorios o países             |
8. **Relación entre Eventos y Aspecto Transformado**

   - Muestra la relación entre los eventos y los aspectos transformados que se identifican.

   ```sql
   SELECT 
       e.id_Evento, 
       e.Nombre AS Evento_Nombre, 
       GROUP_CONCAT(DISTINCT ast.Aspecto SEPARATOR ', ') AS Aspecto_Transformado
   FROM Eventos e
   JOIN Eventos_AspectoTransformado east ON e.id_Evento = east.id_Evento
   JOIN AspectoTransformado ast ON east.id_AspectoTransformado = ast.id_AspectoTransformado
   GROUP BY e.id_Evento LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | Aspecto_Transformado                                       |
   | --------- | -------------------------------------------------------- | ---------------------------------------------------------- |
   | 1         | Descubrimiento de América                               | Comercial, Cultural, Religioso, Social, Territorial        |
   | 2         | Conquista de Tenochtitlán                               | Cultural, Político, Religioso, Territorial                |
   | 3         | Batalla de Alcántara                                    | Político, Territorial                                     |
   | 4         | Guerra Civil Inglesa                                     | Militar, Político, Social                                 |
   | 5         | Independencia de Estados Unidos                          | Comercial, Jurídico, Político, Territorial               |
   | 6         | Revolución Francesa                                     | Jurídico, Político, Social                               |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Político, Social, Territorial                             |
   | 8         | Guerra de los Pasteles                                   | Económico, Militar                                        |
   | 9         | Guerra Civil Americana                                   | Militar, Social, Territorial                               |
   | 10        | Unificación de Alemania                                 | Político, Territorial                                     |
   | 11        | Primera Guerra Mundial                                   | Demográfico, Militar, Político, Territorial              |
   | 12        | Gran Depresión                                          | Económico, Social                                         |
   | 13        | Segunda Guerra Mundial                                   | Científico, Militar, Político, Territorial               |
   | 14        | Guerra de Corea                                          | Político, Territorial                                     |
   | 15        | Llegada del hombre a la Luna                             | Científico, Tecnológico                                  |
   | 16        | Caída del Muro de Berlín                               | Económico, Político, Territorial                         |
   | 17        | Disolución de la Unión Soviética                      | Económico, Político, Territorial                         |
   | 18        | Atentados del 11 de septiembre                           | Militar, Político                                         |
   | 19        | Pandemia de COVID-19                                     | Demográfico, Económico, Sanitario                        |
   | 20        | Revolución Industrial                                   | Demográfico, Económico, Industrial, Social, Tecnológico |
9. **Relación entre Eventos y SubEventos**

   - Muestra la relación entre eventos y subeventos asociados.

   ```sql
   SELECT 
       e.id_Evento,
       e.Nombre AS Evento_Nombre, 
       sube.Nombre AS SubEvento_Nombre,
       sube.Fecha AS SubEvento_Fecha
   FROM Eventos e
   JOIN Eventos_SubEventos esube ON e.id_Evento = esube.id_Evento
   JOIN SubEventos sube ON esube.id_SubEventos = sube.id_SubEventos LIMIT 100
   ```

   | id_Evento | Evento_Nombre                                            | SubEvento_Nombre                                                          | SubEvento_Fecha |
   | --------- | -------------------------------------------------------- | ------------------------------------------------------------------------- | --------------- |
   | 1         | Descubrimiento de América                               | Primer viaje de Colón                                                    | 1492-10-12      |
   | 1         | Descubrimiento de América                               | Firma de las Capitulaciones de Santa Fe                                   | 1492-04-17      |
   | 2         | Conquista de Tenochtitlán                               | Noche Triste                                                              | 1520-06-30      |
   | 2         | Conquista de Tenochtitlán                               | Caída de Tenochtitlán                                                   | 1521-08-13      |
   | 4         | Guerra Civil Inglesa                                     | Batalla de Naseby                                                         | 1645-06-14      |
   | 4         | Guerra Civil Inglesa                                     | Ejecución de Carlos I                                                    | 1649-01-30      |
   | 5         | Independencia de Estados Unidos                          | Firma de la Declaración de Independencia                                 | 1776-07-04      |
   | 5         | Independencia de Estados Unidos                          | Batalla de Yorktown                                                       | 1781-10-19      |
   | 6         | Revolución Francesa                                     | Toma de la Bastilla                                                       | 1789-07-14      |
   | 6         | Revolución Francesa                                     | Aprobación de la Declaración de los Derechos del Hombre y del Ciudadano | 1789-08-26      |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Grito de Dolores                                                          | 1810-09-16      |
   | 7         | Grito de Dolores e inicio de la Independencia de México | Batalla del Puente de Calderón                                           | 1811-01-17      |
   | 8         | Guerra de los Pasteles                                   | Bombardeo de Veracruz                                                     | 1838-11-27      |
   | 9         | Guerra Civil Americana                                   | Batalla de Gettysburg                                                     | 1863-07-01      |
   | 9         | Guerra Civil Americana                                   | Proclamación de Emancipación                                            | 1863-01-01      |
   | 10        | Unificación de Alemania                                 | Batalla de Sedán                                                         | 1870-09-01      |
   | 10        | Unificación de Alemania                                 | Proclamación del Imperio Alemán                                         | 1871-01-18      |
   | 11        | Primera Guerra Mundial                                   | Asesinato del archiduque Francisco Fernando                               | 1914-06-28      |
   | 11        | Primera Guerra Mundial                                   | Tratado de Versalles                                                      | 1919-06-28      |
   | 12        | Gran Depresión                                          | Crack de la Bolsa de Wall Street                                          | 1929-10-24      |
   | 13        | Segunda Guerra Mundial                                   | Invasión de Polonia                                                      | 1939-09-01      |
   | 13        | Segunda Guerra Mundial                                   | Desembarco de Normandía                                                  | 1944-06-06      |
   | 13        | Segunda Guerra Mundial                                   | Hiroshima y Nagasaki                                                      | 1945-08-06      |
   | 14        | Guerra de Corea                                          | Invasión de Corea del Sur                                                | 1950-06-25      |
   | 14        | Guerra de Corea                                          | Armisticio de Panmunjom                                                   | 1953-07-27      |
   | 15        | Llegada del hombre a la Luna                             | Alunizaje del Apolo 11                                                    | 1969-07-20      |
   | 16        | Caída del Muro de Berlín                               | Apertura del Muro de Berlín                                              | 1989-11-09      |
   | 17        | Disolución de la Unión Soviética                      | Renuncia de Mijaíl Gorbachov                                             | 1991-12-25      |
   | 19        | Pandemia de COVID-19                                     | Declaración de pandemia por la OMS                                       | 2020-03-11      |
   | 20        | Revolución Industrial                                   | Invención de la máquina de vapor de Watt                                |                 |
10. **Eventos en Europa con Alcance Global**

    - Filtra eventos que tuvieron lugar en Europa y que tienen un alcance global.

    ```sql
    SELECT
        e.id_Evento,
        e.Nombre AS Evento_Nombre,
        l.Nombre AS Locacion,
        a.Tipo AS Alcance
    FROM Eventos e
    JOIN Eventos_Locaciones el ON e.id_Evento = el.id_Evento
    JOIN Locaciones l ON el.id_Locacion = l.id_Locacion
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    WHERE l.Nombre = 'Europa' AND a.Tipo = 'Global' LIMIT 100
    ```

    | id_Evento | Evento_Nombre          | Locacion | Alcance |
    | --------- | ---------------------- | -------- | ------- |
    | 13        | Segunda Guerra Mundial | Europa   | Global  |
11. **Eventos con Aspecto Transformado Político y Documentación Cartográfica y por Audio**

    - Filtra eventos que tienen un aspecto transformado político y que cuentan con documentación cartográfica y por audio.

    ```sql
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
    HAVING COUNT(DISTINCT d.Nombre) = 2 LIMIT 100
    ```

    | id_Evento | Evento_Nombre              | Aspecto_Transformado | Documentacion        |
    | --------- | -------------------------- | -------------------- | -------------------- |
    | 11        | Primera Guerra Mundial     | Político            | Audio, Cartográfica |
    | 13        | Segunda Guerra Mundial     | Político            | Audio, Cartográfica |
    | 16        | Caída del Muro de Berlín | Político            | Audio, Cartográfica |
12. **Eventos entre 1780s y 1830s con Aspecto Transformado Social**

    - Filtra eventos que ocurrieron entre las décadas de 1780 y 1830 con un aspecto transformado social.

    ```sql
    SELECT
        e.id_Evento,
        e.Nombre AS Evento_Nombre,
        d.Decada,
        aT.Aspecto AS Aspecto_Transformado
    FROM Eventos e
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    WHERE d.Decada BETWEEN '1780s' AND '1830s' AND aT.Aspecto = 'Social' LIMIT 100
    ```

    | id_Evento | Evento_Nombre                                            | Decada | Aspecto_Transformado |
    | --------- | -------------------------------------------------------- | ------ | -------------------- |
    | 6         | Revolución Francesa                                     | 1780s  | Social               |
    | 7         | Grito de Dolores e inicio de la Independencia de México | 1810s  | Social               |
13. **Eventos del Último Milenio con Aspecto Transformador Económico**

    - Filtra eventos del último milenio que tienen un aspecto transformador económico.

    ```sql
    SELECT
        e.id_Evento,
        e.Nombre AS Evento_Nombre,
        d.Decada,
        aT.Aspecto AS Aspecto_Transformado
    FROM Eventos e
    JOIN Decada d ON e.id_Decada = d.id_Decada
    JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    WHERE d.Decada > '1920s' AND aT.Aspecto = 'Económico' LIMIT 100
    ```

    | id_Evento | Evento_Nombre                       | Decada | Aspecto_Transformado |
    | --------- | ----------------------------------- | ------ | -------------------- |
    | 16        | Caída del Muro de Berlín          | 1980s  | Económico           |
    | 17        | Disolución de la Unión Soviética | 1990s  | Económico           |
    | 19        | Pandemia de COVID-19                | 2020s  | Económico           |
14. **Eventos con Tipo de Conflicto Guerra Civil y Mundial con Documentación Judicial y Memorias**

    - Filtra eventos que son guerras civiles o mundiales con documentación judicial y memorias.

    ```sql
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
    HAVING COUNT(DISTINCT d.Nombre) = 2 LIMIT 100
    ```

    | id_Evento | Evento_Nombre          | Tipo_De_Conflicto | Documentacion                           |
    | --------- | ---------------------- | ----------------- | --------------------------------------- |
    | 9         | Guerra Civil Americana | Guerra Civil      | Judicial, Memorias o diarios personales |
    | 11        | Primera Guerra Mundial | Guerra Mundial    | Judicial, Memorias o diarios personales |
    | 13        | Segunda Guerra Mundial | Guerra Mundial    | Judicial, Memorias o diarios personales |
15. **Eventos Antes de los 2000s con Documentación Testimonial, Gráfica y Oficial**

    - Filtra eventos anteriores a los 2000 que cuentan con documentación testimonial, gráfica y oficial.

    ```sql
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
    HAVING COUNT(DISTINCT do.Nombre) = 3 LIMIT 100
    ```

    | id_Evento | Evento_Nombre                       | Decada | Documentacion                  |
    | --------- | ----------------------------------- | ------ | ------------------------------ |
    | 2         | Conquista de Tenochtitlán          | 1520s  | Gráfica, Oficial, Testimonial |
    | 3         | Batalla de Alcántara               | 1580s  | Gráfica, Oficial, Testimonial |
    | 5         | Independencia de Estados Unidos     | 1770s  | Gráfica, Oficial, Testimonial |
    | 9         | Guerra Civil Americana              | 1860s  | Gráfica, Oficial, Testimonial |
    | 10        | Unificación de Alemania            | 1870s  | Gráfica, Oficial, Testimonial |
    | 11        | Primera Guerra Mundial              | 1910s  | Gráfica, Oficial, Testimonial |
    | 12        | Gran Depresión                     | 1920s  | Gráfica, Oficial, Testimonial |
    | 13        | Segunda Guerra Mundial              | 1930s  | Gráfica, Oficial, Testimonial |
    | 16        | Caída del Muro de Berlín          | 1980s  | Gráfica, Oficial, Testimonial |
    | 17        | Disolución de la Unión Soviética | 1990s  | Gráfica, Oficial, Testimonial |
16. **Eventos con Conflicto Internacional entre 1940s y 1980s**

    - Filtra eventos que tienen un tipo de conflicto internacional entre las décadas de 1940 y 1980.

    ```sql
    SELECT
        e.id_Evento,
        e.Nombre AS Evento_Nombre,
        Tc.Nombre AS Tipo_De_Conflicto,
        d.Decada
    FROM Eventos e
    JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    JOIN Decada d ON e.id_Decada = d.id_Decada
    WHERE d.Decada BETWEEN '1940s' AND '1980s' AND Tc.Nombre = 'Conflicto Internacional' LIMIT 100
    ```

    | id_Evento | Evento_Nombre   | Tipo_De_Conflicto       | Decada |
    | --------- | --------------- | ----------------------- | ------ |
    | 14        | Guerra de Corea | Conflicto Internacional | 1950s  |
17. **Eventos con Documentación Fotográfica y Correspondencia y Conflicto Guerra Tecnológica**

    - Filtra eventos que cuentan con documentación fotográfica y de correspondencia y que son de tipo guerra tecnológica.

    ```sql
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
    HAVING COUNT(DISTINCT do.Nombre) = 2 LIMIT 100
    ```

    | id_Evento | Evento_Nombre                | Tipo_De_Conflicto   | Documentacion                 |
    | --------- | ---------------------------- | ------------------- | ----------------------------- |
    | 15        | Llegada del hombre a la Luna | Guerra Tecnológica | Correspondencia, Fotográfica |
18. **Eventos Localizados en Luna, Versalles y Nueva York con Alcance Tecnológico**

    - Filtra eventos que tienen lugar en las locaciones especificadas y con un alcance tecnológico.

    ```sql
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
        e.id_Evento LIMIT 100
    ```

    | id_Evento | Evento                       | Descripcion_Evento                                                                                                                                                | Locaciones | Alcance      |
    | --------- | ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------------ |
    | 15        | Llegada del hombre a la Luna | La misión Apolo 11 de la NASA llevó a los primeros humanos a la Luna en 1969, en el contexto de la carrera espacial entre Estados Unidos y la Unión Soviética | Luna       | Tecnológico |
19. **Eventos con Aspecto Transformado Militar y Alcance Global**

    - Filtra eventos que tienen un aspecto transformado militar y un alcance global.

    ```sql
    SELECT
        e.id_Evento,
        e.Nombre AS Evento_Nombre
    FROM Eventos e
    JOIN Eventos_AspectoTransformado eaT ON e.id_Evento = eaT.id_Evento
    JOIN AspectoTransformado aT ON eaT.id_AspectoTransformado = aT.id_AspectoTransformado
    JOIN Alcance a ON e.id_Alcance = a.id_Alcance
    WHERE aT.Aspecto = 'Militar' AND a.Tipo = 'Global' LIMIT 100
    ```

    | id_Evento | Evento_Nombre          |
    | --------- | ---------------------- |
    | 13        | Segunda Guerra Mundial |
20. **Eventos con Causa Colapso de Sistemas Políticos**

    - Filtra eventos que tienen como causa el colapso de sistemas políticos.

    ```sql
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
        e.id_Evento LIMIT 100
    ```

    | id_Evento | Nombre                              |
    | --------- | ----------------------------------- |
    | 16        | Caída del Muro de Berlín          |
    | 17        | Disolución de la Unión Soviética |
21. **Eventos con Causa Revoluciones Sociales y Económicas y Documentación Académica**

    - Filtra eventos con causas de revoluciones sociales y económicas que cuentan con documentación académica.

    ```sql
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
        e.id_Evento LIMIT 100
    ```

    | id_Evento | Nombre                 |
    | --------- | ---------------------- |
    | 20        | Revolución Industrial |
    | 6         | Revolución Francesa   |
22. **Eventos con Documentación Cinematográfica y Periodística y Múltiples SubEventos**

    - Filtra eventos que tienen documentación cinematográfica y periodística, y al menos dos subeventos.

    ```sql
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
        COUNT(DISTINCT se.id_SubEventos) >= 2 LIMIT 100
    ```

    | id_Evento | Nombre                   |
    | --------- | ------------------------ |
    | 9         | Guerra Civil Americana   |
    | 10        | Unificación de Alemania |
    | 11        | Primera Guerra Mundial   |
    | 13        | Segunda Guerra Mundial   |
    | 14        | Guerra de Corea          |
23. **Eventos No Globales sin Documentación Cinematográfica, Fotográfica y Periodística**

    - Filtra eventos que no son de alcance global y no tienen documentación cinematográfica, fotográfica ni periodística.

    ```sql
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
        COUNT(CASE WHEN do.Nombre IN ("Cinematográfica", "Fotográfica", "Periodística") THEN 1 END) = 0 LIMIT 100
    ```

    | id_Evento | Nombre                                                   |
    | --------- | -------------------------------------------------------- |
    | 1         | Descubrimiento de América                               |
    | 2         | Conquista de Tenochtitlán                               |
    | 3         | Batalla de Alcántara                                    |
    | 4         | Guerra Civil Inglesa                                     |
    | 5         | Independencia de Estados Unidos                          |
    | 6         | Revolución Francesa                                     |
    | 7         | Grito de Dolores e inicio de la Independencia de México |
    | 20        | Revolución Industrial                                   |
24. **Eventos con Más de 6 Documentaciones entre 1840s y 1940s**

    - Filtra eventos que tienen más de 6 documentaciones y que ocurrieron entre las décadas de 1840 y 1940.

    ```sql
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
        COUNT(DISTINCT do.id_Documentacion) > 6 LIMIT 100
    ```

    | id_Evento | Nombre                       |
    | --------- | ---------------------------- |
    | 9         | Guerra Civil Americana       |
    | 10        | Unificación de Alemania     |
    | 11        | Primera Guerra Mundial       |
    | 12        | Gran Depresión              |
    | 13        | Segunda Guerra Mundial       |
    | 15        | Llegada del hombre a la Luna |
25. **Eventos con Alcance Territorial y Múltiples Aspectos Transformados**

    - Filtra eventos con alcance territorial que tienen dos o más aspectos transformados.

    ```sql
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
        COUNT(DISTINCT aT.Aspecto) >= 2 LIMIT 100
    ```

    | id_Evento | Nombre                                                   |
    | --------- | -------------------------------------------------------- |
    | 1         | Descubrimiento de América                               |
    | 2         | Conquista de Tenochtitlán                               |
    | 5         | Independencia de Estados Unidos                          |
    | 7         | Grito de Dolores e inicio de la Independencia de México |
    | 9         | Guerra Civil Americana                                   |
26. **Eventos con Múltiples Personajes, Documentación y Aspectos Transformados**

    - Filtra eventos que tienen al menos dos personajes, más de 7 documentaciones, y dos subeventos con más de 4 aspectos transformados.

    ```sql
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
        COUNT(DISTINCT aT.id_AspectoTransformado) >= 4 LIMIT 100
    ```

    | id_Evento | Nombre                     |
    | --------- | -------------------------- |
    | 1         | Descubrimiento de América |
    | 2         | Conquista de Tenochtitlán |
    | 11        | Primera Guerra Mundial     |
27. **Personajes Nacidos en la Década de 1930 Participantes en Eventos Políticos**

    - Filtra personajes nacidos en la década de 1930 que participaron en eventos políticos entre el siglo XX y XXI.

    ```sql
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
        p.Fecha_Nacimiento LIMIT 100
    ```

    | id_Evento | Nombre                              | Tipo_De_Conflicto   | Descripcion                                                                                                                                                      | Alcance   | Nombre            | Fecha_Nacimiento | Decada |
    | --------- | ----------------------------------- | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ----------------- | ---------------- | ------ |
    | 16        | Caída del Muro de Berlín          | Conflicto Político | La caída del Muro de Berlín en 1989 simbolizó el colapso del comunismo en Europa del Este y la reunificación de Alemania                                     | Político | Mijaíl Gorbachov | 1931             | 1980s  |
    | 17        | Disolución de la Unión Soviética | Conflicto Político | La desintegración de la Unión Soviética en 1991 marcó el fin del comunismo en gran parte de Europa del Este y la aparición de varios estados independientes | Político | Mijaíl Gorbachov | 1931             | 1990s  |
28. **Eventos entre 1870s y 1940s con Múltiples Aspectos Transformados y Documentación**

    - Filtra eventos que ocurrieron entre las décadas de 1870 y 1940 con dos aspectos transformados, dos personajes, y al menos 8 documentaciones.

    ```sql
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
        COUNT(DISTINCT aT.id_AspectoTransformado) = 2 LIMIT 100
    ```

    | id_Evento | Evento                   | Locaciones | Documentacion                                                                                                                                              |
    | --------- | ------------------------ | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | 10        | Unificación de Alemania | Versalles  | Análisis académico, Cartográfica, Correspondencia, Fotográfica, Gráfica, Oficial, Periodística, Testimonial                                          |
    | 12        | Gran Depresión          | Nueva York | Análisis académico, Audio, Cinematográfica, Correspondencia, Fotográfica, Gráfica, Memorias o diarios personales, Oficial, Periodística, Testimonial |
29. **10 Eventos Históricos Detallados**

    - Muestra los primeros 10 eventos históricos en la base de datos.

    ```sql
    SELECT
        e.id_Evento,
        e.Nombre
    FROM
        Eventos e
    LIMIT 10
    ```

    | id_Evento | Nombre                                                   |
    | --------- | -------------------------------------------------------- |
    | 18        | Atentados del 11 de septiembre                           |
    | 3         | Batalla de Alcántara                                    |
    | 16        | Caída del Muro de Berlín                               |
    | 2         | Conquista de Tenochtitlán                               |
    | 1         | Descubrimiento de América                               |
    | 17        | Disolución de la Unión Soviética                      |
    | 12        | Gran Depresión                                          |
    | 7         | Grito de Dolores e inicio de la Independencia de México |
    | 9         | Guerra Civil Americana                                   |
    | 4         | Guerra Civil Inglesa                                     |
30. **Personajes Nacidos entre 1500s y 1800s que Contribuyeron en Eventos Jurídicos**

    - Filtra personajes nacidos entre 1500 y 1800 que contribuyeron en eventos en el área jurídica.

    ```sql
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
        AND at.Aspecto = 'Jurídico' LIMIT 100
    ```

    | id_Personajes | Nombre                 | Edad_de_Fallecimiento |
    | ------------- | ---------------------- | --------------------- |
    | 11            | George Washington      | 67                    |
    | 12            | Thomas Jefferson       | 83                    |
    | 13            | Benjamin Franklin      | 84                    |
    | 14            | Maximilien Robespierre | 36                    |
    | 15            | Luis XVI de Francia    | 39                    |
    | 16            | María Antonieta       | 38                    |
31. **Existencia de Documentación Cartográfica sobre la Llegada a la Luna**

    - Verifica si existe documentación cartográfica sobre la llegada del hombre a la luna.

    ```sql
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
        END AS "¿Existe documentación cartográfica sobre la llegada del hombre a la luna?" LIMIT 100
    ```

    | ¿Existe documentación cartográfica sobre la llegada del hombre a la luna? |
    | ---------------------------------------------------------------------------- |
    | Falso                                                                        |
32. **Tipo de Conflicto Más Común**

    - Muestra el tipo de conflicto más común en la base de datos.

    ```sql
    SELECT
        Tc.Nombre AS "Tipo de conflicto",
        COUNT(*) AS "Coincidencias"
    FROM
        Eventos e
        JOIN TipoConflicto Tc ON e.id_TipoConflicto = Tc.id_TipoConflicto
    GROUP BY
        Tc.Nombre
    ORDER BY
        COUNT(*) DESC LIMIT 100
    ```

    | Tipo de conflicto       | Coincidencias |
    | ----------------------- | ------------- |
    | Conflicto Político     | 3             |
    | Guerra Civil            | 2             |
    | Guerra Mundial          | 2             |
    | Guerra de Independencia | 2             |
    | Guerra Económica       | 2             |
    | Conflicto Internacional | 2             |
    | Conquista               | 2             |
    | Revolución             | 1             |
    | Guerra Territorial      | 1             |
    | Guerra Tecnológica     | 1             |
    | Crisis Económica       | 1             |
    | Crisis Sanitaria        | 1             |
33. **Eventos Históricos con Múltiples Personajes Implicados**

    - Muestra eventos históricos que tienen 4 o más personajes implicados.

    ```sql
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
        COUNT(*) DESC LIMIT 100
    ```

    | id_Evento | Nombre                 | # Personajes |
    | --------- | ---------------------- | ------------ |
    | 13        | Segunda Guerra Mundial | 4            |
34. **Personajes Vivos o Fallecidos Recientemente**

    - Filtra personajes que no han fallecido o que fallecieron hace menos de dos décadas.

    ```sql
    SELECT
        id_Personajes,
        Nombre
    FROM
        Personajes
    WHERE
        Fecha_Fallecimiento IS NULL
        OR (YEAR(CURDATE()) - Fecha_Fallecimiento) < 20
    ORDER BY  
        Fecha_Nacimiento ASC LIMIT 100
    ```

    | id_Personajes | Nombre                     |
    | ------------- | -------------------------- |
    | 38            | Neil Armstrong             |
    | 39            | Buzz Aldrin                |
    | 40            | Michael Collins            |
    | 43            | Helmut Kohl                |
    | 41            | Mijaíl Gorbachov          |
    | 44            | Boris Yeltsin              |
    | 48            | Anthony Fauci              |
    | 46            | George W. Bush             |
    | 47            | Xi Jinping                 |
    | 45            | Osama bin Laden            |
    | 49            | Tedros Adhanom Ghebreyesus |
35. **Eventos Históricos de Caracter Global o Mundial**

    - Filtra eventos históricos que son de carácter global o mundial.

    ```sql
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
        tc.Nombre = "Guerra Mundial" OR a.Tipo = "Global" LIMIT 100
    ```

    | id_Evento | Nombre                 | Caracter                          |
    | --------- | ---------------------- | --------------------------------- |
    | 11        | Primera Guerra Mundial | Tipo De Conflicto: Guerra Mundial |
    | 13        | Segunda Guerra Mundial | Tipo De Conflicto: Guerra Mundial |
36. **Eventos con más de 10 Documentaciones de Naturaleza Específica**

    - Muestra eventos que tienen más de 10 documentaciones y cumplen con criterios específicos de naturaleza.

    ```sql
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
        Fecha ASC LIMIT 100
    ```

    | id_SubEventos | Momento Emblematico                     | Evento                     | Fecha      |
    | ------------- | --------------------------------------- | -------------------------- | ---------- |
    | 2             | Firma de las Capitulaciones de Santa Fe | Descubrimiento de América | 1492-04-17 |
    | 1             | Primer viaje de Colón                  | Descubrimiento de América | 1492-10-12 |
    | 3             | Noche Triste                            | Conquista de Tenochtitlán | 1520-06-30 |
    | 4             | Caída de Tenochtitlán                 | Conquista de Tenochtitlán | 1521-08-13 |
37. **Eventos Históricos con más de 3 SubEventos y Documentación Especial**

    - Muestra eventos históricos que tienen más de 3 subeventos y tienen un tipo de documentación especial.

    ```sql
    SELECT
        id_SubEventos,
        Nombre,
        Fecha
    FROM
        SubEventos
    WHERE
        YEAR(Fecha) = 1789 AND
        MONTH(Fecha) BETWEEN 07 AND 09 LIMIT 100
    ```

    | id_SubEventos | Nombre                                                                    | Fecha      |
    | ------------- | ------------------------------------------------------------------------- | ---------- |
    | 9             | Toma de la Bastilla                                                       | 1789-07-14 |
    | 10            | Aprobación de la Declaración de los Derechos del Hombre y del Ciudadano | 1789-08-26 |
38. **Eventos y su Correspondencia con Aspectos Sociales y Culturales**

    - Muestra eventos y su correspondencia con aspectos sociales y culturales que han sido transformadores.

    ```sql
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
    ```

    | id_Evento | Nombre               | Decada |
    | --------- | -------------------- | ------ |
    | 19        | Pandemia de COVID-19 | 2020s  |
39. **Eventos que Implicaron Cambios Significativos en Políticas Internacionales**

    - Muestra eventos que implicaron cambios significativos en políticas internacionales a lo largo de la historia.

    ```sql
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
        AND CAST(LEFT(d.Decada, 4) AS UNSIGNED) >= 2000 LIMIT 100
    ```

    | id_Evento | Nombre                         |
    | --------- | ------------------------------ |
    | 18        | Atentados del 11 de septiembre |
40. **Eventos que Tuvieron un Impacto en la Historia Contemporánea**

    - Muestra eventos que tuvieron un impacto significativo en la historia contemporánea.

    ```sql
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
        AND CAST(LEFT(d.Decada, 4) AS UNSIGNED) BETWEEN 1910 AND 1930 LIMIT 100
    ```

    | id_Evento | Nombre          |
    | --------- | --------------- |
    | 12        | Gran Depresión |


## PD

Probablemente por el corre corre final las ultimas 5 consultas estan mal ubicadas, en el dql se encuentran las consultas comentariadas sin este error.
