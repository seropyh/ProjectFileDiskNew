--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10
-- Dumped by pg_dump version 11.10

-- Started on 2020-12-09 22:01:25

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 24609)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    uuid character varying(50) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    file_count integer,
    file_size bigint,
    name character varying(500) NOT NULL,
    path character varying(1000) NOT NULL,
    user_login character varying(50)
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24617)
-- Name: links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.links (
    uuid character varying(255) NOT NULL,
    create_time timestamp without time zone,
    link character varying(255),
    file_id character varying(50),
    user_login character varying(50)
);


ALTER TABLE public.links OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24625)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_name character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24630)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_login character varying(50) NOT NULL,
    user_name character varying(250) NOT NULL,
    user_password character varying(128) NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2830 (class 0 OID 24609)
-- Dependencies: 196
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (uuid, create_date, file_count, file_size, name, path, user_login) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 24617)
-- Dependencies: 197
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.links (uuid, create_time, link, file_id, user_login) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 24625)
-- Dependencies: 198
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_name, name) FROM stdin;
ROLE_ADMIN	Администратор
ROLE_USER	Пользователь
\.


--
-- TOC entry 2833 (class 0 OID 24630)
-- Dependencies: 199
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_login, user_name, user_password, role_name) FROM stdin;
admin	admin	$2a$10$5.yURMvWZBQ7xc/DEuc.UOdgiTG1IAFBxhe3ySgfnfch/S7KvtRQS	ROLE_ADMIN
\.


--
-- TOC entry 2698 (class 2606 OID 24616)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (uuid);


--
-- TOC entry 2700 (class 2606 OID 24624)
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (uuid);


--
-- TOC entry 2702 (class 2606 OID 24629)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_name);


--
-- TOC entry 2704 (class 2606 OID 24634)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_login);


--
-- TOC entry 2705 (class 2606 OID 24635)
-- Name: files fk5xm4tmwios4hcmn2xshrbx1w7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT fk5xm4tmwios4hcmn2xshrbx1w7 FOREIGN KEY (user_login) REFERENCES public.users(user_login);


--
-- TOC entry 2708 (class 2606 OID 24650)
-- Name: users fk6e7f1kfvvn2k48olww485qvo3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk6e7f1kfvvn2k48olww485qvo3 FOREIGN KEY (role_name) REFERENCES public.roles(role_name);


--
-- TOC entry 2707 (class 2606 OID 24645)
-- Name: links fk6fmuxu44gosnwac99l3gh4i9o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk6fmuxu44gosnwac99l3gh4i9o FOREIGN KEY (user_login) REFERENCES public.users(user_login);


--
-- TOC entry 2706 (class 2606 OID 24640)
-- Name: links fkcc6238ccyij8sheee8gwfbwm0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fkcc6238ccyij8sheee8gwfbwm0 FOREIGN KEY (file_id) REFERENCES public.files(uuid);


-- Completed on 2020-12-09 22:01:25

--
-- PostgreSQL database dump complete
--

