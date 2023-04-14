--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    star_id integer,
    visible_nth boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovered text,
    shape text,
    constellation text NOT NULL,
    constellation_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    planet_id integer,
    distance text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    has_moon boolean,
    yr_len numeric(6,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    distance text,
    age_billion integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (2, 1, false, 'Centaurus');
INSERT INTO public.constellation VALUES (3, 1, true, 'Aries');
INSERT INTO public.constellation VALUES (4, 1, false, 'Sagittarius');
INSERT INTO public.constellation VALUES (5, 1, true, 'Cassiopeia');
INSERT INTO public.constellation VALUES (6, 2, true, 'Ursa Minor');
INSERT INTO public.constellation VALUES (7, 3, true, 'Gemini');
INSERT INTO public.constellation VALUES (8, 4, true, 'Orion');
INSERT INTO public.constellation VALUES (9, 5, false, 'Canis Major');
INSERT INTO public.constellation VALUES (10, 6, false, 'Scorpius');
INSERT INTO public.constellation VALUES (11, 7, true, 'Aquila');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward', '2001', 'spiral', 'Centaurus', 2);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', '1610', 'spiral', 'Cassiopeia', 5);
INSERT INTO public.galaxy VALUES (3, 'Condor', '1835', 'spiral', 'Gemini', 7);
INSERT INTO public.galaxy VALUES (4, 'Little Sombrero', '2001', 'spiral', 'Aquila', 11);
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', '1950', 'ring', 'Orion', 8);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', '1941', 'ring', 'Scorpius', 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, 4, '365476 km');
INSERT INTO public.moon VALUES (2, 'Phobos', 27, 3, '777 million km');
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 3, '777 million km');
INSERT INTO public.moon VALUES (4, 'Io', 1821, 5, '553 million km');
INSERT INTO public.moon VALUES (5, 'Europa', 1550, 5, '630 million km');
INSERT INTO public.moon VALUES (6, 'Ganymede', 2631, 5, '628 million km');
INSERT INTO public.moon VALUES (7, 'Callisto', 1821, 5, '628 million km');
INSERT INTO public.moon VALUES (8, 'Fenrir', 4, 6, NULL);
INSERT INTO public.moon VALUES (9, 'Hyperion', 84, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Janus', 90, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Pandora', 41, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Charon', 604, 11, '804 million km');
INSERT INTO public.moon VALUES (13, 'Hydra', 36, 11, '418 million km');
INSERT INTO public.moon VALUES (14, 'Kerberos', 5, 11, NULL);
INSERT INTO public.moon VALUES (15, 'Nix', 36, 11, '418 million km');
INSERT INTO public.moon VALUES (16, 'Styx', 7, 11, '418 million km');
INSERT INTO public.moon VALUES (17, 'Triton', 9242, 8, '350 million km');
INSERT INTO public.moon VALUES (18, 'Despina', 523, 8, '360 million km');
INSERT INTO public.moon VALUES (19, 'Larissa', 661, 8, '487 million km');
INSERT INTO public.moon VALUES (20, 'Proteus', 210, 8, '48 million km');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2, false, 88.00);
INSERT INTO public.planet VALUES (2, 'Venus', 2, false, 225.00);
INSERT INTO public.planet VALUES (3, 'Mars', 2, true, 687.00);
INSERT INTO public.planet VALUES (4, 'Earth', 2, true, 365.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, true, 4333.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, true, 9999.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, true, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, true, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 2, false, 1680.00);
INSERT INTO public.planet VALUES (10, 'Makemake', 2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Pluto', 2, true, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, true, NULL);
INSERT INTO public.planet VALUES (13, 'Eris', 2, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 'Cassiopeia', '000.1 light years', 5, 1);
INSERT INTO public.star VALUES (3, 'Polaris', 'Ursa Minor', '430 light years', 1, 1);
INSERT INTO public.star VALUES (4, 'Castor', 'Gemini', '51 light years', NULL, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Orion', '2000 light years', 250, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 'Canis Major', '8.6 light years', 12, 1);
INSERT INTO public.star VALUES (7, 'Altair', 'Aquila', '16.7 light years', 100, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_nam_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_nam_key UNIQUE (name);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

