USE Proyecto_historiaSQL;

INSERT INTO
    Alcance (Tipo)
VALUES
    ('Territorial'),
    ('Político'),
    ('Social'),
    ('Cultural'),
    ('Militar'),
    ('Económico'),
    ('Tecnológico'),
    ('Sanitario'),
    ('Ideológico'),
    ('Global'),
    ('Demográfico'),
    ('Religioso'),
    ('Industrial'),
    ('Jurídico'),
    ('Comercial'),
    ('Diplomático'),
    ('Científico'),
    ('Ambiental'),
    ('Psicológico'),
    ('Humanitario');

INSERT INTO
    Decada (Decada)
VALUES
    ('1490s'),
    ('1520s'),
    ('1580s'),
    ('1640s'),
    ('1760s'),
    ('1770s'),
    ('1780s'),
    ('1810s'),
    ('1830s'),
    ('1860s'),
    ('1870s'),
    ('1910s'),
    ('1920s'),
    ('1930s'),
    ('1940s'),
    ('1950s'),
    ('1960s'),
    ('1980s'),
    ('1990s'),
    ('2000s'),
    ('2020s');

INSERT INTO
    Eventos (Nombre, Descripcion, id_Decada, id_Alcance)
VALUES
    (
        'Descubrimiento de América',
        'El viaje de Cristóbal Colón que llevó al descubrimiento del continente americano por los europeos, abriendo paso a la exploración y colonización del Nuevo Mundo',
        1,
        1
    ),
    (
        'Conquista de Tenochtitlán',
        'Hernán Cortés y su ejército conquistaron la capital del Imperio Azteca, marcando el inicio del dominio español en México y la caída de Tenochtitlán',
        2,
        1
    ),
    (
        'Batalla de Alcántara',
        'Un conflicto entre Portugal y España por la sucesión al trono portugués, que resultó en la unión temporal de ambos reinos bajo la monarquía española',
        3,
        2
    ),
    (
        'Guerra Civil Inglesa',
        'Un conflicto entre el Parlamento y el rey Carlos I por el control del gobierno, que terminó con la ejecución del rey y el establecimiento de la Commonwealth bajo Oliver Cromwell',
        4,
        2
    ),
    (
        'Independencia de Estados Unidos',
        'Las Trece Colonias de América del Norte lucharon por su independencia del Reino Unido, resultando en la creación de los Estados Unidos de América',
        6,
        1
    ),
    (
        'Revolución Francesa',
        'Una serie de eventos revolucionarios que llevaron al fin de la monarquía en Francia y a profundas transformaciones sociales, políticas y económicas',
        7,
        2
    ),
    (
        'Grito de Dolores e inicio de la Independencia de México',
        'Un llamado del sacerdote Miguel Hidalgo inició el movimiento de independencia contra el dominio colonial español en México',
        8,
        1
    ),
    (
        'Guerra de los Pasteles',
        'Un conflicto entre México y Francia provocado por reclamaciones económicas de empresarios franceses, que resultó en una breve intervención militar',
        9,
        15
    ),
    (
        'Guerra Civil Americana',
        'Un conflicto interno en los Estados Unidos entre los estados del Norte y el Sur, causado principalmente por la esclavitud y los derechos de los estados, que terminó con la abolición de la esclavitud',
        10,
        1
    ),
    (
        'Unificación de Alemania',
        'El esfuerzo liderado por Prusia y Otto von Bismarck resultó en la unificación de varios estados alemanes en un solo Imperio Alemán, tras la victoria sobre Francia en la Guerra Franco-Prusiana',
        11,
        2
    ),
    (
        'Primera Guerra Mundial',
        'Un conflicto global que involucró a las principales potencias mundiales, causado por tensiones políticas, militares y territoriales, y que resultó en millones de muertos y cambios en las fronteras europeas',
        12,
        5
    ),
    (
        'Gran Depresión',
        'Una severa crisis económica global que comenzó con el colapso de la bolsa de valores en 1929, llevando a un declive económico prolongado y sufrimiento social',
        13,
        6
    ),
    (
        'Segunda Guerra Mundial',
        'Un conflicto global impulsado por el expansionismo nazi y la respuesta aliada, que culminó con la caída de los regímenes totalitarios y profundas transformaciones políticas y territoriales',
        14,
        10
    ),
    (
        'Guerra de Corea',
        'Un conflicto entre Corea del Norte, apoyada por China y la Unión Soviética, y Corea del Sur, apoyada por Estados Unidos y la ONU, que estableció la división permanente de la península coreana',
        16,
        5
    ),
    (
        'Llegada del hombre a la Luna',
        'La misión Apolo 11 de la NASA llevó a los primeros humanos a la Luna en 1969, en el contexto de la carrera espacial entre Estados Unidos y la Unión Soviética',
        10,
        7
    ),
    (
        'Caída del Muro de Berlín',
        'La caída del Muro de Berlín en 1989 simbolizó el colapso del comunismo en Europa del Este y la reunificación de Alemania',
        18,
        2
    ),
    (
        'Disolución de la Unión Soviética',
        'La desintegración de la Unión Soviética en 1991 marcó el fin del comunismo en gran parte de Europa del Este y la aparición de varios estados independientes',
        19,
        2
    ),
    (
        'Atentados del 11 de septiembre',
        'Un ataque terrorista en 2001 en el que aviones secuestrados impactaron las Torres Gemelas y el Pentágono, cambiando la política de seguridad global y provocando la "Guerra contra el Terrorismo',
        20,
        9
    ),
    (
        'Pandemia de COVID-19',
        'Una pandemia global causada por el virus SARS-CoV-2 que afectó gravemente la salud pública, la economía y la movilidad de las personas en todo el mundo',
        21,
        8
    ),
    (
        'Revolución Industrial',
        'Un periodo de transformación en Europa, impulsado por avances tecnológicos, que cambió la producción industrial, la economía y la estructura social',
        5,
        13
    );

