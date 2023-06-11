--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

--
-- Name: status; Type: TYPE; Schema: public; Owner: aflahgmc
--

CREATE TYPE public.status AS ENUM (
    'sold',
    'rented'
);


ALTER TYPE public.status OWNER TO aflahgmc;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: agent; Type: TABLE; Schema: public; Owner: aflahgmc
--

CREATE TABLE public.agent (
    agent_id integer NOT NULL,
    username character varying(20) NOT NULL,
    password text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.agent OWNER TO aflahgmc;

--
-- Name: agent_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.agent_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_agent_id_seq OWNER TO aflahgmc;

--
-- Name: agent_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.agent_agent_id_seq OWNED BY public.agent.agent_id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: aflahgmc
--

CREATE TABLE public.properties (
    property_id integer NOT NULL,
    nama text NOT NULL,
    description character varying(20) NOT NULL,
    alamat text NOT NULL,
    luas text NOT NULL,
    harga bigint NOT NULL,
    jumlah_kamar integer NOT NULL,
    jumlah_kamar_mandi integer NOT NULL,
    agent_id integer NOT NULL,
    status public.status NOT NULL
);


ALTER TABLE public.properties OWNER TO aflahgmc;

--
-- Name: properties_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.properties_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_agent_id_seq OWNER TO aflahgmc;

--
-- Name: properties_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.properties_agent_id_seq OWNED BY public.properties.agent_id;


--
-- Name: properties_property_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.properties_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_property_id_seq OWNER TO aflahgmc;

--
-- Name: properties_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.properties_property_id_seq OWNED BY public.properties.property_id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: aflahgmc
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    user_id integer NOT NULL,
    agent_id integer NOT NULL,
    property_id integer NOT NULL,
    nama character varying(20) NOT NULL,
    tanggal_transaksi date DEFAULT CURRENT_DATE NOT NULL,
    harga integer NOT NULL,
    status public.status NOT NULL
);


ALTER TABLE public.transactions OWNER TO aflahgmc;

--
-- Name: transactions_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.transactions_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_agent_id_seq OWNER TO aflahgmc;

--
-- Name: transactions_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.transactions_agent_id_seq OWNED BY public.transactions.agent_id;


--
-- Name: transactions_property_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.transactions_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_property_id_seq OWNER TO aflahgmc;

--
-- Name: transactions_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.transactions_property_id_seq OWNED BY public.transactions.property_id;


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.transactions_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_transaction_id_seq OWNER TO aflahgmc;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;


--
-- Name: transactions_user_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.transactions_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_user_id_seq OWNER TO aflahgmc;

--
-- Name: transactions_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.transactions_user_id_seq OWNED BY public.transactions.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: aflahgmc
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(20) NOT NULL,
    password text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.users OWNER TO aflahgmc;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: aflahgmc
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO aflahgmc;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aflahgmc
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: agent agent_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.agent ALTER COLUMN agent_id SET DEFAULT nextval('public.agent_agent_id_seq'::regclass);


--
-- Name: properties property_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.properties ALTER COLUMN property_id SET DEFAULT nextval('public.properties_property_id_seq'::regclass);


--
-- Name: properties agent_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.properties ALTER COLUMN agent_id SET DEFAULT nextval('public.properties_agent_id_seq'::regclass);


--
-- Name: transactions transaction_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);


--
-- Name: transactions user_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions ALTER COLUMN user_id SET DEFAULT nextval('public.transactions_user_id_seq'::regclass);


--
-- Name: transactions agent_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions ALTER COLUMN agent_id SET DEFAULT nextval('public.transactions_agent_id_seq'::regclass);


