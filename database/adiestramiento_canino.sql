--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-04 16:02:30

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
-- TOC entry 226 (class 1259 OID 16484)
-- Name: ejercicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ejercicio (
    id integer NOT NULL,
    plan_id integer,
    nombre character varying(100) NOT NULL,
    descripcion text,
    orden integer
);


ALTER TABLE public.ejercicio OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: ejercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ejercicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ejercicio_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 225
-- Name: ejercicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ejercicio_id_seq OWNED BY public.ejercicio.id;


--
-- TOC entry 222 (class 1259 OID 16463)
-- Name: perros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perros (
    id integer NOT NULL,
    usuario_id integer,
    nombre character varying(100) NOT NULL,
    raza character varying(100),
    edad integer
);


ALTER TABLE public.perros OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16462)
-- Name: perro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perro_id_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 221
-- Name: perro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perro_id_seq OWNED BY public.perros.id;


--
-- TOC entry 224 (class 1259 OID 16475)
-- Name: plan_entrenamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_entrenamiento (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    nivel character varying(50),
    descripcion text
);


ALTER TABLE public.plan_entrenamiento OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16474)
-- Name: plan_entrenamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_entrenamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plan_entrenamiento_id_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 223
-- Name: plan_entrenamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_entrenamiento_id_seq OWNED BY public.plan_entrenamiento.id;


--
-- TOC entry 228 (class 1259 OID 16498)
-- Name: progreso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progreso (
    id integer NOT NULL,
    perro_id integer,
    ejercicio_id integer,
    completado boolean DEFAULT false,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.progreso OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16497)
-- Name: progreso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.progreso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.progreso_id_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 227
-- Name: progreso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.progreso_id_seq OWNED BY public.progreso.id;


--
-- TOC entry 220 (class 1259 OID 16454)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    contrasena character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16453)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100),
    email character varying(100) NOT NULL,
    contrasena character varying(255) NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4772 (class 2604 OID 16487)
