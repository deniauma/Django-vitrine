--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.vitrine_navigation DROP CONSTRAINT vitrine_navigation_link_page_id_3a248409_fk_vitrine_page_id;
ALTER TABLE ONLY public.vitrine_label DROP CONSTRAINT vitrine_label_label_page_id_113e8c87_fk_vitrine_page_id;
DROP INDEX public.vitrine_navigation_link_page_id_idx;
DROP INDEX public.vitrine_label_label_page_id_idx;
ALTER TABLE ONLY public.vitrine_page DROP CONSTRAINT vitrine_page_pkey;
ALTER TABLE ONLY public.vitrine_navigation DROP CONSTRAINT vitrine_navigation_pkey;
ALTER TABLE ONLY public.vitrine_label DROP CONSTRAINT vitrine_label_pkey;
ALTER TABLE ONLY public.vitrine_closingday DROP CONSTRAINT vitrine_closingday_pkey;
ALTER TABLE ONLY public.vitrine_appointment DROP CONSTRAINT vitrine_appointment_pkey;
DROP TABLE public.vitrine_page;
DROP SEQUENCE public.vitrine_page_id_seq;
DROP TABLE public.vitrine_navigation;
DROP SEQUENCE public.vitrine_navigation_id_seq;
DROP TABLE public.vitrine_label;
DROP SEQUENCE public.vitrine_label_id_seq;
DROP TABLE public.vitrine_closingday;
DROP SEQUENCE public.vitrine_closingday_id_seq;
DROP TABLE public.vitrine_appointment;
DROP SEQUENCE public.vitrine_appointment_id_seq;
SET search_path = public, pg_catalog;

--
-- Name: vitrine_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: deniauma
--

CREATE SEQUENCE vitrine_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vitrine_appointment_id_seq OWNER TO deniauma;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: vitrine_appointment; Type: TABLE; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE TABLE vitrine_appointment (
    id integer DEFAULT nextval('vitrine_appointment_id_seq'::regclass) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    validated boolean NOT NULL,
    details text NOT NULL,
    email character varying(150) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(30) NOT NULL
);


ALTER TABLE public.vitrine_appointment OWNER TO deniauma;

--
-- Name: vitrine_closingday_id_seq; Type: SEQUENCE; Schema: public; Owner: deniauma
--

CREATE SEQUENCE vitrine_closingday_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vitrine_closingday_id_seq OWNER TO deniauma;

--
-- Name: vitrine_closingday; Type: TABLE; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE TABLE vitrine_closingday (
    id integer DEFAULT nextval('vitrine_closingday_id_seq'::regclass) NOT NULL,
    date date NOT NULL,
    title character varying(40) NOT NULL
);


ALTER TABLE public.vitrine_closingday OWNER TO deniauma;

--
-- Name: vitrine_label_id_seq; Type: SEQUENCE; Schema: public; Owner: deniauma
--

CREATE SEQUENCE vitrine_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vitrine_label_id_seq OWNER TO deniauma;

--
-- Name: vitrine_label; Type: TABLE; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE TABLE vitrine_label (
    id integer DEFAULT nextval('vitrine_label_id_seq'::regclass) NOT NULL,
    label_place character varying(40) NOT NULL,
    label_text text NOT NULL,
    label_page_id integer NOT NULL
);


ALTER TABLE public.vitrine_label OWNER TO deniauma;

--
-- Name: vitrine_navigation_id_seq; Type: SEQUENCE; Schema: public; Owner: deniauma
--

CREATE SEQUENCE vitrine_navigation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vitrine_navigation_id_seq OWNER TO deniauma;

--
-- Name: vitrine_navigation; Type: TABLE; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE TABLE vitrine_navigation (
    id integer DEFAULT nextval('vitrine_navigation_id_seq'::regclass) NOT NULL,
    link_label character varying(400) NOT NULL,
    link_order integer NOT NULL,
    link_page_id integer NOT NULL
);


ALTER TABLE public.vitrine_navigation OWNER TO deniauma;

--
-- Name: vitrine_page_id_seq; Type: SEQUENCE; Schema: public; Owner: deniauma
--

CREATE SEQUENCE vitrine_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vitrine_page_id_seq OWNER TO deniauma;

--
-- Name: vitrine_page; Type: TABLE; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE TABLE vitrine_page (
    id integer DEFAULT nextval('vitrine_page_id_seq'::regclass) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    is_main_page boolean NOT NULL,
    page_slug character varying(400) NOT NULL,
    page_template character varying(400) NOT NULL
);