--
-- Name: transactions property_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions ALTER COLUMN property_id SET DEFAULT nextval('public.transactions_property_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: aflahgmc
--

COPY public.agent (agent_id, username, password, email) FROM stdin;
5	aflah	$2a$10$u8RRypIbAbNp15TB1IAuA.D2INLnuIjtWG6eNAACF4M5wlZ2Xwm9O	bob123@gmail.com
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: aflahgmc
--

COPY public.properties (property_id, nama, description, alamat, luas, harga, jumlah_kamar, jumlah_kamar_mandi, agent_id, status) FROM stdin;
1	VINUS88 RESIDENCE\t	Rumah	Jl. Pinang Raya RT. 002 RW. 022 Pamulang Timur, Pamulang, Tangerang Selatan	40x40	800000000	2	2	5	sold
2	Sharon Residence	Rumah	Jl.Inspeksi Cidurian, Cileunyi, Bandung	50x50	1000000000	3	2	5	sold
3	Aquilla Valley\t	Rumah	Jl. AMD, Kuripan Cibentang, Ciseeng, Bogor	90x70	160000000	5	5	5	sold
4	Clarity House	Rumah	Jl. Ki Hajar Dewantara, Ciputat, Tangerang Selatan	140x140	220000000	5	5	5	sold
5	Aria Rempoa	Rumah	Pdk.Cempaka Rt.03,Rw.10, Rempoa, Ciputat Timur,Tangerang Selatan	80x80	1900000000	4	4	5	sold
6	Kemang Mansion Apartment N2703	Apartemen	Jl. Kemang Raya, Kemang, Jakarta Selatan	60x60	15000000	1	1	5	rented
7	Tokyo Riverside Apartment	Apartemen	Pantai Indah Kapuk, Jakarta Utara	21x21	8000000	1	1	5	rented
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: aflahgmc
--

COPY public.transactions (transaction_id, user_id, agent_id, property_id, nama, tanggal_transaksi, harga, status) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: aflahgmc
--

COPY public.users (user_id, username, password, email) FROM stdin;
4	aflah	aflah2003	aflahgmc@gmail.com
6	reva	$2a$10$wSZcWJce2tUjfzRM5I/ce.c7jPPH1.N5KEteIEGhukeEVJcGKs3Ku	reva@gmail.com
7	tes	$2a$10$BlC1buzhzmebeZIeQC7XfO0agbAj7sBtD38/LEiXMiJJ2g2tmTJMy	tes@gmail.com
10	undefined	$2a$10$lnKNQvrYSEk5lKvM4qBnquP0cJIRkVDp4g3AZub11v4B10RtkdLzC	tes2@gmail.com
13	tes3	$2a$10$BzsbuYitF6Ge3SFqXfPXBu5frwcOEGF6.E5tCeex2UKcmlLP1aGnu	tes3@gmail.com
14	tes4	$2a$10$8GUf0XOQ9JG01iZwfRuyNuXR3xygP3CaNTDY3KeGqlsdTvDf4TvNK	tes3@gmail.com
15	anto	$2a$10$p4ghg62OEx4UHWob1squxelfQQyJcngQgNcrPtzv3KZ9CohuuGkKS	anto@gmail.com
16	budi	$2a$10$hsqO1XTPUmvcLSzDskS.JuvWBpQyx5Ir5G6W6cxiwii.wtmenKAH.	budi@gmail.com
17	tes5	$2a$10$z96lZasZAF//AlTmcTh2M.Q07cQs9DiIQ0dPYpbaBfPyaM6HZr0BS	tes5@gmail.com
18	andi	$2a$10$hkMPLi9xeq.9hTEHQMm1weAy/7sZhIPfHeSdnDKF/Dz9.HsNDh0C6	andi@gmail.com
19	siti	$2a$10$pH5eQp6r0yVxxukaSYrmXuhTz6xIh2MzU8jbM3uBMPKhUaoi6xLDW	siti@gmail.com
\.


--
-- Name: agent_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.agent_agent_id_seq', 5, true);


--
-- Name: properties_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.properties_agent_id_seq', 1, false);


--
-- Name: properties_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.properties_property_id_seq', 7, true);


--
-- Name: transactions_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.transactions_agent_id_seq', 1, false);


--
-- Name: transactions_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.transactions_property_id_seq', 1, false);


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 3, true);


--
-- Name: transactions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.transactions_user_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aflahgmc
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: agent agent_pkey; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (agent_id);


--
-- Name: agent agent_username_key; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.agent
    ADD CONSTRAINT agent_username_key UNIQUE (username);


--
-- Name: properties properties_alamat_key; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_alamat_key UNIQUE (alamat);


--
-- Name: properties properties_nama_key; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_nama_key UNIQUE (nama);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (property_id);


--
-- Name: transactions transactions_nama_key; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_nama_key UNIQUE (nama);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: properties properties_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.agent(agent_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.agent(agent_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(property_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aflahgmc
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

