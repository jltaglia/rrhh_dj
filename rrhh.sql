--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: personal_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_categorias (
    id bigint NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE public.personal_categorias OWNER TO postgres;

--
-- Name: personal_categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_categorias_id_seq OWNER TO postgres;

--
-- Name: personal_categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_categorias_id_seq OWNED BY public.personal_categorias.id;


--
-- Name: personal_est_civil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_est_civil (
    id bigint NOT NULL,
    descripcion character varying(15) NOT NULL
);


ALTER TABLE public.personal_est_civil OWNER TO postgres;

--
-- Name: personal_est_civil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_est_civil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_est_civil_id_seq OWNER TO postgres;

--
-- Name: personal_est_civil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_est_civil_id_seq OWNED BY public.personal_est_civil.id;


--
-- Name: personal_eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_eventos (
    id bigint NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE public.personal_eventos OWNER TO postgres;

--
-- Name: personal_eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_eventos_id_seq OWNER TO postgres;

--
-- Name: personal_eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_eventos_id_seq OWNED BY public.personal_eventos.id;


--
-- Name: personal_localidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_localidades (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    cp_localidad integer NOT NULL,
    id_provincia_id bigint NOT NULL
);


ALTER TABLE public.personal_localidades OWNER TO postgres;

--
-- Name: personal_localidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_localidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_localidades_id_seq OWNER TO postgres;

--
-- Name: personal_localidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_localidades_id_seq OWNED BY public.personal_localidades.id;


--
-- Name: personal_parentescos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_parentescos (
    id bigint NOT NULL,
    descripcion character varying(10) NOT NULL
);


ALTER TABLE public.personal_parentescos OWNER TO postgres;

--
-- Name: personal_parentescos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_parentescos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_parentescos_id_seq OWNER TO postgres;

--
-- Name: personal_parentescos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_parentescos_id_seq OWNED BY public.personal_parentescos.id;


--
-- Name: personal_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_personal (
    id bigint NOT NULL,
    foto character varying(100) NOT NULL,
    apellidos character varying(30) NOT NULL,
    nombres character varying(40) NOT NULL,
    documento character varying(8) NOT NULL,
    cuil character varying(11) NOT NULL,
    fecha_nacimiento date NOT NULL,
    fecha_ingreso date NOT NULL,
    fecha_egreso date,
    domicilio character varying(50) NOT NULL,
    tel character varying(15) NOT NULL,
    email character varying(254),
    saldo_licencia smallint NOT NULL,
    licencia_curso smallint NOT NULL,
    fecha_regreso date,
    id_categoria_id bigint NOT NULL,
    id_documento_id bigint NOT NULL,
    id_est_civil_id bigint NOT NULL,
    id_localidad_id bigint NOT NULL,
    id_provincia_id bigint NOT NULL
);


ALTER TABLE public.personal_personal OWNER TO postgres;

--
-- Name: personal_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_personal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_personal_id_seq OWNER TO postgres;

--
-- Name: personal_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_personal_id_seq OWNED BY public.personal_personal.id;


--
-- Name: personal_provincias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_provincias (
    id bigint NOT NULL,
    nombre character varying(31) NOT NULL
);


ALTER TABLE public.personal_provincias OWNER TO postgres;

--
-- Name: personal_provincias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_provincias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_provincias_id_seq OWNER TO postgres;

--
-- Name: personal_provincias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_provincias_id_seq OWNED BY public.personal_provincias.id;


--
-- Name: personal_tipo_doc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_tipo_doc (
    id bigint NOT NULL,
    descripcion character varying(10) NOT NULL
);


ALTER TABLE public.personal_tipo_doc OWNER TO postgres;

--
-- Name: personal_tipo_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_tipo_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_tipo_doc_id_seq OWNER TO postgres;

--
-- Name: personal_tipo_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_tipo_doc_id_seq OWNED BY public.personal_tipo_doc.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: personal_categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_categorias ALTER COLUMN id SET DEFAULT nextval('public.personal_categorias_id_seq'::regclass);


--
-- Name: personal_est_civil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_est_civil ALTER COLUMN id SET DEFAULT nextval('public.personal_est_civil_id_seq'::regclass);


--
-- Name: personal_eventos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_eventos ALTER COLUMN id SET DEFAULT nextval('public.personal_eventos_id_seq'::regclass);


--
-- Name: personal_localidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_localidades ALTER COLUMN id SET DEFAULT nextval('public.personal_localidades_id_seq'::regclass);


--
-- Name: personal_parentescos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_parentescos ALTER COLUMN id SET DEFAULT nextval('public.personal_parentescos_id_seq'::regclass);


--
-- Name: personal_personal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal ALTER COLUMN id SET DEFAULT nextval('public.personal_personal_id_seq'::regclass);


--
-- Name: personal_provincias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_provincias ALTER COLUMN id SET DEFAULT nextval('public.personal_provincias_id_seq'::regclass);


--
-- Name: personal_tipo_doc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_tipo_doc ALTER COLUMN id SET DEFAULT nextval('public.personal_tipo_doc_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add categorias	7	add_categorias
26	Can change categorias	7	change_categorias
27	Can delete categorias	7	delete_categorias
28	Can view categorias	7	view_categorias
29	Can add est_civil	8	add_est_civil
30	Can change est_civil	8	change_est_civil
31	Can delete est_civil	8	delete_est_civil
32	Can view est_civil	8	view_est_civil
33	Can add eventos	9	add_eventos
34	Can change eventos	9	change_eventos
35	Can delete eventos	9	delete_eventos
36	Can view eventos	9	view_eventos
37	Can add localidades	10	add_localidades
38	Can change localidades	10	change_localidades
39	Can delete localidades	10	delete_localidades
40	Can view localidades	10	view_localidades
41	Can add parentescos	11	add_parentescos
42	Can change parentescos	11	change_parentescos
43	Can delete parentescos	11	delete_parentescos
44	Can view parentescos	11	view_parentescos
45	Can add provincias	12	add_provincias
46	Can change provincias	12	change_provincias
47	Can delete provincias	12	delete_provincias
48	Can view provincias	12	view_provincias
49	Can add tipo_doc	13	add_tipo_doc
50	Can change tipo_doc	13	change_tipo_doc
51	Can delete tipo_doc	13	delete_tipo_doc
52	Can view tipo_doc	13	view_tipo_doc
53	Can add personal	14	add_personal
54	Can change personal	14	change_personal
55	Can delete personal	14	delete_personal
56	Can view personal	14	view_personal
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	personal	categorias
8	personal	est_civil
9	personal	eventos
10	personal	localidades
11	personal	parentescos
12	personal	provincias
13	personal	tipo_doc
14	personal	personal
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-10-23 16:37:27.428446-03
2	auth	0001_initial	2022-10-23 16:37:27.906234-03
3	admin	0001_initial	2022-10-23 16:37:28.000168-03
4	admin	0002_logentry_remove_auto_add	2022-10-23 16:37:28.009162-03
5	admin	0003_logentry_add_action_flag_choices	2022-10-23 16:37:28.02507-03
6	contenttypes	0002_remove_content_type_name	2022-10-23 16:37:28.043058-03
7	auth	0002_alter_permission_name_max_length	2022-10-23 16:37:28.052051-03
8	auth	0003_alter_user_email_max_length	2022-10-23 16:37:28.068039-03
9	auth	0004_alter_user_username_opts	2022-10-23 16:37:28.077033-03
10	auth	0005_alter_user_last_login_null	2022-10-23 16:37:28.092023-03
11	auth	0006_require_contenttypes_0002	2022-10-23 16:37:28.09502-03
12	auth	0007_alter_validators_add_error_messages	2022-10-23 16:37:28.104014-03
13	auth	0008_alter_user_username_max_length	2022-10-23 16:37:28.140988-03
14	auth	0009_alter_user_last_name_max_length	2022-10-23 16:37:28.149982-03
15	auth	0010_alter_group_name_max_length	2022-10-23 16:37:28.168969-03
16	auth	0011_update_proxy_permissions	2022-10-23 16:37:28.206942-03
17	auth	0012_alter_user_first_name_max_length	2022-10-23 16:37:28.218933-03
18	personal	0001_initial	2022-10-23 16:37:28.644805-03
19	sessions	0001_initial	2022-10-23 16:37:28.730259-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: personal_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_categorias (id, descripcion) FROM stdin;
1	1/2 OFICIAL
2	ADM. 1RA.
3	AYUDANTE
4	COCINERO
5	OFICIAL
6	VENDEDOR
\.


--
-- Data for Name: personal_est_civil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_est_civil (id, descripcion) FROM stdin;
1	CASADO
2	SOLTERO
3	CONCUBIN.
4	SEPARADO
5	DIVORCIADO
\.


--
-- Data for Name: personal_eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_eventos (id, descripcion) FROM stdin;
1	ACCIDENTE DE TRABAJO
2	CASAMIENTO
3	DEFUNCION
4	DESPIDO
5	ENFERMEDAD
6	FALTA SIN AVISO
7	LLEGADA TARDE
8	NACIMIENTO
9	RENUNCIA
10	SUSPENSION
11	VACACIONES
\.


--
-- Data for Name: personal_localidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_localidades (id, nombre, cp_localidad, id_provincia_id) FROM stdin;
26077020	Playa Union	9103	26
26077030	Rawson	9103	26
26077040	Trelew	9100	26
\.


--
-- Data for Name: personal_parentescos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_parentescos (id, descripcion) FROM stdin;
1	ESPOSA/O
2	HIJO/A
3	PADRE
4	MADRE
5	F/CARGO
\.


--
-- Data for Name: personal_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_personal (id, foto, apellidos, nombres, documento, cuil, fecha_nacimiento, fecha_ingreso, fecha_egreso, domicilio, tel, email, saldo_licencia, licencia_curso, fecha_regreso, id_categoria_id, id_documento_id, id_est_civil_id, id_localidad_id, id_provincia_id) FROM stdin;
1	fotos_pers/001_2022164000.jpg	JARAMILLO	NELSON TEODORO	20239146	20202391461	1969-02-06	1987-02-01	\N	ALBERDI 1656	0	 	30	2021	2021-10-02	4	1	2	26077030	26
2	fotos_pers/002_2022164000.png	MELLA	HECTOR RUBEN	17406898	23184068089	1965-01-22	1988-10-01	\N	ARTIGAS 38	0	 	32	2022	2022-05-10	5	1	1	26077030	26
3	fotos_pers/003_2022164000.png	VALSECCHI	JORGE EDGARDO	18028267	20180272775	1967-10-25	1994-01-03	\N	AV CENTENARIO 573	0	 	16	2019	2022-02-14	6	1	1	26077020	26
4	fotos_pers/004_2022025311.jpg	TAGLIARINI	JULIAN LISANDRO	23645093	20236450938	1973-11-11	1995-03-01	\N	AZCUENAGA 682 B MEDANOS CASA 2238	0	 	17	2010	2018-11-16	5	1	1	26077030	26
5	fotos_pers/005_2022164000.png	SUAREZ	JUAN MANUEL	20542521	20205485212	1968-11-09	1998-03-02	\N	B 490 VIV. - CASA N 4130	0	 	31	2021	2022-05-23	6	1	1	26077040	26
6	fotos_pers/006_2022025241.jpg	PES	FERNANDO MARTIN	23600802	20236409026	1973-12-08	1998-09-01	\N	B 490 VIV. CASA N 221	0	 	15	2012	2007-06-12	5	1	2	26077030	26
7	fotos_pers/007_2022164000.png	BUSTOS	ENZO DAMIAN	28703184	20285081848	1981-07-11	2006-03-15	\N	B AMEP CASA N 422	0	 	25	2021	2022-04-11	2	1	1	26077030	26
8	fotos_pers/008_2022164000.png	QUINTRAMAN	MATIAS	30580274	20305802743	1984-05-20	2006-07-01	\N	B LUIS VERNET CASA N 192	0	 	28	2021	2022-06-16	2	1	1	26077030	26
10	fotos_pers/010_2022025342.jpg	ARTEAGA	GUSTAVO ADRIAN	33398561	20333125614	1987-10-20	2010-04-01	\N	B MALVINAS ESC. 1 DPTO 322	0	 	22	2021	2022-01-31	2	1	1	26077030	26
9	fotos_pers/009_2022164000.png	MIGUEL	JUAN DAVID	45887154	20658871543	1991-06-14	2010-04-01	\N	BARRIO UPCN CASA 127	0	 	10	2021	2022-05-27	6	1	2	26077030	26
11	fotos_pers/011_2022164000.png	MALIQUEO	CESAR ADAN	34706378	23347064789	1989-10-19	2011-04-11	\N	COSTA RICA 1955	0	 	24	2021	2022-03-02	1	1	2	26077030	26
12	fotos_pers/012_2022164000.png	GONZALEZ	MARCOS ANTONIO	26288034	20262880447	1977-12-07	2011-11-17	\N	FACUNDO QUIROGA 1487 (A 16)	0	 	23	2021	2022-01-08	1	1	2	26077030	26
13	fotos_pers/013_2022164000.png	MANSILLA	PATRICIA DEL CARMEN	22700318	27227013184	1972-07-06	2012-07-13	\N	FIGUEROA LOPEZ 816 B RIO CHUBUT	0	 	8	2021	2022-01-08	2	1	2	26077030	26
14	fotos_pers/014_2022164000.png	SALAMANCA	FERERICO ELIAS GABRI	38536374	20385343740	1995-03-12	2014-11-26	\N	GREGORIO MAYO 2275	0	 	18	2022	2022-05-09	2	1	2	26077030	26
15	fotos_pers/015_2022164000.png	HIRIGOYEN	DIEGO FEDERICO	35172115	20351729156	1990-06-04	2019-06-17	\N	QUINTANA 1672	0	 	11	2022	2022-01-08	3	1	2	26077040	26
18	default.jpg	BELLIZZI	PABLO	11111111	20111111115	2001-01-01	2022-01-01	\N	asdasd	1234-5678	\N	14	2022	\N	3	2	2	26077030	66
\.


--
-- Data for Name: personal_provincias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_provincias (id, nombre) FROM stdin;
2	Ciudad Autonoma de Buenos Aires
6	Buenos Aires
10	Catamarca
14	Cordoba
18	Corrientes
22	Chaco
26	Chubut
30	Entre Rios
34	Formosa
38	Jujuy
42	La Pampa
46	La Rioja
50	Mendoza
54	Misiones
58	Neuquen
62	Rio Negro
66	Salta
70	San Juan
74	San Luis
78	Santa Cruz
82	Santa Fe
86	Santiago del Estero
90	Tucuman
94	Tierra del Fuego
\.


--
-- Data for Name: personal_tipo_doc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_tipo_doc (id, descripcion) FROM stdin;
1	DNI
2	LE
3	LC
4	CI
5	PASAPORTE
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: personal_categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_categorias_id_seq', 1, false);


--
-- Name: personal_est_civil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_est_civil_id_seq', 1, false);


--
-- Name: personal_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_eventos_id_seq', 1, false);


--
-- Name: personal_localidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_localidades_id_seq', 1, false);


--
-- Name: personal_parentescos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_parentescos_id_seq', 1, false);


--
-- Name: personal_personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_personal_id_seq', 18, true);


--
-- Name: personal_provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_provincias_id_seq', 1, false);


--
-- Name: personal_tipo_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_tipo_doc_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: personal_categorias personal_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_categorias
    ADD CONSTRAINT personal_categorias_pkey PRIMARY KEY (id);


--
-- Name: personal_est_civil personal_est_civil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_est_civil
    ADD CONSTRAINT personal_est_civil_pkey PRIMARY KEY (id);


--
-- Name: personal_eventos personal_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_eventos
    ADD CONSTRAINT personal_eventos_pkey PRIMARY KEY (id);


--
-- Name: personal_localidades personal_localidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_localidades
    ADD CONSTRAINT personal_localidades_pkey PRIMARY KEY (id);


--
-- Name: personal_parentescos personal_parentescos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_parentescos
    ADD CONSTRAINT personal_parentescos_pkey PRIMARY KEY (id);


--
-- Name: personal_personal personal_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal
    ADD CONSTRAINT personal_personal_pkey PRIMARY KEY (id);


--
-- Name: personal_provincias personal_provincias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_provincias
    ADD CONSTRAINT personal_provincias_pkey PRIMARY KEY (id);


--
-- Name: personal_tipo_doc personal_tipo_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_tipo_doc
    ADD CONSTRAINT personal_tipo_doc_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: personal_localidades_id_provincia_id_b5bdfd9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_localidades_id_provincia_id_b5bdfd9f ON public.personal_localidades USING btree (id_provincia_id);


--
-- Name: personal_personal_id_categoria_id_8cd498b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_personal_id_categoria_id_8cd498b4 ON public.personal_personal USING btree (id_categoria_id);


--
-- Name: personal_personal_id_documento_id_4aa2d0fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_personal_id_documento_id_4aa2d0fe ON public.personal_personal USING btree (id_documento_id);


--
-- Name: personal_personal_id_est_civil_id_cf0f5f5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_personal_id_est_civil_id_cf0f5f5c ON public.personal_personal USING btree (id_est_civil_id);


--
-- Name: personal_personal_id_localidad_id_2c4a40a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_personal_id_localidad_id_2c4a40a3 ON public.personal_personal USING btree (id_localidad_id);


--
-- Name: personal_personal_id_provincia_id_8083b2cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_personal_id_provincia_id_8083b2cc ON public.personal_personal USING btree (id_provincia_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personal_localidades personal_localidades_id_provincia_id_b5bdfd9f_fk_personal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_localidades
    ADD CONSTRAINT personal_localidades_id_provincia_id_b5bdfd9f_fk_personal_ FOREIGN KEY (id_provincia_id) REFERENCES public.personal_provincias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personal_personal personal_personal_id_categoria_id_8cd498b4_fk_personal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal
    ADD CONSTRAINT personal_personal_id_categoria_id_8cd498b4_fk_personal_ FOREIGN KEY (id_categoria_id) REFERENCES public.personal_categorias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personal_personal personal_personal_id_documento_id_4aa2d0fe_fk_personal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal
    ADD CONSTRAINT personal_personal_id_documento_id_4aa2d0fe_fk_personal_ FOREIGN KEY (id_documento_id) REFERENCES public.personal_tipo_doc(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personal_personal personal_personal_id_est_civil_id_cf0f5f5c_fk_personal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal
    ADD CONSTRAINT personal_personal_id_est_civil_id_cf0f5f5c_fk_personal_ FOREIGN KEY (id_est_civil_id) REFERENCES public.personal_est_civil(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personal_personal personal_personal_id_localidad_id_2c4a40a3_fk_personal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal
    ADD CONSTRAINT personal_personal_id_localidad_id_2c4a40a3_fk_personal_ FOREIGN KEY (id_localidad_id) REFERENCES public.personal_localidades(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personal_personal personal_personal_id_provincia_id_8083b2cc_fk_personal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_personal
    ADD CONSTRAINT personal_personal_id_provincia_id_8083b2cc_fk_personal_ FOREIGN KEY (id_provincia_id) REFERENCES public.personal_provincias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

