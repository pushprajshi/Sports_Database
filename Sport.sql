--
-- PostgreSQL database dump
--

\restrict Av1IvKWHWpneYtgHkQZB1JsYaTvFsI7DsvRwZUQhmcK1gfRvIvFe4kag8HSh53m

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-29 19:15:13

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

--
-- TOC entry 12 (class 2615 OID 25061)
-- Name: s; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA s;


ALTER SCHEMA s OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 381 (class 1259 OID 25071)
-- Name: healthexpert; Type: TABLE; Schema: s; Owner: postgres
--

CREATE TABLE s.healthexpert (
    he_id integer NOT NULL,
    he_n character varying(100),
    he_e character varying(100),
    he_m character varying(10)
);


ALTER TABLE s.healthexpert OWNER TO postgres;

--
-- TOC entry 384 (class 1259 OID 25089)
-- Name: mapping; Type: TABLE; Schema: s; Owner: postgres
--

CREATE TABLE s.mapping (
    m_u_id integer NOT NULL,
    m_s_id integer NOT NULL
);


ALTER TABLE s.mapping OWNER TO postgres;

--
-- TOC entry 383 (class 1259 OID 25078)
-- Name: sport; Type: TABLE; Schema: s; Owner: postgres
--

CREATE TABLE s.sport (
    s_id integer NOT NULL,
    s_n character varying(100),
    s_he integer
);


ALTER TABLE s.sport OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 25063)
-- Name: user; Type: TABLE; Schema: s; Owner: postgres
--

CREATE TABLE s."user" (
    u_id integer NOT NULL,
    u_n character varying(100),
    u_e character varying(100),
    u_m character varying(10),
    u_a integer,
    CONSTRAINT user_u_a_check CHECK ((u_a < 61))
);


ALTER TABLE s."user" OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 25070)
-- Name: healthexpert_he_id_seq; Type: SEQUENCE; Schema: s; Owner: postgres
--

CREATE SEQUENCE s.healthexpert_he_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE s.healthexpert_he_id_seq OWNER TO postgres;

--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 380
-- Name: healthexpert_he_id_seq; Type: SEQUENCE OWNED BY; Schema: s; Owner: postgres
--

ALTER SEQUENCE s.healthexpert_he_id_seq OWNED BY s.healthexpert.he_id;


--
-- TOC entry 382 (class 1259 OID 25077)
-- Name: sport_s_id_seq; Type: SEQUENCE; Schema: s; Owner: postgres
--

CREATE SEQUENCE s.sport_s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE s.sport_s_id_seq OWNER TO postgres;

--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 382
-- Name: sport_s_id_seq; Type: SEQUENCE OWNED BY; Schema: s; Owner: postgres
--

ALTER SEQUENCE s.sport_s_id_seq OWNED BY s.sport.s_id;


--
-- TOC entry 378 (class 1259 OID 25062)
-- Name: user_u_id_seq; Type: SEQUENCE; Schema: s; Owner: postgres
--

CREATE SEQUENCE s.user_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE s.user_u_id_seq OWNER TO postgres;

--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 378
-- Name: user_u_id_seq; Type: SEQUENCE OWNED BY; Schema: s; Owner: postgres
--

ALTER SEQUENCE s.user_u_id_seq OWNED BY s."user".u_id;


--
-- TOC entry 5196 (class 2604 OID 25074)
-- Name: healthexpert he_id; Type: DEFAULT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.healthexpert ALTER COLUMN he_id SET DEFAULT nextval('s.healthexpert_he_id_seq'::regclass);


--
-- TOC entry 5197 (class 2604 OID 25081)
-- Name: sport s_id; Type: DEFAULT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.sport ALTER COLUMN s_id SET DEFAULT nextval('s.sport_s_id_seq'::regclass);


--
-- TOC entry 5195 (class 2604 OID 25066)
-- Name: user u_id; Type: DEFAULT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s."user" ALTER COLUMN u_id SET DEFAULT nextval('s.user_u_id_seq'::regclass);


--
-- TOC entry 5361 (class 0 OID 25071)
-- Dependencies: 381
-- Data for Name: healthexpert; Type: TABLE DATA; Schema: s; Owner: postgres
--

COPY s.healthexpert (he_id, he_n, he_e, he_m) FROM stdin;
1	a1	a1@gmail.com	123456789
2	ab2	ab2@gmail.com	123456789
3	ac3	ac3@gmail.com	123456789
4	ad4	ad4@gmail.com	123456789
5	ae5	ae5@gmail.com	123456789
6	af6	af6@gmail.com	123456789
\.


