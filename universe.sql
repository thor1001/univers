--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    diameter_km integer NOT NULL,
    orbital_period_years integer,
    mass_earth numeric,
    composition text,
    is_spherical boolean,
    has_moons boolean
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_my integer NOT NULL,
    systems integer,
    diameter_ly numeric,
    description text,
    has_life boolean,
    is_spiral boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    diameter_km integer NOT NULL,
    orbital_period_days integer,
    mass_earth numeric,
    composition text,
    is_tidally_locked boolean,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    diameter_km integer NOT NULL,
    orbital_period_days integer,
    mass_earth numeric,
    atmosphere text,
    has_atmosphere boolean,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    temperature_k integer NOT NULL,
    luminosity integer,
    mass_solar numeric,
    spectral_type text,
    has_planets boolean,
    is_binary boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Plutoid1', 1, 2376, 248, 0.002, 'Ice-Rock', true, false);
INSERT INTO public.dwarf_planet VALUES (2, 'Plutoid2', 3, 2376, 248, 0.002, 'Ice-Rock', true, false);
INSERT INTO public.dwarf_planet VALUES (3, 'Plutoid3', 5, 2376, 248, 0.002, 'Ice-Rock', true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Aetheria', 13500, 200000, 120000.5, 'Vast spiral with numerous star-forming regions', true, true);
INSERT INTO public.galaxy VALUES (2, 'Nebulon', 8000, 150000, 90000.0, 'Dense nebula-filled elliptical galaxy', false, false);
INSERT INTO public.galaxy VALUES (3, 'Stellara', 15000, 300000, 150000.2, 'Barred spiral known for bright cores', true, true);
INSERT INTO public.galaxy VALUES (4, 'Cosmora', 10000, 100000, 80000.75, 'Irregular galaxy with chaotic star distribution', false, false);
INSERT INTO public.galaxy VALUES (5, 'Voidspire', 5000, 50000, 60000.3, 'Dark galaxy with sparse stars', false, false);
INSERT INTO public.galaxy VALUES (6, 'Luminara', 12000, 250000, 110000.9, 'Luminous spiral with active galactic nucleus', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 1, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (2, 'Moon2', 1, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (3, 'Moon3', 2, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (4, 'Moon4', 2, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (5, 'Moon5', 2, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (6, 'Moon6', 3, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (7, 'Moon7', 4, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (8, 'Moon8', 4, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (9, 'Moon9', 6, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (10, 'Moon10', 6, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (11, 'Moon11', 6, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (12, 'Moon12', 7, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (13, 'Moon13', 8, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (14, 'Moon14', 8, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (15, 'Moon15', 9, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (16, 'Moon16', 9, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (17, 'Moon17', 9, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (18, 'Moon18', 9, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (19, 'Moon19', 10, 3000, 27, 0.012, 'Silicate', true, false);
INSERT INTO public.moon VALUES (20, 'Moon20', 12, 3000, 27, 0.012, 'Silicate', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', 1, 12742, 365, 1.0, 'Nitrogen-Oxygen', true, true);
INSERT INTO public.planet VALUES (2, 'Aqua', 1, 15000, 400, 2.5, 'Water vapor', true, true);
INSERT INTO public.planet VALUES (3, 'Ignis', 2, 8000, 200, 0.5, 'CO2', true, false);
INSERT INTO public.planet VALUES (4, 'Ventus', 2, 10000, 500, 1.2, 'Hydrogen', true, false);
INSERT INTO public.planet VALUES (5, 'Lithos', 3, 6000, 100, 0.3, 'None', false, false);
INSERT INTO public.planet VALUES (6, 'Aether', 3, 12000, 300, 1.8, 'Methane', true, false);
INSERT INTO public.planet VALUES (7, 'Chronos', 4, 20000, 1000, 5.0, 'Helium', true, false);
INSERT INTO public.planet VALUES (8, 'Gaia', 4, 13000, 365, 1.1, 'N2-O2', true, true);
INSERT INTO public.planet VALUES (9, 'Helios', 5, 50000, 4000, 100.0, 'Hydrogen-Helium', true, false);
INSERT INTO public.planet VALUES (10, 'Selene', 5, 7000, 150, 0.4, 'Thin CO2', true, false);
INSERT INTO public.planet VALUES (11, 'Atlas', 6, 14000, 600, 3.0, 'Nitrogen', true, false);
INSERT INTO public.planet VALUES (12, 'Hera', 6, 11000, 250, 0.9, 'Oxygen-rich', true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Solara', 1, 5800, 1, 1.0, 'G2V', true, false);
INSERT INTO public.star VALUES (2, 'Pulsara', 2, 25000, 10000, 20.5, 'O5V', true, false);
INSERT INTO public.star VALUES (3, 'Nova', 3, 3500, 0, 0.5, 'M5V', true, true);
INSERT INTO public.star VALUES (4, 'Quasar', 4, 10000, 500, 5.2, 'A0V', true, false);
INSERT INTO public.star VALUES (5, 'Eclipse', 5, 4000, 0, 0.8, 'K2V', true, false);
INSERT INTO public.star VALUES (6, 'Zenith', 6, 7000, 10, 1.8, 'F5V', true, true);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--