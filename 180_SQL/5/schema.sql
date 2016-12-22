--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: list; Type: TABLE; Schema: public; Owner: sunny
--

CREATE TABLE list (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE list OWNER TO sunny;

--
-- Name: list_id_seq; Type: SEQUENCE; Schema: public; Owner: sunny
--

CREATE SEQUENCE list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE list_id_seq OWNER TO sunny;

--
-- Name: list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunny
--

ALTER SEQUENCE list_id_seq OWNED BY list.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: sunny
--

CREATE TABLE todos (
    id integer NOT NULL,
    list_id integer NOT NULL,
    name text NOT NULL,
    completed boolean DEFAULT false NOT NULL
);


ALTER TABLE todos OWNER TO sunny;

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: sunny
--

CREATE SEQUENCE todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE todos_id_seq OWNER TO sunny;

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunny
--

ALTER SEQUENCE todos_id_seq OWNED BY todos.id;


--
-- Name: list id; Type: DEFAULT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY list ALTER COLUMN id SET DEFAULT nextval('list_id_seq'::regclass);


--
-- Name: todos id; Type: DEFAULT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY todos ALTER COLUMN id SET DEFAULT nextval('todos_id_seq'::regclass);


--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: sunny
--



--
-- Name: list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunny
--

SELECT pg_catalog.setval('list_id_seq', 1, false);


--
-- Data for Name: todos; Type: TABLE DATA; Schema: public; Owner: sunny
--



--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunny
--

SELECT pg_catalog.setval('todos_id_seq', 1, false);


--
-- Name: list list_name_key; Type: CONSTRAINT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY list
    ADD CONSTRAINT list_name_key UNIQUE (name);


--
-- Name: list list_pkey; Type: CONSTRAINT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY list
    ADD CONSTRAINT list_pkey PRIMARY KEY (id);


--
-- Name: todos todos_pkey; Type: CONSTRAINT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- Name: todos todos_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_list_id_fkey FOREIGN KEY (list_id) REFERENCES list(id);


--
-- PostgreSQL database dump complete
--

