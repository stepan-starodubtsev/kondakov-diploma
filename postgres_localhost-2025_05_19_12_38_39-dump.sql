--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_Maintenances_status; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Maintenances_status" AS ENUM (
    'EDITED',
    'PENDING',
    'APPROVED',
    'REJECTED',
    'NOT_CLOSED',
    'DONE'
);


ALTER TYPE public."enum_Maintenances_status" OWNER TO admin;

--
-- Name: enum_Maintenances_type; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Maintenances_type" AS ENUM (
    'TO1',
    'TO2',
    'SR',
    'SO'
);


ALTER TYPE public."enum_Maintenances_type" OWNER TO admin;

--
-- Name: enum_Repairs_status; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Repairs_status" AS ENUM (
    'EDITED',
    'PENDING',
    'APPROVED',
    'REJECTED',
    'NOT_CLOSED',
    'DONE'
);


ALTER TYPE public."enum_Repairs_status" OWNER TO admin;

--
-- Name: enum_Repairs_type; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Repairs_type" AS ENUM (
    'unplanned',
    'current',
    'medium',
    'capital'
);


ALTER TYPE public."enum_Repairs_type" OWNER TO admin;

--
-- Name: enum_Users_role; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Users_role" AS ENUM (
    'mainCommander',
    'commander',
    'admin',
    'MAIN_COMMANDER',
    'UNIT_COMMANDER',
    'COMMANDER',
    'ADMIN',
    'DUTY_STAFF'
);


ALTER TYPE public."enum_Users_role" OWNER TO admin;

--
-- Name: enum_VehicleComponents_componentType; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_VehicleComponents_componentType" AS ENUM (
    'engine',
    'УТПШТУ',
    'gearbox',
    'transmission',
    'ENGINE',
    'GEARBOX',
    'TRANSMISSION',
    'transfer_case',
    'CHASSIS',
    'BODY',
    'POWER_SYSTEM',
    'COOLING_SYSTEM',
    'BRAKE_SYSTEM',
    'MONITORING_SYSTEM',
    'FUEL_SYSTEM'
);


ALTER TYPE public."enum_VehicleComponents_componentType" OWNER TO admin;

--
-- Name: enum_VehicleComponents_conditionCategory; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_VehicleComponents_conditionCategory" AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


ALTER TYPE public."enum_VehicleComponents_conditionCategory" OWNER TO admin;

--
-- Name: enum_Vehicles_conditionCategory; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Vehicles_conditionCategory" AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


ALTER TYPE public."enum_Vehicles_conditionCategory" OWNER TO admin;

--
-- Name: enum_Vehicles_fuelType; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Vehicles_fuelType" AS ENUM (
    'A-80',
    'A-92',
    'A-95',
    'A-98',
    'DIESEL'
);


ALTER TYPE public."enum_Vehicles_fuelType" OWNER TO admin;

--
-- Name: enum_Vehicles_oilType; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Vehicles_oilType" AS ENUM (
    'М-10Г2к',
    'М-8Г2к/М-10Г2к',
    'М-10Г2к/М-10ДМ',
    'M-10Г2k',
    'M-10G2k',
    'M-8G2k/M-10G2k',
    'M-10G2k/M-10DM',
    '10W-40',
    '15W-40'
);


ALTER TYPE public."enum_Vehicles_oilType" OWNER TO admin;

--
-- Name: enum_Vehicles_operationGroup; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Vehicles_operationGroup" AS ENUM (
    'COMBAT',
    'DRILL',
    'TRAINING',
    'RESERVE'
);


ALTER TYPE public."enum_Vehicles_operationGroup" OWNER TO admin;

--
-- Name: enum_Vehicles_type; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public."enum_Vehicles_type" AS ENUM (
    'CAR',
    'BUS',
    'TRUCK'
);


ALTER TYPE public."enum_Vehicles_type" OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: LogEntries; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."LogEntries" (
    id integer NOT NULL,
    action character varying(255) NOT NULL,
    "entityType" character varying(255) NOT NULL,
    "entityId" integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public."LogEntries" OWNER TO admin;

--
-- Name: LogEntries_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."LogEntries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LogEntries_id_seq" OWNER TO admin;

--
-- Name: LogEntries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."LogEntries_id_seq" OWNED BY public."LogEntries".id;


--
-- Name: Maintenances; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Maintenances" (
    id integer NOT NULL,
    type public."enum_Maintenances_type" NOT NULL,
    date date NOT NULL,
    result text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "vehicleId" integer
);


ALTER TABLE public."Maintenances" OWNER TO admin;

--
-- Name: Maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Maintenances_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Maintenances_id_seq" OWNER TO admin;

--
-- Name: Maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Maintenances_id_seq" OWNED BY public."Maintenances".id;


--
-- Name: MileageLogs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."MileageLogs" (
    id integer NOT NULL,
    date date NOT NULL,
    mileage double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "vehicleId" integer,
    "mileageDifference" double precision NOT NULL
);


ALTER TABLE public."MileageLogs" OWNER TO admin;

--
-- Name: MileageLogs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."MileageLogs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."MileageLogs_id_seq" OWNER TO admin;

--
-- Name: MileageLogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."MileageLogs_id_seq" OWNED BY public."MileageLogs".id;


--
-- Name: RepairComponents; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."RepairComponents" (
    id integer NOT NULL,
    "workDescription" text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "repairId" integer,
    "vehicleComponentId" integer
);


ALTER TABLE public."RepairComponents" OWNER TO admin;

--
-- Name: RepairComponents_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."RepairComponents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RepairComponents_id_seq" OWNER TO admin;

--
-- Name: RepairComponents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."RepairComponents_id_seq" OWNED BY public."RepairComponents".id;


--
-- Name: Repairs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Repairs" (
    id integer NOT NULL,
    type public."enum_Repairs_type" NOT NULL,
    date date NOT NULL,
    "repairReasonText" text,
    "workDescription" text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "vehicleId" integer
);


ALTER TABLE public."Repairs" OWNER TO admin;

--
-- Name: Repairs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Repairs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Repairs_id_seq" OWNER TO admin;

--
-- Name: Repairs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Repairs_id_seq" OWNED BY public."Repairs".id;


--
-- Name: Units; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Units" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "commanderId" integer
);


ALTER TABLE public."Units" OWNER TO admin;

--
-- Name: Units_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Units_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Units_id_seq" OWNER TO admin;

--
-- Name: Units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Units_id_seq" OWNED BY public."Units".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    "passwordHash" character varying(255) NOT NULL,
    role public."enum_Users_role" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO admin;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO admin;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: VehicleComponents; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."VehicleComponents" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "componentType" public."enum_VehicleComponents_componentType" NOT NULL,
    "manufacturerNumber" character varying(255) NOT NULL,
    "manufacturedAt" date NOT NULL,
    "mileageSinceManufactured" double precision NOT NULL,
    "mileageAfterLastRepair" double precision NOT NULL,
    "annualResourceNorm" double precision NOT NULL,
    "maxResource" double precision NOT NULL,
    "conditionCategory" public."enum_VehicleComponents_conditionCategory" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "vehicleId" integer
);


ALTER TABLE public."VehicleComponents" OWNER TO admin;

--
-- Name: VehicleComponents_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."VehicleComponents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."VehicleComponents_id_seq" OWNER TO admin;

--
-- Name: VehicleComponents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."VehicleComponents_id_seq" OWNED BY public."VehicleComponents".id;


--
-- Name: Vehicles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Vehicles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type public."enum_Vehicles_type" NOT NULL,
    "licensePlate" character varying(255) NOT NULL,
    "manufacturerNumber" character varying(255) NOT NULL,
    "manufacturedAt" date NOT NULL,
    "operationGroup" public."enum_Vehicles_operationGroup" NOT NULL,
    "mileageSinceManufactured" double precision NOT NULL,
    "annualResourceNorm" double precision NOT NULL,
    "fuelType" public."enum_Vehicles_fuelType" NOT NULL,
    "oilType" public."enum_Vehicles_oilType" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "unitId" integer
);


ALTER TABLE public."Vehicles" OWNER TO admin;

--
-- Name: Vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Vehicles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Vehicles_id_seq" OWNER TO admin;

--
-- Name: Vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Vehicles_id_seq" OWNED BY public."Vehicles".id;


--
-- Name: LogEntries id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."LogEntries" ALTER COLUMN id SET DEFAULT nextval('public."LogEntries_id_seq"'::regclass);


--
-- Name: Maintenances id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Maintenances" ALTER COLUMN id SET DEFAULT nextval('public."Maintenances_id_seq"'::regclass);


--
-- Name: MileageLogs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."MileageLogs" ALTER COLUMN id SET DEFAULT nextval('public."MileageLogs_id_seq"'::regclass);


--
-- Name: RepairComponents id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."RepairComponents" ALTER COLUMN id SET DEFAULT nextval('public."RepairComponents_id_seq"'::regclass);


--
-- Name: Repairs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Repairs" ALTER COLUMN id SET DEFAULT nextval('public."Repairs_id_seq"'::regclass);


--
-- Name: Units id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Units" ALTER COLUMN id SET DEFAULT nextval('public."Units_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: VehicleComponents id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."VehicleComponents" ALTER COLUMN id SET DEFAULT nextval('public."VehicleComponents_id_seq"'::regclass);


--
-- Name: Vehicles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Vehicles" ALTER COLUMN id SET DEFAULT nextval('public."Vehicles_id_seq"'::regclass);