ALTER TABLE public.vitrine_page OWNER TO deniauma;

--
-- Data for Name: vitrine_appointment; Type: TABLE DATA; Schema: public; Owner: deniauma
--

COPY vitrine_appointment (id, start_date, end_date, validated, details, email, first_name, last_name, phone) FROM stdin;
2	2015-08-28 13:00:00+02	2015-08-28 14:30:00+02	t	ioyiyiy	joselle.ichu@gmail.com	Joselle	Michu	04 45 78 96 52
3	2015-08-28 17:00:00+02	2015-08-28 18:30:00+02	t	TEST	joselle.ichu@gmail.com	Joselle	Michu	04 45 78 96 52
4	2015-08-29 12:30:00+02	2015-08-29 14:00:00+02	t		p.michu@test.fr	Patrcik	Michu	04 85 45 78 96
1	2015-08-28 12:00:00+02	2015-08-28 12:59:00+02	f	rttr ertert	joselle.ichu@gmail.com	Joselle	Michu	04 45 78 96 52
\.


--
-- Name: vitrine_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deniauma
--

SELECT pg_catalog.setval('vitrine_appointment_id_seq', 4, true);


--
-- Data for Name: vitrine_closingday; Type: TABLE DATA; Schema: public; Owner: deniauma
--

COPY vitrine_closingday (id, date, title) FROM stdin;
1	2015-08-26	Absent
\.


--
-- Name: vitrine_closingday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deniauma
--

SELECT pg_catalog.setval('vitrine_closingday_id_seq', 1, true);


--
-- Data for Name: vitrine_label; Type: TABLE DATA; Schema: public; Owner: deniauma
--