INSERT INTO
    Locaciones (Nombre)
VALUES
    ('Isla Guanahaní'),
    ('Tenochtitlán'),
    ('Alcántara'),
    ('Inglaterra'),
    ('Filadelfia'),
    ('París'),
    ('Dolores Hidalgo'),
    ('México'),
    ('Estados Unidos'),
    ('Versalles'),
    ('Europa'),
    ('Nueva York'),
    ('Peninsula Coreana'),
    ('Luna'),
    ('Berlín'),
    ('Moscú'),
    ('China'),
    ('Reino Unido');

INSERT INTO
    Eventos_Locaciones (id_Locacion, id_Evento)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (11, 13),
    (13, 14),
    (14, 15),
    (15, 16),
    (16, 17),
    (12, 18),
    (17, 19),
    (18, 20);

INSERT INTO
    Causas (Nombre)
VALUES
    ('Exploración y expansión territorial'),
    ('Conquista de nuevas tierras'),
    ('Conflictos dinásticos y sucesión al trono'),
    ('Lucha por el control político y poder'),
    ('Independencia y autodeterminación'),
    ('Revoluciones sociales y económicas'),
    ('Resistencia al dominio colonial'),
    ('Reclamaciones económicas entre naciones'),
    ('Guerra civil por divisiones internas'),
    ('Unificación de territorios o países'),
    ('Tensiones entre alianzas militares'),
    ('Colapso económico'),
    ('Invasión territorial'),
    ('Caída de regímenes totalitarios'),
    (
        'Conflicto ideológico (comunismo vs. capitalismo)'
    ),
    ('Competencia tecnológica o científica'),
    ('Colapso de sistemas políticos'),
    ('Ataques terroristas'),
    ('Pandemias y crisis sanitarias'),
    ('Asesinato de una figura política o pública');

