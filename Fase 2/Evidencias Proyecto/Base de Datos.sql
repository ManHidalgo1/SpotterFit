--
-- PostgreSQL database dump
--

\restrict ePUONPhXs7mfxlGaFOTLWt5Z7TdHSXpwsdJJe20mgC34CToZIa40E6JUmsJXidP

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dias_rutina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dias_rutina (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    rutina_id uuid NOT NULL,
    numero_dia integer NOT NULL,
    nombre_dia character varying(100) NOT NULL
);


--
-- Name: ejercicios_catalogo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ejercicios_catalogo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    tipo character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    instrucciones text,
    zonas_principales character varying(255),
    youtube_query character varying(255),
    youtube_video_id character varying(50),
    imagen_musculos character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: ejercicios_dia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ejercicios_dia (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    dia_id uuid NOT NULL,
    tipo character varying(50) NOT NULL,
    series integer NOT NULL,
    repeticiones integer NOT NULL,
    descanso_seg integer NOT NULL,
    notas_ia text
);


--
-- Name: onboarding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.onboarding (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    fecha_nacimiento date NOT NULL,
    sexo character varying(20) NOT NULL,
    peso_kg double precision NOT NULL,
    altura_cm double precision NOT NULL,
    imc double precision NOT NULL,
    objetivo_principal character varying(100) NOT NULL,
    motivacion character varying(100) NOT NULL,
    nivel_experiencia character varying(50) NOT NULL,
    dificultades_fisicas character varying(100) NOT NULL,
    dias_semana integer NOT NULL,
    duracion_sesion character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: progreso_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.progreso_usuario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid,
    dia_actual integer DEFAULT 1,
    ultimo_entrenamiento date,
    racha_actual integer DEFAULT 0,
    racha_maxima integer DEFAULT 0,
    total_sesiones integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: resultados_ejercicio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resultados_ejercicio (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sesion_id uuid NOT NULL,
    tipo_ejercicio character varying(50) NOT NULL,
    reps_completadas integer,
    series_completadas integer,
    score_postura integer,
    duracion_seg integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ejercicio_id uuid
);


--
-- Name: rutinas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rutinas (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    onboarding_id uuid NOT NULL,
    nombre character varying(100) NOT NULL,
    dias_semana integer NOT NULL,
    duracion_estimada character varying(50),
    activa boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sesiones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesiones (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    rutina_id uuid NOT NULL,
    inicio timestamp without time zone NOT NULL,
    fin timestamp without time zone,
    duracion_seg integer,
    score_global integer,
    completada boolean DEFAULT false,
    dia_numero integer,
    score_promedio double precision
);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    firebase_uid character varying(128) NOT NULL,
    email character varying(255) NOT NULL,
    nombre character varying(100) NOT NULL,
    racha_actual integer DEFAULT 0,
    racha_maxima integer DEFAULT 0,
    ultimo_entrenamiento timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    password_hash character varying(255),
    reset_token character varying(255),
    reset_token_expiry timestamp without time zone
);


--
-- Data for Name: dias_rutina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dias_rutina (id, rutina_id, numero_dia, nombre_dia) FROM stdin;
64544cc3-f7fd-4bb3-9889-d6dec00b773b	5aa8b037-ccda-472c-8107-6365f1ac7bf0	1	Día 1 - Tren Inferior y Hombros
e0e139d8-3c26-492f-aaa4-60c19cd8e8a5	5aa8b037-ccda-472c-8107-6365f1ac7bf0	2	Día 2 - Tren Superior y Posterior
e54e03b6-4778-4501-82e7-d7f7a61c8d41	7d08f36d-2830-4d1a-ab4d-74763c0d785b	1	Día 1 - Piernas y Hombros
7f5b2604-bf15-4e75-8995-a60b0c59a5b6	7d08f36d-2830-4d1a-ab4d-74763c0d785b	2	Día 2 - Espalda y Bíceps
77065ed4-37b1-4273-893f-35742fec576d	22976d4f-f1e0-4740-bded-3305bb176116	1	Día 1 - Tren Inferior y Hombros
d9a526d2-256f-4885-a50c-98335d46c6f1	22976d4f-f1e0-4740-bded-3305bb176116	2	Día 2 - Fuerza Funcional
0a684c01-8e57-4196-b8e4-826eb4f2020c	22976d4f-f1e0-4740-bded-3305bb176116	3	Día 3 - Hombros y Brazos
79771901-1b6c-47c6-8668-e5b7d0f7628b	22976d4f-f1e0-4740-bded-3305bb176116	4	Día 4 - Piernas y Fuerza Total
66868df2-77b5-4df5-a637-3036e51bd5fb	97a31d52-c731-40f3-bf17-86c3545dca7a	1	Día 1 - Piernas y Fuerza Base
c93e163a-dee3-42c9-999d-37fd6d62bc39	97a31d52-c731-40f3-bf17-86c3545dca7a	2	Día 2 - Hombros y Definición
5dfcc363-f99c-4ce0-8651-133f692bf063	97a31d52-c731-40f3-bf17-86c3545dca7a	3	Día 3 - Brazos y Cuerpo Completo
31c50208-f114-434a-9b0f-d2de678d4abc	f3854086-c550-471c-ab67-e454b2ec589e	1	Día 1 - Tren Inferior y Hombros
00ea8e0e-6413-4820-a4bd-60cb614fac12	f3854086-c550-471c-ab67-e454b2ec589e	2	Día 2 - Bíceps y Hombros
8ea4d31a-0196-47c1-900e-a4972b072769	f3854086-c550-471c-ab67-e454b2ec589e	3	Día 3 - Cuerpo Completo Suave
f0af3fab-4ac4-4517-bb03-efde156ca977	285fbf5b-9324-4152-8856-2254b22ec6f9	1	Día 1 - Tren Inferior y Hombros
2217d3d3-a103-4037-8f3b-67a2b9c06efa	285fbf5b-9324-4152-8856-2254b22ec6f9	2	Día 2 - Tren Superior y Espalda
6645e928-eddf-420c-ae40-9f706ff59a94	b25aff6e-1859-4612-b1a1-846335b8364a	1	Día 1
0d859930-cd67-46be-b7aa-f95bd27042f9	ca760a85-f660-4c86-bcdb-b050c44cb46d	1	Día 1 - Fuerza Total
eabcc641-1b6a-49d5-a98a-4b4f532c08e0	b25aff6e-1859-4612-b1a1-846335b8364a	2	Día 2
f4975943-89e5-401c-8295-48d8ce7348c3	44ecf40b-c9f7-40b2-86a4-ccea5c8964f9	1	Día 1 - Cuerpo Completo
51a42074-e4a6-4355-87cf-e84474f69246	b923fbb6-ac50-4d71-a4d2-69acfc307145	1	Día 1 - Piernas y Hombros
bd79fd52-a278-4fb2-9458-75643cb0ebf7	b923fbb6-ac50-4d71-a4d2-69acfc307145	2	Día 2 - Espalda y Hombros Frontales
907a0a48-9706-4e5b-b467-4afbb8f0b45e	b923fbb6-ac50-4d71-a4d2-69acfc307145	3	Día 3 - Brazos y Cuerpo Completo
\.


--
-- Data for Name: ejercicios_catalogo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ejercicios_catalogo (id, tipo, nombre, descripcion, instrucciones, zonas_principales, youtube_query, youtube_video_id, imagen_musculos, created_at) FROM stdin;
359e017e-f47c-40cb-b551-ee59ea99c4a8	front_raise	Elevacion Frontal	Ejercicio de aislamiento para el deltoides anterior.	Párate con una mancuerna en cada mano frente a ti. Mantén los brazos casi extendidos. Eleva los brazos hacia adelante hasta la altura de los hombros. Baja lentamente y de forma controlada.	Deltoides anterior,Hombro frontal,Trapecio	elevacion frontal mancuernas tecnica correcta	gUITTCpa4Z4	assets/images/musculos_front_raise.png	2026-06-01 22:22:58.820809
761ebef4-d321-426c-9fc4-3839a65baf5e	bench_press	Press de Banca	Ejercicio compuesto fundamental para el pecho.	Acuéstate en el banco con los pies apoyados en el suelo. Agarra la barra con las manos más anchas que los hombros. Baja la barra hasta el pecho de forma controlada. Empuja hacia arriba hasta extender los brazos completamente.	Pecho,Tríceps,Deltoides anterior	press de banca tecnica correcta tutorial	5wqtqjYBWec	assets/images/musculos_bench_press.png	2026-06-01 22:22:58.820809
af06422b-29db-4d5a-a98b-8ef15cf7c0dc	lateral_raise	Elevacion Lateral	Ejercicio de aislamiento para los hombros laterales.	Párate con una mancuerna en cada mano a los costados. Mantén los codos ligeramente flexionados. Eleva los brazos hacia los lados hasta la altura de los hombros. Baja lentamente y de forma controlada.	Hombro lateral,Trapecio,Deltoides	elevacion lateral mancuernas tecnica correcta	_L2icuIfbqY	assets/images/musculos_lateral_raise.png	2026-06-01 22:22:58.820809
f6020dd9-725a-4ba5-b3d1-bdbd98278df0	deadlift	Peso Muerto	Ejercicio compuesto que trabaja la cadena posterior del cuerpo.	Párate con los pies al ancho de los hombros. Inclínate hacia adelante manteniendo la espalda recta. Agarra la barra con ambas manos. Empuja el suelo con los pies y levanta la barra hasta quedar erguido. Baja controladamente.	Espalda baja,Glúteos,Isquiotibiales,Trapecios	peso muerto técnica correcta tutorial	f0SMNtfjUFs	assets/images/musculos_deadlift.png	2026-06-01 22:22:58.820809
64dce493-e382-4169-923a-cf109060630b	sentadillas	Sentadillas	Ejercicio fundamental para el tren inferior que trabaja cuádriceps, glúteos e isquiotibiales.	Párate con los pies al ancho de los hombros. Baja el cuerpo como si fueras a sentarte en una silla. Mantén la espalda recta y las rodillas alineadas con los pies. Baja hasta que los muslos estén paralelos al suelo.	Cuádriceps,Glúteos,Isquiotibiales	como hacer sentadillas correctamente	4xVs7iOSd2Q	sentadillas_musculos.png	2026-05-13 23:31:40.858624
fb0262a2-868d-4b02-b4d7-9a02d3c11c66	biceps_mancuernas	Curl de Bíceps con Mancuernas	Ejercicio de aislamiento para el bíceps que desarrolla la fuerza y el volumen del brazo.	Párate con los pies al ancho de los hombros sosteniendo una mancuerna en cada mano. Mantén los codos pegados al cuerpo. Sube las mancuernas contrayendo el bíceps. Baja lentamente a la posición inicial.	Bíceps,Tríceps,Hombros	como hacer curl de biceps con mancuernas	LrXGP_Tda-A	biceps_musculos.png	2026-05-13 23:31:40.858624
\.


--
-- Data for Name: ejercicios_dia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ejercicios_dia (id, dia_id, tipo, series, repeticiones, descanso_seg, notas_ia) FROM stdin;
28f853b4-138f-49cc-b038-a27dac3affee	64544cc3-f7fd-4bb3-9889-d6dec00b773b	sentadillas	3	12	60	La base de todo gran físico. Mantén la espalda recta y empuja con fuerza, ¡cada repetición te acerca a tu mejor versión!
c32f6e93-7ee8-4935-b002-8cd48de3c720	64544cc3-f7fd-4bb3-9889-d6dec00b773b	lateral_raise	3	12	60	Este ejercicio esculpe hombros anchos que se notan bajo cualquier camiseta. ¡Controla el movimiento y notarás la diferencia pronto!
212d3c53-949f-4f9d-bd1e-40c9182e45d9	64544cc3-f7fd-4bb3-9889-d6dec00b773b	front_raise	3	12	60	Perfecto para complementar tus hombros y dar esa apariencia atlética que buscas. ¡Sube lento y baja con control!
cbbebd90-7cf8-45b7-85f3-b20e3e94ec21	e0e139d8-3c26-492f-aaa4-60c19cd8e8a5	biceps_mancuernas	3	12	60	Los bíceps son uno de los músculos más visibles. Concéntrate en apretarlos en cada subida y ¡verás resultados antes de lo que imaginas!
c305afc1-f8c4-47b6-9212-6e2e5106cb06	e0e139d8-3c26-492f-aaa4-60c19cd8e8a5	deadlift	3	10	75	El rey de los ejercicios de fuerza. Activa espalda, glúteos y piernas a la vez. Empieza con poco peso, la técnica es tu mejor aliada ahora mismo.
1acaf46a-54e6-4c08-91c9-565f6df5353d	e54e03b6-4778-4501-82e7-d7f7a61c8d41	sentadillas	3	10	60	La base de todo cuerpo fuerte empieza aquí. Mantén la espalda recta y lleva las rodillas hacia afuera.
1b31675b-b189-4151-b307-40ce0708219e	e54e03b6-4778-4501-82e7-d7f7a61c8d41	lateral_raise	3	10	45	Hombros más anchos con cada repetición. Sube los brazos con control, sin balancear el cuerpo.
17b5f11c-6fff-4275-8aa1-477ce3ab4672	e54e03b6-4778-4501-82e7-d7f7a61c8d41	front_raise	3	10	45	Perfecto para definir el hombro frontal. Usa un peso ligero y siente cómo trabaja cada músculo.
5b3394a2-c342-41fb-aba9-1e876230c52e	7f5b2604-bf15-4e75-8995-a60b0c59a5b6	deadlift	3	8	75	El rey de los ejercicios compuestos. Mantén la espalda neutral y empuja el suelo con los talones para activar todo el posterior.
2549f2e7-3896-4f22-ba5f-94ceb8671836	7f5b2604-bf15-4e75-8995-a60b0c59a5b6	biceps_mancuernas	3	12	45	Cada curl te acerca a los brazos que quieres. Sube controlado y baja lento para maximizar el trabajo del bíceps.
20737565-5824-458c-85d4-3eae56479b03	77065ed4-37b1-4273-893f-35742fec576d	sentadillas	3	12	60	Mantén la espalda recta y el core activado. Cada repetición te acerca a tu mejor versión.
68640db8-c8bd-4b15-9c0d-998a9e5c3186	77065ed4-37b1-4273-893f-35742fec576d	lateral_raise	3	12	45	Movimiento controlado, sin balanceos. Tus hombros se van a transformar con constancia.
c2f6cb5d-d00a-410b-9812-ac6b9b3ece91	77065ed4-37b1-4273-893f-35742fec576d	front_raise	3	12	45	Sube con control y baja lento. Cada subida es energía pura que estás construyendo.
6f1e8cce-e248-4880-a5d6-c0c2211a4061	d9a526d2-256f-4885-a50c-98335d46c6f1	deadlift	3	10	75	Con espalda sensible, prioriza la técnica sobre el peso. Activa glúteos y core antes de cada tirón.
17b95f24-2274-4aa7-abf1-187a05182f5e	d9a526d2-256f-4885-a50c-98335d46c6f1	biceps_mancuernas	3	12	45	Codos fijos al cuerpo, siente el músculo trabajar. ¡Tu esfuerzo de hoy es tu energía de mañana!
00a5bca1-6d00-4b2a-8966-42d32b2cbe07	0a684c01-8e57-4196-b8e4-826eb4f2020c	lateral_raise	4	12	45	Cuatro series hoy para elevar la intensidad. Respira bien y mantén el ritmo.
e5cf4887-b092-44dd-8ea1-8df6bb4fbc2e	0a684c01-8e57-4196-b8e4-826eb4f2020c	front_raise	3	12	45	Complementa perfectamente el lateral raise. Juntos esculpen unos hombros de impacto.
5c458d0f-967b-41d1-9517-cac96774fb52	0a684c01-8e57-4196-b8e4-826eb4f2020c	biceps_mancuernas	3	15	45	Más repeticiones para quemar más calorías. ¡Siente el ardor, es señal de progreso!
b0426f88-79fd-4fad-8722-803892643027	79771901-1b6c-47c6-8668-e5b7d0f7628b	sentadillas	4	15	60	Las piernas son el motor del cuerpo. Más repeticiones hoy para maximizar la quema calórica.
3cd061b5-a328-427a-a631-149bc2009f53	79771901-1b6c-47c6-8668-e5b7d0f7628b	deadlift	3	10	75	Finaliza la semana fuerte. Espalda neutra siempre, el peso ideal es el que puedes controlar.
07d4700c-e8e9-42d9-afeb-b8e24becbb3c	79771901-1b6c-47c6-8668-e5b7d0f7628b	biceps_mancuernas	2	12	45	Cierre perfecto para la semana. ¡Completaste 4 días, eso es lo que te diferencia!
28d48406-d9c7-4d55-b88d-34876f2b1612	66868df2-77b5-4df5-a637-3036e51bd5fb	sentadillas	3	10	60	Cada repetición te acerca a la mejor versión de ti mismo. ¡Mantén la espalda recta y tú puedes!
86ef71b2-1ea1-4c42-a290-6bc03aa12ebd	66868df2-77b5-4df5-a637-3036e51bd5fb	deadlift	3	8	75	Este ejercicio construye una base sólida. Concéntrate en la técnica y los resultados llegarán solos.
b536bdc1-1676-4f7d-afc3-80fdfed09627	c93e163a-dee3-42c9-999d-37fd6d62bc39	lateral_raise	3	12	60	Hombros trabajados son hombros que se notan. ¡Controla el movimiento y siéntete más grande cada día!
b478d6fc-9be2-4e70-b819-d8cfd5622f53	c93e163a-dee3-42c9-999d-37fd6d62bc39	front_raise	3	12	60	La parte delantera del hombro da presencia. ¡Cada serie es un paso hacia el físico que deseas!
d9fcf9ba-a5e4-433a-aec0-3ce270bb69b6	5dfcc363-f99c-4ce0-8651-133f692bf063	biceps_mancuernas	3	12	60	Los bíceps son el músculo más visible. ¡Trabájalos con ganas y pronto notarás la diferencia en el espejo!
239cd3da-7ff8-4627-a160-015020000e27	5dfcc363-f99c-4ce0-8651-133f692bf063	sentadillas	2	10	60	Termina la semana fuerte. Estas sentadillas sellan tu esfuerzo de los últimos tres días. ¡Dalo todo!
fac3c67a-4db9-4ace-a2da-6243cdde5aac	31c50208-f114-434a-9b0f-d2de678d4abc	sentadillas	3	10	60	Mantén la espalda recta y el core activo. ¡Cada repetición te acerca a la mejor versión de ti mismo!
16b76cdf-690d-4e0f-b7f9-633e96512054	31c50208-f114-434a-9b0f-d2de678d4abc	lateral_raise	3	12	45	Sube los brazos con control, sin balancear. ¡Unos hombros definidos cambian toda tu figura!
85b3a078-4511-4c45-902e-e5b9d57cacf0	31c50208-f114-434a-9b0f-d2de678d4abc	front_raise	3	12	45	Movimiento lento y controlado. ¡Estás construyendo el físico que siempre quisiste!
3edb72bc-ff95-41f9-a993-358d9e8c6e80	00ea8e0e-6413-4820-a4bd-60cb614fac12	biceps_mancuernas	3	12	60	Codos pegados al cuerpo y sube despacio. ¡Unos bíceps trabajados te harán lucir increíble!
b507443f-ef81-4a61-86c0-26fc3aee5b9f	00ea8e0e-6413-4820-a4bd-60cb614fac12	lateral_raise	3	12	45	Usa un peso ligero para mantener la técnica perfecta. ¡La constancia es tu superpoder!
d5925f25-f957-4583-89c5-f5384a88b281	00ea8e0e-6413-4820-a4bd-60cb614fac12	front_raise	3	12	45	Respira al subir y al bajar. ¡Cada sesión cuenta, sigue adelante!
9ad9d948-896d-41ef-804f-fe2a13364848	8ea4d31a-0196-47c1-900e-a4972b072769	sentadillas	3	10	60	Controla el descenso y empuja fuerte al subir. ¡Tu cuerpo ya está cambiando, confía en el proceso!
bf69ece1-e26b-4fde-8f51-29fd3e575d85	8ea4d31a-0196-47c1-900e-a4972b072769	deadlift	2	8	75	Con espalda sensible, usa poco peso y prioriza la técnica. ¡La seguridad primero, los resultados vendrán!
e647e9e6-d7c3-405b-b1a0-7653a49038c8	8ea4d31a-0196-47c1-900e-a4972b072769	biceps_mancuernas	3	12	60	Termina fuerte esta semana. ¡Tres días de esfuerzo son tres pasos más cerca de tu objetivo!
ecb1c884-4de6-46f8-825c-161793d5b819	f0af3fab-4ac4-4517-bb03-efde156ca977	sentadillas	3	12	60	¡La base de todo cuerpo fuerte! Mantén la espalda recta y baja con control. Cada repetición te acerca a la mejor versión de ti mismo.
580d73fd-a247-4740-b5fa-6b30e3e31263	f0af3fab-4ac4-4517-bb03-efde156ca977	lateral_raise	3	12	60	Este ejercicio esculpe tus hombros y te da esa apariencia amplia que buscas. Usa un peso ligero y siente el músculo trabajar.
eb909ac9-4a7d-4592-b077-66561653aa45	f0af3fab-4ac4-4517-bb03-efde156ca977	front_raise	3	12	60	¡Excelente complemento para tus hombros! Sube con control y baja despacio. La consistencia es tu mejor aliada.
9b984e1c-d58a-4f77-8dea-8d867ed75ab2	2217d3d3-a103-4037-8f3b-67a2b9c06efa	biceps_mancuernas	3	12	60	¡Brazos que impresionan! Mantén los codos pegados al cuerpo y concéntrate en el músculo. Cada curl cuenta.
dcd0ca38-3ba7-40f4-addf-0fd0f2e58117	2217d3d3-a103-4037-8f3b-67a2b9c06efa	deadlift	3	10	75	El rey de los ejercicios funcionales. Empieza con poco peso, prioriza la técnica y notarás cómo tu cuerpo cambia desde adentro hacia afuera.
0731e29a-f67e-4bed-8be7-33ed79124a31	0d859930-cd67-46be-b7aa-f95bd27042f9	sentadillas	3	10	60	La base de todo cuerpo fuerte empieza aquí. Mantén la espalda recta y baja con control.
a295c56f-4cb4-4f2e-9d68-060d8e2cacd0	0d859930-cd67-46be-b7aa-f95bd27042f9	deadlift	3	8	75	Cada repetición construye tu espalda y piernas. Concéntrate en la técnica antes que en el peso.
f7ee3bf6-ebbf-49ff-ae02-6e6366b2db84	0d859930-cd67-46be-b7aa-f95bd27042f9	biceps_mancuernas	3	10	45	Siente el músculo trabajar en cada subida. La constancia hará crecer esos bíceps.
4fb2e4fd-b807-4b79-80f8-d5d04574391d	0d859930-cd67-46be-b7aa-f95bd27042f9	lateral_raise	3	12	45	Hombros anchos se construyen con paciencia. Usa poco peso y haz el movimiento limpio.
70c4ad9f-399a-4ce3-a46a-66c96be192c8	0d859930-cd67-46be-b7aa-f95bd27042f9	front_raise	3	12	45	Cierra la sesión con fuerza. Cada elevación te acerca al cuerpo que estás construyendo.
108d2674-af38-40d3-9d6b-d5ccb7b4e1e0	6645e928-eddf-420c-ae40-9f706ff59a94	sentadillas	2	5	20	Rutina de demostración
a554f4d0-8e29-4ad0-9f84-c46ab8cd4573	6645e928-eddf-420c-ae40-9f706ff59a94	biceps_mancuernas	2	5	20	Rutina de demostración
95b8b65e-ea76-4987-8b43-435c1db4a9ae	eabcc641-1b6a-49d5-a98a-4b4f532c08e0	sentadillas	2	5	20	Rutina de demostración
c9180cd4-6347-408a-9a45-1870305a319c	eabcc641-1b6a-49d5-a98a-4b4f532c08e0	biceps_mancuernas	2	5	20	Rutina de demostración
e351e6d7-ed09-4a7c-838f-939483ba6172	f4975943-89e5-401c-8295-48d8ce7348c3	sentadillas	3	10	60	La base de todo cuerpo fuerte empieza aquí. ¡Mantén la espalda recta y confía en tu progreso!
5ec9f1dd-9699-43be-822c-25d734c77b55	f4975943-89e5-401c-8295-48d8ce7348c3	deadlift	3	8	75	Cada repetición construye tu fuerza desde cero. Foco en la técnica antes que en el peso.
b6f5391c-61f7-4cd8-85c1-0dea3848ffc2	f4975943-89e5-401c-8295-48d8ce7348c3	biceps_mancuernas	3	12	45	Siente cómo tus brazos crecen con cada curl. ¡Tú puedes con esto y mucho más!
f8ea68aa-f1df-4396-a249-a4a555f807da	f4975943-89e5-401c-8295-48d8ce7348c3	lateral_raise	3	12	45	Hombros anchos se ganan con constancia. Usa un peso ligero y controla el movimiento.
3534caeb-4f80-4979-a44f-c3c5980d1c5c	f4975943-89e5-401c-8295-48d8ce7348c3	front_raise	3	12	45	Completa tus hombros con este ejercicio. ¡Cada sesión te acerca a tu mejor versión!
57eefc16-a668-4973-bad2-6c44e1f6dae1	51a42074-e4a6-4355-87cf-e84474f69246	sentadillas	3	12	60	¡La base de todo cuerpo fuerte empieza aquí! Mantén la espalda recta y baja con control.
44e66520-d089-45ba-b2b2-9222c629b267	51a42074-e4a6-4355-87cf-e84474f69246	lateral_raise	3	12	60	Hombros amplios en construcción. Sube los brazos despacio y siente el trabajo muscular.
2dcab600-6ff1-4b30-812d-b6d8245ed052	bd79fd52-a278-4fb2-9458-75643cb0ebf7	deadlift	3	10	75	El peso muerto es el rey de los ejercicios. Cada repetición te hace más fuerte desde los pies hasta la nuca.
c9279339-a2ba-4df6-ae00-7fba1f57a70d	bd79fd52-a278-4fb2-9458-75643cb0ebf7	front_raise	3	12	60	Eleva con propósito. Este ejercicio moldea tus hombros frontales y mejora tu postura día a día.
83771664-764a-4943-9415-4be6da59e066	907a0a48-9706-4e5b-b467-4afbb8f0b45e	biceps_mancuernas	3	12	60	¡Tus bíceps crecen con cada curl! Concentra la mente en el músculo y disfruta cada repetición.
1d4387d5-2b89-40f0-bf74-422312663361	907a0a48-9706-4e5b-b467-4afbb8f0b45e	sentadillas	3	12	60	Segunda ronda de piernas para consolidar tu progreso. Vas a notar la diferencia semana a semana.
54258c86-f8ca-4b70-b690-bd3caaae5f78	907a0a48-9706-4e5b-b467-4afbb8f0b45e	lateral_raise	2	12	60	Cierra la semana con hombros fuertes. ¡Cada sesión completada es un paso más hacia tu mejor versión!
\.


--
-- Data for Name: onboarding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.onboarding (id, usuario_id, fecha_nacimiento, sexo, peso_kg, altura_cm, imc, objetivo_principal, motivacion, nivel_experiencia, dificultades_fisicas, dias_semana, duracion_sesion, created_at) FROM stdin;
f2a8faab-2519-458c-b7ae-e5226bc50a1a	417d1cb7-321e-4093-b294-b413c8946797	1996-11-15	Masculino	74	174	24.44	Condición física	Verme mejor	Principiante	Ninguna	2	10-15 min	2026-06-19 04:42:02.905398
488a8207-a708-4637-bae6-4703541b2654	72034c1c-12dd-41c0-8649-d5af3055395c	2003-05-12	Masculino	83	183	24.78	Perder peso	Energía	Intermedio	Espalda sensible	4	20-30 min	2026-06-19 23:33:41.388097
feb8e51b-3a39-445f-be1f-4d6fb5c02c9f	22b43bfe-1628-461c-9ef8-95a9a49bcca5	2002-08-17	Masculino	85	170	29.41	Ganar músculo	Verme mejor	Principiante	Ninguna	3	15-20 min	2026-06-24 01:22:41.416101
b5899c43-e983-43a6-9865-c2ab549a0620	5b392f67-1e5d-4a5d-a275-c96fdb3e4936	2000-07-23	Masculino	85	180	26.23	Perder peso	Verme mejor	Principiante	Espalda sensible	3	15-20 min	2026-06-24 01:53:58.794997
32652f43-6f2c-4080-984b-583c862f9fc2	f5640c2c-e015-4a81-ac6d-e13608d58e67	1995-01-01	Masculino	75	174	24.77	Condición física	Verme mejor	Principiante	Ninguna	2	15-20 min	2026-07-01 23:28:01.919313
840823a6-e4e7-4e7b-ac7a-2be0a4485a7b	f5640c2c-e015-4a81-ac6d-e13608d58e67	2000-01-01	masculino	75	175	24.5	ganar_musculo	salud	principiante	ninguna	1	corta	2026-07-01 23:32:42.658336
9367010f-463a-48a0-adfd-2aeff2ba34c4	23417f06-2b15-40bb-9bd0-a928aa22bdeb	2001-01-01	Masculino	74	174	24.44	Ganar músculo	Energía	Principiante	Ninguna	3	15-20 min	2026-07-03 22:19:16.132765
\.


--
-- Data for Name: progreso_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.progreso_usuario (id, usuario_id, dia_actual, ultimo_entrenamiento, racha_actual, racha_maxima, total_sesiones, created_at, updated_at) FROM stdin;
517cd6db-d90d-4d8e-83e7-14173c0d3866	417d1cb7-321e-4093-b294-b413c8946797	1	2026-06-19	1	1	2	2026-06-19 04:43:34.785464	2026-06-19 09:31:05.359437
febdc2eb-9dc8-4127-8f0a-9d7177da8fda	72034c1c-12dd-41c0-8649-d5af3055395c	1	\N	0	0	0	2026-06-19 23:35:55.26955	2026-06-19 23:35:55.26955
701a5a44-6445-415b-837c-603fdac44ffc	22b43bfe-1628-461c-9ef8-95a9a49bcca5	1	\N	0	0	0	2026-06-24 01:23:02.424588	2026-06-24 01:23:02.424588
52f3f27f-f7fd-470b-a380-5d3338c3d9b3	5b392f67-1e5d-4a5d-a275-c96fdb3e4936	1	\N	0	0	0	2026-06-24 01:55:41.693031	2026-06-24 01:55:41.693031
28509053-49d5-40bc-876e-540c8f4c0fc9	f5640c2c-e015-4a81-ac6d-e13608d58e67	2	2026-07-03	1	1	1	2026-07-01 23:32:42.658336	2026-07-03 22:17:29.039158
\.


--
-- Data for Name: resultados_ejercicio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resultados_ejercicio (id, sesion_id, tipo_ejercicio, reps_completadas, series_completadas, score_postura, duracion_seg, created_at, ejercicio_id) FROM stdin;
971b67ff-d24f-4263-99d3-f9f64690f40d	07e3d6b7-4fc6-4db9-a09b-0fd295587d63	sentadillas	98	\N	63	390	2026-06-19 04:44:03.219181	28f853b4-138f-49cc-b038-a27dac3affee
2bf7ffa3-cca1-4daa-bb8d-128fe24ded7e	07e3d6b7-4fc6-4db9-a09b-0fd295587d63	deadlift	9	\N	93	45	2026-06-19 05:35:09.553817	c305afc1-f8c4-47b6-9212-6e2e5106cb06
9b0ae626-c589-4fa6-96b3-04619f22b211	c7d18ab6-b682-4d9b-83e0-756fc1b51427	deadlift	12	\N	71	66	2026-06-19 09:31:02.907621	c305afc1-f8c4-47b6-9212-6e2e5106cb06
d3c078bb-8458-4e1f-97aa-2eb89fa2c6eb	7e6e48a2-25bb-4813-8471-95f932cc9cdc	sentadillas	33	\N	73	181	2026-06-19 09:32:32.747608	1acaf46a-54e6-4c08-91c9-565f6df5353d
3ed0ba68-42da-45b8-8ffc-f6cdd2033d88	a239ac68-031a-47fa-bc6e-189d9978b322	lateral_raise	19	\N	78	106	2026-06-19 23:37:31.733421	68640db8-c8bd-4b15-9c0d-998a9e5c3186
bf734f66-f6b0-4292-b5e7-1854be921137	a239ac68-031a-47fa-bc6e-189d9978b322	biceps_mancuernas	14	\N	62	77	2026-06-19 23:40:09.833221	17b95f24-2274-4aa7-abf1-187a05182f5e
e468927b-f4f6-47ac-ba92-6e8e2d010b19	0e2fc397-2084-48cf-b5b2-6a3d0f908678	sentadillas	1	\N	68	50	2026-06-24 01:56:33.383954	fac3c67a-4db9-4ace-a2da-6243cdde5aac
0ffa2b85-8a6e-47ba-8ef7-963477d73a5a	0bd786e9-2e77-46be-bce7-ec2f9b0eb10f	biceps_mancuernas	23	\N	78	166	2026-06-29 16:01:40.240646	17b95f24-2274-4aa7-abf1-187a05182f5e
6b31dcc3-c246-45a9-a1f6-35d8a37b05f2	3988743e-1c51-4e4e-8377-4bd7567cb73f	deadlift	11	\N	70	72	2026-07-01 18:50:06.967096	5b3394a2-c342-41fb-aba9-1e876230c52e
23eb7547-c2f8-4d96-8079-40b3e672357c	3988743e-1c51-4e4e-8377-4bd7567cb73f	sentadillas	5	\N	69	27	2026-07-01 18:51:13.561053	1acaf46a-54e6-4c08-91c9-565f6df5353d
6a81959e-1b72-4ccf-b10d-c11acf676d74	3afdf41b-4268-48e6-bb97-f0b9c1e16c77	sentadillas	10	\N	76	72	2026-07-03 22:14:53.778781	108d2674-af38-40d3-9d6b-d5ccb7b4e1e0
fbc36d77-8c45-46bd-835e-9ffb498848ed	3afdf41b-4268-48e6-bb97-f0b9c1e16c77	biceps_mancuernas	10	\N	74	46	2026-07-03 22:16:37.738602	a554f4d0-8e29-4ad0-9f84-c46ab8cd4573
\.


--
-- Data for Name: rutinas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rutinas (id, usuario_id, onboarding_id, nombre, dias_semana, duracion_estimada, activa, created_at) FROM stdin;
5aa8b037-ccda-472c-8107-6365f1ac7bf0	417d1cb7-321e-4093-b294-b413c8946797	f2a8faab-2519-458c-b7ae-e5226bc50a1a	Rutina Inicio Poderoso	2	10-15 min	f	2026-06-19 04:42:03.621869
7d08f36d-2830-4d1a-ab4d-74763c0d785b	417d1cb7-321e-4093-b294-b413c8946797	f2a8faab-2519-458c-b7ae-e5226bc50a1a	Rutina Inicio Poderoso	2	10-15 min	t	2026-06-19 09:31:05.381063
22976d4f-f1e0-4740-bded-3305bb176116	72034c1c-12dd-41c0-8649-d5af3055395c	488a8207-a708-4637-bae6-4703541b2654	Rutina Energía Total - Quema y Potencia	4	20-30 min	t	2026-06-19 23:33:42.395048
97a31d52-c731-40f3-bf17-86c3545dca7a	22b43bfe-1628-461c-9ef8-95a9a49bcca5	feb8e51b-3a39-445f-be1f-4d6fb5c02c9f	Rutina Inicio Poderoso	3	15-20 min	t	2026-06-24 01:22:43.193915
f3854086-c550-471c-ab67-e454b2ec589e	5b392f67-1e5d-4a5d-a275-c96fdb3e4936	b5899c43-e983-43a6-9865-c2ab549a0620	Rutina Quema y Forma - Principiante	3	15-20 min	t	2026-06-24 01:53:59.717908
285fbf5b-9324-4152-8856-2254b22ec6f9	f5640c2c-e015-4a81-ac6d-e13608d58e67	32652f43-6f2c-4080-984b-583c862f9fc2	Rutina Inicio Poderoso	2	15-20 min	f	2026-07-01 23:28:02.734907
ca760a85-f660-4c86-bcdb-b050c44cb46d	f5640c2c-e015-4a81-ac6d-e13608d58e67	840823a6-e4e7-4e7b-ac7a-2be0a4485a7b	Rutina Inicio Fuerte	1	25-35 min	f	2026-07-02 00:27:39.314585
44ecf40b-c9f7-40b2-86a4-ccea5c8964f9	f5640c2c-e015-4a81-ac6d-e13608d58e67	840823a6-e4e7-4e7b-ac7a-2be0a4485a7b	Rutina Inicio Poderoso	1	25-35 min	f	2026-07-03 12:15:47.02808
b25aff6e-1859-4612-b1a1-846335b8364a	f5640c2c-e015-4a81-ac6d-e13608d58e67	840823a6-e4e7-4e7b-ac7a-2be0a4485a7b	Rutina Demo	2	5 min	t	2026-07-01 23:32:42.658336
b923fbb6-ac50-4d71-a4d2-69acfc307145	23417f06-2b15-40bb-9bd0-a928aa22bdeb	9367010f-463a-48a0-adfd-2aeff2ba34c4	Rutina Energía Total - Principiante 3 Días	3	15-20 min	t	2026-07-03 22:19:16.92268
\.


--
-- Data for Name: sesiones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesiones (id, usuario_id, rutina_id, inicio, fin, duracion_seg, score_global, completada, dia_numero, score_promedio) FROM stdin;
07e3d6b7-4fc6-4db9-a09b-0fd295587d63	417d1cb7-321e-4093-b294-b413c8946797	5aa8b037-ccda-472c-8107-6365f1ac7bf0	2026-06-19 04:43:34.801747	\N	3098	\N	t	1	78
c7d18ab6-b682-4d9b-83e0-756fc1b51427	417d1cb7-321e-4093-b294-b413c8946797	5aa8b037-ccda-472c-8107-6365f1ac7bf0	2026-06-19 09:29:55.684421	\N	70	\N	t	2	71
7e6e48a2-25bb-4813-8471-95f932cc9cdc	417d1cb7-321e-4093-b294-b413c8946797	7d08f36d-2830-4d1a-ab4d-74763c0d785b	2026-06-19 09:31:28.743694	\N	\N	\N	f	1	\N
a239ac68-031a-47fa-bc6e-189d9978b322	72034c1c-12dd-41c0-8649-d5af3055395c	22976d4f-f1e0-4740-bded-3305bb176116	2026-06-19 23:35:55.299003	\N	\N	\N	f	1	\N
4b16d484-90af-44b3-93a5-cfd9c80a2a99	22b43bfe-1628-461c-9ef8-95a9a49bcca5	97a31d52-c731-40f3-bf17-86c3545dca7a	2026-06-24 01:23:02.462517	\N	\N	\N	f	1	\N
0e2fc397-2084-48cf-b5b2-6a3d0f908678	5b392f67-1e5d-4a5d-a275-c96fdb3e4936	f3854086-c550-471c-ab67-e454b2ec589e	2026-06-24 01:55:41.716217	\N	\N	\N	f	1	\N
0bd786e9-2e77-46be-bce7-ec2f9b0eb10f	72034c1c-12dd-41c0-8649-d5af3055395c	22976d4f-f1e0-4740-bded-3305bb176116	2026-06-29 16:00:33.038726	\N	\N	\N	f	1	\N
3988743e-1c51-4e4e-8377-4bd7567cb73f	417d1cb7-321e-4093-b294-b413c8946797	7d08f36d-2830-4d1a-ab4d-74763c0d785b	2026-07-01 18:48:53.996931	\N	\N	\N	f	1	\N
3afdf41b-4268-48e6-bb97-f0b9c1e16c77	f5640c2c-e015-4a81-ac6d-e13608d58e67	b25aff6e-1859-4612-b1a1-846335b8364a	2026-07-03 22:13:40.909745	\N	228	\N	t	1	75
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usuarios (id, firebase_uid, email, nombre, racha_actual, racha_maxima, ultimo_entrenamiento, created_at, password_hash, reset_token, reset_token_expiry) FROM stdin;
417d1cb7-321e-4093-b294-b413c8946797	jose246495@gmail.com	jose246495@gmail.com	jose quintero	0	0	\N	2026-06-19 04:42:02.905398	$2b$12$exWdT0Phekf5trfjtCl7..MU8F7O7zcd1bvbhN2AcKagRJ4MEbXQm	\N	\N
72034c1c-12dd-41c0-8649-d5af3055395c	lu.gomezv@duocuc.cl	lu.gomezv@duocuc.cl	LUIS MANUEL GOMEZ VALERY	0	0	\N	2026-06-19 23:33:41.388097	$2b$12$1/pbLOu6GKzixwhDdBhFtOvMIAfvYYBVKPeLxTAUf.p.6yo6z.S0C	\N	\N
22b43bfe-1628-461c-9ef8-95a9a49bcca5	nacho17hs@gmail.com	nacho17hs@gmail.com	Manuel Hidalgo	0	0	\N	2026-06-24 01:22:41.416101	$2b$12$wtavkWJBLMrzORZd5.EEH.nnSKGd4lMaHxAMKumvsPTOCqXfg5IOG	\N	\N
5b392f67-1e5d-4a5d-a275-c96fdb3e4936	antoniobarraza1133@gmail.com	antoniobarraza1133@gmail.com	benjamin	0	0	\N	2026-06-24 01:53:58.794997	$2b$12$MzBAq2tdkGvhkE3EcWBwc.ozLkAzBBfpfFlaM14PIJ0q2sQ3kS28.	\N	\N
f5640c2c-e015-4a81-ac6d-e13608d58e67	jo.quintero@duocuc.cl	jo.quintero@duocuc.cl	Pruebas Jose	0	0	\N	2026-07-01 23:28:01.919313	$2b$12$McP0pVZlRaAkHTH80wGoy.JjzNClLkpqckuKyI1JLf1uA1oiAojGy	\N	\N
23417f06-2b15-40bb-9bd0-a928aa22bdeb	luis@gmail.com	luis@gmail.com	luis Gomez	0	0	\N	2026-07-03 22:19:16.132765	$2b$12$RmeASE66hliOlllSe4WDVewaOPX0McuSWugcZvwbyN3lehePDHcmK	\N	\N
\.


--
-- Name: dias_rutina dias_rutina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dias_rutina
    ADD CONSTRAINT dias_rutina_pkey PRIMARY KEY (id);


--
-- Name: ejercicios_catalogo ejercicios_catalogo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ejercicios_catalogo
    ADD CONSTRAINT ejercicios_catalogo_pkey PRIMARY KEY (id);


--
-- Name: ejercicios_catalogo ejercicios_catalogo_tipo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ejercicios_catalogo
    ADD CONSTRAINT ejercicios_catalogo_tipo_key UNIQUE (tipo);


--
-- Name: ejercicios_dia ejercicios_dia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ejercicios_dia
    ADD CONSTRAINT ejercicios_dia_pkey PRIMARY KEY (id);


--
-- Name: onboarding onboarding_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding
    ADD CONSTRAINT onboarding_pkey PRIMARY KEY (id);


--
-- Name: progreso_usuario progreso_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.progreso_usuario
    ADD CONSTRAINT progreso_usuario_pkey PRIMARY KEY (id);


--
-- Name: progreso_usuario progreso_usuario_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.progreso_usuario
    ADD CONSTRAINT progreso_usuario_usuario_id_key UNIQUE (usuario_id);


--
-- Name: resultados_ejercicio resultados_ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resultados_ejercicio
    ADD CONSTRAINT resultados_ejercicio_pkey PRIMARY KEY (id);


--
-- Name: rutinas rutinas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rutinas
    ADD CONSTRAINT rutinas_pkey PRIMARY KEY (id);


--
-- Name: sesiones sesiones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_firebase_uid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_firebase_uid_key UNIQUE (firebase_uid);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: dias_rutina dias_rutina_rutina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dias_rutina
    ADD CONSTRAINT dias_rutina_rutina_id_fkey FOREIGN KEY (rutina_id) REFERENCES public.rutinas(id);


--
-- Name: ejercicios_dia ejercicios_dia_dia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ejercicios_dia
    ADD CONSTRAINT ejercicios_dia_dia_id_fkey FOREIGN KEY (dia_id) REFERENCES public.dias_rutina(id);


--
-- Name: onboarding onboarding_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding
    ADD CONSTRAINT onboarding_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: progreso_usuario progreso_usuario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.progreso_usuario
    ADD CONSTRAINT progreso_usuario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: resultados_ejercicio resultados_ejercicio_sesion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resultados_ejercicio
    ADD CONSTRAINT resultados_ejercicio_sesion_id_fkey FOREIGN KEY (sesion_id) REFERENCES public.sesiones(id);


--
-- Name: rutinas rutinas_onboarding_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rutinas
    ADD CONSTRAINT rutinas_onboarding_id_fkey FOREIGN KEY (onboarding_id) REFERENCES public.onboarding(id);


--
-- Name: rutinas rutinas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rutinas
    ADD CONSTRAINT rutinas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: sesiones sesiones_rutina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_rutina_id_fkey FOREIGN KEY (rutina_id) REFERENCES public.rutinas(id);


--
-- Name: sesiones sesiones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

\unrestrict ePUONPhXs7mfxlGaFOTLWt5Z7TdHSXpwsdJJe20mgC34CToZIa40E6JUmsJXidP

