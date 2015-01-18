--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO max;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO max;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO max;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO max;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO max;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO max;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO max;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO max;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO max;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO max;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO max;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO max;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cats_cat; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE cats_cat (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.cats_cat OWNER TO max;

--
-- Name: cats_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE cats_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cats_cat_id_seq OWNER TO max;

--
-- Name: cats_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE cats_cat_id_seq OWNED BY cats_cat.id;


--
-- Name: cats_catdata; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE cats_catdata (
    id integer NOT NULL,
    cat_id integer NOT NULL,
    photo character varying(100) NOT NULL,
    story text NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.cats_catdata OWNER TO max;

--
-- Name: cats_catdata_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE cats_catdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cats_catdata_id_seq OWNER TO max;

--
-- Name: cats_catdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE cats_catdata_id_seq OWNED BY cats_catdata.id;


--
-- Name: cats_vote; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE cats_vote (
    id integer NOT NULL,
    cat_data_id integer NOT NULL,
    cuteness_sum integer NOT NULL,
    num_votes integer NOT NULL,
    CONSTRAINT cats_vote_cuteness_sum_check CHECK ((cuteness_sum >= 0))
);


ALTER TABLE public.cats_vote OWNER TO max;

--
-- Name: cats_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE cats_vote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cats_vote_id_seq OWNER TO max;

--
-- Name: cats_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE cats_vote_id_seq OWNED BY cats_vote.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO max;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO max;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO max;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO max;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: max; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO max;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY cats_cat ALTER COLUMN id SET DEFAULT nextval('cats_cat_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY cats_catdata ALTER COLUMN id SET DEFAULT nextval('cats_catdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY cats_vote ALTER COLUMN id SET DEFAULT nextval('cats_vote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: max
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: max
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: max
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add cat	7	add_cat
20	Can change cat	7	change_cat
21	Can delete cat	7	delete_cat
22	Can add cat data	8	add_catdata
23	Can change cat data	8	change_catdata
24	Can delete cat data	8	delete_catdata
25	Can add vote	9	add_vote
26	Can change vote	9	change_vote
27	Can delete vote	9	delete_vote
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: max
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$uobvPG2S0QpO$3g2jIJDnf7ag0sO48HJOCMTA/W9RWm8CPzXojN3M3ms=	2014-03-18 19:57:18.822932-07	t	donna			forsythia@gmail.com	t	t	2014-02-18 01:01:08.679044-08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: max
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: max
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cats_cat; Type: TABLE DATA; Schema: public; Owner: max
--

COPY cats_cat (id, name, created) FROM stdin;
1	Max	2014-02-18 04:39:11.878993-08
2	Bramble	2014-02-18 04:41:38.064039-08
3	Foo	2014-03-01 04:57:32.212868-08
4	Torbie	2014-03-02 03:13:39.472006-08
5	Zank	2014-03-02 06:05:50.078038-08
6	Kenard	2014-03-02 06:07:09.841999-08
7	Burt	2014-03-02 06:08:17.275726-08
8	Zyla	2014-03-02 06:11:40.8202-08
9	Polly	2014-03-02 06:12:34.721373-08
10	Meriwether	2014-04-15 11:23:24.203251-07
11	Maggie	2014-04-15 11:24:17.385354-07
\.


--
-- Name: cats_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('cats_cat_id_seq', 11, true);


--
-- Data for Name: cats_catdata; Type: TABLE DATA; Schema: public; Owner: max
--

COPY cats_catdata (id, cat_id, photo, story, created) FROM stdin;
1	1	catimages/max1_1.jpg	One day Max took a nap on the game.	2014-02-19 23:01:44.926907-08
2	2	catimages/bramble1.jpg	Mixmaster Bramble$	2014-02-19 23:08:36.966779-08
3	1	catimages/max2.jpg	Max thinks the chair is comfortable.	2014-02-19 23:14:02.480979-08
4	2	catimages/bramble2.jpg	Bramble and Max have a snug.	2014-02-19 23:16:07.864499-08
5	1	catimages/max3.jpg	Max says, 'Hey, ladies!' after he came home from the hospital.	2014-02-19 23:18:19.930321-08
6	2	catimages/bramble3_1.jpg	Bramble meows at snow.	2014-02-19 23:19:55.033757-08
9	3	catimages/9.jpg	Foo decided she was the mom.	2014-03-01 05:34:34.424844-08
10	1	catimages/10.jpg	Max got huge!	2014-03-01 05:51:44.518193-08
11	3	catimages/0998_foo_just_woke_up.jpg	Foo just woke up from a nap on top of some cabinets.	2014-03-01 23:17:03.324441-08
12	4	catimages/12_1.jpg	Just a little baby <3	2014-03-02 03:13:39.518386-08
13	5	catimages/13_1.jpg	Zank wants to be your valentine.	2014-03-02 06:05:50.154906-08
14	6	catimages/14_1.jpg	Kenard helps with the laundry.	2014-03-02 06:07:09.853709-08
15	7	catimages/15.jpg	Burt poses with a plant.	2014-03-02 06:08:17.291162-08
16	1	catimages/16.jpg	Max has a secret hideout.	2014-03-02 06:09:39.945773-08
17	2	catimages/17.jpg	Bramble keeps it complicated.	2014-03-02 06:10:38.85737-08
18	8	catimages/18.jpg	Zyla was a cute kitten.	2014-03-02 06:11:40.838806-08
19	9	catimages/19.jpg	Polly stole my cellphone.	2014-03-02 06:12:34.739122-08
20	3	catimages/20.jpg	Foo is a baby and a snug.	2014-03-02 06:14:02.851691-08
21	5	catimages/21.jpg	Zank was a tubby little kitten.	2014-03-03 00:37:49.381637-08
22	5	catimages/22.jpg	Zank grew very large indeed.	2014-03-03 00:39:05.081838-08
23	3	catimages/23.jpg	<3	2014-03-03 00:40:49.922829-08
24	1	catimages/24.jpg	Max likes to play with sticks.	2014-03-18 19:10:12.8402-07
27	1	catimages/27.jpg	Donna loves Max and Max is a baby.	2014-03-18 19:27:37.54509-07
28	10	catimages/28.jpg	Meriwether has a helicopter purr.	2014-04-15 11:23:24.322233-07
29	11	catimages/29.jpg	Maggie was a rainbow kitten.	2014-04-15 11:24:17.386594-07
30	6	catimages/30.jpg	Ken is the best present.	2014-04-16 09:40:31.442596-07
31	2	catimages/31.jpg	She was just a little thing.	2014-05-09 13:21:07.49318-07
32	6	catimages/32.jpg	Kenard snuck into a small box.	2014-05-11 20:27:55.627688-07
\.


--
-- Name: cats_catdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('cats_catdata_id_seq', 32, true);


--
-- Data for Name: cats_vote; Type: TABLE DATA; Schema: public; Owner: max
--

COPY cats_vote (id, cat_data_id, cuteness_sum, num_votes) FROM stdin;
11	16	60	7
4	22	70	8
24	23	60	6
23	2	70	7
29	29	20	2
10	4	75	8
13	12	55	6
9	15	5	1
8	20	64	8
7	14	70	8
14	19	50	5
3	24	57	7
22	27	50	5
21	5	25	3
19	13	40	4
16	17	45	5
27	32	10	1
15	3	25	3
5	18	64	8
18	10	65	7
26	28	60	6
20	6	80	8
17	11	40	4
12	21	30	4
28	31	20	2
6	9	69	8
25	30	40	4
1	1	154	17
\.


--
-- Name: cats_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('cats_vote_id_seq', 29, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: max
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: max
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	cat	cats	cat
8	cat data	cats	catdata
9	vote	cats	vote
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: max
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
dgdeg44mdyftv8baq3nn0avj0ry0d6g0	NThlMjdkZjQzN2RmMjQzMmVlZDU3ZjIxMTc5MzQzNDQzZDMwZDg0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-03-05 23:31:41.746845-08
ioqajltf8senr4of3i8tqomejnv1hllj	NThlMjdkZjQzN2RmMjQzMmVlZDU3ZjIxMTc5MzQzNDQzZDMwZDg0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-03-15 00:28:47.528353-07
ljvl52sxll89ho1ve3k19t0q4sf96f0p	NThlMjdkZjQzN2RmMjQzMmVlZDU3ZjIxMTc5MzQzNDQzZDMwZDg0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-01 19:57:18.825102-07
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cats_cat_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY cats_cat
    ADD CONSTRAINT cats_cat_pkey PRIMARY KEY (id);


--
-- Name: cats_catdata_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY cats_catdata
    ADD CONSTRAINT cats_catdata_pkey PRIMARY KEY (id);


--
-- Name: cats_vote_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY cats_vote
    ADD CONSTRAINT cats_vote_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: max; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cats_catdata_cat_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX cats_catdata_cat_id ON cats_catdata USING btree (cat_id);


--
-- Name: cats_vote_cat_data_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX cats_vote_cat_data_id ON cats_vote USING btree (cat_data_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: max; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cats_catdata_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY cats_catdata
    ADD CONSTRAINT cats_catdata_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES cats_cat(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cats_vote_cat_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY cats_vote
    ADD CONSTRAINT cats_vote_cat_data_id_fkey FOREIGN KEY (cat_data_id) REFERENCES cats_catdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

