--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: activities; Type: TABLE; Schema: public; Owner: bradbell
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    name character varying,
    user_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE public.activities OWNER TO bradbell;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: bradbell
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO bradbell;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bradbell
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: bradbell
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO bradbell;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: bradbell
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO bradbell;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: bradbell
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO bradbell;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bradbell
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: did_its; Type: TABLE; Schema: public; Owner: bradbell
--

CREATE TABLE public.did_its (
    id bigint NOT NULL,
    user_id integer,
    activity_id integer,
    date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.did_its OWNER TO bradbell;

--
-- Name: did_its_id_seq; Type: SEQUENCE; Schema: public; Owner: bradbell
--

CREATE SEQUENCE public.did_its_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.did_its_id_seq OWNER TO bradbell;

--
-- Name: did_its_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bradbell
--

ALTER SEQUENCE public.did_its_id_seq OWNED BY public.did_its.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bradbell
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO bradbell;

--
-- Name: users; Type: TABLE; Schema: public; Owner: bradbell
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    password_digest character varying,
    streak integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying
);


ALTER TABLE public.users OWNER TO bradbell;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bradbell
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO bradbell;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bradbell
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: did_its id; Type: DEFAULT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.did_its ALTER COLUMN id SET DEFAULT nextval('public.did_its_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: bradbell
--

COPY public.activities (id, name, user_id, created_at, updated_at, category_id) FROM stdin;
1	yoga	1	2023-02-22 22:45:29.904312	2023-02-22 22:45:29.904312	\N
2	hike the M	1	2023-02-22 22:45:29.907181	2023-02-22 22:45:29.907181	\N
3	skateboard	1	2023-02-22 22:45:29.910314	2023-02-22 22:45:29.910314	\N
4	bicycle	1	2023-02-22 22:45:29.913147	2023-02-22 22:45:29.913147	\N
5	backcountry ski	1	2023-02-22 22:45:29.916766	2023-07-24 14:58:18.379464	1
6	ski big sky	1	2023-02-22 22:45:29.923814	2023-07-24 14:58:47.405642	1
7	ski bridger bowl	1	2023-02-22 22:45:29.92599	2023-07-24 14:59:04.179682	1
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: bradbell
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-02-22 22:45:29.586488	2023-02-22 22:45:29.586488
schema_sha1	69bf5e92f4275e5d349f710949ec88e775539401	2023-02-22 22:45:29.589798	2023-02-22 22:45:29.589798
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: bradbell
--

COPY public.categories (id, name, user_id, created_at, updated_at) FROM stdin;
1	Ski	1	2023-07-24 14:57:08.319794	2023-07-24 14:57:08.319794
\.


--
-- Data for Name: did_its; Type: TABLE DATA; Schema: public; Owner: bradbell
--

COPY public.did_its (id, user_id, activity_id, date, created_at, updated_at) FROM stdin;
1	1	1	2022-09-27	2023-02-22 22:45:29.943369	2023-02-22 22:45:29.943369
2	1	1	2022-09-28	2023-02-22 22:45:29.946632	2023-02-22 22:45:29.946632
3	1	1	2022-10-04	2023-02-22 22:45:29.950295	2023-02-22 22:45:29.950295
4	1	1	2022-10-05	2023-02-22 22:45:29.952884	2023-02-22 22:45:29.952884
5	1	1	2022-10-07	2023-02-22 22:45:29.955479	2023-02-22 22:45:29.955479
6	1	1	2022-10-10	2023-02-22 22:45:29.95811	2023-02-22 22:45:29.95811
7	1	1	2022-10-11	2023-02-22 22:45:29.961199	2023-02-22 22:45:29.961199
8	1	1	2022-10-13	2023-02-22 22:45:29.964037	2023-02-22 22:45:29.964037
9	1	1	2022-10-14	2023-02-22 22:45:29.967161	2023-02-22 22:45:29.967161
10	1	1	2022-10-20	2023-02-22 22:45:29.969652	2023-02-22 22:45:29.969652
11	1	1	2022-10-24	2023-02-22 22:45:29.972188	2023-02-22 22:45:29.972188
12	1	1	2022-10-25	2023-02-22 22:45:29.977208	2023-02-22 22:45:29.977208
13	1	1	2022-10-27	2023-02-22 22:45:29.980624	2023-02-22 22:45:29.980624
14	1	1	2022-10-31	2023-02-22 22:45:29.984122	2023-02-22 22:45:29.984122
15	1	1	2022-11-01	2023-02-22 22:45:29.986691	2023-02-22 22:45:29.986691
16	1	1	2022-11-02	2023-02-22 22:45:29.989675	2023-02-22 22:45:29.989675
17	1	1	2022-11-03	2023-02-22 22:45:29.993083	2023-02-22 22:45:29.993083
18	1	1	2022-11-04	2023-02-22 22:45:29.996361	2023-02-22 22:45:29.996361
19	1	1	2022-11-09	2023-02-22 22:45:29.999978	2023-02-22 22:45:29.999978
20	1	1	2022-11-10	2023-02-22 22:45:30.003591	2023-02-22 22:45:30.003591
21	1	1	2022-11-14	2023-02-22 22:45:30.012869	2023-02-22 22:45:30.012869
22	1	1	2022-11-15	2023-02-22 22:45:30.023091	2023-02-22 22:45:30.023091
23	1	1	2022-11-16	2023-02-22 22:45:30.048075	2023-02-22 22:45:30.048075
24	1	1	2022-11-21	2023-02-22 22:45:30.05189	2023-02-22 22:45:30.05189
25	1	1	2022-11-22	2023-02-22 22:45:30.054495	2023-02-22 22:45:30.054495
26	1	1	2022-11-28	2023-02-22 22:45:30.057063	2023-02-22 22:45:30.057063
27	1	1	2022-11-29	2023-02-22 22:45:30.060106	2023-02-22 22:45:30.060106
28	1	1	2022-11-30	2023-02-22 22:45:30.062754	2023-02-22 22:45:30.062754
29	1	1	2022-12-01	2023-02-22 22:45:30.066407	2023-02-22 22:45:30.066407
30	1	1	2022-12-05	2023-02-22 22:45:30.069634	2023-02-22 22:45:30.069634
31	1	1	2022-12-06	2023-02-22 22:45:30.072109	2023-02-22 22:45:30.072109
32	1	1	2022-12-08	2023-02-22 22:45:30.074908	2023-02-22 22:45:30.074908
33	1	1	2022-12-09	2023-02-22 22:45:30.077423	2023-02-22 22:45:30.077423
34	1	1	2022-12-12	2023-02-22 22:45:30.080722	2023-02-22 22:45:30.080722
35	1	1	2022-12-13	2023-02-22 22:45:30.083982	2023-02-22 22:45:30.083982
36	1	1	2022-12-14	2023-02-22 22:45:30.086526	2023-02-22 22:45:30.086526
37	1	1	2022-12-15	2023-02-22 22:45:30.090016	2023-02-22 22:45:30.090016
38	1	1	2022-12-19	2023-02-22 22:45:30.093233	2023-02-22 22:45:30.093233
39	1	1	2022-12-20	2023-02-22 22:45:30.095727	2023-02-22 22:45:30.095727
40	1	1	2022-12-22	2023-02-22 22:45:30.098478	2023-02-22 22:45:30.098478
41	1	1	2022-12-26	2023-02-22 22:45:30.101837	2023-02-22 22:45:30.101837
42	1	1	2022-12-27	2023-02-22 22:45:30.105065	2023-02-22 22:45:30.105065
43	1	1	2022-12-29	2023-02-22 22:45:30.10807	2023-02-22 22:45:30.10807
44	1	1	2022-12-30	2023-02-22 22:45:30.11132	2023-02-22 22:45:30.11132
45	1	1	2023-01-03	2023-02-22 22:45:30.115575	2023-02-22 22:45:30.115575
46	1	1	2023-01-04	2023-02-22 22:45:30.118476	2023-02-22 22:45:30.118476
47	1	1	2023-01-05	2023-02-22 22:45:30.120969	2023-02-22 22:45:30.120969
48	1	1	2023-01-09	2023-02-22 22:45:30.123439	2023-02-22 22:45:30.123439
49	1	1	2023-01-11	2023-02-22 22:45:30.126795	2023-02-22 22:45:30.126795
50	1	1	2023-01-12	2023-02-22 22:45:30.133039	2023-02-22 22:45:30.133039
51	1	1	2023-01-13	2023-02-22 22:45:30.137294	2023-02-22 22:45:30.137294
52	1	1	2023-01-16	2023-02-22 22:45:30.139878	2023-02-22 22:45:30.139878
53	1	1	2023-01-17	2023-02-22 22:45:30.142857	2023-02-22 22:45:30.142857
54	1	1	2023-01-19	2023-02-22 22:45:30.146351	2023-02-22 22:45:30.146351
55	1	1	2023-01-23	2023-02-22 22:45:30.148969	2023-02-22 22:45:30.148969
56	1	1	2023-01-25	2023-02-22 22:45:30.152157	2023-02-22 22:45:30.152157
57	1	1	2023-02-02	2023-02-22 22:45:30.154947	2023-02-22 22:45:30.154947
58	1	1	2023-02-03	2023-02-22 22:45:30.157431	2023-02-22 22:45:30.157431
59	1	1	2023-02-06	2023-02-22 22:45:30.161817	2023-02-22 22:45:30.161817
60	1	1	2023-02-08	2023-02-22 22:45:30.16453	2023-02-22 22:45:30.16453
61	1	1	2023-02-16	2023-02-22 22:45:30.167373	2023-02-22 22:45:30.167373
62	1	1	2023-02-17	2023-02-22 22:45:30.171331	2023-02-22 22:45:30.171331
63	1	1	2023-02-19	2023-02-22 22:45:30.173791	2023-02-22 22:45:30.173791
64	1	1	2023-02-21	2023-02-22 22:45:30.177195	2023-02-22 22:45:30.177195
66	1	2	2022-10-05	2023-02-22 22:45:30.183191	2023-02-22 22:45:30.183191
67	1	2	2022-10-16	2023-02-22 22:45:30.185869	2023-02-22 22:45:30.185869
68	1	2	2022-10-17	2023-02-22 22:45:30.188507	2023-02-22 22:45:30.188507
69	1	2	2022-10-28	2023-02-22 22:45:30.191584	2023-02-22 22:45:30.191584
70	1	2	2022-11-01	2023-02-22 22:45:30.19423	2023-02-22 22:45:30.19423
71	1	2	2023-01-06	2023-02-22 22:45:30.197017	2023-02-22 22:45:30.197017
72	1	3	2022-10-07	2023-02-22 22:45:30.20003	2023-02-22 22:45:30.20003
73	1	4	2022-11-18	2023-02-22 22:45:30.202806	2023-02-22 22:45:30.202806
74	1	4	2022-11-19	2023-02-22 22:45:30.205353	2023-02-22 22:45:30.205353
75	1	5	2022-11-06	2023-02-22 22:45:30.20806	2023-02-22 22:45:30.20806
76	1	5	2022-11-08	2023-02-22 22:45:30.211696	2023-02-22 22:45:30.211696
77	1	5	2022-11-11	2023-02-22 22:45:30.216345	2023-02-22 22:45:30.216345
78	1	5	2022-11-13	2023-02-22 22:45:30.219269	2023-02-22 22:45:30.219269
79	1	5	2022-11-26	2023-02-22 22:45:30.221907	2023-02-22 22:45:30.221907
80	1	5	2022-12-18	2023-02-22 22:45:30.224528	2023-02-22 22:45:30.224528
81	1	5	2022-12-31	2023-02-22 22:45:30.227166	2023-02-22 22:45:30.227166
82	1	5	2023-01-07	2023-02-22 22:45:30.230524	2023-02-22 22:45:30.230524
83	1	5	2023-01-25	2023-02-22 22:45:30.233527	2023-02-22 22:45:30.233527
84	1	5	2023-02-09	2023-02-22 22:45:30.236132	2023-02-22 22:45:30.236132
85	1	5	2023-02-18	2023-02-22 22:45:30.238774	2023-02-22 22:45:30.238774
86	1	6	2022-11-24	2023-02-22 22:45:30.241379	2023-02-22 22:45:30.241379
87	1	6	2022-12-03	2023-02-22 22:45:30.244052	2023-02-22 22:45:30.244052
88	1	7	2022-12-10	2023-02-22 22:45:30.246588	2023-02-22 22:45:30.246588
89	1	7	2022-12-17	2023-02-22 22:45:30.250195	2023-02-22 22:45:30.250195
90	1	7	2022-12-27	2023-02-22 22:45:30.252651	2023-02-22 22:45:30.252651
91	1	7	2023-01-02	2023-02-22 22:45:30.255127	2023-02-22 22:45:30.255127
92	1	7	2023-01-21	2023-02-22 22:45:30.257719	2023-02-22 22:45:30.257719
93	1	7	2023-01-27	2023-02-22 22:45:30.260254	2023-02-22 22:45:30.260254
94	1	7	2023-01-28	2023-02-22 22:45:30.262739	2023-02-22 22:45:30.262739
95	1	7	2023-02-11	2023-02-22 22:45:30.265592	2023-02-22 22:45:30.265592
96	1	7	2023-02-20	2023-02-22 22:45:30.268179	2023-02-22 22:45:30.268179
115	1	1	2023-02-22	2023-02-23 02:35:25.448691	2023-02-23 02:35:25.448691
117	1	1	2023-02-23	2023-02-26 21:06:36.266321	2023-02-26 21:06:36.266321
118	1	1	2023-02-24	2023-02-26 21:06:39.733519	2023-02-26 21:06:39.733519
119	1	2	2023-02-25	2023-02-26 21:06:50.262726	2023-02-26 21:06:50.262726
120	1	7	2023-02-25	2023-02-26 21:06:50.291324	2023-02-26 21:06:50.291324
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: bradbell
--

COPY public.schema_migrations (version) FROM stdin;
20221228191723
20221228185237
20221228185325
20221228191342
20221228191706
20230724144325
20230724144414
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bradbell
--

COPY public.users (id, name, password_digest, streak, created_at, updated_at, email) FROM stdin;
1	BB	$2a$12$af75JztnqJOVl9HO4Uqq9OwvpGErY38sDehvNaVYVLmpl7nJMv0X2	0	2023-02-22 22:45:29.883625	2023-02-22 22:45:29.883625	brad.bb.bell@gmail.com
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bradbell
--

SELECT pg_catalog.setval('public.activities_id_seq', 7, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bradbell
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: did_its_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bradbell
--

SELECT pg_catalog.setval('public.did_its_id_seq', 120, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bradbell
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: did_its did_its_pkey; Type: CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.did_its
    ADD CONSTRAINT did_its_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_activities_on_category_id; Type: INDEX; Schema: public; Owner: bradbell
--

CREATE INDEX index_activities_on_category_id ON public.activities USING btree (category_id);


--
-- Name: index_categories_on_user_id; Type: INDEX; Schema: public; Owner: bradbell
--

CREATE INDEX index_categories_on_user_id ON public.categories USING btree (user_id);


--
-- Name: activities fk_rails_8e4b6c5333; Type: FK CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT fk_rails_8e4b6c5333 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: categories fk_rails_b8e2f7adfc; Type: FK CONSTRAINT; Schema: public; Owner: bradbell
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_b8e2f7adfc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