--
-- TOC entry 5364 (class 0 OID 25089)
-- Dependencies: 384
-- Data for Name: mapping; Type: TABLE DATA; Schema: s; Owner: postgres
--

COPY s.mapping (m_u_id, m_s_id) FROM stdin;
1	1
1	4
2	2
2	3
3	1
4	1
5	5
6	2
8	1
9	1
\.


--
-- TOC entry 5363 (class 0 OID 25078)
-- Dependencies: 383
-- Data for Name: sport; Type: TABLE DATA; Schema: s; Owner: postgres
--

COPY s.sport (s_id, s_n, s_he) FROM stdin;
1	Cricket	1
2	Football	5
3	Badminton	3
4	Hockey	1
5	Tennis	2
\.


--
-- TOC entry 5359 (class 0 OID 25063)
-- Dependencies: 379
-- Data for Name: user; Type: TABLE DATA; Schema: s; Owner: postgres
--

COPY s."user" (u_id, u_n, u_e, u_m, u_a) FROM stdin;
1	a	a@gmail.com	123456789	56
2	ab	ab@gmail.com	123456789	16
3	ac	ac@gmail.com	123456789	36
4	ad	ad@gmail.com	123456789	15
5	ae	ae@gmail.com	123456789	46
6	af	af@gmail.com	123456789	26
7	Am	am@gmail	456789123	25
8	pradeep	pradeep@gmail.com	123456789	30
9	pari	pari@gmail.com	123456789	20
\.


--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 380
-- Name: healthexpert_he_id_seq; Type: SEQUENCE SET; Schema: s; Owner: postgres
--

SELECT pg_catalog.setval('s.healthexpert_he_id_seq', 6, true);


--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 382
-- Name: sport_s_id_seq; Type: SEQUENCE SET; Schema: s; Owner: postgres
--

SELECT pg_catalog.setval('s.sport_s_id_seq', 5, true);


--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 378
-- Name: user_u_id_seq; Type: SEQUENCE SET; Schema: s; Owner: postgres
--

SELECT pg_catalog.setval('s.user_u_id_seq', 9, true);


--
-- TOC entry 5202 (class 2606 OID 25076)
-- Name: healthexpert healthexpert_pkey; Type: CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.healthexpert
    ADD CONSTRAINT healthexpert_pkey PRIMARY KEY (he_id);


--
-- TOC entry 5206 (class 2606 OID 25093)
-- Name: mapping mapping_pkey; Type: CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.mapping
    ADD CONSTRAINT mapping_pkey PRIMARY KEY (m_u_id, m_s_id);


--
-- TOC entry 5204 (class 2606 OID 25083)
-- Name: sport sport_pkey; Type: CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.sport
    ADD CONSTRAINT sport_pkey PRIMARY KEY (s_id);


--
-- TOC entry 5200 (class 2606 OID 25069)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (u_id);


--
-- TOC entry 5210 (class 2620 OID 25111)
-- Name: user after_user_insert; Type: TRIGGER; Schema: s; Owner: postgres
--

CREATE TRIGGER after_user_insert AFTER INSERT ON s."user" FOR EACH ROW EXECUTE FUNCTION public.insert_into_mapping();


--
-- TOC entry 5208 (class 2606 OID 25099)
-- Name: mapping mapping_m_s_id_fkey; Type: FK CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.mapping
    ADD CONSTRAINT mapping_m_s_id_fkey FOREIGN KEY (m_s_id) REFERENCES s.sport(s_id);


--
-- TOC entry 5209 (class 2606 OID 25094)
-- Name: mapping mapping_m_u_id_fkey; Type: FK CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.mapping
    ADD CONSTRAINT mapping_m_u_id_fkey FOREIGN KEY (m_u_id) REFERENCES s."user"(u_id);


--
-- TOC entry 5207 (class 2606 OID 25084)
-- Name: sport sport_s_he_fkey; Type: FK CONSTRAINT; Schema: s; Owner: postgres
--

ALTER TABLE ONLY s.sport
    ADD CONSTRAINT sport_s_he_fkey FOREIGN KEY (s_he) REFERENCES s.healthexpert(he_id);


-- Completed on 2025-09-29 19:15:14

--
-- PostgreSQL database dump complete
--

\unrestrict Av1IvKWHWpneYtgHkQZB1JsYaTvFsI7DsvRwZUQhmcK1gfRvIvFe4kag8HSh53m