COPY vitrine_label (id, label_place, label_text, label_page_id) FROM stdin;
1	T	<p>Bienvenue!</p>	1
2	C1	<p>A l'heure o&ugrave; l'&ecirc;tre humain recherche le naturel, le Reiki et le Magn&eacute;tisme r&eacute;pondent &agrave; cette attente l&eacute;gitime.<br /> <br /> Nombreuses sont les personnes qui s'interrogent sur les causes de leurs souffrances physiques et/ou morales...</p>\r\n<p>Il faut savoir que la tr&egrave;s grande majorit&eacute; des maladies physiques sont engendr&eacute;es par des "charges &eacute;motionnelles" que nous avons, &agrave; un moment ou un autre, int&eacute;rioris&eacute;es. La m&eacute;decine moderne nomme cette relation Corps-Esprit: &eacute;tats psychosomatiques. Cela est enseign&eacute; depuis des mill&eacute;naires par la M&eacute;decine Chinoise, entre autres.<br /> <br /> Si ces charges sont peu importantes, nous les &eacute;liminons; lorsque l'&eacute;motion a &eacute;t&eacute; importante et douloureuse, nous l'enfouissons au fond de nous-m&ecirc;mes; plus pr&eacute;cis&eacute;ment dans le ventre (l'expression "avoir des n&oelig;uds au ventre" n'est pas du tout anodine).<br /> <br /> A force de les y entasser, elles finissent par se manifester sous la forme de souffrances physiques; celles-ci peuvent &ecirc;tre l&eacute;g&egrave;res ou tr&egrave;s graves.<br /> <br /> Il faut, dans ce cas, commencer par traiter l'Effet, puis s'occuper de la Cause; en fait, pour retrouver un &eacute;quilibre tant physique que psychologique, il faut absolument se d&eacute;barrasser de ces charges &eacute;motionnelles qui vous p&eacute;nalisent dans votre vie de tous les jours.<br /> <br /> Lib&eacute;rez-Vous !<span>&nbsp;<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&Eacute;ric DENIAUD &nbsp;&nbsp; <br /></span></p>	1
3	T	<p><span><span><span><span>Le </span></span></span></span><span><span><span><span>Magn&eacute;tisme</span></span></span></span></p>	2
4	C1	<p><span><span><span><span>Quel int&eacute;r&ecirc;t pour Vous ?<br /> <br /> Je Vous le <strong>recommande</strong> pour deux raisons:</span></span></span> </span></p>\r\n<ul>\r\n<li><span><span><span><span><strong>S&eacute;ances pr&eacute;ventives:</strong> faites r&eacute;guli&egrave;rement, elles apportent: d&eacute;tente, &eacute;nergie, s&eacute;r&eacute;nit&eacute;, bien-&ecirc;tre et, surtout, une <strong>am&eacute;lioration</strong> sensible de votre &eacute;tat <strong>mental et physique</strong>;</span></span></span></span></li>\r\n<li><span><span><span><span><strong>S&eacute;ances curatives</strong>: ponctuelles, elles permettent de <strong>Vous soulager</strong> de diverses souffrances: d&eacute;pression, stress, mal-&ecirc;tre, anxi&eacute;t&eacute;, manque de confiance, insomnies, fatigue, douleurs, migraines, sciatiques, zona&hellip;</span></span></span></span></li>\r\n</ul>\r\n<p><span> <span> <span><span>Le magn&eacute;tisme est <strong>compl&eacute;mentaire</strong> &agrave; tous les traitements m&eacute;dicaux, <strong>naturel </strong>et sans contre-indication.<br /> <br /> Pour ce faire, je vous accueille dans un environnement <strong>calme et propice &agrave; la d&eacute;tente.</strong><br /> <br /> Je mets en toute simplicit&eacute;, &agrave; Votre service, ce que la <strong>Nature</strong> m'a donn&eacute;: le <strong>Magn&eacute;tisme</strong>. Ce don, je le <strong>renforce</strong> gr&acirc;ce &agrave; des <strong>techniques sino-japonaises</strong> utilis&eacute;es depuis des mill&eacute;naires: <strong>Reiki </strong>et Ki-magn&eacute;tisme.</span></span></span></span></p>	2
5	T	<p>S&eacute;ances et tarif:&nbsp; </p>	5
6	C1	<ul>\r\n<li>\r\n<p><span style="text-decoration: underline;">Reiki (Magn&eacute;tisme &eacute;nerg&eacute;tique):</span>&nbsp;&eacute;limination des charges &eacute;motionnelles, allergies, d&eacute;pression, angoisse, stress, phobie, mal-&ecirc;tre, nervosit&eacute;, insomnie, fatigue...</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p><span style="text-decoration: underline;">Massomagn&eacute;tisme complet:</span> travail &agrave; l'huile et magn&eacute;tisation des trois zones les plus sensibles: dos/&eacute;paules, ventre, visage/cou: d&eacute;tente physique et bien-&ecirc;tre...</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li><span style="text-decoration: underline;">Massomagn&eacute;tisme local:</span>&nbsp;douleurs, zona, sciatiques, cruralgies, migraines...</li>\r\n</ul>\r\n<p><br /> Prix de la s&eacute;ance d'une heure: 40 &euro;.<br /> <br /> D&eacute;placement &agrave; domicile: sur demande.<br /> <br /> Travail &agrave; distance sur photo: 40 &euro;.<br /> <br /> R&egrave;glement comptant par ch&egrave;que ou esp&egrave;ces.</p>	5
7	T	<p>Mes formations</p>	3
8	C1	<ul>\r\n<li>Praticien de Reiki et Ki-magn&eacute;tisme:\r\n<ul>\r\n<li><address>techniques sino-japonaises permettant le r&eacute;&eacute;quilibrage et le renforcement des &eacute;nergies du corps; ceci permettant de dynamiser les capacit&eacute;s de gu&eacute;rison de votre corps, et d'am&eacute;liorer votre moral.</address></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<div>Praticien des techniques de Tui Fa:</div>\r\n<ul>\r\n<li><address>pressions gliss&eacute;es sur les m&eacute;ridiens profonds, permettant de soulager les douleurs physiques.</address></li>\r\n</ul>\r\n</li>\r\n</ul>	3
9	T	<p>Voici ma pi&egrave;ce de travail:</p>	4
10	C1	<p>Je vous re&ccedil;ois en musique, dans une pi&egrave;ce calme et chaleureuse, qui vous relaxera; vous ressentirez soulagement, bien-&ecirc;tre et s&eacute;r&eacute;nit&eacute;.</p>	4
11	C2	<p><span class="text-green">Voici la liste de mes qualifications acquises durant mes formations dans le domaine du Reiki/Magn&eacute;tisme:</span></p>	3
12	C2	<p>Une salle d'attente, calme et accueillante, vous est propos&eacute;e &agrave; votre arriv&eacute;e.</p>	4
13	T	<p>Pour me contacter</p>	6
14	C1	<p>Vous pouvez me joindre par t&eacute;l&eacute;phone:</p>\r\n<ul>\r\n<li>T&eacute;l: 02 41 42 12 18</li>\r\n<li>Port: 06 87 49 33 99</li>\r\n</ul>\r\n<p>Localisation:</p>	6
15	C2	<p>Vous pouvez &eacute;galement me joindre par e-mail en remplissant le formulaire ci-dessous:</p>	6
\.


