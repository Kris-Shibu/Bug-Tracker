-- Database: bug_tracker

-- DROP DATABASE IF EXISTS bug_tracker;

CREATE DATABASE bug_tracker
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE bug_tracker
    IS 'This  database  will help organisations manage and track bugs that they encounter in all stages of software development (such as production, development, quality assurance, Beta) etc.';

_

CREATE TABLE IF NOT EXISTS public."user"
(
    user_id bigint NOT NULL DEFAULT nextval('user_user_id_seq'::regclass),
    user_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (user_id)
)
ALTER TABLE IF EXISTS public."user"
    ADD COLUMN email_address character varying(20) COLLATE pg_catalog."default";
    
    ALTER TABLE IF EXISTS public."user"
    ADD COLUMN job_tittle character varying(10) COLLATE pg_catalog."default";
    
    
    CREATE TABLE IF NOT EXISTS public."bugs "
(
    bug_id bigint NOT NULL DEFAULT nextval('"bugs _bug_id_seq"'::regclass),
    environment character varying(20) COLLATE pg_catalog."default",
    project_name character varying(20) COLLATE pg_catalog."default",
    status character varying(10) COLLATE pg_catalog."default",
    summary character varying(50) COLLATE pg_catalog."default",
    priority character varying(10) COLLATE pg_catalog."default",
    opened_by character varying(20) COLLATE pg_catalog."default",
    opened_date date,
    opened_time time with time zone,
    closed_by character varying(20) COLLATE pg_catalog."default",
    closed_date date,
    closed_time time with time zone,
    CONSTRAINT "bugs _pkey" PRIMARY KEY (bug_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."bugs "
    OWNER to postgres;
    
    
    CREATE TABLE IF NOT EXISTS public.comments
(
    comment_id bigint NOT NULL DEFAULT nextval('comments_comment_id_seq'::regclass),
    user_id bigint,
    bug_id bigint,
    "comment " character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT comments_pkey PRIMARY KEY (comment_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.comments
    OWNER to postgres;
    