INSERT INTO
    Eventos_Causas (id_Causa, id_Evento)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (15, 14),
    (16, 15),
    (17, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (6, 20);

INSERT INTO
    AspectoTransformado (Aspecto)
VALUES
    ('Territorial'),
    ('Económico'),
    ('Político'),
    ('Social'),
    ('Cultural'),
    ('Religioso'),
    ('Tecnológico'),
    ('Ambiental'),
    ('Demográfico'),
    ('Educativo'),
    ('Jurídico'),
    ('Militar'),
    ('Comunicativo'),
    ('Infraestructura'),
    ('Comercial'),
    ('Científico'),
    ('Sanitario'),
    ('Alimentario'),
    ('Industrial'),
    ('Artístico');

INSERT INTO
    Eventos_AspectoTransformado (id_AspectoTransformado, id_Evento)
VALUES
    (1, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (15, 1),
    (1, 2),
    (3, 2),
    (5, 2),
    (6, 2),
    (1, 3),
    (3, 3),
    (3, 4),
    (4, 4),
    (12, 4),
    (1, 5),
    (3, 5),
    (11, 5),
    (15, 5),
    (3, 6),
    (4, 6),
    (11, 6),
    (1, 7),
    (3, 7),
    (4, 7),
    (2, 8),
    (12, 8),
    (1, 9),
    (4, 9),
    (12, 9),
    (1, 10),
    (3, 10),
    (1, 11),
    (3, 11),
    (12, 11),
    (9, 11),
    (2, 12),
    (4, 12),
    (1, 13),
    (3, 13),
    (12, 13),
    (16, 13),
    (1, 14),
    (3, 14),
    (16, 15),
    (7, 15),
    (1, 16),
    (3, 16),
    (2, 16),
    (1, 17),
    (3, 17),
    (2, 17),
    (3, 18),
    (12, 18),
    (17, 19),
    (2, 19),
    (9, 19),
    (2, 20),
    (19, 20),
    (4, 20),
    (7, 20),
    (9, 20);

INSERT INTO
    SubEventos (Nombre, Descripcion, Fecha)
VALUES
    (
        'Primer viaje de Colón',
        'Llegada de Cristóbal Colón a la isla Guanahaní, marcando el inicio de la colonización europea en América',
        '1492-10-12'
    ),
    (
        'Firma de las Capitulaciones de Santa Fe',
        'Acuerdo entre los Reyes Católicos y Colón que autorizó su expedición',
        '1492-04-17'
    ),
    (
        'Noche Triste',
        'Derrota de Hernán Cortés y sus aliados indígenas mientras intentaban huir de Tenochtitlán',
        '1520-06-30'
    ),
    (
        'Caída de Tenochtitlán',
        'Victoria de Cortés sobre el imperio mexica, marcando el fin del dominio azteca',
        '1521-08-13'
    ),
    (
        'Batalla de Naseby',
        'Victoria decisiva del ejército parlamentario sobre las fuerzas realistas',
        '1645-06-14'
    ),
    (
        'Ejecución de Carlos I',
        'Decapitación del rey, lo que puso fin a la monarquía en Inglaterra durante un corto período',
        '1649-01-30'
    ),
    (
        'Firma de la Declaración de Independencia',
        'Proclamación de la independencia de las trece colonias británicas',
        '1776-07-04'
    ),
    (
        'Batalla de Yorktown',
        'Última gran batalla que llevó a la rendición británica y al fin de la guerra',
        '1781-10-19'
    ),
    (
        'Toma de la Bastilla',
        'Inicio simbólico de la Revolución con la toma de la prisión de la Bastilla en París',
        '1789-07-14'
    ),
    (
        'Aprobación de la Declaración de los Derechos del Hombre y del Ciudadano',
        'Documento fundamental que estableció los principios de libertad, igualdad y fraternidad',
        '1789-08-26'
    ),
    (
        'Grito de Dolores',
        'Inicio formal del levantamiento independentista bajo el liderazgo de Miguel Hidalgo',
        '1810-09-16'
    ),
    (
        'Batalla del Puente de Calderón',
        'Derrota del ejército insurgente que marcó un retroceso en la lucha independentista',
        '1811-01-17'
    ),
    (
        'Bombardeo de Veracruz',
        'Invasión francesa a México en respuesta a las reclamaciones económicas por daños a ciudadanos franceses',
        '1838-11-27'
    ),
    (
        'Batalla de Gettysburg',
        'Punto de inflexión en la guerra, con una victoria crucial para la Unión',
        '1863-07-01'
    ),
    (
        'Proclamación de Emancipación',
        'Decreto de Abraham Lincoln que liberó a los esclavos en los estados confederados',
        '1863-01-01'
    ),
    (
        'Batalla de Sedán',
        'Victoria decisiva de Prusia sobre Francia, allanando el camino para la proclamación del Imperio Alemán',
        '1870-09-01'
    ),
    (
        'Proclamación del Imperio Alemán',
        'Guillermo I es coronado emperador en el Palacio de Versalles',
        '1871-01-18'
    ),
    (
        'Asesinato del archiduque Francisco Fernando',
        'Evento desencadenante de la guerra',
        '1914-06-28'
    ),
    (
        'Tratado de Versalles',
        'Acuerdo de paz que puso fin formalmente a la guerra',
        '1919-06-28'
    ),
    (
        'Crack de la Bolsa de Wall Street',
        'El colapso financiero que inició la Gran Depresión',
        '1929-10-24'
    ),
    (
        'Invasión de Polonia',
        'Inicio de la Segunda Guerra Mundial con la invasión alemana de Polonia',
        '1939-09-01'
    ),
    (
        'Desembarco de Normandía',
        'Invasión aliada de Europa occidental, un punto decisivo en la guerra',
        '1944-06-06'
    ),
    (
        'Hiroshima y Nagasaki ',
        'Lanzamiento de bombas atómicas por Estados Unidos, que provocaron la rendición de Japón',
        '1945-08-06'
    ),
    (
        'Invasión de Corea del Sur',
        'Inicio del conflicto cuando Corea del Norte invadió el sur',
        '1950-06-25'
    ),
    (
        'Armisticio de Panmunjom',
        'Acuerdo que puso fin a las hostilidades activas, aunque sin un tratado de paz formal',
        '1953-07-27'
    ),
    (
        'Alunizaje del Apolo 11',
        'El astronauta Neil Armstrong se convierte en el primer ser humano en pisar la Luna',
        '1969-07-20'
    ),
    (
        'Apertura del Muro de Berlín',
        'El gobierno de Alemania Oriental abre las fronteras, permitiendo la reunificación alemana',
        '1989-11-09'
    ),
    (
        'Renuncia de Mijaíl Gorbachov',
        'El fin oficial de la Unión Soviética con la disolución de sus repúblicas constituyentes',
        '1991-12-25'
    ),
    (
        'Declaración de pandemia por la OMS',
        'La Organización Mundial de la Salud declara el COVID-19 como una pandemia global',
        '2020-03-11'
    ),
    (
        'Invención de la máquina de vapor de Watt',
        'Uno de los hitos más importantes en la revolución industrial, que revolucionó la industria y el transporte',
        NULL
    );

INSERT INTO
    Eventos_SubEventos (id_SubEventos, id_Evento)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 4),
    (6, 4),
    (7, 5),
    (8, 5),
    (9, 6),
    (10, 6),
    (11, 7),
    (12, 7),
    (13, 8),
    (14, 9),
    (15, 9),
    (16, 10),
    (17, 10),
    (18, 11),
    (19, 11),
    (20, 12),
    (21, 13),
    (22, 13),
    (23, 13),
    (24, 14),
    (25, 14),
    (26, 15),
    (27, 16),
    (28, 17),
    (29, 19),
    (30, 20);

INSERT INTO
    Documentacion (Nombre)
VALUES
    ('Fotográfica'),
    ('Testimonial'),
    ('Periodística'),
    ('Arqueológica'),
    ('Oficial'),
    ('Literaria'),
    ('Oral'),
    ('Cinematográfica'),
    ('Epigráfica'),
    ('Cartográfica'),
    ('Correspondencia'),
    ('Judicial'),
    ('Diplomas o títulos'),
    ('Memorias o diarios personales'),
    ('Manuscritos'),
    ('Gráfica'),
    ('Pinturas o murales históricos'),
    ('Audio'),
    ('Actas de reuniones o asambleas'),
    ('Análisis académico');

INSERT INTO
    Eventos_Documentacion (id_Documentacion, id_Evento)
VALUES
    (20, 1),
    (11, 1),
    (15, 1),
    (16, 1),
    (10, 1),
    (2, 1),
    (6, 1),
    (17, 1),
    (2, 2),
    (4, 2),
    (5, 2),
    (11, 2),
    (10, 2),
    (15, 2),
    (16, 2),
    (20, 2),
    (17, 2),
    (2, 3),
    (5, 3),
    (11, 3),
    (10, 3),
    (16, 3),
    (20, 3),
    (2, 4),
    (5, 4),
    (11, 4),
    (10, 4),
    (17, 4),
    (14, 4),
    (20, 4),
    (5, 5),
    (11, 5),
    (10, 5),
    (16, 5),
    (2, 5),
    (14, 5),
    (20, 5),
    (2, 6),
    (11, 6),
    (10, 6),
    (16, 6),
    (14, 6),
    (20, 6),
    (5, 7),
    (11, 7),
    (16, 7),
    (14, 7),
    (20, 7),
    (2, 8),
    (5, 8),
    (11, 8),
    (3, 8),
    (20, 8),
    (1, 9),
    (2, 9),
    (3, 9),
    (5, 9),
    (10, 9),
    (11, 9),
    (12, 9),
    (16, 9),
    (14, 9),
    (20, 9),
    (1, 10),
    (2, 10),
    (3, 10),
    (5, 10),
    (10, 10),
    (11, 10),
    (16, 10),
    (20, 10),
    (1, 11),
    (2, 11),
    (3, 11),
    (5, 11),
    (10, 11),
    (11, 11),
    (12, 11),
    (16, 11),
    (8, 11),
    (18, 11),
    (14, 11),
    (20, 11),
    (1, 12),
    (2, 12),
    (3, 12),
    (5, 12),
    (11, 12),
    (16, 12),
    (8, 12),
    (18, 12),
    (14, 12),
    (20, 12),
    (1, 13),
    (2, 13),
    (3, 13),
    (5, 13),
    (10, 13),
    (11, 13),
    (12, 13),
    (16, 13),
    (8, 13),
    (18, 13),
    (14, 13),
    (20, 13),
    (1, 14),
    (2, 14),
    (3, 14),
    (5, 14),
    (11, 14),
    (12, 14),
    (8, 14),
    (18, 14),
    (14, 14),
    (20, 14),
    (1, 15),
    (2, 15),
    (3, 15),
    (5, 15),
    (11, 15),
    (8, 15),
    (18, 15),
    (20, 15),
    (1, 16),
    (2, 16),
    (3, 16),
    (5, 16),
    (10, 16),
    (11, 16),
    (16, 16),
    (18, 16),
    (8, 16),
    (20, 16),
    (1, 17),
    (2, 17),
    (3, 17),
    (5, 17),
    (11, 17),
    (12, 17),
    (16, 17),
    (18, 17),
    (20, 17),
    (1, 18),
    (2, 18),
    (3, 18),
    (5, 18),
    (11, 18),
    (12, 18),
    (16, 18),
    (8, 18),
    (18, 18),
    (20, 18),
    (1, 19),
    (2, 19),
    (3, 19),
    (5, 19),
    (8, 19),
    (18, 19),
    (14, 19),
    (20, 19),
    (2, 20),
    (6, 20),
    (11, 20),
    (10, 20),
    (13, 20),
    (15, 20),
    (17, 20),
    (16, 20),
    (20, 20);

INSERT INTO
    TipoConflicto (Nombre)
VALUES
    ('Guerra Civil'),
    ('Revolución'),
    ('Guerra Mundial'),
    ('Invasión'),
    ('Guerra de Independencia'),
    ('Guerra Fría'),
    ('Guerra Religiosa'),
    ('Guerrilla'),
    ('Conflicto Étnico'),
    ('Guerra Territorial'),
    ('Conflicto Fronterizo'),
    ('Conflicto Político'),
    ('Guerra Económica'),
    ('Conflicto Internacional'),
    ('Rebelión'),
    ('Intervención Militar'),
    ('Guerra de Guerrillas'),
    ('Conflicto Ambiental'),
    ('Guerra Tecnológica'),
    ('Conquista'),
    ('Revolucion Tecnologica'),
    ('Crisis Económica'),
    ('Crisis Sanitaria');

INSERT INTO
    Eventos_TipoConflicto (id_TipoConflicto, id_Evento)
VALUES
    (20, 1),  
    (20, 2),  
    (12, 3),  
    (1, 4),   
    (5, 5),   
    (2, 6),   
    (5, 7),   
    (13, 8),  
    (1, 9),   
    (10, 10), 
    (3, 11),  
    (22, 12), 
    (3, 13),  
    (14, 14), 
    (19, 15), 
    (12, 16), 
    (12, 17), 
    (14, 18), 
    (23, 19), 
    (22, 20); 

INSERT INTO
    Personajes (Nombre, Fecha_Nacimiento, Fecha_Fallecimiento)
VALUES
    ('Cristóbal Colón', 1451, 1506),
    ('Isabel I de Castilla', 1451, 1504),
    ('Fernando II de Aragón', 1452, 1516),
    ('Hernán Cortés', 1485, 1547),
    ('Moctezuma II', 1466, 1520),
    ('Cuauhtémoc', 1496, 1525),
    ('Felipe II de España', 1527, 1598),
    ('Antonio, Prior de Crato', 1531, 1595),
    ('Oliver Cromwell', 1599, 1658),
    ('Carlos I de Inglaterra', 1600, 1649),
    ('George Washington', 1732, 1799),
    ('Thomas Jefferson', 1743, 1826),
    ('Benjamin Franklin', 1706, 1790),
    ('Maximilien Robespierre', 1758, 1794),
    ('Luis XVI de Francia', 1754, 1793),
    ('María Antonieta', 1755, 1793),
    ('Miguel Hidalgo y Costilla', 1753, 1811),
    ('José María Morelos', 1765, 1815),
    ('Ignacio Allende', 1769, 1811),
    ('Anastasio Bustamante', 1780, 1853),
    ('Luis Felipe I de Francia', 1773, 1850),
    ('Abraham Lincoln', 1809, 1865),
    ('Robert E. Lee', 1807, 1870),
    ('Ulysses S. Grant', 1822, 1885),
    ('Otto von Bismarck', 1815, 1898),
    ('Guillermo I de Alemania', 1797, 1888),
    ('Woodrow Wilson', 1856, 1924),
    ('Kaiser Guillermo II', 1859, 1941),
    ('Francisco Fernando de Austria', 1863, 1914),
    ('Herbert Hoover', 1874, 1964),
    ('Franklin D. Roosevelt', 1882, 1945),
    ('Adolf Hitler', 1889, 1945),
    ('Winston Churchill', 1874, 1965),
    ('Joseph Stalin', 1878, 1953),
    ('Kim Il-sung', 1912, 1994),
    ('Harry S. Truman', 1884, 1972),
    ('Syngman Rhee', 1875, 1965),
    ('Neil Armstrong', 1930, 2012),
    ('Buzz Aldrin', 1930, NULL),
    ('Michael Collins', 1930, 2021),
    ('Mijaíl Gorbachov', 1931, 2022),
    ('Ronald Reagan', 1911, 2004),
    ('Helmut Kohl', 1930, 2017),
    ('Boris Yeltsin', 1931, 2007),
    ('Osama bin Laden', 1957, 2011),
    ('George W. Bush', 1946, NULL),
    ('Xi Jinping', 1953, NULL),
    ('Anthony Fauci', 1940, NULL),
    ('Tedros Adhanom Ghebreyesus', 1965, NULL),
    ('James Watt', 1736, 1819),
    ('Adam Smith', 1723, 1790),
    ('Richard Arkwright', 1732, 1792);

INSERT INTO
    Eventos_Personajes (id_Personajes, id_Evento)
VALUES
    (108, 1),
    (109, 1),
    (110, 1),
    (111, 2),
    (112, 2),
    (113, 2),
    (114, 3),
    (115, 3),
    (116, 4),
    (117, 4),
    (118, 5),
    (119, 5),
    (120, 5),
    (121, 6),
    (122, 6),
    (123, 6),
    (124, 7),
    (125, 7),
    (126, 7),
    (127, 8),
    (128, 8),
    (129, 9),
    (130, 9),
    (131, 9),
    (132, 10),
    (133, 10),
    (134, 11),
    (135, 11),
    (136, 11),
    (137, 12),
    (138, 12),
    (139, 13),
    (140, 13),
    (141, 13),
    (138, 13),
    (142, 14),
    (143, 14),
    (144, 14),
    (145, 15),
    (146, 15),
    (147, 15),
    (148, 16),
    (149, 16),
    (150, 16),
    (151, 17),
    (148, 17),
    (152, 18),
    (153, 18),
    (154, 19),
    (155, 19),
    (156, 19),
    (157, 20),
    (158, 20),
    (159, 20);