--
-- Data for Name: LogEntries; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: Maintenances; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (184, 'TO1', '2025-09-29', NULL, '2025-05-19 09:34:12.906+00', '2025-05-19 09:34:12.906+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (185, 'TO1', '2025-02-26', NULL, '2025-05-19 09:34:12.908+00', '2025-05-19 09:34:12.908+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (186, 'TO1', '2025-03-23', NULL, '2025-05-19 09:34:12.91+00', '2025-05-19 09:34:12.91+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (187, 'TO2', '2025-05-15', NULL, '2025-05-19 09:34:12.911+00', '2025-05-19 09:34:12.911+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (188, 'TO2', '2025-03-08', NULL, '2025-05-19 09:34:12.913+00', '2025-05-19 09:34:12.913+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (189, 'TO2', '2025-09-01', NULL, '2025-05-19 09:34:12.914+00', '2025-05-19 09:34:12.914+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (190, 'SO', '2025-11-14', NULL, '2025-05-19 09:34:12.916+00', '2025-05-19 09:34:12.916+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (191, 'SO', '2025-07-17', NULL, '2025-05-19 09:34:12.917+00', '2025-05-19 09:34:12.917+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (192, 'SO', '2025-04-06', NULL, '2025-05-19 09:34:12.919+00', '2025-05-19 09:34:12.919+00', 30);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (193, 'TO1', '2025-08-15', NULL, '2025-05-19 09:34:12.92+00', '2025-05-19 09:34:12.92+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (194, 'TO1', '2025-08-01', NULL, '2025-05-19 09:34:12.922+00', '2025-05-19 09:34:12.922+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (195, 'TO1', '2025-02-06', NULL, '2025-05-19 09:34:12.924+00', '2025-05-19 09:34:12.924+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (196, 'TO2', '2025-11-07', NULL, '2025-05-19 09:34:12.926+00', '2025-05-19 09:34:12.926+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (197, 'TO2', '2025-05-20', NULL, '2025-05-19 09:34:12.927+00', '2025-05-19 09:34:12.927+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (198, 'TO2', '2025-07-05', NULL, '2025-05-19 09:34:12.929+00', '2025-05-19 09:34:12.929+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (199, 'SO', '2025-01-18', NULL, '2025-05-19 09:34:12.931+00', '2025-05-19 09:34:12.931+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (200, 'SO', '2025-12-09', NULL, '2025-05-19 09:34:12.933+00', '2025-05-19 09:34:12.933+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (201, 'SO', '2025-06-24', NULL, '2025-05-19 09:34:12.934+00', '2025-05-19 09:34:12.934+00', 31);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (202, 'TO1', '2025-01-18', NULL, '2025-05-19 09:34:12.936+00', '2025-05-19 09:34:12.936+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (203, 'TO1', '2025-11-25', NULL, '2025-05-19 09:34:12.938+00', '2025-05-19 09:34:12.938+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (204, 'TO1', '2025-05-10', NULL, '2025-05-19 09:34:12.939+00', '2025-05-19 09:34:12.939+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (205, 'TO2', '2025-01-07', NULL, '2025-05-19 09:34:12.941+00', '2025-05-19 09:34:12.941+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (206, 'TO2', '2025-04-07', NULL, '2025-05-19 09:34:12.943+00', '2025-05-19 09:34:12.943+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (207, 'TO2', '2025-11-10', NULL, '2025-05-19 09:34:12.945+00', '2025-05-19 09:34:12.945+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (208, 'SO', '2025-09-02', NULL, '2025-05-19 09:34:12.946+00', '2025-05-19 09:34:12.946+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (209, 'SO', '2025-04-19', NULL, '2025-05-19 09:34:12.948+00', '2025-05-19 09:34:12.948+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (210, 'SO', '2025-10-05', NULL, '2025-05-19 09:34:12.95+00', '2025-05-19 09:34:12.95+00', 32);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (211, 'TO1', '2025-01-10', NULL, '2025-05-19 09:34:12.952+00', '2025-05-19 09:34:12.952+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (212, 'TO1', '2025-12-15', NULL, '2025-05-19 09:34:12.954+00', '2025-05-19 09:34:12.954+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (213, 'TO1', '2025-07-31', NULL, '2025-05-19 09:34:12.956+00', '2025-05-19 09:34:12.956+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (214, 'TO2', '2025-03-27', NULL, '2025-05-19 09:34:12.957+00', '2025-05-19 09:34:12.957+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (215, 'TO2', '2025-08-03', NULL, '2025-05-19 09:34:12.959+00', '2025-05-19 09:34:12.959+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (216, 'TO2', '2025-12-07', NULL, '2025-05-19 09:34:12.961+00', '2025-05-19 09:34:12.961+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (217, 'SO', '2025-07-15', NULL, '2025-05-19 09:34:12.963+00', '2025-05-19 09:34:12.963+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (218, 'SO', '2025-07-31', NULL, '2025-05-19 09:34:12.965+00', '2025-05-19 09:34:12.965+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (219, 'SO', '2025-11-20', NULL, '2025-05-19 09:34:12.966+00', '2025-05-19 09:34:12.966+00', 33);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (220, 'TO1', '2025-06-11', NULL, '2025-05-19 09:34:12.968+00', '2025-05-19 09:34:12.968+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (221, 'TO1', '2025-03-16', NULL, '2025-05-19 09:34:12.97+00', '2025-05-19 09:34:12.97+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (222, 'TO1', '2025-01-20', NULL, '2025-05-19 09:34:12.971+00', '2025-05-19 09:34:12.971+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (223, 'TO2', '2025-03-22', NULL, '2025-05-19 09:34:12.973+00', '2025-05-19 09:34:12.973+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (224, 'TO2', '2025-03-21', NULL, '2025-05-19 09:34:12.974+00', '2025-05-19 09:34:12.974+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (225, 'TO2', '2025-12-03', NULL, '2025-05-19 09:34:12.976+00', '2025-05-19 09:34:12.976+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (226, 'SO', '2025-11-22', NULL, '2025-05-19 09:34:12.977+00', '2025-05-19 09:34:12.977+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (227, 'SO', '2025-08-13', NULL, '2025-05-19 09:34:12.979+00', '2025-05-19 09:34:12.979+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (228, 'SO', '2025-03-07', NULL, '2025-05-19 09:34:12.98+00', '2025-05-19 09:34:12.98+00', 34);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (229, 'TO1', '2025-08-02', NULL, '2025-05-19 09:34:12.982+00', '2025-05-19 09:34:12.982+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (230, 'TO1', '2025-08-16', NULL, '2025-05-19 09:34:12.984+00', '2025-05-19 09:34:12.984+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (231, 'TO1', '2025-12-02', NULL, '2025-05-19 09:34:12.985+00', '2025-05-19 09:34:12.985+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (232, 'TO2', '2025-08-17', NULL, '2025-05-19 09:34:12.987+00', '2025-05-19 09:34:12.987+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (233, 'TO2', '2025-06-23', NULL, '2025-05-19 09:34:12.988+00', '2025-05-19 09:34:12.988+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (234, 'TO2', '2025-05-15', NULL, '2025-05-19 09:34:12.99+00', '2025-05-19 09:34:12.99+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (235, 'SO', '2025-06-30', NULL, '2025-05-19 09:34:12.991+00', '2025-05-19 09:34:12.991+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (236, 'SO', '2025-11-16', NULL, '2025-05-19 09:34:12.993+00', '2025-05-19 09:34:12.993+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (237, 'SO', '2025-03-23', NULL, '2025-05-19 09:34:12.995+00', '2025-05-19 09:34:12.995+00', 35);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (238, 'TO1', '2025-05-03', NULL, '2025-05-19 09:34:12.996+00', '2025-05-19 09:34:12.996+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (239, 'TO1', '2025-11-30', NULL, '2025-05-19 09:34:12.998+00', '2025-05-19 09:34:12.998+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (240, 'TO1', '2025-10-29', NULL, '2025-05-19 09:34:13+00', '2025-05-19 09:34:13+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (241, 'TO2', '2025-05-19', NULL, '2025-05-19 09:34:13.001+00', '2025-05-19 09:34:13.001+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (242, 'TO2', '2025-11-19', NULL, '2025-05-19 09:34:13.003+00', '2025-05-19 09:34:13.003+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (243, 'TO2', '2025-09-25', NULL, '2025-05-19 09:34:13.005+00', '2025-05-19 09:34:13.005+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (244, 'SO', '2025-05-01', NULL, '2025-05-19 09:34:13.006+00', '2025-05-19 09:34:13.006+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (245, 'SO', '2025-07-21', NULL, '2025-05-19 09:34:13.008+00', '2025-05-19 09:34:13.008+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (246, 'SO', '2025-01-25', NULL, '2025-05-19 09:34:13.01+00', '2025-05-19 09:34:13.01+00', 36);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (247, 'TO1', '2025-01-12', NULL, '2025-05-19 09:34:13.011+00', '2025-05-19 09:34:13.011+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (248, 'TO1', '2025-08-13', NULL, '2025-05-19 09:34:13.013+00', '2025-05-19 09:34:13.013+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (249, 'TO1', '2025-10-25', NULL, '2025-05-19 09:34:13.014+00', '2025-05-19 09:34:13.014+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (250, 'TO2', '2025-06-06', NULL, '2025-05-19 09:34:13.016+00', '2025-05-19 09:34:13.016+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (251, 'TO2', '2025-08-14', NULL, '2025-05-19 09:34:13.018+00', '2025-05-19 09:34:13.018+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (252, 'TO2', '2025-03-13', NULL, '2025-05-19 09:34:13.019+00', '2025-05-19 09:34:13.019+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (253, 'SO', '2025-01-03', NULL, '2025-05-19 09:34:13.021+00', '2025-05-19 09:34:13.021+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (254, 'SO', '2025-04-12', NULL, '2025-05-19 09:34:13.022+00', '2025-05-19 09:34:13.022+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (255, 'SO', '2025-12-03', NULL, '2025-05-19 09:34:13.024+00', '2025-05-19 09:34:13.024+00', 37);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (256, 'TO1', '2025-01-08', NULL, '2025-05-19 09:34:13.025+00', '2025-05-19 09:34:13.025+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (257, 'TO1', '2025-06-08', NULL, '2025-05-19 09:34:13.027+00', '2025-05-19 09:34:13.027+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (258, 'TO1', '2025-01-01', NULL, '2025-05-19 09:34:13.028+00', '2025-05-19 09:34:13.028+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (259, 'TO2', '2025-01-18', NULL, '2025-05-19 09:34:13.03+00', '2025-05-19 09:34:13.03+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (260, 'TO2', '2025-07-29', NULL, '2025-05-19 09:34:13.032+00', '2025-05-19 09:34:13.032+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (261, 'TO2', '2025-11-27', NULL, '2025-05-19 09:34:13.033+00', '2025-05-19 09:34:13.033+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (262, 'SO', '2025-07-26', NULL, '2025-05-19 09:34:13.035+00', '2025-05-19 09:34:13.035+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (263, 'SO', '2025-01-25', NULL, '2025-05-19 09:34:13.036+00', '2025-05-19 09:34:13.036+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (264, 'SO', '2025-05-08', NULL, '2025-05-19 09:34:13.038+00', '2025-05-19 09:34:13.038+00', 38);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (265, 'TO1', '2025-05-11', NULL, '2025-05-19 09:34:13.039+00', '2025-05-19 09:34:13.039+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (266, 'TO1', '2025-03-30', NULL, '2025-05-19 09:34:13.041+00', '2025-05-19 09:34:13.041+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (267, 'TO1', '2025-09-05', NULL, '2025-05-19 09:34:13.042+00', '2025-05-19 09:34:13.042+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (268, 'TO2', '2025-03-04', NULL, '2025-05-19 09:34:13.044+00', '2025-05-19 09:34:13.044+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (269, 'TO2', '2025-10-29', NULL, '2025-05-19 09:34:13.046+00', '2025-05-19 09:34:13.046+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (270, 'TO2', '2025-06-08', NULL, '2025-05-19 09:34:13.047+00', '2025-05-19 09:34:13.047+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (271, 'SO', '2025-08-14', NULL, '2025-05-19 09:34:13.049+00', '2025-05-19 09:34:13.049+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (272, 'SO', '2025-11-23', NULL, '2025-05-19 09:34:13.05+00', '2025-05-19 09:34:13.05+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (273, 'SO', '2025-01-20', NULL, '2025-05-19 09:34:13.052+00', '2025-05-19 09:34:13.052+00', 39);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (274, 'TO1', '2025-01-29', NULL, '2025-05-19 09:34:13.053+00', '2025-05-19 09:34:13.053+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (275, 'TO1', '2025-10-01', NULL, '2025-05-19 09:34:13.055+00', '2025-05-19 09:34:13.055+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (276, 'TO1', '2025-07-23', NULL, '2025-05-19 09:34:13.057+00', '2025-05-19 09:34:13.057+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (277, 'TO2', '2025-10-10', NULL, '2025-05-19 09:34:13.059+00', '2025-05-19 09:34:13.059+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (278, 'TO2', '2025-05-11', NULL, '2025-05-19 09:34:13.06+00', '2025-05-19 09:34:13.06+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (279, 'TO2', '2025-10-16', NULL, '2025-05-19 09:34:13.062+00', '2025-05-19 09:34:13.062+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (280, 'SO', '2025-07-29', NULL, '2025-05-19 09:34:13.063+00', '2025-05-19 09:34:13.063+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (281, 'SO', '2025-01-23', NULL, '2025-05-19 09:34:13.065+00', '2025-05-19 09:34:13.065+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (282, 'SO', '2025-02-07', NULL, '2025-05-19 09:34:13.067+00', '2025-05-19 09:34:13.067+00', 40);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (283, 'TO1', '2025-03-23', NULL, '2025-05-19 09:34:13.068+00', '2025-05-19 09:34:13.068+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (284, 'TO1', '2025-04-26', NULL, '2025-05-19 09:34:13.07+00', '2025-05-19 09:34:13.07+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (285, 'TO1', '2025-01-18', NULL, '2025-05-19 09:34:13.071+00', '2025-05-19 09:34:13.071+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (286, 'TO2', '2025-02-22', NULL, '2025-05-19 09:34:13.073+00', '2025-05-19 09:34:13.073+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (287, 'TO2', '2025-05-20', NULL, '2025-05-19 09:34:13.074+00', '2025-05-19 09:34:13.074+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (288, 'TO2', '2025-10-14', NULL, '2025-05-19 09:34:13.076+00', '2025-05-19 09:34:13.076+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (289, 'SO', '2025-08-02', NULL, '2025-05-19 09:34:13.078+00', '2025-05-19 09:34:13.078+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (290, 'SO', '2025-05-21', NULL, '2025-05-19 09:34:13.079+00', '2025-05-19 09:34:13.079+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (291, 'SO', '2025-03-31', NULL, '2025-05-19 09:34:13.081+00', '2025-05-19 09:34:13.081+00', 41);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (292, 'TO1', '2025-03-14', NULL, '2025-05-19 09:34:13.083+00', '2025-05-19 09:34:13.083+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (293, 'TO1', '2025-03-20', NULL, '2025-05-19 09:34:13.084+00', '2025-05-19 09:34:13.084+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (294, 'TO1', '2025-11-02', NULL, '2025-05-19 09:34:13.086+00', '2025-05-19 09:34:13.086+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (295, 'TO2', '2025-12-23', NULL, '2025-05-19 09:34:13.088+00', '2025-05-19 09:34:13.088+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (296, 'TO2', '2025-08-31', NULL, '2025-05-19 09:34:13.089+00', '2025-05-19 09:34:13.089+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (297, 'TO2', '2025-06-08', NULL, '2025-05-19 09:34:13.091+00', '2025-05-19 09:34:13.091+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (298, 'SO', '2025-10-11', NULL, '2025-05-19 09:34:13.092+00', '2025-05-19 09:34:13.092+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (299, 'SO', '2025-07-10', NULL, '2025-05-19 09:34:13.094+00', '2025-05-19 09:34:13.094+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (300, 'SO', '2025-03-29', NULL, '2025-05-19 09:34:13.096+00', '2025-05-19 09:34:13.096+00', 42);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (301, 'TO1', '2025-08-02', NULL, '2025-05-19 09:34:13.097+00', '2025-05-19 09:34:13.097+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (302, 'TO1', '2025-07-28', NULL, '2025-05-19 09:34:13.099+00', '2025-05-19 09:34:13.099+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (303, 'TO1', '2025-05-10', NULL, '2025-05-19 09:34:13.101+00', '2025-05-19 09:34:13.101+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (304, 'TO2', '2025-10-11', NULL, '2025-05-19 09:34:13.102+00', '2025-05-19 09:34:13.102+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (305, 'TO2', '2025-12-10', NULL, '2025-05-19 09:34:13.104+00', '2025-05-19 09:34:13.104+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (306, 'TO2', '2025-08-12', NULL, '2025-05-19 09:34:13.105+00', '2025-05-19 09:34:13.105+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (307, 'SO', '2025-02-10', NULL, '2025-05-19 09:34:13.107+00', '2025-05-19 09:34:13.107+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (308, 'SO', '2025-11-13', NULL, '2025-05-19 09:34:13.109+00', '2025-05-19 09:34:13.109+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (309, 'SO', '2025-05-19', NULL, '2025-05-19 09:34:13.11+00', '2025-05-19 09:34:13.11+00', 43);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (310, 'TO1', '2025-04-24', NULL, '2025-05-19 09:34:13.112+00', '2025-05-19 09:34:13.112+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (311, 'TO1', '2025-04-23', NULL, '2025-05-19 09:34:13.113+00', '2025-05-19 09:34:13.113+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (312, 'TO1', '2025-09-20', NULL, '2025-05-19 09:34:13.115+00', '2025-05-19 09:34:13.115+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (313, 'TO2', '2025-10-21', NULL, '2025-05-19 09:34:13.117+00', '2025-05-19 09:34:13.117+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (314, 'TO2', '2025-05-08', NULL, '2025-05-19 09:34:13.118+00', '2025-05-19 09:34:13.118+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (315, 'TO2', '2025-10-07', NULL, '2025-05-19 09:34:13.12+00', '2025-05-19 09:34:13.12+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (316, 'SO', '2025-12-12', NULL, '2025-05-19 09:34:13.121+00', '2025-05-19 09:34:13.121+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (317, 'SO', '2025-06-25', NULL, '2025-05-19 09:34:13.123+00', '2025-05-19 09:34:13.123+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (318, 'SO', '2025-10-05', NULL, '2025-05-19 09:34:13.125+00', '2025-05-19 09:34:13.125+00', 44);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (319, 'TO1', '2025-11-13', NULL, '2025-05-19 09:34:13.127+00', '2025-05-19 09:34:13.127+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (320, 'TO1', '2025-04-08', NULL, '2025-05-19 09:34:13.128+00', '2025-05-19 09:34:13.128+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (321, 'TO1', '2025-01-09', NULL, '2025-05-19 09:34:13.13+00', '2025-05-19 09:34:13.13+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (322, 'TO2', '2025-11-19', NULL, '2025-05-19 09:34:13.131+00', '2025-05-19 09:34:13.131+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (323, 'TO2', '2025-02-21', NULL, '2025-05-19 09:34:13.133+00', '2025-05-19 09:34:13.133+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (324, 'TO2', '2025-12-07', NULL, '2025-05-19 09:34:13.134+00', '2025-05-19 09:34:13.134+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (325, 'SO', '2025-03-10', NULL, '2025-05-19 09:34:13.136+00', '2025-05-19 09:34:13.136+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (326, 'SO', '2025-05-27', NULL, '2025-05-19 09:34:13.137+00', '2025-05-19 09:34:13.137+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (327, 'SO', '2025-07-02', NULL, '2025-05-19 09:34:13.139+00', '2025-05-19 09:34:13.139+00', 45);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (328, 'TO1', '2025-01-11', NULL, '2025-05-19 09:34:13.142+00', '2025-05-19 09:34:13.142+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (329, 'TO1', '2025-07-16', NULL, '2025-05-19 09:34:13.143+00', '2025-05-19 09:34:13.143+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (330, 'TO1', '2025-10-22', NULL, '2025-05-19 09:34:13.145+00', '2025-05-19 09:34:13.145+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (331, 'TO2', '2025-10-03', NULL, '2025-05-19 09:34:13.146+00', '2025-05-19 09:34:13.146+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (332, 'TO2', '2025-04-07', NULL, '2025-05-19 09:34:13.148+00', '2025-05-19 09:34:13.148+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (333, 'TO2', '2025-03-29', NULL, '2025-05-19 09:34:13.149+00', '2025-05-19 09:34:13.149+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (334, 'SO', '2025-03-06', NULL, '2025-05-19 09:34:13.151+00', '2025-05-19 09:34:13.151+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (335, 'SO', '2025-12-14', NULL, '2025-05-19 09:34:13.153+00', '2025-05-19 09:34:13.153+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (336, 'SO', '2025-05-01', NULL, '2025-05-19 09:34:13.154+00', '2025-05-19 09:34:13.154+00', 46);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (337, 'TO1', '2025-03-30', NULL, '2025-05-19 09:34:13.156+00', '2025-05-19 09:34:13.156+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (338, 'TO1', '2025-05-31', NULL, '2025-05-19 09:34:13.157+00', '2025-05-19 09:34:13.157+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (339, 'TO1', '2025-02-11', NULL, '2025-05-19 09:34:13.159+00', '2025-05-19 09:34:13.159+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (340, 'TO2', '2025-05-13', NULL, '2025-05-19 09:34:13.16+00', '2025-05-19 09:34:13.16+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (341, 'TO2', '2025-02-08', NULL, '2025-05-19 09:34:13.162+00', '2025-05-19 09:34:13.162+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (342, 'TO2', '2025-12-08', NULL, '2025-05-19 09:34:13.163+00', '2025-05-19 09:34:13.163+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (343, 'SO', '2025-04-05', NULL, '2025-05-19 09:34:13.165+00', '2025-05-19 09:34:13.165+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (344, 'SO', '2025-06-12', NULL, '2025-05-19 09:34:13.166+00', '2025-05-19 09:34:13.166+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (345, 'SO', '2025-02-02', NULL, '2025-05-19 09:34:13.168+00', '2025-05-19 09:34:13.168+00', 47);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (346, 'TO1', '2025-09-23', NULL, '2025-05-19 09:34:13.169+00', '2025-05-19 09:34:13.169+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (347, 'TO1', '2025-02-03', NULL, '2025-05-19 09:34:13.171+00', '2025-05-19 09:34:13.171+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (348, 'TO1', '2025-09-02', NULL, '2025-05-19 09:34:13.173+00', '2025-05-19 09:34:13.173+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (349, 'TO2', '2025-01-14', NULL, '2025-05-19 09:34:13.174+00', '2025-05-19 09:34:13.174+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (350, 'TO2', '2025-06-30', NULL, '2025-05-19 09:34:13.176+00', '2025-05-19 09:34:13.176+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (351, 'TO2', '2025-05-26', NULL, '2025-05-19 09:34:13.177+00', '2025-05-19 09:34:13.177+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (352, 'SO', '2025-07-30', NULL, '2025-05-19 09:34:13.179+00', '2025-05-19 09:34:13.179+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (353, 'SO', '2025-06-15', NULL, '2025-05-19 09:34:13.18+00', '2025-05-19 09:34:13.18+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (354, 'SO', '2025-03-25', NULL, '2025-05-19 09:34:13.182+00', '2025-05-19 09:34:13.182+00', 48);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (355, 'TO1', '2025-05-04', NULL, '2025-05-19 09:34:13.183+00', '2025-05-19 09:34:13.183+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (356, 'TO1', '2025-04-11', NULL, '2025-05-19 09:34:13.185+00', '2025-05-19 09:34:13.185+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (357, 'TO1', '2025-12-27', NULL, '2025-05-19 09:34:13.187+00', '2025-05-19 09:34:13.187+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (358, 'TO2', '2025-06-17', NULL, '2025-05-19 09:34:13.188+00', '2025-05-19 09:34:13.188+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (359, 'TO2', '2025-10-17', NULL, '2025-05-19 09:34:13.19+00', '2025-05-19 09:34:13.19+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (360, 'TO2', '2025-07-26', NULL, '2025-05-19 09:34:13.191+00', '2025-05-19 09:34:13.191+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (361, 'SO', '2025-09-02', NULL, '2025-05-19 09:34:13.193+00', '2025-05-19 09:34:13.193+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (362, 'SO', '2025-10-26', NULL, '2025-05-19 09:34:13.195+00', '2025-05-19 09:34:13.195+00', 49);
INSERT INTO public."Maintenances" (id, type, date, result, "createdAt", "updatedAt", "vehicleId") VALUES (363, 'SO', '2025-09-01', NULL, '2025-05-19 09:34:13.196+00', '2025-05-19 09:34:13.196+00', 49);


--
-- Data for Name: MileageLogs; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (119, '2021-05-27', 126845.1345422175, '2025-05-19 09:34:13.198+00', '2025-05-19 09:34:13.198+00', 30, 270.19288272756967);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (120, '2023-09-25', 127035.12349306808, '2025-05-19 09:34:13.198+00', '2025-05-19 09:34:13.198+00', 30, 189.98895085057302);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (121, '2024-07-12', 127124.48454103405, '2025-05-19 09:34:13.198+00', '2025-05-19 09:34:13.198+00', 30, 89.36104796596919);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (122, '2025-01-03', 127592.9658487768, '2025-05-19 09:34:13.198+00', '2025-05-19 09:34:13.198+00', 30, 468.4813077427534);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (123, '2016-11-15', 471402.2025361984, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 83.68657550716307);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (124, '2017-12-13', 471657.8771734131, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 255.67463721468812);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (125, '2022-02-05', 472072.8937951708, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 415.01662175770616);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (126, '2022-11-27', 472288.64438772027, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 215.7505925494479);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (127, '2024-02-21', 472703.7413801336, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 415.09699241333874);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (128, '2024-11-05', 472869.52473972656, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 165.7833595929551);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (129, '2025-01-14', 473266.16359854484, '2025-05-19 09:34:13.202+00', '2025-05-19 09:34:13.202+00', 31, 396.63885881827446);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (130, '2023-04-05', 299304.45621999225, '2025-05-19 09:34:13.204+00', '2025-05-19 09:34:13.204+00', 32, 391.1797866799752);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (131, '2025-04-23', 299691.6925386187, '2025-05-19 09:34:13.204+00', '2025-05-19 09:34:13.204+00', 32, 387.23631862644106);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (132, '2025-05-08', 299829.4546381367, '2025-05-19 09:34:13.204+00', '2025-05-19 09:34:13.204+00', 32, 137.7620995180332);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (133, '2025-05-18', 300271.44111890916, '2025-05-19 09:34:13.204+00', '2025-05-19 09:34:13.204+00', 32, 441.98648077243706);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (134, '2019-02-04', 44545.28284262252, '2025-05-19 09:34:13.206+00', '2025-05-19 09:34:13.206+00', 33, 473.61143548109976);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (135, '2024-11-25', 44643.22575508446, '2025-05-19 09:34:13.206+00', '2025-05-19 09:34:13.206+00', 33, 97.94291246194189);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (136, '2025-01-02', 45039.904340849134, '2025-05-19 09:34:13.206+00', '2025-05-19 09:34:13.206+00', 33, 396.6785857646755);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (137, '2019-04-14', 10614.124038978913, '2025-05-19 09:34:13.208+00', '2025-05-19 09:34:13.208+00', 34, 456.7491030515266);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (138, '2024-10-08', 10649.18489342527, '2025-05-19 09:34:13.208+00', '2025-05-19 09:34:13.208+00', 34, 35.06085444635755);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (139, '2025-03-22', 493245.9664523456, '2025-05-19 09:34:13.21+00', '2025-05-19 09:34:13.21+00', 35, 111.55400876246858);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (140, '2025-04-27', 493425.753220917, '2025-05-19 09:34:13.21+00', '2025-05-19 09:34:13.21+00', 35, 179.78676857141545);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (141, '2011-11-17', 195836.7299521296, '2025-05-19 09:34:13.211+00', '2025-05-19 09:34:13.211+00', 36, 263.81896363181295);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (142, '2013-07-26', 196131.08448533242, '2025-05-19 09:34:13.211+00', '2025-05-19 09:34:13.211+00', 36, 294.35453320282977);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (143, '2015-06-23', 196565.74732261928, '2025-05-19 09:34:13.211+00', '2025-05-19 09:34:13.211+00', 36, 434.6628372868581);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (144, '1996-11-27', 168859.58487101746, '2025-05-19 09:34:13.213+00', '2025-05-19 09:34:13.213+00', 37, 319.40686027446645);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (145, '2000-11-07', 169250.06882858422, '2025-05-19 09:34:13.213+00', '2025-05-19 09:34:13.213+00', 37, 390.48395756675745);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (146, '2006-07-30', 169412.68673158775, '2025-05-19 09:34:13.213+00', '2025-05-19 09:34:13.213+00', 37, 162.61790300352732);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (147, '2014-12-26', 169630.21801881614, '2025-05-19 09:34:13.213+00', '2025-05-19 09:34:13.213+00', 37, 217.53128722839756);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (148, '2023-10-15', 169916.71816403166, '2025-05-19 09:34:13.213+00', '2025-05-19 09:34:13.213+00', 37, 286.500145215512);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (149, '2002-02-25', 450514.9302039551, '2025-05-19 09:34:13.215+00', '2025-05-19 09:34:13.215+00', 38, 196.04755046154605);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (150, '2018-05-28', 450980.34525637294, '2025-05-19 09:34:13.215+00', '2025-05-19 09:34:13.215+00', 38, 465.41505241784034);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (151, '2023-08-30', 451212.5512970587, '2025-05-19 09:34:13.215+00', '2025-05-19 09:34:13.215+00', 38, 232.20604068576358);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (152, '2023-11-06', 451278.75237587356, '2025-05-19 09:34:13.215+00', '2025-05-19 09:34:13.215+00', 38, 66.20107881486183);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (153, '2012-10-18', 229296.91525414208, '2025-05-19 09:34:13.217+00', '2025-05-19 09:34:13.217+00', 39, 479.94615716979024);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (154, '2021-05-05', 229385.63548127995, '2025-05-19 09:34:13.217+00', '2025-05-19 09:34:13.217+00', 39, 88.72022713787737);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (155, '2022-02-19', 229617.6968975605, '2025-05-19 09:34:13.217+00', '2025-05-19 09:34:13.217+00', 39, 232.0614162805432);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (156, '2024-05-27', 229647.12390763173, '2025-05-19 09:34:13.217+00', '2025-05-19 09:34:13.217+00', 39, 29.427010071231052);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (157, '2024-12-04', 229689.06906505008, '2025-05-19 09:34:13.217+00', '2025-05-19 09:34:13.217+00', 39, 41.94515741834766);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (158, '2014-02-18', 451564.2393516865, '2025-05-19 09:34:13.22+00', '2025-05-19 09:34:13.22+00', 40, 80.28694758581696);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (159, '2017-11-30', 451659.97725845926, '2025-05-19 09:34:13.22+00', '2025-05-19 09:34:13.22+00', 40, 95.73790677275974);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (160, '2019-05-08', 451932.29620519496, '2025-05-19 09:34:13.22+00', '2025-05-19 09:34:13.22+00', 40, 272.3189467357006);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (161, '2024-11-09', 452274.67576367606, '2025-05-19 09:34:13.22+00', '2025-05-19 09:34:13.22+00', 40, 342.3795584811014);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (162, '2025-04-17', 452700.5172107083, '2025-05-19 09:34:13.22+00', '2025-05-19 09:34:13.22+00', 40, 425.8414470322314);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (163, '2002-04-28', 326952.73920462065, '2025-05-19 09:34:13.223+00', '2025-05-19 09:34:13.223+00', 41, 412.3385324583505);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (164, '2014-01-12', 327203.67118974717, '2025-05-19 09:34:13.223+00', '2025-05-19 09:34:13.223+00', 41, 250.93198512651725);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (165, '2014-08-09', 327423.27488381846, '2025-05-19 09:34:13.223+00', '2025-05-19 09:34:13.223+00', 41, 219.60369407129474);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (166, '2020-07-12', 327571.1292458263, '2025-05-19 09:34:13.223+00', '2025-05-19 09:34:13.223+00', 41, 147.8543620078126);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (167, '2021-02-27', 327955.1525063855, '2025-05-19 09:34:13.223+00', '2025-05-19 09:34:13.223+00', 41, 384.0232605592464);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (168, '2005-06-07', 232798.17044296124, '2025-05-19 09:34:13.225+00', '2025-05-19 09:34:13.225+00', 42, 281.1828177854186);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (169, '2011-09-01', 232828.27638447672, '2025-05-19 09:34:13.225+00', '2025-05-19 09:34:13.225+00', 42, 30.105941515474115);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (170, '2021-08-15', 232977.46934737568, '2025-05-19 09:34:13.225+00', '2025-05-19 09:34:13.225+00', 42, 149.1929628989601);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (171, '2024-12-11', 233054.19870946283, '2025-05-19 09:34:13.225+00', '2025-05-19 09:34:13.225+00', 42, 76.72936208714964);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (172, '2011-12-05', 285896.3769051638, '2025-05-19 09:34:13.227+00', '2025-05-19 09:34:13.227+00', 43, 367.6078731683665);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (173, '2018-08-11', 286129.3561729706, '2025-05-19 09:34:13.227+00', '2025-05-19 09:34:13.227+00', 43, 232.97926780680427);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (174, '2019-09-05', 286288.3479048565, '2025-05-19 09:34:13.227+00', '2025-05-19 09:34:13.227+00', 43, 158.99173188587883);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (175, '2025-05-03', 286721.113622678, '2025-05-19 09:34:13.227+00', '2025-05-19 09:34:13.227+00', 43, 432.76571782148676);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (176, '2025-05-09', 287135.7547406018, '2025-05-19 09:34:13.227+00', '2025-05-19 09:34:13.227+00', 43, 414.6411179238348);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (177, '2007-11-15', 129807.67171516777, '2025-05-19 09:34:13.229+00', '2025-05-19 09:34:13.229+00', 44, 104.11584459690494);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (178, '2018-04-06', 129827.27722939356, '2025-05-19 09:34:13.229+00', '2025-05-19 09:34:13.229+00', 44, 19.605514225782827);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (179, '2019-01-31', 130098.49796081457, '2025-05-19 09:34:13.229+00', '2025-05-19 09:34:13.229+00', 44, 271.22073142101);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (180, '2016-08-01', 319153.48350027314, '2025-05-19 09:34:13.231+00', '2025-05-19 09:34:13.231+00', 45, 185.17874825536273);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (181, '2021-05-12', 319648.7672227, '2025-05-19 09:34:13.231+00', '2025-05-19 09:34:13.231+00', 45, 495.28372242685873);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (182, '2025-01-13', 320113.844517897, '2025-05-19 09:34:13.231+00', '2025-05-19 09:34:13.231+00', 45, 465.07729519699933);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (183, '2025-02-08', 320564.49433737254, '2025-05-19 09:34:13.231+00', '2025-05-19 09:34:13.231+00', 45, 450.6498194755404);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (184, '2025-03-20', 320641.19134722766, '2025-05-19 09:34:13.231+00', '2025-05-19 09:34:13.231+00', 45, 76.69700985512463);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (185, '2025-04-28', 320684.2088438855, '2025-05-19 09:34:13.231+00', '2025-05-19 09:34:13.231+00', 45, 43.017496657848824);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (186, '2023-01-03', 479626.3691521094, '2025-05-19 09:34:13.234+00', '2025-05-19 09:34:13.234+00', 46, 468.7001292370842);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (187, '2024-08-02', 479949.1654410118, '2025-05-19 09:34:13.234+00', '2025-05-19 09:34:13.234+00', 46, 322.79628890240565);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (188, '2024-08-07', 480186.2522282746, '2025-05-19 09:34:13.234+00', '2025-05-19 09:34:13.234+00', 46, 237.08678726281505);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (189, '2024-09-03', 480455.205638176, '2025-05-19 09:34:13.234+00', '2025-05-19 09:34:13.234+00', 46, 268.95340990141267);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (190, '2021-05-31', 97815.68848133195, '2025-05-19 09:34:13.236+00', '2025-05-19 09:34:13.236+00', 47, 148.98333745315904);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (191, '2024-03-06', 97962.90317205453, '2025-05-19 09:34:13.236+00', '2025-05-19 09:34:13.236+00', 47, 147.21469072258333);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (192, '2025-04-14', 98052.88336256986, '2025-05-19 09:34:13.236+00', '2025-05-19 09:34:13.236+00', 47, 89.98019051532901);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (193, '2025-05-07', 98537.93205444448, '2025-05-19 09:34:13.236+00', '2025-05-19 09:34:13.236+00', 47, 485.04869187461736);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (194, '2025-05-11', 98869.29730915489, '2025-05-19 09:34:13.236+00', '2025-05-19 09:34:13.236+00', 47, 331.36525471041386);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (195, '1996-03-08', 419790.2297095806, '2025-05-19 09:34:13.238+00', '2025-05-19 09:34:13.238+00', 48, 235.1693811333971);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (196, '2023-08-09', 419987.9949244658, '2025-05-19 09:34:13.238+00', '2025-05-19 09:34:13.238+00', 48, 197.76521488517756);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (197, '2023-10-09', 420352.14308627363, '2025-05-19 09:34:13.238+00', '2025-05-19 09:34:13.238+00', 48, 364.1481618078542);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (198, '2025-01-13', 420789.6966619056, '2025-05-19 09:34:13.238+00', '2025-05-19 09:34:13.238+00', 48, 437.55357563198777);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (199, '2025-04-26', 421031.7373970319, '2025-05-19 09:34:13.238+00', '2025-05-19 09:34:13.238+00', 48, 242.0407351262984);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (200, '2025-05-05', 421340.96261772164, '2025-05-19 09:34:13.238+00', '2025-05-19 09:34:13.238+00', 48, 309.22522068972467);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (201, '2022-09-11', 137688.1850599585, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 346.60384252743097);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (202, '2024-05-20', 137733.09468561725, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 44.909625658765435);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (203, '2024-11-04', 138116.60426549302, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 383.5095798757684);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (204, '2025-01-11', 138145.3907103779, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 28.786444884870434);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (205, '2025-01-12', 138274.7873221716, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 129.39661179372342);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (206, '2025-02-15', 138601.2792545323, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 326.4919323606882);
INSERT INTO public."MileageLogs" (id, date, mileage, "createdAt", "updatedAt", "vehicleId", "mileageDifference") VALUES (207, '2025-02-16', 139032.8484530069, '2025-05-19 09:34:13.24+00', '2025-05-19 09:34:13.24+00', 49, 431.56919847460813);


--
-- Data for Name: RepairComponents; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (95, NULL, '2025-05-19 09:34:12.731+00', '2025-05-19 09:34:12.731+00', 64, 209);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (96, NULL, '2025-05-19 09:34:12.734+00', '2025-05-19 09:34:12.734+00', 64, 215);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (97, NULL, '2025-05-19 09:34:12.738+00', '2025-05-19 09:34:12.738+00', 65, 225);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (98, NULL, '2025-05-19 09:34:12.742+00', '2025-05-19 09:34:12.742+00', 66, 231);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (99, NULL, '2025-05-19 09:34:12.746+00', '2025-05-19 09:34:12.746+00', 67, 242);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (100, NULL, '2025-05-19 09:34:12.748+00', '2025-05-19 09:34:12.748+00', 67, 246);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (101, NULL, '2025-05-19 09:34:12.753+00', '2025-05-19 09:34:12.753+00', 68, 247);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (102, NULL, '2025-05-19 09:34:12.758+00', '2025-05-19 09:34:12.758+00', 69, 253);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (103, NULL, '2025-05-19 09:34:12.759+00', '2025-05-19 09:34:12.759+00', 69, 254);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (104, NULL, '2025-05-19 09:34:12.761+00', '2025-05-19 09:34:12.761+00', 69, 252);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (105, NULL, '2025-05-19 09:34:12.765+00', '2025-05-19 09:34:12.765+00', 70, 262);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (106, NULL, '2025-05-19 09:34:12.769+00', '2025-05-19 09:34:12.769+00', 71, 267);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (107, NULL, '2025-05-19 09:34:12.773+00', '2025-05-19 09:34:12.773+00', 72, 261);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (108, NULL, '2025-05-19 09:34:12.776+00', '2025-05-19 09:34:12.776+00', 73, 274);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (109, NULL, '2025-05-19 09:34:12.78+00', '2025-05-19 09:34:12.78+00', 74, 274);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (110, NULL, '2025-05-19 09:34:12.783+00', '2025-05-19 09:34:12.783+00', 75, 270);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (111, NULL, '2025-05-19 09:34:12.784+00', '2025-05-19 09:34:12.784+00', 75, 277);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (112, NULL, '2025-05-19 09:34:12.787+00', '2025-05-19 09:34:12.787+00', 76, 285);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (113, NULL, '2025-05-19 09:34:12.789+00', '2025-05-19 09:34:12.789+00', 76, 284);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (114, NULL, '2025-05-19 09:34:12.792+00', '2025-05-19 09:34:12.792+00', 77, 278);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (115, NULL, '2025-05-19 09:34:12.796+00', '2025-05-19 09:34:12.796+00', 78, 282);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (116, NULL, '2025-05-19 09:34:12.798+00', '2025-05-19 09:34:12.798+00', 78, 286);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (117, NULL, '2025-05-19 09:34:12.799+00', '2025-05-19 09:34:12.799+00', 78, 281);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (118, NULL, '2025-05-19 09:34:12.802+00', '2025-05-19 09:34:12.802+00', 79, 288);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (119, NULL, '2025-05-19 09:34:12.804+00', '2025-05-19 09:34:12.804+00', 79, 297);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (120, NULL, '2025-05-19 09:34:12.807+00', '2025-05-19 09:34:12.807+00', 80, 307);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (121, NULL, '2025-05-19 09:34:12.81+00', '2025-05-19 09:34:12.81+00', 81, 308);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (122, NULL, '2025-05-19 09:34:12.812+00', '2025-05-19 09:34:12.812+00', 81, 309);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (123, NULL, '2025-05-19 09:34:12.816+00', '2025-05-19 09:34:12.816+00', 82, 312);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (124, NULL, '2025-05-19 09:34:12.819+00', '2025-05-19 09:34:12.819+00', 83, 322);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (125, NULL, '2025-05-19 09:34:12.821+00', '2025-05-19 09:34:12.821+00', 83, 325);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (126, NULL, '2025-05-19 09:34:12.823+00', '2025-05-19 09:34:12.823+00', 83, 320);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (127, NULL, '2025-05-19 09:34:12.827+00', '2025-05-19 09:34:12.827+00', 84, 318);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (128, NULL, '2025-05-19 09:34:12.829+00', '2025-05-19 09:34:12.829+00', 84, 326);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (129, NULL, '2025-05-19 09:34:12.832+00', '2025-05-19 09:34:12.832+00', 85, 334);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (130, NULL, '2025-05-19 09:34:12.835+00', '2025-05-19 09:34:12.835+00', 86, 334);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (131, NULL, '2025-05-19 09:34:12.837+00', '2025-05-19 09:34:12.837+00', 86, 328);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (132, NULL, '2025-05-19 09:34:12.838+00', '2025-05-19 09:34:12.838+00', 86, 329);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (133, NULL, '2025-05-19 09:34:12.842+00', '2025-05-19 09:34:12.842+00', 87, 334);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (134, NULL, '2025-05-19 09:34:12.845+00', '2025-05-19 09:34:12.845+00', 88, 338);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (135, NULL, '2025-05-19 09:34:12.848+00', '2025-05-19 09:34:12.848+00', 89, 349);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (136, NULL, '2025-05-19 09:34:12.85+00', '2025-05-19 09:34:12.85+00', 89, 357);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (137, NULL, '2025-05-19 09:34:12.852+00', '2025-05-19 09:34:12.852+00', 89, 352);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (138, NULL, '2025-05-19 09:34:12.855+00', '2025-05-19 09:34:12.855+00', 90, 354);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (139, NULL, '2025-05-19 09:34:12.857+00', '2025-05-19 09:34:12.857+00', 90, 355);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (140, NULL, '2025-05-19 09:34:12.86+00', '2025-05-19 09:34:12.86+00', 91, 352);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (141, NULL, '2025-05-19 09:34:12.862+00', '2025-05-19 09:34:12.862+00', 91, 357);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (142, NULL, '2025-05-19 09:34:12.867+00', '2025-05-19 09:34:12.867+00', 92, 361);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (143, NULL, '2025-05-19 09:34:12.87+00', '2025-05-19 09:34:12.87+00', 93, 372);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (144, NULL, '2025-05-19 09:34:12.872+00', '2025-05-19 09:34:12.872+00', 93, 374);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (145, NULL, '2025-05-19 09:34:12.873+00', '2025-05-19 09:34:12.873+00', 93, 371);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (146, NULL, '2025-05-19 09:34:12.877+00', '2025-05-19 09:34:12.877+00', 94, 374);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (147, NULL, '2025-05-19 09:34:12.88+00', '2025-05-19 09:34:12.88+00', 95, 379);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (148, NULL, '2025-05-19 09:34:12.881+00', '2025-05-19 09:34:12.881+00', 95, 386);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (149, NULL, '2025-05-19 09:34:12.883+00', '2025-05-19 09:34:12.883+00', 95, 378);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (150, NULL, '2025-05-19 09:34:12.886+00', '2025-05-19 09:34:12.886+00', 96, 397);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (151, NULL, '2025-05-19 09:34:12.888+00', '2025-05-19 09:34:12.888+00', 96, 390);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (152, NULL, '2025-05-19 09:34:12.889+00', '2025-05-19 09:34:12.889+00', 96, 388);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (153, NULL, '2025-05-19 09:34:12.892+00', '2025-05-19 09:34:12.892+00', 97, 390);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (154, NULL, '2025-05-19 09:34:12.894+00', '2025-05-19 09:34:12.894+00', 97, 393);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (155, NULL, '2025-05-19 09:34:12.895+00', '2025-05-19 09:34:12.895+00', 97, 389);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (156, NULL, '2025-05-19 09:34:12.898+00', '2025-05-19 09:34:12.898+00', 98, 402);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (157, NULL, '2025-05-19 09:34:12.9+00', '2025-05-19 09:34:12.9+00', 98, 400);
INSERT INTO public."RepairComponents" (id, "workDescription", "createdAt", "updatedAt", "repairId", "vehicleComponentId") VALUES (158, NULL, '2025-05-19 09:34:12.904+00', '2025-05-19 09:34:12.904+00', 99, 403);


--
-- Data for Name: Repairs; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (64, 'unplanned', '2025-04-11', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.729+00', '2025-05-19 09:34:12.729+00', 30);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (65, 'current', '2025-03-27', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.736+00', '2025-05-19 09:34:12.736+00', 31);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (66, 'medium', '2025-10-26', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.74+00', '2025-05-19 09:34:12.74+00', 32);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (67, 'current', '2025-02-13', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.744+00', '2025-05-19 09:34:12.744+00', 33);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (68, 'unplanned', '2025-01-02', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.751+00', '2025-05-19 09:34:12.751+00', 33);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (69, 'unplanned', '2025-02-27', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.755+00', '2025-05-19 09:34:12.755+00', 34);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (70, 'capital', '2025-05-23', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.763+00', '2025-05-19 09:34:12.763+00', 35);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (71, 'capital', '2025-05-11', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.767+00', '2025-05-19 09:34:12.767+00', 35);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (72, 'unplanned', '2025-01-07', 'Виявлено несправність під час експлуатації (тестова причина 3)', NULL, '2025-05-19 09:34:12.771+00', '2025-05-19 09:34:12.771+00', 35);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (73, 'unplanned', '2025-02-28', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.775+00', '2025-05-19 09:34:12.775+00', 36);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (74, 'medium', '2025-12-08', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.778+00', '2025-05-19 09:34:12.778+00', 36);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (75, 'unplanned', '2025-02-16', 'Виявлено несправність під час експлуатації (тестова причина 3)', NULL, '2025-05-19 09:34:12.781+00', '2025-05-19 09:34:12.781+00', 36);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (76, 'capital', '2025-05-21', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.786+00', '2025-05-19 09:34:12.786+00', 37);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (77, 'capital', '2025-11-20', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.79+00', '2025-05-19 09:34:12.79+00', 37);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (78, 'capital', '2025-04-02', 'Виявлено несправність під час експлуатації (тестова причина 3)', NULL, '2025-05-19 09:34:12.794+00', '2025-05-19 09:34:12.794+00', 37);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (79, 'capital', '2025-12-18', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.801+00', '2025-05-19 09:34:12.801+00', 38);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (80, 'capital', '2025-09-11', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.806+00', '2025-05-19 09:34:12.806+00', 39);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (81, 'unplanned', '2025-01-02', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.809+00', '2025-05-19 09:34:12.809+00', 40);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (82, 'current', '2025-06-14', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.814+00', '2025-05-19 09:34:12.814+00', 40);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (83, 'capital', '2025-11-29', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.818+00', '2025-05-19 09:34:12.818+00', 41);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (84, 'unplanned', '2025-10-21', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.825+00', '2025-05-19 09:34:12.825+00', 41);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (85, 'unplanned', '2025-12-19', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.83+00', '2025-05-19 09:34:12.83+00', 42);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (86, 'capital', '2025-07-20', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.834+00', '2025-05-19 09:34:12.834+00', 42);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (87, 'medium', '2025-04-28', 'Виявлено несправність під час експлуатації (тестова причина 3)', NULL, '2025-05-19 09:34:12.84+00', '2025-05-19 09:34:12.84+00', 42);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (88, 'capital', '2025-07-19', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.843+00', '2025-05-19 09:34:12.843+00', 43);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (89, 'medium', '2025-05-03', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.847+00', '2025-05-19 09:34:12.847+00', 44);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (90, 'capital', '2025-01-26', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.853+00', '2025-05-19 09:34:12.853+00', 44);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (91, 'medium', '2025-03-29', 'Виявлено несправність під час експлуатації (тестова причина 3)', NULL, '2025-05-19 09:34:12.858+00', '2025-05-19 09:34:12.858+00', 44);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (92, 'unplanned', '2025-04-02', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.864+00', '2025-05-19 09:34:12.864+00', 45);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (93, 'medium', '2025-07-10', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.868+00', '2025-05-19 09:34:12.868+00', 46);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (94, 'current', '2025-02-04', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.875+00', '2025-05-19 09:34:12.875+00', 46);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (95, 'unplanned', '2025-02-28', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.878+00', '2025-05-19 09:34:12.878+00', 47);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (96, 'current', '2025-08-10', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.884+00', '2025-05-19 09:34:12.884+00', 48);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (97, 'capital', '2025-12-04', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.891+00', '2025-05-19 09:34:12.891+00', 48);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (98, 'medium', '2025-11-06', 'Виявлено несправність під час експлуатації (тестова причина 1)', NULL, '2025-05-19 09:34:12.897+00', '2025-05-19 09:34:12.897+00', 49);
INSERT INTO public."Repairs" (id, type, date, "repairReasonText", "workDescription", "createdAt", "updatedAt", "vehicleId") VALUES (99, 'unplanned', '2025-06-22', 'Виявлено несправність під час експлуатації (тестова причина 2)', NULL, '2025-05-19 09:34:12.902+00', '2025-05-19 09:34:12.902+00', 49);


--
-- Data for Name: Units; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Units" (id, name, "createdAt", "updatedAt", "commanderId") VALUES (43, '2-й Рота охорони', '2025-05-19 09:34:12.236+00', '2025-05-19 09:34:12.236+00', 55);
INSERT INTO public."Units" (id, name, "createdAt", "updatedAt", "commanderId") VALUES (44, '5-й Рота охорони', '2025-05-19 09:34:12.239+00', '2025-05-19 09:34:12.239+00', 56);
INSERT INTO public."Units" (id, name, "createdAt", "updatedAt", "commanderId") VALUES (45, '1-й Рота охорони', '2025-05-19 09:34:12.241+00', '2025-05-19 09:34:12.241+00', 57);
INSERT INTO public."Units" (id, name, "createdAt", "updatedAt", "commanderId") VALUES (46, '1-й механізований Батальйон', '2025-05-19 09:34:12.243+00', '2025-05-19 09:34:12.243+00', 58);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (52, 'Артушенко Олег Денисович', 'commander_main', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'COMMANDER', '2025-05-19 09:34:12.214+00', '2025-05-19 09:34:12.214+00');
INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (53, 'Назаренко Кирило Богданович', 'duty_park', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'DUTY_STAFF', '2025-05-19 09:34:12.223+00', '2025-05-19 09:34:12.223+00');
INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (54, 'Литвин Роман Степанович', 'admin_user', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'ADMIN', '2025-05-19 09:34:12.226+00', '2025-05-19 09:34:12.226+00');
INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (55, 'Бондаренко Станіслав Максимович', 'unit_commander_1', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'UNIT_COMMANDER', '2025-05-19 09:34:12.228+00', '2025-05-19 09:34:12.228+00');
INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (56, 'Дяченко Олег Леонідович', 'unit_commander_2', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'UNIT_COMMANDER', '2025-05-19 09:34:12.23+00', '2025-05-19 09:34:12.23+00');
INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (57, 'Шульга Микола Русланович', 'unit_commander_3', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'UNIT_COMMANDER', '2025-05-19 09:34:12.232+00', '2025-05-19 09:34:12.232+00');
INSERT INTO public."Users" (id, name, username, "passwordHash", role, "createdAt", "updatedAt") VALUES (58, 'Денисенко Андрій Васильович', 'unit_commander_4', '$2a$10$cQGEznE0h/eigYrXzuj9Wuy4sug2mjEmwn5e.S9eJ/Z4PraoQYmfO', 'UNIT_COMMANDER', '2025-05-19 09:34:12.234+00', '2025-05-19 09:34:12.234+00');


--
-- Data for Name: VehicleComponents; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (208, 'Двигун (КАМАЗ-4310)', 'ENGINE', 'cPbQBhYqsyqELd3', '2024-07-06', 88401.0632525689, 13123.179066466395, 9983.657746094388, 227861.58453102817, '3', '2025-05-19 09:34:12.29+00', '2025-05-19 09:34:12.29+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (209, 'Коробка передач (КАМАЗ-4310)', 'GEARBOX', 'bGDsAJIeGl0HJf5', '2024-07-06', 87759.56733668268, 608.5778735076656, 25041.379886070805, 293210.629251508, '1', '2025-05-19 09:34:12.294+00', '2025-05-19 09:34:12.294+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (210, 'Трансмісія (КАМАЗ-4310)', 'TRANSMISSION', '0uCoh6ImlNpz9Ej', '2024-07-06', 7569.188348233213, 1898.98320948386, 13941.175017823625, 141536.21069446765, '2', '2025-05-19 09:34:12.296+00', '2025-05-19 09:34:12.296+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (211, 'Шасі (КАМАЗ-4310)', 'CHASSIS', 'MdAmpkT9VosHvev', '2024-07-06', 23482.819097719042, 2994.7906084649244, 33315.306967936325, 121540.66184114954, '5', '2025-05-19 09:34:12.299+00', '2025-05-19 09:34:12.299+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (212, 'Кузов (КАМАЗ-4310)', 'BODY', 'S3bzwi6Z5z5ageL', '2024-07-06', 30863.144608606686, 16989.15676140106, 20708.529758420333, 219131.96257133345, '3', '2025-05-19 09:34:12.301+00', '2025-05-19 09:34:12.301+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (213, 'Система живлення (КАМАЗ-4310)', 'POWER_SYSTEM', 'AwGv3xiqBRnmN05', '2024-07-06', 10914.525273405952, 1780.2795305697402, 11097.816026498018, 118204.29953777952, '3', '2025-05-19 09:34:12.304+00', '2025-05-19 09:34:12.304+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (214, 'Система охолодження (КАМАЗ-4310)', 'COOLING_SYSTEM', 'vuup3E9B5LIGKjj', '2024-07-06', 65408.906491448026, 56.156727078802355, 21393.02138450238, 93517.40425836925, '2', '2025-05-19 09:34:12.308+00', '2025-05-19 09:34:12.308+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (215, 'Гальмівна система (КАМАЗ-4310)', 'BRAKE_SYSTEM', 'aMUiJBN0AUte1Vc', '2024-07-06', 5937.806583077616, 4154.491318809018, 33832.64002930092, 297781.1976970175, '5', '2025-05-19 09:34:12.311+00', '2025-05-19 09:34:12.311+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (216, 'Система моніторингу (КАМАЗ-4310)', 'MONITORING_SYSTEM', 'dZXZUEW5x8kDlfs', '2024-07-06', 34855.91488720745, 1366.032531487189, 15682.481093237891, 281273.1773793904, '4', '2025-05-19 09:34:12.314+00', '2025-05-19 09:34:12.314+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (217, 'Паливна система (КАМАЗ-4310)', 'FUEL_SYSTEM', 'ggbaL51AB3wxOq3', '2024-07-06', 20997.942833873847, 8564.329066388367, 26178.074902467186, 141566.08989027905, '5', '2025-05-19 09:34:12.318+00', '2025-05-19 09:34:12.318+00', 30);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (218, 'Двигун (ПАЗ)', 'ENGINE', 'UtacR4WOli5YqSK', '2014-07-09', 89490.98929675481, 5742.905313588344, 35597.89969746512, 147957.62869519548, '3', '2025-05-19 09:34:12.321+00', '2025-05-19 09:34:12.321+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (219, 'Коробка передач (ПАЗ)', 'GEARBOX', 'A8KlFDKH8gd8ssB', '2014-07-09', 355087.10560416774, 6514.453408572353, 6231.681761197971, 213712.2528687447, '2', '2025-05-19 09:34:12.324+00', '2025-05-19 09:34:12.324+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (220, 'Трансмісія (ПАЗ)', 'TRANSMISSION', 'Qc8PxCgzqZBbrGa', '2014-07-09', 440366.8198322098, 831.4471800221728, 36433.34032211466, 257649.6292870449, '5', '2025-05-19 09:34:12.326+00', '2025-05-19 09:34:12.326+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (221, 'Шасі (ПАЗ)', 'CHASSIS', '5PdPQbu2NTRiBds', '2014-07-09', 236168.15687739584, 1990.469380023197, 6644.779604066785, 154044.5809880814, '2', '2025-05-19 09:34:12.329+00', '2025-05-19 09:34:12.329+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (222, 'Кузов (ПАЗ)', 'BODY', 'WKUEPpO90hjKiZY', '2014-07-09', 238273.79014437587, 18550.764582964057, 12975.404638798416, 119911.78115084156, '5', '2025-05-19 09:34:12.331+00', '2025-05-19 09:34:12.331+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (223, 'Система живлення (ПАЗ)', 'POWER_SYSTEM', 'e3zBsv4RVpKNIjv', '2014-07-09', 108699.4327384041, 10603.908347208784, 27217.410041874384, 156434.79366085035, '5', '2025-05-19 09:34:12.333+00', '2025-05-19 09:34:12.333+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (224, 'Система охолодження (ПАЗ)', 'COOLING_SYSTEM', 'WkUMCufGwrxxiH2', '2014-07-09', 272848.2822583927, 2086.249469994466, 7326.767758794356, 166266.36166603744, '3', '2025-05-19 09:34:12.336+00', '2025-05-19 09:34:12.336+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (225, 'Гальмівна система (ПАЗ)', 'BRAKE_SYSTEM', '7e73a2NvBcGfXmR', '2014-07-09', 195915.90565937775, 1194.337098041896, 11837.12625905659, 64292.31412487064, '4', '2025-05-19 09:34:12.338+00', '2025-05-19 09:34:12.338+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (226, 'Система моніторингу (ПАЗ)', 'MONITORING_SYSTEM', '5yT2b1hUtFMXWdb', '2014-07-09', 134388.24035257864, 3547.9452343826633, 37257.51788585364, 248478.9467659722, '2', '2025-05-19 09:34:12.341+00', '2025-05-19 09:34:12.341+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (227, 'Паливна система (ПАЗ)', 'FUEL_SYSTEM', 'sXczU2VGCAHtKxo', '2014-07-09', 275187.58776522096, 3329.753968801998, 13247.928854454238, 245049.80334389405, '2', '2025-05-19 09:34:12.343+00', '2025-05-19 09:34:12.343+00', 31);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (228, 'Двигун (ЛуАЗ-1302)', 'ENGINE', 'xvaSeiLNOa7y3Pf', '2025-04-19', 99475.8875072724, 1196.9481099354603, 25692.517827407573, 93367.03506958595, '4', '2025-05-19 09:34:12.346+00', '2025-05-19 09:34:12.346+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (229, 'Коробка передач (ЛуАЗ-1302)', 'GEARBOX', 'UFukhCsLVQDnyT1', '2025-04-19', 214870.87239743193, 9234.93376829696, 24120.957156794007, 187457.1580410751, '5', '2025-05-19 09:34:12.348+00', '2025-05-19 09:34:12.348+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (230, 'Трансмісія (ЛуАЗ-1302)', 'TRANSMISSION', 'N02BRm4Yjs0iTEC', '2025-04-19', 22550.435798913946, 12274.570444425019, 21575.52698145718, 235023.98720268227, '5', '2025-05-19 09:34:12.351+00', '2025-05-19 09:34:12.351+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (231, 'Шасі (ЛуАЗ-1302)', 'CHASSIS', '7OnLlcfhHkKoM8O', '2025-04-19', 53603.12555069999, 9574.228610276243, 32661.92946316934, 209867.8845233994, '4', '2025-05-19 09:34:12.353+00', '2025-05-19 09:34:12.353+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (232, 'Кузов (ЛуАЗ-1302)', 'BODY', 'cpeIXtY2W3WrgEF', '2025-04-19', 158412.30395677796, 7489.139028770227, 11575.86070089197, 216269.55601197618, '2', '2025-05-19 09:34:12.355+00', '2025-05-19 09:34:12.355+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (233, 'Система живлення (ЛуАЗ-1302)', 'POWER_SYSTEM', 'Jg8j6200wLyDOLz', '2025-04-19', 229582.0927576063, 17463.979533261914, 18314.964298769577, 239273.81813021156, '5', '2025-05-19 09:34:12.357+00', '2025-05-19 09:34:12.357+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (234, 'Система охолодження (ЛуАЗ-1302)', 'COOLING_SYSTEM', 'mqpjDOESONGBSdi', '2025-04-19', 162366.254545555, 1441.8370532588385, 17395.22147907655, 112379.5962737308, '1', '2025-05-19 09:34:12.36+00', '2025-05-19 09:34:12.36+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (235, 'Гальмівна система (ЛуАЗ-1302)', 'BRAKE_SYSTEM', 'KVp4uieFa03tXzO', '2025-04-19', 95324.58718370745, 19688.998760461905, 28200.48616281168, 282923.2243143247, '3', '2025-05-19 09:34:12.362+00', '2025-05-19 09:34:12.362+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (236, 'Система моніторингу (ЛуАЗ-1302)', 'MONITORING_SYSTEM', 'NWu7bwzrd8bcBGz', '2025-04-19', 142134.0086958807, 19641.06284991093, 36074.264208375884, 175773.60026964458, '4', '2025-05-19 09:34:12.364+00', '2025-05-19 09:34:12.364+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (237, 'Паливна система (ЛуАЗ-1302)', 'FUEL_SYSTEM', 'oNnNEBKrVLYa7eD', '2025-04-19', 248739.99538012402, 1378.7574576792213, 24550.61014250734, 238343.56240167483, '2', '2025-05-19 09:34:12.366+00', '2025-05-19 09:34:12.366+00', 32);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (238, 'Двигун (УАЗ-469)', 'ENGINE', 'GYbY6G1rhCGC9Ek', '1989-07-29', 7440.690759377461, 2708.6452262507655, 6156.220184643473, 222402.41546731693, '3', '2025-05-19 09:34:12.368+00', '2025-05-19 09:34:12.368+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (239, 'Коробка передач (УАЗ-469)', 'GEARBOX', 'jYtlX4qpY5rJXDv', '1989-07-29', 23076.234220363316, 15276.990166764544, 9583.494995460995, 229529.17023748872, '3', '2025-05-19 09:34:12.37+00', '2025-05-19 09:34:12.37+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (240, 'Трансмісія (УАЗ-469)', 'TRANSMISSION', 'OcMJpcJNVpcKgZA', '1989-07-29', 34888.603387732335, 12707.931855231463, 27231.203010630463, 255557.80649042872, '3', '2025-05-19 09:34:12.373+00', '2025-05-19 09:34:12.373+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (241, 'Шасі (УАЗ-469)', 'CHASSIS', 'woKu2qUlhiGUbiG', '1989-07-29', 17886.859897454193, 12335.375613183038, 11752.55206259486, 76556.02140826835, '5', '2025-05-19 09:34:12.376+00', '2025-05-19 09:34:12.376+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (242, 'Кузов (УАЗ-469)', 'BODY', 'rM7vovrnCA5OCvw', '1989-07-29', 25648.721563668547, 5024.642332328762, 6946.264698864435, 115790.22235395692, '4', '2025-05-19 09:34:12.378+00', '2025-05-19 09:34:12.378+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (243, 'Система живлення (УАЗ-469)', 'POWER_SYSTEM', 'd05esjKJUpkXXjI', '1989-07-29', 38153.99113937018, 23520.31127674585, 33131.90843680456, 257059.0921792223, '5', '2025-05-19 09:34:12.38+00', '2025-05-19 09:34:12.38+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (244, 'Система охолодження (УАЗ-469)', 'COOLING_SYSTEM', 'yexZ1lMuPdnenoq', '1989-07-29', 10546.582976258349, 3824.0054621914333, 9057.66579897422, 267065.82375090476, '5', '2025-05-19 09:34:12.382+00', '2025-05-19 09:34:12.382+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (245, 'Гальмівна система (УАЗ-469)', 'BRAKE_SYSTEM', 'kwp3TFRZvDrW2t9', '1989-07-29', 18057.255951657793, 483.40542174394784, 14651.026166103231, 273666.2316967739, '3', '2025-05-19 09:34:12.385+00', '2025-05-19 09:34:12.385+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (246, 'Система моніторингу (УАЗ-469)', 'MONITORING_SYSTEM', 'eEQw2UwpWtm8cgm', '1989-07-29', 487.65466995615583, 55.29630561902169, 35860.18136055468, 88640.0027780886, '3', '2025-05-19 09:34:12.387+00', '2025-05-19 09:34:12.387+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (247, 'Паливна система (УАЗ-469)', 'FUEL_SYSTEM', 'f3FZ5oQuXxxtnxh', '1989-07-29', 18976.119371078235, 344.5285076939326, 6662.280625712718, 129053.36731681656, '2', '2025-05-19 09:34:12.39+00', '2025-05-19 09:34:12.39+00', 33);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (248, 'Двигун (КАМАЗ-4310)', 'ENGINE', '3SoxiHxrG2dDJGK', '2024-07-08', 6417.144874464443, 2475.784023173405, 11296.815080336924, 279711.67973466625, '2', '2025-05-19 09:34:12.392+00', '2025-05-19 09:34:12.392+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (249, 'Коробка передач (КАМАЗ-4310)', 'GEARBOX', 'xQvYHvrPZpF2AxF', '2024-07-08', 5454.657442941017, 4319.85403367153, 13536.998329631973, 297637.1782087459, '2', '2025-05-19 09:34:12.395+00', '2025-05-19 09:34:12.395+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (250, 'Трансмісія (КАМАЗ-4310)', 'TRANSMISSION', 'cksOTlLWLyrlrsd', '2024-07-08', 3993.628121557464, 3149.898618764587, 18633.80516733781, 120511.4398552758, '5', '2025-05-19 09:34:12.397+00', '2025-05-19 09:34:12.397+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (251, 'Шасі (КАМАЗ-4310)', 'CHASSIS', 'PeYU6E2HYcH6s8c', '2024-07-08', 7806.073145068673, 931.8990603746789, 10173.030868690403, 268627.1713607277, '2', '2025-05-19 09:34:12.399+00', '2025-05-19 09:34:12.399+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (252, 'Кузов (КАМАЗ-4310)', 'BODY', 'FtpBJ1D0g8vZ8Lq', '2024-07-08', 9365.448257492468, 650.3040364825418, 26674.144759338273, 128823.54798676638, '1', '2025-05-19 09:34:12.401+00', '2025-05-19 09:34:12.401+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (253, 'Система живлення (КАМАЗ-4310)', 'POWER_SYSTEM', '03z3Rg140njlvDP', '2024-07-08', 5346.7138810455945, 196.16710895990957, 5892.549378679329, 267352.9444392947, '1', '2025-05-19 09:34:12.404+00', '2025-05-19 09:34:12.404+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (254, 'Система охолодження (КАМАЗ-4310)', 'COOLING_SYSTEM', 'q7zONvxqHGiFPGK', '2024-07-08', 2406.7986927955335, 2014.423113961554, 29014.658554223937, 270238.1906422166, '3', '2025-05-19 09:34:12.407+00', '2025-05-19 09:34:12.407+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (255, 'Гальмівна система (КАМАЗ-4310)', 'BRAKE_SYSTEM', 'itOyaVC9MMvnGVz', '2024-07-08', 3988.656480209095, 1122.8624424870998, 36223.94743512138, 293975.2462473043, '2', '2025-05-19 09:34:12.409+00', '2025-05-19 09:34:12.409+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (256, 'Система моніторингу (КАМАЗ-4310)', 'MONITORING_SYSTEM', 'FEFGueZJH1kHhHY', '2024-07-08', 4225.189635772206, 1948.1578805901026, 14327.70530871043, 299945.12991327693, '4', '2025-05-19 09:34:12.412+00', '2025-05-19 09:34:12.412+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (257, 'Паливна система (КАМАЗ-4310)', 'FUEL_SYSTEM', 'q5a3hce6zblPHnP', '2024-07-08', 1117.4874728284556, 171.6530781066265, 18691.695743746204, 270577.11394123454, '3', '2025-05-19 09:34:12.414+00', '2025-05-19 09:34:12.414+00', 34);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (258, 'Двигун (M939)', 'ENGINE', 'PTCguyTot5XDNy3', '1991-08-26', 283073.01686850924, 4518.684211784745, 39486.248431672335, 106442.29443153681, '1', '2025-05-19 09:34:12.417+00', '2025-05-19 09:34:12.417+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (259, 'Коробка передач (M939)', 'GEARBOX', '80EZ9WQMvXHi1ci', '1991-08-26', 146310.83418530275, 677.1877944582718, 14503.938094408342, 175966.1699785001, '5', '2025-05-19 09:34:12.419+00', '2025-05-19 09:34:12.419+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (260, 'Трансмісія (M939)', 'TRANSMISSION', 'mBet1CyVgF5qmiv', '1991-08-26', 403351.8658086749, 7195.822925973248, 19750.404728195623, 110953.81351801171, '2', '2025-05-19 09:34:12.421+00', '2025-05-19 09:34:12.421+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (261, 'Шасі (M939)', 'CHASSIS', 'tOwCE4h2uL0RRnA', '1991-08-26', 384631.2910213542, 24059.275023350183, 24378.986488215312, 152361.55676471026, '4', '2025-05-19 09:34:12.423+00', '2025-05-19 09:34:12.423+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (262, 'Кузов (M939)', 'BODY', 'rKDHUOOiMWR2lku', '1991-08-26', 60914.5683297678, 12479.569368488628, 9589.632910072594, 231966.21970637937, '2', '2025-05-19 09:34:12.425+00', '2025-05-19 09:34:12.425+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (263, 'Система живлення (M939)', 'POWER_SYSTEM', 'nNrwdPZ8vMbYnVV', '1991-08-26', 332428.85974661453, 9715.167438475406, 10360.040738645443, 258016.32618388964, '4', '2025-05-19 09:34:12.427+00', '2025-05-19 09:34:12.427+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (264, 'Система охолодження (M939)', 'COOLING_SYSTEM', 'iVyGiGJTE9aQuao', '1991-08-26', 97272.25777999638, 9852.692462170427, 20221.829753283826, 234787.55552425308, '4', '2025-05-19 09:34:12.428+00', '2025-05-19 09:34:12.428+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (265, 'Гальмівна система (M939)', 'BRAKE_SYSTEM', 'AsoNCgSeYCvT5LP', '1991-08-26', 189268.89474626933, 18914.017349078345, 30878.157365772517, 51792.54983531407, '4', '2025-05-19 09:34:12.432+00', '2025-05-19 09:34:12.432+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (266, 'Система моніторингу (M939)', 'MONITORING_SYSTEM', 'BoHDSpkftuUJJZk', '1991-08-26', 157404.7617695427, 18073.31176200308, 29467.062430395366, 184487.14252962967, '3', '2025-05-19 09:34:12.435+00', '2025-05-19 09:34:12.435+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (267, 'Паливна система (M939)', 'FUEL_SYSTEM', 'KRWKfN3Zg1iKlii', '1991-08-26', 258864.78928727208, 4350.61948587201, 23188.231379155895, 50849.99303750549, '3', '2025-05-19 09:34:12.437+00', '2025-05-19 09:34:12.437+00', 35);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (268, 'Двигун (Богдан)', 'ENGINE', '4nAFdr3VdQAo3RX', '2000-02-02', 143958.83001301953, 10686.190985800122, 14213.63878804086, 287288.23146446544, '2', '2025-05-19 09:34:12.439+00', '2025-05-19 09:34:12.439+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (269, 'Коробка передач (Богдан)', 'GEARBOX', 'W9Ozhs5gLjTPz4r', '2000-02-02', 154985.78864030956, 1326.3495543372, 16029.032526993858, 89451.89112953178, '4', '2025-05-19 09:34:12.441+00', '2025-05-19 09:34:12.441+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (270, 'Трансмісія (Богдан)', 'TRANSMISSION', 'yJNfN1bfwuUlGKv', '2000-02-02', 136457.7711515528, 20769.04404703484, 26419.58848797762, 107756.0483052844, '2', '2025-05-19 09:34:12.443+00', '2025-05-19 09:34:12.443+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (271, 'Шасі (Богдан)', 'CHASSIS', 'MZ5IxkPrMwPFIoT', '2000-02-02', 24590.905699703035, 1156.7225745670894, 25234.560365214184, 117130.67008108203, '4', '2025-05-19 09:34:12.444+00', '2025-05-19 09:34:12.444+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (272, 'Кузов (Богдан)', 'BODY', 'vTQqZOEYi7eiggy', '2000-02-02', 32885.410897475114, 4101.994543298663, 22852.51905033911, 218924.92728052405, '3', '2025-05-19 09:34:12.446+00', '2025-05-19 09:34:12.446+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (273, 'Система живлення (Богдан)', 'POWER_SYSTEM', 'Yfv2Wl72LVu8bTF', '2000-02-02', 75101.95216458905, 14026.67775012689, 38989.085838591716, 236430.25539729596, '2', '2025-05-19 09:34:12.449+00', '2025-05-19 09:34:12.449+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (274, 'Система охолодження (Богдан)', 'COOLING_SYSTEM', 'HSAinkII7DN7ln0', '2000-02-02', 128638.84742427671, 7648.188457448065, 9975.899829952, 180384.39962357807, '4', '2025-05-19 09:34:12.451+00', '2025-05-19 09:34:12.451+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (275, 'Гальмівна система (Богдан)', 'BRAKE_SYSTEM', 'e7r9bgqbal6Tml9', '2000-02-02', 132575.95196735393, 9440.942823183685, 18849.219736052422, 103327.16357838412, '4', '2025-05-19 09:34:12.454+00', '2025-05-19 09:34:12.454+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (276, 'Система моніторингу (Богдан)', 'MONITORING_SYSTEM', 'qB95Mla7o3WyRl0', '2000-02-02', 25405.81660713161, 8146.933455502801, 10500.54904993734, 149023.62796033657, '5', '2025-05-19 09:34:12.456+00', '2025-05-19 09:34:12.456+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (277, 'Паливна система (Богдан)', 'FUEL_SYSTEM', '2iRlh9dRY2jf6MU', '2000-02-02', 79600.12356631138, 10784.811556583325, 28659.65282617005, 78279.71834836579, '5', '2025-05-19 09:34:12.458+00', '2025-05-19 09:34:12.458+00', 36);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (278, 'Двигун (КрАЗ-260)', 'ENGINE', 'dpQkptIk8KFJ2Cj', '2013-12-20', 87595.03242161844, 8408.608393841283, 13222.771001829196, 201508.60569464936, '1', '2025-05-19 09:34:12.46+00', '2025-05-19 09:34:12.46+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (279, 'Коробка передач (КрАЗ-260)', 'GEARBOX', 'Hh7IeaCVlIG5xJC', '2013-12-20', 22369.551173388358, 3711.7918407402317, 34104.83408500267, 220881.01626346802, '4', '2025-05-19 09:34:12.462+00', '2025-05-19 09:34:12.462+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (280, 'Трансмісія (КрАЗ-260)', 'TRANSMISSION', 'iUEIAY9Cso68jOu', '2013-12-20', 95383.54411133156, 1538.504782706302, 18645.24253150337, 85114.64574133942, '2', '2025-05-19 09:34:12.464+00', '2025-05-19 09:34:12.464+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (281, 'Шасі (КрАЗ-260)', 'CHASSIS', 'hiSbQJ8KdCK4tGq', '2013-12-20', 33128.20721126302, 5640.342238395945, 22428.615005474163, 278480.46269480116, '1', '2025-05-19 09:34:12.466+00', '2025-05-19 09:34:12.466+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (282, 'Кузов (КрАЗ-260)', 'BODY', 'mAKZlPKxBitCtR5', '2013-12-20', 40869.91641789408, 3109.0302325801567, 35245.833565807945, 67365.13157990843, '2', '2025-05-19 09:34:12.468+00', '2025-05-19 09:34:12.468+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (283, 'Система живлення (КрАЗ-260)', 'POWER_SYSTEM', '2Q03FNMaUGQ7B9p', '2013-12-20', 134611.8151953875, 13956.582486474912, 7479.296845352811, 258422.3754707113, '1', '2025-05-19 09:34:12.47+00', '2025-05-19 09:34:12.47+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (284, 'Система охолодження (КрАЗ-260)', 'COOLING_SYSTEM', '6Esj6R3gfYwaFWG', '2013-12-20', 92063.14744234039, 13565.753596105002, 6495.5252840639005, 119201.2105485379, '2', '2025-05-19 09:34:12.472+00', '2025-05-19 09:34:12.472+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (285, 'Гальмівна система (КрАЗ-260)', 'BRAKE_SYSTEM', '1OrpKqk2VYt5zM3', '2013-12-20', 23643.046574482923, 18817.26056912853, 16796.321050493298, 90784.88348904585, '1', '2025-05-19 09:34:12.474+00', '2025-05-19 09:34:12.474+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (286, 'Система моніторингу (КрАЗ-260)', 'MONITORING_SYSTEM', '8DOEwSeQqz8506X', '2013-12-20', 114224.7131937955, 4442.504472119771, 21962.987632294342, 196159.05807592155, '4', '2025-05-19 09:34:12.476+00', '2025-05-19 09:34:12.476+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (287, 'Паливна система (КрАЗ-260)', 'FUEL_SYSTEM', 'eFJOVx5zIrd8gmK', '2013-12-20', 14580.383188107193, 12499.966174558025, 36768.44391408448, 162102.6186135416, '4', '2025-05-19 09:34:12.478+00', '2025-05-19 09:34:12.478+00', 37);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (288, 'Двигун (ЗІЛ-131)', 'ENGINE', '4Aqwse1o1jnKxT2', '2007-12-27', 125285.6783236245, 5638.369971157024, 22166.175630803922, 272438.29033696017, '4', '2025-05-19 09:34:12.479+00', '2025-05-19 09:34:12.479+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (289, 'Коробка передач (ЗІЛ-131)', 'GEARBOX', 'n2oGGC67dTDbVEd', '2007-12-27', 257139.901643412, 10044.033578995755, 22301.385106689755, 144361.28738931648, '2', '2025-05-19 09:34:12.481+00', '2025-05-19 09:34:12.481+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (290, 'Трансмісія (ЗІЛ-131)', 'TRANSMISSION', 'Yd8ckkMLEFwYLEp', '2007-12-27', 265879.6874792434, 13757.457800308917, 28991.558307407107, 50896.87176252029, '1', '2025-05-19 09:34:12.483+00', '2025-05-19 09:34:12.483+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (291, 'Шасі (ЗІЛ-131)', 'CHASSIS', 'eA3loMYHhj6ZYwa', '2007-12-27', 277738.8500726502, 7506.212286071317, 27396.38637493025, 203427.22305521555, '4', '2025-05-19 09:34:12.485+00', '2025-05-19 09:34:12.485+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (292, 'Кузов (ЗІЛ-131)', 'BODY', '6wrEtlLdfvd4TU1', '2007-12-27', 233235.3138464454, 4313.567378388438, 12923.202431801716, 299538.1271000629, '5', '2025-05-19 09:34:12.487+00', '2025-05-19 09:34:12.487+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (293, 'Система живлення (ЗІЛ-131)', 'POWER_SYSTEM', 'mF1JgGxkY287rFX', '2007-12-27', 406460.7694435027, 2418.763830494879, 11160.398029547101, 272486.7215393246, '5', '2025-05-19 09:34:12.489+00', '2025-05-19 09:34:12.489+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (294, 'Система охолодження (ЗІЛ-131)', 'COOLING_SYSTEM', 'dxrUmk2RoRNqtDJ', '2007-12-27', 219539.21688528973, 7888.833975341522, 13618.396927100046, 138477.9780887303, '2', '2025-05-19 09:34:12.491+00', '2025-05-19 09:34:12.491+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (295, 'Гальмівна система (ЗІЛ-131)', 'BRAKE_SYSTEM', '9lKBEJvk6jDF3Qz', '2007-12-27', 4174.086123431812, 3523.6298121998275, 23379.313713761523, 215949.16507230757, '5', '2025-05-19 09:34:12.493+00', '2025-05-19 09:34:12.493+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (296, 'Система моніторингу (ЗІЛ-131)', 'MONITORING_SYSTEM', 'u1qiRKGC8kKpLeu', '2007-12-27', 197768.05080321647, 25947.343703854924, 25912.587102333266, 271941.01608182164, '4', '2025-05-19 09:34:12.496+00', '2025-05-19 09:34:12.496+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (297, 'Паливна система (ЗІЛ-131)', 'FUEL_SYSTEM', 'ILbz80RzflCMy7K', '2007-12-27', 54054.84766239416, 193.6842658539069, 37895.8721783956, 261993.753931212, '1', '2025-05-19 09:34:12.498+00', '2025-05-19 09:34:12.498+00', 38);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (298, 'Двигун (Урал-4320)', 'ENGINE', '1EfNEfh8o17VdAg', '2020-06-01', 72938.0013604377, 1358.2031630350243, 20730.81715473177, 61457.592122239905, '2', '2025-05-19 09:34:12.5+00', '2025-05-19 09:34:12.5+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (299, 'Коробка передач (Урал-4320)', 'GEARBOX', 'g6YqtBGSCPhVaFT', '2020-06-01', 2932.35808441945, 2710.8992813503683, 17386.74050414555, 196989.8674319113, '4', '2025-05-19 09:34:12.502+00', '2025-05-19 09:34:12.502+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (300, 'Трансмісія (Урал-4320)', 'TRANSMISSION', 'g3NHD7hZPWtuhb6', '2020-06-01', 120909.91728087894, 24003.504653152024, 6302.702470958022, 178233.92362288357, '5', '2025-05-19 09:34:12.504+00', '2025-05-19 09:34:12.504+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (301, 'Шасі (Урал-4320)', 'CHASSIS', 'IsIV2AlMOMfpn5s', '2020-06-01', 19128.99423731318, 14949.042233724145, 36803.33863683799, 291625.8053668295, '5', '2025-05-19 09:34:12.506+00', '2025-05-19 09:34:12.506+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (302, 'Кузов (Урал-4320)', 'BODY', 'hiu8f2WlO6RXJaZ', '2020-06-01', 134674.91215098373, 5388.900372707822, 19542.624314021738, 108423.88367794387, '4', '2025-05-19 09:34:12.508+00', '2025-05-19 09:34:12.508+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (303, 'Система живлення (Урал-4320)', 'POWER_SYSTEM', 'nltFwFnmgKeb8Tt', '2020-06-01', 70169.11973682196, 3847.754411117663, 9523.108316083872, 138645.3316948273, '5', '2025-05-19 09:34:12.51+00', '2025-05-19 09:34:12.51+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (304, 'Система охолодження (Урал-4320)', 'COOLING_SYSTEM', 'Q6CY48M996mOS2L', '2020-06-01', 183850.4376896763, 8883.990164062361, 24889.145347281647, 263066.8604751305, '1', '2025-05-19 09:34:12.512+00', '2025-05-19 09:34:12.512+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (305, 'Гальмівна система (Урал-4320)', 'BRAKE_SYSTEM', 'doszOx0oDkiMIM1', '2020-06-01', 47513.38725040833, 1541.732061528476, 14079.382839978383, 82604.80596355876, '2', '2025-05-19 09:34:12.514+00', '2025-05-19 09:34:12.514+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (306, 'Система моніторингу (Урал-4320)', 'MONITORING_SYSTEM', 'looD6AxFIZSY8ux', '2020-06-01', 181831.9589625222, 4129.321500672966, 6710.830505852426, 84089.71105172625, '2', '2025-05-19 09:34:12.516+00', '2025-05-19 09:34:12.516+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (307, 'Паливна система (Урал-4320)', 'FUEL_SYSTEM', 'byW7MKNt0pX8kw0', '2020-06-01', 113115.42452833365, 16033.137043935994, 7201.944802341017, 293496.1855218103, '2', '2025-05-19 09:34:12.518+00', '2025-05-19 09:34:12.518+00', 39);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (308, 'Двигун (КАВЗ)', 'ENGINE', 'hxUJcUS0QVHGgb0', '2017-11-20', 116016.66176917066, 7851.2422583729085, 24308.407629808495, 51163.34374706523, '3', '2025-05-19 09:34:12.52+00', '2025-05-19 09:34:12.52+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (309, 'Коробка передач (КАВЗ)', 'GEARBOX', 'cYzVStL9k7eRsjw', '2017-11-20', 41027.9229128758, 188.0947161271818, 28112.81615521122, 230510.2778200336, '1', '2025-05-19 09:34:12.522+00', '2025-05-19 09:34:12.522+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (310, 'Трансмісія (КАВЗ)', 'TRANSMISSION', 'di69aRpTMVFPpTv', '2017-11-20', 386454.15899889165, 8229.060934833004, 24138.856432286382, 88388.41337712228, '4', '2025-05-19 09:34:12.524+00', '2025-05-19 09:34:12.524+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (311, 'Шасі (КАВЗ)', 'CHASSIS', 'o7LOXVjcYQcndFH', '2017-11-20', 270049.82350774924, 12341.20534614028, 26196.348680250678, 131971.37214901875, '2', '2025-05-19 09:34:12.526+00', '2025-05-19 09:34:12.526+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (312, 'Кузов (КАВЗ)', 'BODY', 'mbImnmTkFYH9M7V', '2017-11-20', 219846.31337568737, 17320.3101691908, 14225.37755277867, 122581.63000938873, '4', '2025-05-19 09:34:12.528+00', '2025-05-19 09:34:12.528+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (313, 'Система живлення (КАВЗ)', 'POWER_SYSTEM', 'GobpAOAUsozoqyY', '2017-11-20', 191395.28895305167, 5763.620894826802, 34328.79410717352, 227446.8720004736, '2', '2025-05-19 09:34:12.531+00', '2025-05-19 09:34:12.531+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (314, 'Система охолодження (КАВЗ)', 'COOLING_SYSTEM', 'NPDxh9EIKJTnCrq', '2017-11-20', 274300.18668931554, 14461.510443673133, 20344.161478191298, 250489.01596010642, '1', '2025-05-19 09:34:12.533+00', '2025-05-19 09:34:12.533+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (315, 'Гальмівна система (КАВЗ)', 'BRAKE_SYSTEM', 'OChStezgcrnPI0n', '2017-11-20', 42589.62380102876, 6252.080371168992, 20192.42405263078, 284883.1328890801, '4', '2025-05-19 09:34:12.535+00', '2025-05-19 09:34:12.535+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (316, 'Система моніторингу (КАВЗ)', 'MONITORING_SYSTEM', 'HuKUJNCMJTZ2fzX', '2017-11-20', 57941.78631894899, 10819.871471519667, 37470.525400171886, 204321.9737690788, '3', '2025-05-19 09:34:12.537+00', '2025-05-19 09:34:12.537+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (317, 'Паливна система (КАВЗ)', 'FUEL_SYSTEM', 'gcJgYI0VFpzlUVs', '2017-11-20', 294000.7390895068, 1439.5118304900639, 15962.895889322042, 290238.2810171151, '4', '2025-05-19 09:34:12.539+00', '2025-05-19 09:34:12.539+00', 40);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (318, 'Двигун (ПАЗ)', 'ENGINE', 'vz91VLDgN1VTsta', '2002-06-15', 161453.17102186085, 26324.897523194584, 22146.924025749384, 121671.61568664499, '1', '2025-05-19 09:34:12.541+00', '2025-05-19 09:34:12.541+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (319, 'Коробка передач (ПАЗ)', 'GEARBOX', '4B4WILWXozrTFAk', '2002-06-15', 84628.96478793643, 17724.93532243686, 35744.78105943465, 192761.0484528955, '1', '2025-05-19 09:34:12.543+00', '2025-05-19 09:34:12.543+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (320, 'Трансмісія (ПАЗ)', 'TRANSMISSION', 'NG1w4bvuZMUyISS', '2002-06-15', 278272.67863393313, 18715.101440381946, 35997.28777243918, 72804.31230546914, '1', '2025-05-19 09:34:12.545+00', '2025-05-19 09:34:12.545+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (321, 'Шасі (ПАЗ)', 'CHASSIS', 'hSvpWXI7NfZzOoL', '2002-06-15', 10987.71309502475, 1622.923628024317, 7808.965802656452, 192431.75717289903, '5', '2025-05-19 09:34:12.548+00', '2025-05-19 09:34:12.548+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (322, 'Кузов (ПАЗ)', 'BODY', '4acpVdBDZt8ELdL', '2002-06-15', 9470.410970394107, 13.5708505051789, 24830.389018898357, 157549.54238081782, '4', '2025-05-19 09:34:12.55+00', '2025-05-19 09:34:12.55+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (323, 'Система живлення (ПАЗ)', 'POWER_SYSTEM', 'KhP6lB2bQ1Bp7Hj', '2002-06-15', 352657.71562152257, 4739.33411166148, 31401.53593836461, 205074.9778378428, '1', '2025-05-19 09:34:12.552+00', '2025-05-19 09:34:12.552+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (324, 'Система охолодження (ПАЗ)', 'COOLING_SYSTEM', '93FdkhKj5lO8ux7', '2002-06-15', 61646.95683303182, 2073.489589350845, 11255.930378361187, 68454.48591034015, '4', '2025-05-19 09:34:12.554+00', '2025-05-19 09:34:12.554+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (325, 'Гальмівна система (ПАЗ)', 'BRAKE_SYSTEM', 'DerX8nZj1d7qR0k', '2002-06-15', 97409.74048349498, 1537.927647271132, 31082.9941081046, 65646.16623374326, '1', '2025-05-19 09:34:12.556+00', '2025-05-19 09:34:12.556+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (326, 'Система моніторингу (ПАЗ)', 'MONITORING_SYSTEM', '8Sn8yei6781OApE', '2002-06-15', 95106.99522490862, 1536.632467139476, 15195.364130861624, 105272.29273858514, '4', '2025-05-19 09:34:12.558+00', '2025-05-19 09:34:12.558+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (327, 'Паливна система (ПАЗ)', 'FUEL_SYSTEM', 'AT3zRTEuhMj6hUl', '2002-06-15', 49165.72736032738, 3264.4642988885735, 22951.8390672873, 238832.36818145993, '2', '2025-05-19 09:34:12.56+00', '2025-05-19 09:34:12.56+00', 41);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (328, 'Двигун (ПАЗ)', 'ENGINE', 'h7fEC47APYZ8cZ4', '2005-10-11', 10671.848424487702, 2971.491178174063, 10801.474831645472, 74536.33707562169, '3', '2025-05-19 09:34:12.562+00', '2025-05-19 09:34:12.562+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (329, 'Коробка передач (ПАЗ)', 'GEARBOX', 'A9s4etMuSlZ548y', '2005-10-11', 23172.88197182531, 20706.25191865191, 10658.082281943953, 225620.89364000226, '5', '2025-05-19 09:34:12.564+00', '2025-05-19 09:34:12.564+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (330, 'Трансмісія (ПАЗ)', 'TRANSMISSION', 'ZBekgXPlno8eIC2', '2005-10-11', 182557.5944907378, 15277.437954320087, 23152.757861920345, 73813.1730453241, '3', '2025-05-19 09:34:12.566+00', '2025-05-19 09:34:12.566+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (331, 'Шасі (ПАЗ)', 'CHASSIS', '2bUkcrwxu63bHEQ', '2005-10-11', 168712.76366087914, 11139.791514860817, 25829.139090157674, 238663.03873585156, '2', '2025-05-19 09:34:12.568+00', '2025-05-19 09:34:12.568+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (332, 'Кузов (ПАЗ)', 'BODY', 'lCQoI1ba6Lv54Bs', '2005-10-11', 163815.97037940222, 9270.282209841618, 11217.713938718589, 191917.58698666125, '4', '2025-05-19 09:34:12.57+00', '2025-05-19 09:34:12.57+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (333, 'Система живлення (ПАЗ)', 'POWER_SYSTEM', 'NdHcaTxShAYulEP', '2005-10-11', 100211.4433771666, 7755.783872586025, 5383.375450921014, 236505.73451334285, '4', '2025-05-19 09:34:12.572+00', '2025-05-19 09:34:12.572+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (334, 'Система охолодження (ПАЗ)', 'COOLING_SYSTEM', 'QYAHhlkyPDnlLHG', '2005-10-11', 97907.35561644047, 1699.4167663960122, 7931.763819321144, 204901.75999229078, '1', '2025-05-19 09:34:12.575+00', '2025-05-19 09:34:12.575+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (335, 'Гальмівна система (ПАЗ)', 'BRAKE_SYSTEM', 'KXeSVT62gUeXJio', '2005-10-11', 81975.78035910819, 7031.6871648450915, 23371.06750633559, 148956.4439055766, '2', '2025-05-19 09:34:12.577+00', '2025-05-19 09:34:12.577+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (336, 'Система моніторингу (ПАЗ)', 'MONITORING_SYSTEM', 'gP4bhNtbOrT4m3N', '2005-10-11', 66754.6600737741, 20072.437879352456, 21380.509457471795, 235290.45541176831, '2', '2025-05-19 09:34:12.58+00', '2025-05-19 09:34:12.58+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (337, 'Паливна система (ПАЗ)', 'FUEL_SYSTEM', 'RAntxvTupSqTSRP', '2005-10-11', 59535.00940038679, 28036.69304850146, 23618.28978194371, 100703.07791737045, '3', '2025-05-19 09:34:12.594+00', '2025-05-19 09:34:12.594+00', 42);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (338, 'Двигун (Pickup)', 'ENGINE', '1kdIeS50BTVunjz', '2004-02-05', 7384.043483737161, 75.22106142447285, 36267.277861234295, 208322.91753535366, '4', '2025-05-19 09:34:12.597+00', '2025-05-19 09:34:12.597+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (339, 'Коробка передач (Pickup)', 'GEARBOX', 'tgZIWZ5h4xeqUJr', '2004-02-05', 258752.44109413787, 3626.3679855537584, 21838.890401166853, 174345.50276430877, '5', '2025-05-19 09:34:12.599+00', '2025-05-19 09:34:12.599+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (340, 'Трансмісія (Pickup)', 'TRANSMISSION', '9kPIbbxNZZJLMMg', '2004-02-05', 7240.1752211472, 2598.1963663781958, 32067.731740471343, 229623.15583456977, '5', '2025-05-19 09:34:12.602+00', '2025-05-19 09:34:12.602+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (341, 'Шасі (Pickup)', 'CHASSIS', 'nu3EMH3F7J27GPP', '2004-02-05', 109693.77831194409, 5440.105999505361, 12265.0623494229, 195144.44259592262, '5', '2025-05-19 09:34:12.604+00', '2025-05-19 09:34:12.604+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (342, 'Кузов (Pickup)', 'BODY', 'Yq3WElbkaucyaiJ', '2004-02-05', 168955.60228531618, 11000.42048660979, 19935.596229684248, 137446.78104221442, '1', '2025-05-19 09:34:12.606+00', '2025-05-19 09:34:12.606+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (343, 'Система живлення (Pickup)', 'POWER_SYSTEM', '9hQajiFnuuaDta2', '2004-02-05', 134215.6017509748, 37.11385902991666, 20453.131378256345, 298781.3923590356, '5', '2025-05-19 09:34:12.609+00', '2025-05-19 09:34:12.609+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (344, 'Система охолодження (Pickup)', 'COOLING_SYSTEM', 'pe56MhhZ7TMnJYU', '2004-02-05', 25857.75211917889, 10022.316368743544, 38422.77988032276, 228861.62009757894, '4', '2025-05-19 09:34:12.611+00', '2025-05-19 09:34:12.611+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (345, 'Гальмівна система (Pickup)', 'BRAKE_SYSTEM', 'QrRFy0ec1W89xEm', '2004-02-05', 24429.892741921725, 13420.140041878787, 18556.318003321205, 119747.02269847727, '2', '2025-05-19 09:34:12.613+00', '2025-05-19 09:34:12.613+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (346, 'Система моніторингу (Pickup)', 'MONITORING_SYSTEM', 'DcQmpH0rLLcLoVq', '2004-02-05', 77486.58706402768, 2970.860361993919, 27558.265653596536, 237792.8611694071, '3', '2025-05-19 09:34:12.615+00', '2025-05-19 09:34:12.615+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (347, 'Паливна система (Pickup)', 'FUEL_SYSTEM', 'hVQjG6UqFiuAFqk', '2004-02-05', 23519.243846958467, 13142.543156852782, 11350.591942696472, 227342.77420202066, '5', '2025-05-19 09:34:12.617+00', '2025-05-19 09:34:12.617+00', 43);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (348, 'Двигун (ПАЗ)', 'ENGINE', 'W31i3gzkI0yXkzX', '2017-07-21', 77401.65959703826, 8589.470826877372, 26978.286616286103, 285098.274399437, '4', '2025-05-19 09:34:12.619+00', '2025-05-19 09:34:12.619+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (349, 'Коробка передач (ПАЗ)', 'GEARBOX', 'CUa2k1BE9qbm0Wo', '2017-07-21', 79458.06834511914, 9583.609848328771, 25777.713675399675, 174063.38162874614, '5', '2025-05-19 09:34:12.621+00', '2025-05-19 09:34:12.621+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (350, 'Трансмісія (ПАЗ)', 'TRANSMISSION', 'Bijx9MgYLrdfNUh', '2017-07-21', 130167.66378188504, 19496.613563274514, 30245.12635836524, 223617.85471656927, '5', '2025-05-19 09:34:12.624+00', '2025-05-19 09:34:12.624+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (351, 'Шасі (ПАЗ)', 'CHASSIS', 'jeMU4S2B1Nty9xw', '2017-07-21', 63256.410983678, 16347.632667205913, 11011.515923122188, 53897.24606741731, '3', '2025-05-19 09:34:12.626+00', '2025-05-19 09:34:12.626+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (352, 'Кузов (ПАЗ)', 'BODY', 'PHdLhoeAHCVA2iG', '2017-07-21', 65694.66091161767, 11351.817162397178, 32346.242404532873, 288665.4062739252, '5', '2025-05-19 09:34:12.628+00', '2025-05-19 09:34:12.628+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (353, 'Система живлення (ПАЗ)', 'POWER_SYSTEM', 'qkXJrzWgi1uXR2x', '2017-07-21', 114119.3412866903, 26325.539597749717, 23914.97993167893, 152371.63789168108, '5', '2025-05-19 09:34:12.629+00', '2025-05-19 09:34:12.629+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (354, 'Система охолодження (ПАЗ)', 'COOLING_SYSTEM', 'qxEf04U6RQp8nL5', '2017-07-21', 13924.005220608013, 4179.127951634413, 9513.69640629872, 293215.23941962793, '4', '2025-05-19 09:34:12.631+00', '2025-05-19 09:34:12.631+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (355, 'Гальмівна система (ПАЗ)', 'BRAKE_SYSTEM', 'dXxGFPv0FgCaOmz', '2017-07-21', 14442.275652806155, 2451.6704464615023, 30518.60308518708, 237402.66041781844, '3', '2025-05-19 09:34:12.633+00', '2025-05-19 09:34:12.633+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (356, 'Система моніторингу (ПАЗ)', 'MONITORING_SYSTEM', 'wlTP9ZYCRE0xtMd', '2017-07-21', 35377.94758232638, 454.0626535336987, 33663.150268928206, 198827.37985871496, '1', '2025-05-19 09:34:12.636+00', '2025-05-19 09:34:12.636+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (357, 'Паливна система (ПАЗ)', 'FUEL_SYSTEM', 'sN5j9aCobzmiSWZ', '2017-07-21', 2179.589039410463, 1167.7656639339489, 17755.567355836636, 134974.15144376675, '5', '2025-05-19 09:34:12.638+00', '2025-05-19 09:34:12.638+00', 44);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (358, 'Двигун (КАВЗ)', 'ENGINE', 'VVPLuKQjpdA11nL', '2021-08-08', 204776.72225752595, 6542.549555412625, 36645.07681644628, 191897.36093378745, '1', '2025-05-19 09:34:12.64+00', '2025-05-19 09:34:12.64+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (359, 'Коробка передач (КАВЗ)', 'GEARBOX', 'PtryhH5tN2nwJEz', '2021-08-08', 64214.6993443013, 7410.0182375449385, 20708.043563247607, 242359.63784686584, '4', '2025-05-19 09:34:12.642+00', '2025-05-19 09:34:12.642+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (360, 'Трансмісія (КАВЗ)', 'TRANSMISSION', '64f6ohoRnSPBCgt', '2021-08-08', 266088.57440574944, 11342.547501542093, 27393.01752947181, 108891.59852637371, '2', '2025-05-19 09:34:12.644+00', '2025-05-19 09:34:12.644+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (361, 'Шасі (КАВЗ)', 'CHASSIS', 'fDR4OugXoUfHi1o', '2021-08-08', 81866.80649583283, 8032.348331652185, 17555.223757780925, 122637.28119333879, '3', '2025-05-19 09:34:12.646+00', '2025-05-19 09:34:12.646+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (362, 'Кузов (КАВЗ)', 'BODY', '54blVcQ2EzTxZgS', '2021-08-08', 78289.68211615518, 12117.014250512175, 25563.088971397217, 240000.77532125302, '4', '2025-05-19 09:34:12.648+00', '2025-05-19 09:34:12.648+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (363, 'Система живлення (КАВЗ)', 'POWER_SYSTEM', 'QbQHkyLAxHI0Tx9', '2021-08-08', 9581.212000862588, 6767.106137221467, 14866.683071952111, 157146.16918401944, '1', '2025-05-19 09:34:12.649+00', '2025-05-19 09:34:12.649+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (364, 'Система охолодження (КАВЗ)', 'COOLING_SYSTEM', 'qeSdte6eDCrl3bo', '2021-08-08', 265736.5094291177, 47.68864950243082, 39677.10023167765, 60395.59745703217, '4', '2025-05-19 09:34:12.651+00', '2025-05-19 09:34:12.651+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (365, 'Гальмівна система (КАВЗ)', 'BRAKE_SYSTEM', 'YvsWqbVFj9OFLni', '2021-08-08', 53825.175668255295, 4201.058194977798, 17214.224893305684, 65490.88288535566, '1', '2025-05-19 09:34:12.653+00', '2025-05-19 09:34:12.653+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (366, 'Система моніторингу (КАВЗ)', 'MONITORING_SYSTEM', '25RlSMqyPPkGLKy', '2021-08-08', 218286.48547712108, 19367.25463338304, 37248.78995859946, 82547.80494046533, '5', '2025-05-19 09:34:12.655+00', '2025-05-19 09:34:12.655+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (367, 'Паливна система (КАВЗ)', 'FUEL_SYSTEM', 'pdINDAig4KVvOwo', '2021-08-08', 31332.018106124044, 127.42187904915984, 37761.16183847444, 170176.56071586985, '5', '2025-05-19 09:34:12.657+00', '2025-05-19 09:34:12.657+00', 45);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (368, 'Двигун (Pickup)', 'ENGINE', 'skrkG56PcMnF14y', '2018-09-24', 66919.57601176087, 15211.319414188036, 23062.50760359836, 266534.80939000065, '3', '2025-05-19 09:34:12.659+00', '2025-05-19 09:34:12.659+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (369, 'Коробка передач (Pickup)', 'GEARBOX', 'adJWxTXa3Z68p0X', '2018-09-24', 212282.80683617722, 5341.612237164298, 7510.08192851889, 221742.34584990676, '3', '2025-05-19 09:34:12.662+00', '2025-05-19 09:34:12.662+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (370, 'Трансмісія (Pickup)', 'TRANSMISSION', 'Vt7ZcjrlswGIn6l', '2018-09-24', 71487.70189685437, 9822.241465742167, 29584.63196296569, 155332.96641609626, '2', '2025-05-19 09:34:12.664+00', '2025-05-19 09:34:12.664+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (371, 'Шасі (Pickup)', 'CHASSIS', 'snosvr8814NDsMU', '2018-09-24', 23346.59650599941, 13998.591448849182, 38915.01447529374, 171557.1112651017, '3', '2025-05-19 09:34:12.665+00', '2025-05-19 09:34:12.665+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (372, 'Кузов (Pickup)', 'BODY', 'LhPKjTatsWBopwD', '2018-09-24', 249849.16437889135, 5574.5187716960145, 17364.63786992623, 294842.7283786944, '2', '2025-05-19 09:34:12.667+00', '2025-05-19 09:34:12.667+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (373, 'Система живлення (Pickup)', 'POWER_SYSTEM', 'nIOIoRbpIRw5jP0', '2018-09-24', 77676.19830277204, 3412.2973910974274, 9439.682432784393, 68342.49218667671, '3', '2025-05-19 09:34:12.669+00', '2025-05-19 09:34:12.669+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (374, 'Система охолодження (Pickup)', 'COOLING_SYSTEM', 'OWQWLi6Rog5d644', '2018-09-24', 202171.07572842322, 4548.8276500740485, 17299.164799211416, 225949.21674838365, '3', '2025-05-19 09:34:12.671+00', '2025-05-19 09:34:12.671+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (375, 'Гальмівна система (Pickup)', 'BRAKE_SYSTEM', 'IEKELHF8NJcNs3v', '2018-09-24', 236993.47365923182, 9387.846304729166, 34659.52395708565, 121904.25177420906, '1', '2025-05-19 09:34:12.672+00', '2025-05-19 09:34:12.672+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (376, 'Система моніторингу (Pickup)', 'MONITORING_SYSTEM', 'ztB8oA2mbCAC6kZ', '2018-09-24', 91768.88409000267, 4109.027166063672, 12537.321168628772, 137297.26151389984, '1', '2025-05-19 09:34:12.674+00', '2025-05-19 09:34:12.674+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (377, 'Паливна система (Pickup)', 'FUEL_SYSTEM', 'ePhnZ3cB9VKzk4a', '2018-09-24', 8206.822618792741, 402.2167953744984, 25921.782776219505, 57958.29271686643, '1', '2025-05-19 09:34:12.676+00', '2025-05-19 09:34:12.676+00', 46);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (378, 'Двигун (TATRA-815)', 'ENGINE', 'phVd74JOS9U2cOD', '2021-04-21', 55161.12852530368, 10526.171300191561, 36630.47121501492, 262903.6843807588, '5', '2025-05-19 09:34:12.678+00', '2025-05-19 09:34:12.678+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (379, 'Коробка передач (TATRA-815)', 'GEARBOX', 'e4QgKbbS1gfKl91', '2021-04-21', 6908.73383555278, 2920.983544954542, 33975.98004842363, 195031.0827048838, '1', '2025-05-19 09:34:12.679+00', '2025-05-19 09:34:12.679+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (380, 'Трансмісія (TATRA-815)', 'TRANSMISSION', 'q9te9SxM5eZXKAh', '2021-04-21', 47938.84720581989, 9078.344932746391, 7827.946139963762, 70262.70442795291, '4', '2025-05-19 09:34:12.681+00', '2025-05-19 09:34:12.681+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (381, 'Шасі (TATRA-815)', 'CHASSIS', 'tUXh9bJwGbl5iUl', '2021-04-21', 36384.05661306415, 5794.890150527658, 21112.617352376692, 181378.03783971263, '5', '2025-05-19 09:34:12.683+00', '2025-05-19 09:34:12.683+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (382, 'Кузов (TATRA-815)', 'BODY', '6FPLQmuNAZ3OiUv', '2021-04-21', 43054.32658027568, 9327.14095951384, 28376.658329111946, 124683.73009040325, '2', '2025-05-19 09:34:12.684+00', '2025-05-19 09:34:12.684+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (383, 'Система живлення (TATRA-815)', 'POWER_SYSTEM', 'PaWRKmNBOpTicRe', '2021-04-21', 46949.430514277374, 11249.016955852, 13418.33372001455, 290169.3375196514, '2', '2025-05-19 09:34:12.686+00', '2025-05-19 09:34:12.686+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (384, 'Система охолодження (TATRA-815)', 'COOLING_SYSTEM', 'SXBzXyd0kkMkKSI', '2021-04-21', 3944.678854960961, 542.1766901403802, 7173.094616550555, 251697.3166440088, '1', '2025-05-19 09:34:12.688+00', '2025-05-19 09:34:12.688+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (385, 'Гальмівна система (TATRA-815)', 'BRAKE_SYSTEM', 'NGogX1EHFvVfwql', '2021-04-21', 35142.56344496654, 7026.423900798615, 23622.90507039826, 209639.17125168664, '4', '2025-05-19 09:34:12.689+00', '2025-05-19 09:34:12.689+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (386, 'Система моніторингу (TATRA-815)', 'MONITORING_SYSTEM', 'ayXHRGLMBYdXN9u', '2021-04-21', 33519.59306331411, 15908.434637314855, 19304.930766533907, 127920.13582948626, '4', '2025-05-19 09:34:12.691+00', '2025-05-19 09:34:12.691+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (387, 'Паливна система (TATRA-815)', 'FUEL_SYSTEM', 'IvfiDnF2svkSMGl', '2021-04-21', 17153.408229453053, 1249.8231900796702, 16495.172240132837, 235027.88126051388, '4', '2025-05-19 09:34:12.693+00', '2025-05-19 09:34:12.693+00', 47);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (388, 'Двигун (ЛуАЗ-1302)', 'ENGINE', 'pBy6LQtemvy8VgL', '2022-06-25', 135055.4524431557, 653.5295847158521, 13821.88463618865, 287327.53424598946, '1', '2025-05-19 09:34:12.695+00', '2025-05-19 09:34:12.695+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (389, 'Коробка передач (ЛуАЗ-1302)', 'GEARBOX', 'VvuHBiEsEVsQ4Rf', '2022-06-25', 165293.61813783782, 3080.434001919846, 8339.457560158204, 149214.22563860234, '4', '2025-05-19 09:34:12.696+00', '2025-05-19 09:34:12.696+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (390, 'Трансмісія (ЛуАЗ-1302)', 'TRANSMISSION', 'EsPDI54HUgtEo14', '2022-06-25', 2185.7309279103797, 1146.3285934988462, 21770.207362516, 224808.44666365962, '1', '2025-05-19 09:34:12.698+00', '2025-05-19 09:34:12.698+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (391, 'Шасі (ЛуАЗ-1302)', 'CHASSIS', 'nHH2A7146dvWxQb', '2022-06-25', 398898.88495542505, 1834.5280749043868, 15624.051920276142, 94205.93611449141, '3', '2025-05-19 09:34:12.7+00', '2025-05-19 09:34:12.7+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (392, 'Кузов (ЛуАЗ-1302)', 'BODY', 'poSOorTPe6XIpp1', '2022-06-25', 251774.64930231878, 2262.586854519986, 35647.69569571366, 287292.9096375711, '5', '2025-05-19 09:34:12.701+00', '2025-05-19 09:34:12.701+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (393, 'Система живлення (ЛуАЗ-1302)', 'POWER_SYSTEM', 'p6tMssotCg2Y0qQ', '2022-06-25', 189175.6369196215, 13457.597462854459, 18026.857170935342, 151550.1168485337, '5', '2025-05-19 09:34:12.703+00', '2025-05-19 09:34:12.703+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (394, 'Система охолодження (ЛуАЗ-1302)', 'COOLING_SYSTEM', 'znA44RAEiq9oTNm', '2022-06-25', 213803.98888892066, 10631.722335808841, 39872.36167537241, 125825.63688970951, '5', '2025-05-19 09:34:12.705+00', '2025-05-19 09:34:12.705+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (395, 'Гальмівна система (ЛуАЗ-1302)', 'BRAKE_SYSTEM', '2aNbMxfWARFjjz8', '2022-06-25', 25716.576863705253, 27.94119726282005, 12262.833534103731, 215662.8965928994, '2', '2025-05-19 09:34:12.706+00', '2025-05-19 09:34:12.706+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (396, 'Система моніторингу (ЛуАЗ-1302)', 'MONITORING_SYSTEM', 'qqhLg7wo7vpd6a9', '2022-06-25', 178543.46143508906, 1144.7348226989436, 32342.74581279207, 267897.3525914416, '4', '2025-05-19 09:34:12.708+00', '2025-05-19 09:34:12.708+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (397, 'Паливна система (ЛуАЗ-1302)', 'FUEL_SYSTEM', 'cxmCU5IlFL3V67B', '2022-06-25', 364710.4804997968, 4760.655733137187, 8668.933743646621, 181714.9281796927, '1', '2025-05-19 09:34:12.71+00', '2025-05-19 09:34:12.71+00', 48);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (398, 'Двигун (КАВЗ)', 'ENGINE', 'bovapnmddFghHtM', '2015-10-06', 80775.05941203967, 24586.183343152094, 13077.628553888278, 283068.85061181814, '3', '2025-05-19 09:34:12.711+00', '2025-05-19 09:34:12.711+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (399, 'Коробка передач (КАВЗ)', 'GEARBOX', 'aMn7Y1hxnFxIkwN', '2015-10-06', 17489.571149344647, 448.3025230765777, 34057.59886767277, 216339.79330411443, '3', '2025-05-19 09:34:12.713+00', '2025-05-19 09:34:12.713+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (400, 'Трансмісія (КАВЗ)', 'TRANSMISSION', 'JOw3iNrFseWPKf4', '2015-10-06', 7870.881371257661, 3959.1737910161196, 18613.3790738774, 139051.54086292378, '3', '2025-05-19 09:34:12.715+00', '2025-05-19 09:34:12.715+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (401, 'Шасі (КАВЗ)', 'CHASSIS', 'xVCyIHgmjKirkJb', '2015-10-06', 45525.71446958264, 2776.8004569465684, 7564.575028456972, 94753.32192969261, '1', '2025-05-19 09:34:12.717+00', '2025-05-19 09:34:12.717+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (402, 'Кузов (КАВЗ)', 'BODY', 'Z8i3elKFwlLNnG7', '2015-10-06', 22242.77548245885, 4545.314234883671, 36094.52446742137, 263352.79342705314, '2', '2025-05-19 09:34:12.718+00', '2025-05-19 09:34:12.718+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (403, 'Система живлення (КАВЗ)', 'POWER_SYSTEM', '92G8gE8PDJOEQdE', '2015-10-06', 81474.69767134693, 8956.786011305996, 38382.53396240209, 238004.17037910945, '5', '2025-05-19 09:34:12.72+00', '2025-05-19 09:34:12.72+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (404, 'Система охолодження (КАВЗ)', 'COOLING_SYSTEM', 'L2ReEjmV6lNkF7b', '2015-10-06', 16157.687901480575, 15167.358017762364, 11107.602546689752, 254307.57274269723, '1', '2025-05-19 09:34:12.722+00', '2025-05-19 09:34:12.722+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (405, 'Гальмівна система (КАВЗ)', 'BRAKE_SYSTEM', 'qsBlpZq7uBkuUUD', '2015-10-06', 4790.876538169984, 2187.0745187755747, 30077.484571312856, 195555.29272920825, '5', '2025-05-19 09:34:12.723+00', '2025-05-19 09:34:12.723+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (406, 'Система моніторингу (КАВЗ)', 'MONITORING_SYSTEM', 'xOBDpJhWLjBqAO8', '2015-10-06', 110260.26140507738, 6270.79094654182, 37187.373776835724, 64595.24385186067, '2', '2025-05-19 09:34:12.725+00', '2025-05-19 09:34:12.725+00', 49);
INSERT INTO public."VehicleComponents" (id, name, "componentType", "manufacturerNumber", "manufacturedAt", "mileageSinceManufactured", "mileageAfterLastRepair", "annualResourceNorm", "maxResource", "conditionCategory", "createdAt", "updatedAt", "vehicleId") VALUES (407, 'Паливна система (КАВЗ)', 'FUEL_SYSTEM', 'jjmrH6ClHPQpuAV', '2015-10-06', 50358.03145782731, 12400.915343876897, 17130.159191049883, 106636.22124033252, '2', '2025-05-19 09:34:12.727+00', '2025-05-19 09:34:12.727+00', 49);


--
-- Data for Name: Vehicles; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (30, 'КАМАЗ-4310', 'TRUCK', 'НК5545МОУ', '4XkcGYVXigF7', '2001-07-24', 'COMBAT', 126574.94165948994, 79590.62531383202, 'A-95', 'M-10G2k/M-10DM', '2025-05-19 09:34:12.247+00', '2025-05-19 09:34:12.247+00', 44);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (31, 'ПАЗ (військова модифікація)', 'BUS', 'СК4818НГУ', 'J6AZpP40BEvu', '2006-05-15', 'RESERVE', 471318.51596069126, 44673.82294324825, 'A-98', '15W-40', '2025-05-19 09:34:12.251+00', '2025-05-19 09:34:12.251+00', 45);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (32, 'ЛуАЗ-1302', 'CAR', 'АК1261СБУ', 'nmmjxspV5TpW', '2022-11-12', 'RESERVE', 298913.2764333123, 60011.7401275382, 'DIESEL', 'M-10G2k', '2025-05-19 09:34:12.253+00', '2025-05-19 09:34:12.253+00', 46);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (33, 'УАЗ-469', 'CAR', 'АА8412МОУ', 'vGFGBl7fbWEZ', '1988-07-07', 'DRILL', 44071.67140714142, 55957.22137995597, 'A-92', 'M-10G2k/M-10DM', '2025-05-19 09:34:12.255+00', '2025-05-19 09:34:12.255+00', 43);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (34, 'КАМАЗ-4310', 'TRUCK', 'ВН5971СЗРУ', '52MrsLDrycRl', '2014-11-29', 'RESERVE', 10157.374935927386, 47727.8128265401, 'A-98', '15W-40', '2025-05-19 09:34:12.257+00', '2025-05-19 09:34:12.257+00', 44);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (35, 'M939 (Five-ton truck)', 'TRUCK', 'СК6385СЗРУ', 'VOaiwMFVTwSD', '1980-04-15', 'RESERVE', 493134.41244358313, 19854.957868159094, 'DIESEL', '10W-40', '2025-05-19 09:34:12.26+00', '2025-05-19 09:34:12.26+00', 45);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (36, 'Богдан А092 (військова модифікація)', 'BUS', 'СН3064МОУ', 'fO2SVa82vCJS', '1997-03-04', 'TRAINING', 195572.91098849778, 52354.860499857095, 'A-92', 'M-10G2k', '2025-05-19 09:34:12.262+00', '2025-05-19 09:34:12.262+00', 46);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (37, 'КрАЗ-260', 'TRUCK', 'НС4657МОУ', '5aIU1tLWyzqV', '1994-04-18', 'TRAINING', 168540.178010743, 33267.6247711389, 'A-98', 'M-10G2k', '2025-05-19 09:34:12.264+00', '2025-05-19 09:34:12.264+00', 43);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (38, 'ЗІЛ-131', 'TRUCK', 'АА1491ДПСУ', 'MhXPdx7KOKO1', '1994-12-10', 'RESERVE', 450318.88265349355, 44361.01305777684, 'DIESEL', '15W-40', '2025-05-19 09:34:12.265+00', '2025-05-19 09:34:12.265+00', 44);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (39, 'Урал-4320', 'TRUCK', 'НК1263ДПСУ', '1u6p7Y55iVgV', '2003-06-02', 'COMBAT', 228816.9690969723, 58163.209153385695, 'DIESEL', 'M-8G2k/M-10G2k', '2025-05-19 09:34:12.268+00', '2025-05-19 09:34:12.268+00', 45);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (40, 'КАВЗ (військова модифікація)', 'BUS', 'АА4591СЗРУ', 'IPSvQxXAxmmX', '1988-08-20', 'DRILL', 451483.9524041007, 48755.03389759243, 'A-92', 'M-8G2k/M-10G2k', '2025-05-19 09:34:12.271+00', '2025-05-19 09:34:12.271+00', 46);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (41, 'ПАЗ (військова модифікація)', 'BUS', 'ВС9166НГУ', 'DVFQATR7yTj6', '1983-12-31', 'DRILL', 326540.4006721623, 28834.25582118034, 'A-80', '15W-40', '2025-05-19 09:34:12.272+00', '2025-05-19 09:34:12.272+00', 43);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (42, 'ПАЗ (військова модифікація)', 'BUS', 'НС9589МОУ', 'PQ572fglY48l', '1991-11-30', 'RESERVE', 232516.98762517583, 34062.200126242926, 'A-92', 'M-10G2k', '2025-05-19 09:34:12.274+00', '2025-05-19 09:34:12.274+00', 44);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (43, 'Pickup Truck', 'CAR', 'АК9481ЗСУ', 'moaCoZ9wMLz6', '1997-06-14', 'DRILL', 285528.76903199544, 43244.97486635868, 'A-92', '15W-40', '2025-05-19 09:34:12.277+00', '2025-05-19 09:34:12.277+00', 45);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (44, 'ПАЗ (військова модифікація)', 'BUS', 'АС2717ДПСУ', '6ftS9U6BugTU', '2006-05-21', 'TRAINING', 129703.55587057087, 25071.75870420088, 'DIESEL', 'M-8G2k/M-10G2k', '2025-05-19 09:34:12.279+00', '2025-05-19 09:34:12.279+00', 46);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (45, 'КАВЗ (військова модифікація)', 'BUS', 'АА1919МОУ', 'gU3twqBHMSg0', '2009-07-21', 'COMBAT', 318968.3047520178, 16628.78433677539, 'A-80', 'M-10G2k', '2025-05-19 09:34:12.281+00', '2025-05-19 09:34:12.281+00', 43);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (46, 'Pickup Truck', 'CAR', 'ВК1987СЗРУ', '8NNRS4etQMaa', '2015-03-11', 'COMBAT', 479157.6690228723, 51775.46543544887, 'A-80', 'M-8G2k/M-10G2k', '2025-05-19 09:34:12.282+00', '2025-05-19 09:34:12.282+00', 44);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (47, 'TATRA-815', 'TRUCK', 'ВК3526ЗСУ', 'YShsxPhISwvu', '2015-03-17', 'TRAINING', 97666.70514387879, 38389.00466160617, 'A-80', '10W-40', '2025-05-19 09:34:12.284+00', '2025-05-19 09:34:12.284+00', 45);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (48, 'ЛуАЗ-1302', 'CAR', 'СК2793СЗРУ', 'ZcV0uX2z5LQL', '1989-10-30', 'RESERVE', 419555.0603284472, 48041.60175975886, 'A-95', '15W-40', '2025-05-19 09:34:12.286+00', '2025-05-19 09:34:12.286+00', 46);
INSERT INTO public."Vehicles" (id, name, type, "licensePlate", "manufacturerNumber", "manufacturedAt", "operationGroup", "mileageSinceManufactured", "annualResourceNorm", "fuelType", "oilType", "createdAt", "updatedAt", "unitId") VALUES (49, 'КАВЗ (військова модифікація)', 'BUS', 'ВК8369ЗСУ', '1C8Wom508sgT', '2015-03-21', 'RESERVE', 137341.58121743106, 58651.43542926632, 'DIESEL', 'M-10G2k/M-10DM', '2025-05-19 09:34:12.288+00', '2025-05-19 09:34:12.288+00', 43);


--
-- Name: LogEntries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."LogEntries_id_seq"', 1, false);


--
-- Name: Maintenances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Maintenances_id_seq"', 363, true);


--
-- Name: MileageLogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."MileageLogs_id_seq"', 207, true);


--
-- Name: RepairComponents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."RepairComponents_id_seq"', 158, true);


--
-- Name: Repairs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Repairs_id_seq"', 99, true);


--
-- Name: Units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Units_id_seq"', 46, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Users_id_seq"', 58, true);


--
-- Name: VehicleComponents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."VehicleComponents_id_seq"', 407, true);


--
-- Name: Vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Vehicles_id_seq"', 49, true);


--
-- Name: LogEntries LogEntries_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."LogEntries"
    ADD CONSTRAINT "LogEntries_pkey" PRIMARY KEY (id);


--
-- Name: Maintenances Maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Maintenances"
    ADD CONSTRAINT "Maintenances_pkey" PRIMARY KEY (id);


--
-- Name: MileageLogs MileageLogs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."MileageLogs"
    ADD CONSTRAINT "MileageLogs_pkey" PRIMARY KEY (id);


--
-- Name: RepairComponents RepairComponents_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."RepairComponents"
    ADD CONSTRAINT "RepairComponents_pkey" PRIMARY KEY (id);


--
-- Name: Repairs Repairs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Repairs"
    ADD CONSTRAINT "Repairs_pkey" PRIMARY KEY (id);


--
-- Name: Units Units_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: VehicleComponents VehicleComponents_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."VehicleComponents"
    ADD CONSTRAINT "VehicleComponents_pkey" PRIMARY KEY (id);


--
-- Name: Vehicles Vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Vehicles"
    ADD CONSTRAINT "Vehicles_pkey" PRIMARY KEY (id);


--
-- Name: LogEntries LogEntries_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."LogEntries"
    ADD CONSTRAINT "LogEntries_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Maintenances Maintenances_vehicleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Maintenances"
    ADD CONSTRAINT "Maintenances_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES public."Vehicles"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: MileageLogs MileageLogs_vehicleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."MileageLogs"
    ADD CONSTRAINT "MileageLogs_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES public."Vehicles"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: RepairComponents RepairComponents_repairId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."RepairComponents"
    ADD CONSTRAINT "RepairComponents_repairId_fkey" FOREIGN KEY ("repairId") REFERENCES public."Repairs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: RepairComponents RepairComponents_vehicleComponentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."RepairComponents"
    ADD CONSTRAINT "RepairComponents_vehicleComponentId_fkey" FOREIGN KEY ("vehicleComponentId") REFERENCES public."VehicleComponents"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Repairs Repairs_vehicleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Repairs"
    ADD CONSTRAINT "Repairs_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES public."Vehicles"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Units Units_commanderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_commanderId_fkey" FOREIGN KEY ("commanderId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: VehicleComponents VehicleComponents_vehicleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."VehicleComponents"
    ADD CONSTRAINT "VehicleComponents_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES public."Vehicles"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Vehicles Vehicles_unitId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Vehicles"
    ADD CONSTRAINT "Vehicles_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES public."Units"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