--
-- Name: vitrine_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deniauma
--

SELECT pg_catalog.setval('vitrine_label_id_seq', 15, true);


--
-- Data for Name: vitrine_navigation; Type: TABLE DATA; Schema: public; Owner: deniauma
--

COPY vitrine_navigation (id, link_label, link_order, link_page_id) FROM stdin;
1	Accueil	1	1
2	Présentation	2	2
3	Formation	3	3
4	Espace de travail	4	4
5	Séances et tarifs	5	5
6	Contact	6	6
\.


--
-- Name: vitrine_navigation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deniauma
--

SELECT pg_catalog.setval('vitrine_navigation_id_seq', 6, true);


--
-- Data for Name: vitrine_page; Type: TABLE DATA; Schema: public; Owner: deniauma
--

COPY vitrine_page (id, creation_date, last_modified, is_main_page, page_slug, page_template) FROM stdin;
1	2015-06-15 14:39:41+02	2015-08-18 08:16:08+02	t	accueil	accueil.html
2	2015-06-15 14:40:34+02	2015-06-15 14:40:34+02	f	presentation	index.html
3	2015-06-15 14:43:01+02	2015-08-17 07:35:46+02	f	formation	formation.html
4	2015-06-15 14:44:26+02	2015-08-17 07:35:58+02	f	espace-de-travail	espace.html
5	2015-06-15 14:45:04+02	2015-06-16 14:45:04+02	f	seances-et-tarifs	calendar.html
6	2015-06-15 14:45:55+02	2015-08-18 09:54:05+02	f	contact	contact.html
\.


--
-- Name: vitrine_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deniauma
--

SELECT pg_catalog.setval('vitrine_page_id_seq', 6, true);


--
-- Name: vitrine_appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: deniauma; Tablespace: 
--

ALTER TABLE ONLY vitrine_appointment
    ADD CONSTRAINT vitrine_appointment_pkey PRIMARY KEY (id);


--
-- Name: vitrine_closingday_pkey; Type: CONSTRAINT; Schema: public; Owner: deniauma; Tablespace: 
--

ALTER TABLE ONLY vitrine_closingday
    ADD CONSTRAINT vitrine_closingday_pkey PRIMARY KEY (id);


--
-- Name: vitrine_label_pkey; Type: CONSTRAINT; Schema: public; Owner: deniauma; Tablespace: 
--

ALTER TABLE ONLY vitrine_label
    ADD CONSTRAINT vitrine_label_pkey PRIMARY KEY (id);


--
-- Name: vitrine_navigation_pkey; Type: CONSTRAINT; Schema: public; Owner: deniauma; Tablespace: 
--

ALTER TABLE ONLY vitrine_navigation
    ADD CONSTRAINT vitrine_navigation_pkey PRIMARY KEY (id);


--
-- Name: vitrine_page_pkey; Type: CONSTRAINT; Schema: public; Owner: deniauma; Tablespace: 
--

ALTER TABLE ONLY vitrine_page
    ADD CONSTRAINT vitrine_page_pkey PRIMARY KEY (id);


--
-- Name: vitrine_label_label_page_id_idx; Type: INDEX; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE INDEX vitrine_label_label_page_id_idx ON vitrine_label USING btree (label_page_id);


--
-- Name: vitrine_navigation_link_page_id_idx; Type: INDEX; Schema: public; Owner: deniauma; Tablespace: 
--

CREATE INDEX vitrine_navigation_link_page_id_idx ON vitrine_navigation USING btree (link_page_id);


--
-- Name: vitrine_label_label_page_id_113e8c87_fk_vitrine_page_id; Type: FK CONSTRAINT; Schema: public; Owner: deniauma
--

ALTER TABLE ONLY vitrine_label
    ADD CONSTRAINT vitrine_label_label_page_id_113e8c87_fk_vitrine_page_id FOREIGN KEY (label_page_id) REFERENCES vitrine_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vitrine_navigation_link_page_id_3a248409_fk_vitrine_page_id; Type: FK CONSTRAINT; Schema: public; Owner: deniauma
--

ALTER TABLE ONLY vitrine_navigation
    ADD CONSTRAINT vitrine_navigation_link_page_id_3a248409_fk_vitrine_page_id FOREIGN KEY (link_page_id) REFERENCES vitrine_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

