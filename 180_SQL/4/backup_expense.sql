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
-- Name: expenses; Type: TABLE; Schema: public; Owner: sunny
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo character varying(255) NOT NULL,
    created_on date DEFAULT now() NOT NULL,
    CONSTRAINT positive_value CHECK ((amount > 0.00))
);


ALTER TABLE expenses OWNER TO sunny;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: sunny
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO sunny;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunny
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: sunny
--

INSERT INTO expenses VALUES (2, 14.56, 'Pencils', '2016-12-19');
INSERT INTO expenses VALUES (3, 3.29, 'Coffee', '2016-12-19');
INSERT INTO expenses VALUES (4, 49.99, 'Text Editor', '2016-12-19');
INSERT INTO expenses VALUES (5, 3.59, 'More Coffee', '2016-12-20');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sunny
--

SELECT pg_catalog.setval('expenses_id_seq', 5, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: sunny
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