-- Name: ejercicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejercicio ALTER COLUMN id SET DEFAULT nextval('public.ejercicio_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 16466)
-- Name: perros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perros ALTER COLUMN id SET DEFAULT nextval('public.perro_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16478)
-- Name: plan_entrenamiento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_entrenamiento ALTER COLUMN id SET DEFAULT nextval('public.plan_entrenamiento_id_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 16501)
-- Name: progreso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progreso ALTER COLUMN id SET DEFAULT nextval('public.progreso_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 16457)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 16393)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4950 (class 0 OID 16484)
-- Dependencies: 226
-- Data for Name: ejercicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ejercicio (id, plan_id, nombre, descripcion, orden) FROM stdin;
1	1	Sentarse	El perro debe sentarse al recibir la orden.	1
2	1	Dar la pata	El perro debe ofrecer la pata.	2
3	1	Venir	El perro debe venir al ser llamado.	3
4	1	Permanecer	El perro debe quedarse quieto en su sitio.	4
5	2	Buscar objeto	El perro debe buscar y traer un objeto.	1
6	2	Ignorar comida	El perro debe ignorar comida del suelo.	2
7	2	Caminar junto	El perro debe caminar sin tirar de la correa.	3
8	2	Reacción a ruidos	No alterarse ante sonidos fuertes.	4
\.


--
-- TOC entry 4946 (class 0 OID 16463)
-- Dependencies: 222
-- Data for Name: perros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perros (id, usuario_id, nombre, raza, edad) FROM stdin;
1	1	Sara	Pastor Alemán	3
2	2	Luna	Labrador	2
3	3	Max	Bulldog Francés	1
4	4	Nala	Border Collie	4
\.


--
-- TOC entry 4948 (class 0 OID 16475)
-- Dependencies: 224
-- Data for Name: plan_entrenamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_entrenamiento (id, nombre, nivel, descripcion) FROM stdin;
1	Plan Básico	Básico	Ejercicios básicos para cachorrros y perros sin experiencia
2	Plan Avanazado	Avanzado	Entrenamiento para perros con experiencia
\.


--
-- TOC entry 4952 (class 0 OID 16498)
-- Dependencies: 228
-- Data for Name: progreso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progreso (id, perro_id, ejercicio_id, completado, fecha) FROM stdin;
1	1	1	t	2025-06-02 00:00:00
2	1	2	t	2025-06-02 00:00:00
3	2	1	t	2025-06-02 00:00:00
4	2	4	f	2025-06-02 00:00:00
5	3	5	t	2025-06-02 00:00:00
6	4	6	t	2025-06-02 00:00:00
7	4	7	f	2025-06-02 00:00:00
\.


--
-- TOC entry 4944 (class 0 OID 16454)
-- Dependencies: 220
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nombre, email, contrasena) FROM stdin;
1	Matheus Ferreira	matheus@woofyway.com	1234
2	Laura Gómez	laura@woofyway.com	abcd1234
3	Calor Ruiz	carlos@woofyway.com	abcd1234
4	Sara Martín	sara@woofyway.com	abcd1234
\.


--
-- TOC entry 4942 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, email, contrasena, fecha_registro) FROM stdin;
1	Matheus	matheus@woofyway.com	$2b$10$nrzOg99M5eQNrS7DcgUivuqfuR3cneb4RLm0VXR3qQV8wHoxg79Za	2025-04-22 00:06:50.591092
2	mathe	mathefc13@gmail.com	$2b$10$2P7n2Kx6XN/PWxx3d1R3/OR72FayZxAcOVAOdHultCmTHCneoXNj.	2025-06-04 00:17:44.0507
3			$2b$10$4g487yqHc0Axx9gB939LDODAGElMvr2JE9z/VQ2omwlJ9dep0dzSu	2025-06-04 00:24:05.675236
4	ejemplo	ejemplo@ejemplo.com	$2b$10$Y0YaiNStEZaFKqrYgey37.dWnHNDvghcdNXoZwrUyKomOqXibS0Ce	2025-06-04 01:47:07.728138
6	marisel	marisel@woofyway.com	$2b$10$T7wA3uJTrbVnIKukdDuTa.Fbz/aoupaCuPDwhcYrIROCbQVckL5cq	2025-06-04 10:03:05.615911
\.


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 225
-- Name: ejercicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ejercicio_id_seq', 8, true);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 221
-- Name: perro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perro_id_seq', 4, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 223
-- Name: plan_entrenamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_entrenamiento_id_seq', 2, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 227
-- Name: progreso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.progreso_id_seq', 7, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 4, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);


--
-- TOC entry 4789 (class 2606 OID 16491)
-- Name: ejercicio ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejercicio
    ADD CONSTRAINT ejercicio_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 16468)
-- Name: perros perro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perros
    ADD CONSTRAINT perro_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 16482)
-- Name: plan_entrenamiento plan_entrenamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_entrenamiento
    ADD CONSTRAINT plan_entrenamiento_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 16505)
-- Name: progreso progreso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progreso
    ADD CONSTRAINT progreso_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 16461)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 4783 (class 2606 OID 16459)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 16398)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 4779 (class 2606 OID 16396)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16492)
-- Name: ejercicio ejercicio_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejercicio
    ADD CONSTRAINT ejercicio_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plan_entrenamiento(id) ON DELETE CASCADE;


--
-- TOC entry 4792 (class 2606 OID 16469)
-- Name: perros perro_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perros
    ADD CONSTRAINT perro_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 4794 (class 2606 OID 16511)
-- Name: progreso progreso_ejercicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progreso
    ADD CONSTRAINT progreso_ejercicio_id_fkey FOREIGN KEY (ejercicio_id) REFERENCES public.ejercicio(id) ON DELETE CASCADE;


--
-- TOC entry 4795 (class 2606 OID 16506)
-- Name: progreso progreso_perro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progreso
    ADD CONSTRAINT progreso_perro_id_fkey FOREIGN KEY (perro_id) REFERENCES public.perros(id) ON DELETE CASCADE;


-- Completed on 2025-06-04 16:02:30

--
-- PostgreSQL database dump complete
--

