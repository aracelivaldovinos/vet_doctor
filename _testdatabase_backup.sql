--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: doctors; Type: TABLE; Schema: public; Owner: aracelivaldovinos
--

CREATE TABLE public.doctors (
    name character varying,
    specialty character varying,
    id integer NOT NULL
);


ALTER TABLE public.doctors OWNER TO aracelivaldovinos;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: aracelivaldovinos
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO aracelivaldovinos;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aracelivaldovinos
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: aracelivaldovinos
--

CREATE TABLE public.patients (
    name character varying,
    birthday timestamp without time zone,
    id integer NOT NULL,
    doctor_id integer
);


ALTER TABLE public.patients OWNER TO aracelivaldovinos;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: aracelivaldovinos
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO aracelivaldovinos;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aracelivaldovinos
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: aracelivaldovinos
--

COPY public.doctors (name, specialty, id) FROM stdin;
Bob		617
		618
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: aracelivaldovinos
--

COPY public.patients (name, birthday, id, doctor_id) FROM stdin;
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aracelivaldovinos
--

SELECT pg_catalog.setval('public.doctors_id_seq', 618, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aracelivaldovinos
--

SELECT pg_catalog.setval('public.patients_id_seq', 111, true);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

