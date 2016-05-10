--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO whitechapel_geodjango;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO whitechapel_geodjango;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO whitechapel_geodjango;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO whitechapel_geodjango;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO whitechapel_geodjango;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO whitechapel_geodjango;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO whitechapel_geodjango;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO whitechapel_geodjango;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO whitechapel_geodjango;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO whitechapel_geodjango;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO whitechapel_geodjango;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO whitechapel_geodjango;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO whitechapel_geodjango;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO whitechapel_geodjango;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO whitechapel_geodjango;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO whitechapel_geodjango;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: map_category; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_category (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(140),
    thumbnail character varying(100)
);


ALTER TABLE public.map_category OWNER TO whitechapel_geodjango;

--
-- Name: map_category_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_category_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_category_id_seq OWNED BY map_category.id;


--
-- Name: map_document; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_document (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    feature_id integer NOT NULL,
    body text NOT NULL,
    end_year smallint,
    start_year smallint,
    "order" smallint NOT NULL,
    document_type_id integer,
    author_id integer NOT NULL,
    published boolean NOT NULL,
    pending boolean NOT NULL,
    last_edited date,
    body_processed text,
    anonymise boolean NOT NULL,
    CONSTRAINT map_document_end_year_check CHECK ((end_year >= 0)),
    CONSTRAINT map_document_order_check CHECK (("order" >= 0)),
    CONSTRAINT map_document_start_year_check CHECK ((start_year >= 0))
);


ALTER TABLE public.map_document OWNER TO whitechapel_geodjango;

--
-- Name: map_document_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_document_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_document_id_seq OWNED BY map_document.id;


--
-- Name: map_documenttype; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_documenttype (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.map_documenttype OWNER TO whitechapel_geodjango;

--
-- Name: map_documenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_documenttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_documenttype_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_documenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_documenttype_id_seq OWNED BY map_documenttype.id;


--
-- Name: map_feature; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_feature (
    id smallint NOT NULL,
    geom geometry(MultiPolygon,4326) NOT NULL,
    address character varying(100) NOT NULL,
    postcode character varying(8) NOT NULL,
    count smallint NOT NULL,
    thumbnail character varying(100),
    street character varying(100),
    b_number character varying(16),
    architect character varying(100),
    b_name character varying(100),
    b_type character varying(100),
    builders character varying(100),
    f_date smallint,
    materials character varying(100),
    original smallint,
    rebuild_1 smallint,
    rebuild_2 smallint,
    storeys smallint,
    c_area character varying(8),
    listed character varying(8),
    basement character varying(8),
    type character varying(100),
    CONSTRAINT map_feature_count_check CHECK ((count >= 0)),
    CONSTRAINT map_feature_f_date_check CHECK ((f_date >= 0)),
    CONSTRAINT map_feature_id_2e7c3175395d8bae_check CHECK ((id >= 0)),
    CONSTRAINT map_feature_original_check CHECK ((original >= 0)),
    CONSTRAINT map_feature_rebuild_1_check CHECK ((rebuild_1 >= 0)),
    CONSTRAINT map_feature_rebuild_2_check CHECK ((rebuild_2 >= 0)),
    CONSTRAINT map_feature_storeys_check CHECK ((storeys >= 0))
);


ALTER TABLE public.map_feature OWNER TO whitechapel_geodjango;

--
-- Name: map_feature_categories; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_feature_categories (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.map_feature_categories OWNER TO whitechapel_geodjango;

--
-- Name: map_feature_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_feature_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_feature_categories_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_feature_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_feature_categories_id_seq OWNED BY map_feature_categories.id;


--
-- Name: map_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_feature_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_feature_id_seq OWNED BY map_feature.id;


--
-- Name: map_image; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_image (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    file character varying(100),
    author_id integer NOT NULL,
    feature_id integer NOT NULL,
    pending boolean NOT NULL,
    published boolean NOT NULL,
    description text,
    last_edited date
);


ALTER TABLE public.map_image OWNER TO whitechapel_geodjango;

--
-- Name: map_image_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_image_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_image_id_seq OWNED BY map_image.id;


--
-- Name: map_media; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE map_media (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    description text,
    url character varying(200) NOT NULL,
    published boolean NOT NULL,
    pending boolean NOT NULL,
    author_id integer NOT NULL,
    feature_id integer NOT NULL,
    last_edited date
);


ALTER TABLE public.map_media OWNER TO whitechapel_geodjango;

--
-- Name: map_media_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE map_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_media_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: map_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE map_media_id_seq OWNED BY map_media.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO whitechapel_geodjango;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO whitechapel_geodjango;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: whitechapel_pages_page; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE whitechapel_pages_page (
    id integer NOT NULL,
    title character varying(140) NOT NULL,
    body text,
    is_front_page boolean NOT NULL,
    banner_image character varying(100),
    slug character varying(50) NOT NULL
);


ALTER TABLE public.whitechapel_pages_page OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_documents; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE whitechapel_pages_page_documents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    document_id integer NOT NULL
);


ALTER TABLE public.whitechapel_pages_page_documents OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE whitechapel_pages_page_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whitechapel_pages_page_documents_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE whitechapel_pages_page_documents_id_seq OWNED BY whitechapel_pages_page_documents.id;


--
-- Name: whitechapel_pages_page_features; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE whitechapel_pages_page_features (
    id integer NOT NULL,
    page_id integer NOT NULL,
    feature_id integer NOT NULL
);


ALTER TABLE public.whitechapel_pages_page_features OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_features_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE whitechapel_pages_page_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whitechapel_pages_page_features_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE whitechapel_pages_page_features_id_seq OWNED BY whitechapel_pages_page_features.id;


--
-- Name: whitechapel_pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE whitechapel_pages_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whitechapel_pages_page_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE whitechapel_pages_page_id_seq OWNED BY whitechapel_pages_page.id;


--
-- Name: whitechapel_pages_page_images; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE whitechapel_pages_page_images (
    id integer NOT NULL,
    page_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.whitechapel_pages_page_images OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_images_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE whitechapel_pages_page_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whitechapel_pages_page_images_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE whitechapel_pages_page_images_id_seq OWNED BY whitechapel_pages_page_images.id;


--
-- Name: whitechapel_pages_page_media; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE whitechapel_pages_page_media (
    id integer NOT NULL,
    page_id integer NOT NULL,
    media_id integer NOT NULL
);


ALTER TABLE public.whitechapel_pages_page_media OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_media_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE whitechapel_pages_page_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whitechapel_pages_page_media_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_pages_page_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE whitechapel_pages_page_media_id_seq OWNED BY whitechapel_pages_page_media.id;


--
-- Name: whitechapel_users_userprofile; Type: TABLE; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE TABLE whitechapel_users_userprofile (
    id integer NOT NULL,
    display_name character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public.whitechapel_users_userprofile OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_users_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: whitechapel_geodjango
--

CREATE SEQUENCE whitechapel_users_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.whitechapel_users_userprofile_id_seq OWNER TO whitechapel_geodjango;

--
-- Name: whitechapel_users_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whitechapel_geodjango
--

ALTER SEQUENCE whitechapel_users_userprofile_id_seq OWNED BY whitechapel_users_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_category ALTER COLUMN id SET DEFAULT nextval('map_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_document ALTER COLUMN id SET DEFAULT nextval('map_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_documenttype ALTER COLUMN id SET DEFAULT nextval('map_documenttype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_feature ALTER COLUMN id SET DEFAULT nextval('map_feature_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_feature_categories ALTER COLUMN id SET DEFAULT nextval('map_feature_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_image ALTER COLUMN id SET DEFAULT nextval('map_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_media ALTER COLUMN id SET DEFAULT nextval('map_media_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page ALTER COLUMN id SET DEFAULT nextval('whitechapel_pages_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_documents ALTER COLUMN id SET DEFAULT nextval('whitechapel_pages_page_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_features ALTER COLUMN id SET DEFAULT nextval('whitechapel_pages_page_features_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_images ALTER COLUMN id SET DEFAULT nextval('whitechapel_pages_page_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_media ALTER COLUMN id SET DEFAULT nextval('whitechapel_pages_page_media_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_users_userprofile ALTER COLUMN id SET DEFAULT nextval('whitechapel_users_userprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	hay.duncan@gmail.com	f	t	5
2	shlomit@shlomit.com	f	t	6
3	bong@mouse.com	f	t	7
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 3, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
1	2016-05-05 11:47:50.935057+01	2016-05-05 11:47:51.150738+01	5ohylrr7d7sfo7hb4qcha7yp6pigfqldzy5xyonzuxoa6v0buq6fy4sbfmxyvmx3	1
2	2016-05-05 15:52:52.070121+01	2016-05-05 15:52:52.385878+01	1qczwyfk0fltpy5uhu6frcmcqhup6d00vrsqoo8qqygsz7gtlpqh5vinhv4popzp	2
3	2016-05-09 17:26:53.26746+01	2016-05-09 17:26:53.570065+01	iyupiwmyglxrmiu5e33flrjixxiv3mhiuhna54ttp1rpqmcsdkaqdmuaubhd7jy6	3
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 3, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
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
22	Can add category	8	add_category
23	Can change category	8	change_category
24	Can delete category	8	delete_category
25	Can add Building	9	add_feature
26	Can change Building	9	change_feature
27	Can delete Building	9	delete_feature
28	Can add document type	10	add_documenttype
29	Can change document type	10	change_documenttype
30	Can delete document type	10	delete_documenttype
31	Can add document	11	add_document
32	Can change document	11	change_document
33	Can delete document	11	delete_document
34	Can add image	12	add_image
35	Can change image	12	change_image
36	Can delete image	12	delete_image
37	Can add media	13	add_media
38	Can change media	13	change_media
39	Can delete media	13	delete_media
40	Can add page	14	add_page
41	Can change page	14	change_page
42	Can delete page	14	delete_page
43	Can add Tag	15	add_tag
44	Can change Tag	15	change_tag
45	Can delete Tag	15	delete_tag
46	Can add Tagged Item	16	add_taggeditem
47	Can change Tagged Item	16	change_taggeditem
48	Can delete Tagged Item	16	delete_taggeditem
49	Can add source	17	add_source
50	Can change source	17	change_source
51	Can delete source	17	delete_source
52	Can add thumbnail	18	add_thumbnail
53	Can change thumbnail	18	change_thumbnail
54	Can delete thumbnail	18	delete_thumbnail
55	Can add thumbnail dimensions	19	add_thumbnaildimensions
56	Can change thumbnail dimensions	19	change_thumbnaildimensions
57	Can delete thumbnail dimensions	19	delete_thumbnaildimensions
58	Can add user profile	20	add_userprofile
59	Can change user profile	20	change_userprofile
60	Can delete user profile	20	delete_userprofile
61	Can add site	21	add_site
62	Can change site	21	change_site
63	Can delete site	21	delete_site
64	Can add email address	22	add_emailaddress
65	Can change email address	22	change_emailaddress
66	Can delete email address	22	delete_emailaddress
67	Can add email confirmation	23	add_emailconfirmation
68	Can change email confirmation	23	change_emailconfirmation
69	Can delete email confirmation	23	delete_emailconfirmation
70	Can add social application	24	add_socialapp
71	Can change social application	24	change_socialapp
72	Can delete social application	24	delete_socialapp
73	Can add social account	25	add_socialaccount
74	Can change social account	25	change_socialaccount
75	Can delete social account	25	delete_socialaccount
76	Can add social application token	26	add_socialtoken
77	Can change social application token	26	change_socialtoken
78	Can delete social application token	26	delete_socialtoken
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('auth_permission_id_seq', 78, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$20000$cHYxasoER3Zg$ptKVSuz6Qp1kVV1zb2fLCCWX8CT/8uV520XzyejfJmQ=	\N	f	surveyoflondon				f	t	2016-04-28 14:04:37+01
7	pbkdf2_sha256$20000$aA3vHbuljVDq$qvETOjWvW3AieSWK3DZ1yHoy/FuksNmvN9dkxjdFeBE=	2016-05-09 17:26:53.67247+01	f	bongmouse			bong@mouse.com	f	t	2016-05-09 17:26:52.937829+01
1	pbkdf2_sha256$20000$usIwjlLk2abp$hf2586K3SPuIfSY+ui8sRWcp4RSpnTYLsIsrPqfZzk0=	2016-05-10 10:00:12.563116+01	t	duncan			d.hay@ucl.ac.uk	t	t	2016-04-28 12:37:32+01
3	pbkdf2_sha256$20000$sOitTHfM5KI0$unsBJmhX2eyulY0lyYCLcadi3/5eWU2mX1HJVPIiSPs=	2016-05-04 15:14:51.708272+01	f	Shlomit				f	t	2016-05-04 15:05:27.842068+01
5	!VNyzmOWr9POW95XYXjCoUAkqJA7B4Ocvf58TiIKR	2016-05-06 09:11:26.698031+01	f	walled_city			hay.duncan@gmail.com	f	t	2016-05-05 11:47:07.234+01
6	pbkdf2_sha256$20000$JWThfNpvDmoi$3WTrbIe5M2r7gTVhEV/bYtE1CTAcAiVNDYfJF7iWh6k=	2016-05-06 12:00:58.694105+01	f	shlomitF			shlomit@shlomit.com	f	t	2016-05-05 15:52:51.823975+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-04-28 12:42:37.644312+01	1	Telling the Histories of Whitechapel	1		14	1
2	2016-04-28 12:59:32.123238+01	2	Telling the Histories of Whitechapel	1		14	1
3	2016-04-28 13:44:17.988045+01	2	Telling the Histories of Whitechapel	2	Changed banner_image_browsable.	14	1
4	2016-04-28 14:01:12.894154+01	155	Whitechapel Bell Foundry	2	Changed b_name, address, original, basement, c_area, listed, thumbnail, tags and banner.	9	1
5	2016-04-28 14:01:50.20752+01	2	Telling the Histories of Whitechapel	3		14	1
6	2016-04-28 14:04:37.837126+01	2	surveyoflondon	1		4	1
7	2016-04-28 14:06:17.322366+01	1	History	1		10	1
8	2016-04-28 14:06:23.303873+01	155	Whitechapel Bell Foundry	2	Changed tags. Added document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry".	9	1
9	2016-04-28 14:15:20.354474+01	155	Whitechapel Bell Foundry	2	Changed tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry". Changed published and pending for image "Whitechapel Bell Foundry Yard".	9	1
10	2016-04-28 14:27:08.725709+01	155	Whitechapel Bell Foundry Foundry Foundry	2	Changed b_name and tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry Foundry Foundry | A History of the Bell Foundry".	9	1
11	2016-04-28 14:27:25.088625+01	155	Whitechapel Bell Foundry	2	Changed b_name and tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry".	9	1
12	2016-04-28 14:45:22.016506+01	1	Telling the Histories of Whitechapel	2	Changed documents.	14	1
13	2016-04-28 14:48:03.997716+01	1	Immigration	1		8	1
14	2016-04-28 14:48:46.856325+01	2	Religion	1		8	1
15	2016-04-28 14:49:02.185355+01	3	Industry	1		8	1
16	2016-04-28 14:49:12.761625+01	4	Commerce	1		8	1
17	2016-04-28 14:49:37.86466+01	5	Restaurants	1		8	1
18	2016-04-28 14:49:52.016494+01	6	Housing	1		8	1
19	2016-04-28 14:50:26.473571+01	7	Poverty	1		8	1
20	2016-04-28 14:50:57.009161+01	8	Entertainment	1		8	1
21	2016-04-28 14:51:31.969418+01	9	Markets	1		8	1
22	2016-04-28 15:01:51.634892+01	155	Whitechapel Bell Foundry	2	Changed tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry". Added media "A Tour of Whitechapel Bell Foundry".	9	1
23	2016-04-28 15:02:21.461127+01	1	Telling the Histories of Whitechapel	2	Changed media.	14	1
24	2016-04-28 15:03:13.384723+01	155	Whitechapel Bell Foundry	2	Changed tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry". Changed description for media "A Tour of Whitechapel Bell Foundry".	9	1
25	2016-04-28 15:13:00.48419+01	396		2	Changed basement, c_area, listed and tags. Changed published and pending for media "English Heretic".	9	1
26	2016-04-28 15:13:17.742723+01	396	Whitechapel Gallery	2	Changed b_name, address and tags.	9	1
27	2016-04-28 15:14:55.385563+01	1	Telling the Histories of Whitechapel	2	Changed documents and media.	14	1
28	2016-04-28 15:19:56.781961+01	1	Telling the Histories of Whitechapel	2	Changed documents.	14	1
29	2016-04-28 15:44:10.177495+01	1	duncan	2	Added user profile "duncan".	4	1
30	2016-04-28 15:45:14.518455+01	396	Whitechapel Gallery	2	Changed tags. Changed body, document_type, published and pending for document "Duncan Hay | Whitechapel Gallery | A Title for a Post".	9	1
31	2016-04-28 16:18:48.425552+01	954		2	Changed basement, c_area, listed, thumbnail and tags.	9	1
32	2016-04-28 16:19:14.858067+01	954		2	Changed b_number, address and tags.	9	1
33	2016-04-28 16:19:33.33347+01	954	East London Mosque	2	Changed b_number, b_name and tags.	9	1
34	2016-04-28 16:22:23.102722+01	954	East London Mosque	2	Changed tags. Changed title and published for image "The Mosque from Whitechapel Road".	9	1
35	2016-04-28 16:51:59.164196+01	1	duncan	2	Added user profile "duncan".	4	1
36	2016-04-28 16:52:12.559989+01	2	surveyoflondon	2	Added user profile "surveyoflondon".	4	1
37	2016-04-28 16:57:31.907414+01	2	The Mosque from Whitechapel Road	2	Changed author.	12	1
38	2016-05-04 09:38:28.327948+01	1	Telling the Histories of Whitechapel	2	Changed body.	14	1
39	2016-05-04 12:11:50.448748+01	396	Whitechapel Gallery	2	Changed tags. Changed body for document "Duncan Hay | Whitechapel Gallery | A Title for a Post".	9	1
40	2016-05-04 13:06:04.326293+01	2	Story	1		10	1
41	2016-05-04 13:06:12.075711+01	155	Whitechapel Bell Foundry	2	Changed tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry". Changed body, document_type, published and pending for document "Duncan Hay | Whitechapel Bell Foundry | A story about the Foundry".	9	1
42	2016-05-04 14:35:35.904079+01	1	dev.local	2	Changed domain and name.	21	1
43	2016-05-04 14:47:04.437686+01	1	duncan	1		25	1
44	2016-05-04 14:52:35.794356+01	1	Twitter	1		24	1
45	2016-05-04 14:53:44.064469+01	1	duncan	3		25	1
46	2016-05-04 15:03:31.745798+01	1	Twitter	2	Changed sites.	24	1
47	2016-05-04 16:25:31.680433+01	1	dev.local	2	Changed name.	21	1
48	2016-05-04 16:42:58.243443+01	2	Google	1		24	1
49	2016-05-04 16:59:02.688152+01	1	dev.local:8000	2	Changed domain.	21	1
50	2016-05-05 09:57:02.250968+01	1	dev.example.com:8000	2	Changed domain.	21	1
51	2016-05-05 10:25:56.755098+01	3	Pinterest	1		24	1
52	2016-05-05 11:41:36.493033+01	4	Instagram	1		24	1
53	2016-05-05 11:46:51.436133+01	4	walled_city	3		4	1
54	2016-05-05 11:47:46.107533+01	1	duncan	2	Changed email.	4	1
55	2016-05-06 12:02:31.824424+01	1	Telling the Histories of Whitechapel	2	Changed body.	14	1
56	2016-05-06 12:11:26.4625+01	3	How to Contribute	1		14	1
57	2016-05-06 12:16:20.959004+01	1	Telling the Histories of Whitechapel	2	Changed slug.	14	1
58	2016-05-06 12:16:34.080497+01	3	How to Contribute	2	Changed slug.	14	1
59	2016-05-06 12:16:51.585729+01	3	How to Contribute	2	No fields changed.	14	1
60	2016-05-06 12:17:39.843213+01	3	How to Contribute	2	No fields changed.	14	1
61	2016-05-06 12:18:59.321069+01	4	About	1		14	1
62	2016-05-09 09:45:20.805592+01	2	English Heretic	3		13	1
63	2016-05-09 10:08:23.894269+01	155	Whitechapel Bell Foundry	2	Changed tags. Changed body and body_processed for document "Survey of London | Whitechapel Bell Foundry | A History of the Bell Foundry". Changed body for document "Duncan Hay | Whitechapel Bell Foundry | A story about the Foundry".	9	1
64	2016-05-09 15:11:59.425772+01	4	About this Project	2	Changed title and slug.	14	1
65	2016-05-09 17:12:56.056556+01	3	How to Contribute	3		14	1
66	2016-05-10 10:02:40.648781+01	1	Telling the Histories of Whitechapel	2	Changed body.	14	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 66, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
8	map	category
9	map	feature
10	map	documenttype
11	map	document
12	map	image
13	map	media
14	whitechapel_pages	page
15	taggit	tag
16	taggit	taggeditem
17	easy_thumbnails	source
18	easy_thumbnails	thumbnail
19	easy_thumbnails	thumbnaildimensions
20	whitechapel_users	userprofile
21	sites	site
22	account	emailaddress
23	account	emailconfirmation
24	socialaccount	socialapp
25	socialaccount	socialaccount
26	socialaccount	socialtoken
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-04-28 11:31:10.049683+01
2	auth	0001_initial	2016-04-28 11:31:10.615795+01
3	admin	0001_initial	2016-04-28 11:31:10.751626+01
4	contenttypes	0002_remove_content_type_name	2016-04-28 11:31:10.975221+01
5	auth	0002_alter_permission_name_max_length	2016-04-28 11:31:11.031574+01
6	auth	0003_alter_user_email_max_length	2016-04-28 11:31:11.096726+01
7	auth	0004_alter_user_username_opts	2016-04-28 11:31:11.191702+01
8	auth	0005_alter_user_last_login_null	2016-04-28 11:31:11.298564+01
9	auth	0006_require_contenttypes_0002	2016-04-28 11:31:11.315343+01
10	easy_thumbnails	0001_initial	2016-04-28 11:31:11.62723+01
11	easy_thumbnails	0002_thumbnaildimensions	2016-04-28 11:31:11.707246+01
12	taggit	0001_initial	2016-04-28 11:31:11.917132+01
13	taggit	0002_auto_20150616_2121	2016-04-28 11:31:11.978675+01
14	map	0001_initial	2016-04-28 11:31:12.047284+01
15	map	0002_auto_20160202_1131	2016-04-28 11:31:12.112325+01
16	map	0003_auto_20160202_1447	2016-04-28 11:31:12.272205+01
17	map	0004_auto_20160210_1231	2016-04-28 11:31:12.32195+01
18	map	0005_auto_20160210_1326	2016-04-28 11:31:12.368486+01
19	map	0006_auto_20160210_1442	2016-04-28 11:31:12.425337+01
20	map	0007_os_feature	2016-04-28 11:31:12.516705+01
21	map	0008_document	2016-04-28 11:31:12.640646+01
22	map	0009_document_body	2016-04-28 11:31:12.733135+01
23	map	0010_os_feature_count	2016-04-28 11:31:12.818638+01
24	map	0011_os_feature_address	2016-04-28 11:31:12.948838+01
25	map	0012_os_feature_featcode	2016-04-28 11:31:13.02886+01
26	map	0013_auto_20160217_1346	2016-04-28 11:31:13.171292+01
27	map	0014_auto_20160217_1347	2016-04-28 11:31:13.226694+01
28	map	0015_auto_20160217_1402	2016-04-28 11:31:13.297072+01
29	map	0016_auto_20160218_1105	2016-04-28 11:31:13.351+01
30	map	0017_auto_20160219_1447	2016-04-28 11:31:13.461267+01
31	map	0018_auto_20160219_1456	2016-04-28 11:31:13.637463+01
32	map	0019_auto_20160219_1509	2016-04-28 11:31:13.983373+01
33	map	0020_os_feature_category	2016-04-28 11:31:14.062672+01
34	map	0021_auto_20160219_1517	2016-04-28 11:31:14.636218+01
35	map	0022_story	2016-04-28 11:31:14.74267+01
36	map	0023_auto_20160219_1532	2016-04-28 11:31:14.92584+01
37	map	0024_auto_20160219_1538	2016-04-28 11:31:14.985391+01
38	map	0025_auto_20160219_1539	2016-04-28 11:31:15.228635+01
39	map	0026_auto_20160219_1542	2016-04-28 11:31:15.441699+01
40	map	0027_auto_20160223_1707	2016-04-28 11:31:16.066577+01
41	map	0028_auto_20160223_1709	2016-04-28 11:31:16.086233+01
42	map	0029_auto_20160223_1713	2016-04-28 11:31:16.675227+01
43	map	0030_auto_20160224_1547	2016-04-28 11:31:17.256788+01
44	map	0031_auto_20160224_1548	2016-04-28 11:31:17.467131+01
45	map	0032_auto_20160224_1549	2016-04-28 11:31:17.869218+01
46	map	0033_feature_featcode	2016-04-28 11:31:17.954182+01
47	map	0034_feature_name	2016-04-28 11:31:18.027406+01
48	map	0035_feature_short_description	2016-04-28 11:31:18.097712+01
49	map	0036_feature_thumbnail	2016-04-28 11:31:18.186735+01
50	map	0037_auto_20160224_1702	2016-04-28 11:31:18.312267+01
51	map	0038_auto_20160225_1607	2016-04-28 11:31:18.385694+01
52	map	0039_auto_20160226_1627	2016-04-28 11:31:18.45339+01
53	map	0040_auto_20160226_1628	2016-04-28 11:31:18.521963+01
54	map	0041_feature_street	2016-04-28 11:31:18.606827+01
55	map	0042_feature_house_number	2016-04-28 11:31:18.686704+01
56	map	0043_auto_20160301_1306	2016-04-28 11:31:18.822701+01
57	map	0044_auto_20160301_1452	2016-04-28 11:31:19.680252+01
58	map	0045_auto_20160301_1453	2016-04-28 11:31:19.78519+01
59	map	0046_auto_20160301_1454	2016-04-28 11:31:19.89379+01
60	map	0047_auto_20160301_1520	2016-04-28 11:31:19.997001+01
61	map	0048_document_order	2016-04-28 11:31:20.102436+01
62	map	0049_auto_20160302_1453	2016-04-28 11:31:20.258551+01
63	map	0050_feature_tags	2016-04-28 11:31:20.340221+01
64	map	0051_auto_20160303_1610	2016-04-28 11:31:20.588998+01
65	map	0052_auto_20160304_1418	2016-04-28 11:31:20.921951+01
66	map	0053_document_author	2016-04-28 11:31:21.395099+01
67	map	0054_auto_20160404_1026	2016-04-28 11:31:23.893415+01
68	map	0055_auto_20160404_1101	2016-04-28 11:31:24.072377+01
69	map	0056_auto_20160404_1113	2016-04-28 11:31:24.411766+01
70	map	0057_auto_20160404_1133	2016-04-28 11:31:24.811085+01
71	map	0058_auto_20160404_1138	2016-04-28 11:32:30.80822+01
72	map	0059_auto_20160404_1156	2016-04-28 11:34:12.61248+01
73	map	0060_remove_feature_basement	2016-04-28 11:34:12.709105+01
74	map	0061_feature_basement	2016-04-28 11:34:12.802901+01
75	map	0062_feature_type	2016-04-28 11:34:12.923539+01
76	map	0063_auto_20160405_1040	2016-04-28 11:34:13.517794+01
77	map	0064_auto_20160407_1158	2016-04-28 11:34:14.264691+01
78	map	0065_document_published	2016-04-28 11:34:14.402139+01
79	map	0066_document_pending	2016-04-28 11:34:14.540796+01
80	map	0067_document_last_edited	2016-04-28 11:34:14.634158+01
81	map	0068_document_body_processed	2016-04-28 11:34:14.747068+01
82	map	0069_document_anonymise	2016-04-28 11:34:14.906272+01
83	map	0070_auto_20160419_1010	2016-04-28 11:34:15.101028+01
84	map	0071_image	2016-04-28 11:34:15.223318+01
85	map	0072_auto_20160419_1032	2016-04-28 11:34:15.494901+01
86	map	0073_auto_20160419_1107	2016-04-28 11:34:15.63583+01
87	map	0074_remove_image_caption	2016-04-28 11:34:15.785554+01
88	map	0075_image_description	2016-04-28 11:34:15.985904+01
89	map	0076_media	2016-04-28 11:34:16.116098+01
90	map	0077_auto_20160421_1404	2016-04-28 11:34:16.398213+01
91	sessions	0001_initial	2016-04-28 11:34:16.513658+01
92	whitechapel_pages	0001_initial	2016-04-28 11:34:16.620877+01
93	whitechapel_pages	0002_page_documents	2016-04-28 11:34:16.72556+01
94	whitechapel_pages	0003_page_features	2016-04-28 11:34:16.93246+01
95	whitechapel_pages	0004_page_is_front_page	2016-04-28 11:34:17.132135+01
96	whitechapel_pages	0005_auto_20160304_1117	2016-04-28 11:34:17.854334+01
97	whitechapel_pages	0006_auto_20160304_1124	2016-04-28 11:34:18.374316+01
98	whitechapel_pages	0007_page_banner_image	2016-04-28 11:34:18.721664+01
99	whitechapel_pages	0008_auto_20160421_1046	2016-04-28 11:34:19.087916+01
100	map	0078_auto_20160428_1124	2016-04-28 12:24:53.633162+01
101	whitechapel_pages	0009_page_banner_image_browsable	2016-04-28 12:58:11.635656+01
102	map	0079_remove_feature_banner	2016-04-28 14:36:39.356426+01
103	whitechapel_pages	0010_remove_page_banner_image_browsable	2016-04-28 15:04:18.858308+01
104	map	0080_auto_20160428_1549	2016-04-28 16:49:42.785182+01
105	whitechapel_users	0001_initial	2016-04-28 16:50:35.547317+01
106	account	0001_initial	2016-05-04 14:34:08.283643+01
107	account	0002_email_max_length	2016-05-04 14:34:08.429431+01
108	sites	0001_initial	2016-05-04 14:34:08.550028+01
109	socialaccount	0001_initial	2016-05-04 14:34:09.080984+01
110	socialaccount	0002_token_max_lengths	2016-05-04 14:34:09.450259+01
111	socialaccount	0003_extra_data_default_dict	2016-05-04 14:34:09.56193+01
112	whitechapel_pages	0011_page_slug	2016-05-06 12:15:48.399464+01
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('django_migrations_id_seq', 112, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
bd2sjh5e9293ko32lz62pove150s8het	YzAwYTVjZGJjNGM2NzlmYmYxMjRiMWJjMjM1NWUwNDY2ZGNmOGRmYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiaFhIMnZZYTBTcUZuIl19	2016-05-19 11:20:01.254587+01
gdintan2xdafycul5t3zljguz38ikn29	ZmRjOGYyM2E1MTUxOGI1Zjk0OThmZTI1YWFiZTAxMjQzNjBkNTIwMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiN2MyZjQxYTdkMWJmNzMxZmQ3ZThlYmQ5MTZmZDU2OGZjMTk4NDcyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2016-05-19 15:43:24.218101+01
qu0wrjm2ynqli2qaosz8ct0d5vovex97	OTNiNTE4OWUxMTk5YmU3YzE2MzhjYzFlNTIwYjQ3NTE5MWY0ZjE5ODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDQzOGVkM2Q1Mzk0ZWNkMTA1YzQ3OTQyNzU1NmU1ZWUxMDAxOTQ4MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==	2016-05-19 16:22:09.244035+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY django_site (id, domain, name) FROM stdin;
1	dev.example.com:8000	Survey of London Whitechapel
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	uploads/features/None/DP130590.jpg	2016-04-28 14:27:43.275269+01
2	f9bde26a1556cd667f742bd34ec7c55e	uploads/features/155/industry.png	2016-04-28 14:32:36.052196+01
3	f9bde26a1556cd667f742bd34ec7c55e	./st_george.png	2016-04-28 14:53:18.724982+01
4	f9bde26a1556cd667f742bd34ec7c55e	./elm.png	2016-04-28 14:53:19.158603+01
5	f9bde26a1556cd667f742bd34ec7c55e	./industry.png	2016-04-28 14:53:19.511238+01
6	f9bde26a1556cd667f742bd34ec7c55e	./commerce.png	2016-04-28 14:53:19.914168+01
7	f9bde26a1556cd667f742bd34ec7c55e	./restaurants.png	2016-04-28 14:53:20.412747+01
8	f9bde26a1556cd667f742bd34ec7c55e	./housing.png	2016-04-28 14:53:21.015177+01
9	f9bde26a1556cd667f742bd34ec7c55e	./monster_doss_house.png	2016-04-28 14:53:21.423489+01
10	f9bde26a1556cd667f742bd34ec7c55e	./wiltons_music_hall.png	2016-04-28 14:53:21.836032+01
11	f9bde26a1556cd667f742bd34ec7c55e	./whitechapel_road_market.png	2016-04-28 14:53:22.326416+01
13	f9bde26a1556cd667f742bd34ec7c55e	uploads/features/954/elm.png	2016-04-28 16:19:53.788935+01
12	f9bde26a1556cd667f742bd34ec7c55e	uploads/features/None/elm.png	2016-04-28 16:25:00.982448+01
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 13, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	uploads/features/None/DP130590.jpg.265x175_q85_crop-0,0.jpg	2016-04-28 14:15:38.325436+01	1
2	d26becbf46ac48eda79c7a39a13a02dd	uploads/features/None/DP130590.jpg.64x64_q85_crop-0,0.jpg	2016-04-28 14:27:43.298462+01	1
3	d26becbf46ac48eda79c7a39a13a02dd	uploads/features/155/industry.png.300x170_q85_crop-0,0.png	2016-04-28 14:32:36.120441+01	2
4	d26becbf46ac48eda79c7a39a13a02dd	./st_george.png.360x204_q85.png	2016-04-28 14:53:18.778873+01	3
5	d26becbf46ac48eda79c7a39a13a02dd	./elm.png.360x204_q85.png	2016-04-28 14:53:19.169297+01	4
6	d26becbf46ac48eda79c7a39a13a02dd	./industry.png.360x204_q85.png	2016-04-28 14:53:19.529658+01	5
7	d26becbf46ac48eda79c7a39a13a02dd	./commerce.png.360x204_q85.png	2016-04-28 14:53:19.937722+01	6
8	d26becbf46ac48eda79c7a39a13a02dd	./restaurants.png.360x204_q85.png	2016-04-28 14:53:20.458037+01	7
9	d26becbf46ac48eda79c7a39a13a02dd	./housing.png.360x204_q85.png	2016-04-28 14:53:21.056544+01	8
10	d26becbf46ac48eda79c7a39a13a02dd	./monster_doss_house.png.360x204_q85.png	2016-04-28 14:53:21.436109+01	9
11	d26becbf46ac48eda79c7a39a13a02dd	./wiltons_music_hall.png.360x204_q85.png	2016-04-28 14:53:21.863685+01	10
12	d26becbf46ac48eda79c7a39a13a02dd	./whitechapel_road_market.png.360x204_q85.png	2016-04-28 14:53:22.360479+01	11
13	d26becbf46ac48eda79c7a39a13a02dd	uploads/features/None/elm.png.265x175_q85_crop-0,0.png	2016-04-28 15:51:37.379843+01	12
14	d26becbf46ac48eda79c7a39a13a02dd	uploads/features/954/elm.png.300x170_q85_crop-0,0.png	2016-04-28 16:19:53.888965+01	13
15	d26becbf46ac48eda79c7a39a13a02dd	uploads/features/None/elm.png.64x64_q85_crop-0,0.png	2016-04-28 16:25:01.015873+01	12
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 15, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: map_category; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_category (id, name, description, thumbnail) FROM stdin;
1	Immigration		./st_george.png
2	Religion		./elm.png
3	Industry		./industry.png
4	Commerce		./commerce.png
5	Restaurants		./restaurants.png
6	Housing		./housing.png
7	Poverty		./monster_doss_house.png
8	Entertainment		./wiltons_music_hall.png
9	Markets		./whitechapel_road_market.png
\.


--
-- Name: map_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_category_id_seq', 9, true);


--
-- Data for Name: map_document; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_document (id, title, feature_id, body, end_year, start_year, "order", document_type_id, author_id, published, pending, last_edited, body_processed, anonymise) FROM stdin;
2	A Title for a Post	396	<p>Some content for a post.</p>\n	\N	\N	0	1	1	t	f	2016-05-04	<p>Some content for a post.</p>	f
1	A History of the Bell Foundry	155	<p>The Whitechapel Bell Foundry is a remarkable survival. Its business cards claim it as ‘Britain’s oldest manufacturing company’ and ‘the world’s most famous bell foundry’ – the first not readily contradicted, the second unverifiable but plausible. It has been said that the bell foundry ‘is so connected with the history of Whitechapel that it would be impossible to move it without wanton disregard of the associations of many generations.’[^1] The business, principally the making of church bells, has operated continuously in Whitechapel since at least the 1570s, on its present site with the existing house and office buildings since the mid 1740s.</p>\n\n<p>The foundry’s origins have been traced to either Robert Doddes in 1567 or Robert Mot in 1572, giving rise to a traditional foundation date of 1570. It is said then to have been in Essex Court (later Tewkesbury Court, where Gunthorpe Street is now). There is no continuous thread, but it has also been suggested that the Elizabethan establishment had grown out of a foundry in Aldgate that can be tracked back to Stephen Norton in 1363.</p>\n\n<p>From 1701 Richard Phelps was in charge. He made the great (5¼ ton) clock bell for St Paul’s Cathedral in 1716. When he died in August 1738 he was succeeded by Thomas Lester, aged about 35, who had been his foreman. It has been supposed that within the year Lester had moved the foundry into new buildings on the present site on Whitechapel Road, a belief which can be traced to Amherst Tyssen’s account of the history of the foundry in 1923, where he related that ‘according to the tradition preserved in the foundry and communicated to me by Mr John Mears more than sixty years ago, Thomas Lester built the present foundry in the year 1738 and moved his business to it. The site was said to have been previously occupied by the Artichoke Inn.’[^2] That has never been corroborated and it is implausible as such a move would take more than a few months.</p>\n\n<p>Contemporary documentation suggests a slightly later date for the move. An advertisement in the Daily Advertiser of 31 August 1743 reads: ‘To be let on a Building Lease, The Old Artichoke Alehouse, together with the House adjoining, in front fifty feet, and in Depth a hundred and six, situated in Whitechapel Street, the Corner turning into Stepney Fields.’ Those measurements tally well with the foundry site. Stepney Manor Court Rolls refer to ‘the Artichoke Alehouse, late in the occupation of John Cowell now empty’ on 8 April 1743 and to ‘a new built messuage now in possession of Thomas Leicester, formerly two old houses’ on 15 May 1747. A sewer rates listing of February 1743/4 does not mention Lester at the site. The advertised building lease was no doubt taken by or sold on to Lester, who undertook redevelopment of the site in 1744–6, clearing the Artichoke. The motive for the move was no doubt the opportunity for a larger foundry and superior accommodation on this more easterly and therefore open site.</p>\n\n<p>The seven-bay brick range that is 32 and 34 Whitechapel Road is a single room deep with three rooms in line on each storey, all heated from the back wall. It was built to be Lester’s house and has probably always incorporated an office. The Doric doorcase appears to be an original feature, while the shopfront at the east end is of the early nineteenth century, whether an insertion or a replacement. Internally the house retains much original fielded panelling, a good original staircase, chimneypieces of several eighteenth- and nineteenth-century dates and, in the central room on the first floor, a fine apsidal niche cupboard. Behind the east end is 2 Fieldgate Street, a separately built house of just one room per storey, perhaps for a foreman. Its Gibbsian door surround is of timber, as is its back wall.</p>\n\n<p>Eighteenth-century outbuildings to the south are single storeyed, a stables, coach-house and smithery range along Fieldgate Street, and the foundry itself, across a yard behind the west part of the house. Facing the street on the former stabling range is a tablet inscribed: ‘This is Baynes Street’ with an illegible date, perhaps 1766. What is now Plumber’s Row bisected property owned by Edward Baynes from 1729, but the road is not otherwise recorded as having had this name.</p>\n\n<p>Thomas Lester took Thomas Pack into partnership in 1752 and acquired ownership of the foundry from a younger Edward Baynes in 1767. Lester’s nephew William Chapman was a foundry foreman who, working at Canterbury Cathedral in 1762, met William Mears, a young man he brought back to London to learn the bell-founding trade. Lester died in 1769 and left the foundry to relatives to be leased to Pack and Chapman as partners. After Pack died in 1781 Chapman was pushed out and for a few years descendants of Lester ran the establishment. Their initiative failed and William Mears returned in partnership with his brother Thomas, who came to Whitechapel from Canterbury. Ownership of the property remained divided among descendants of Lester and in 1810 Thomas Mears was still trading as ‘late Lester, Pack and Chapman’. On a promotional sheet he listed all the bells cast at the foundry since 1738, 1,858 in total, around 25 per year – including some for St Mary le Bow in 1738, Petersburg in Russia in 1747 and Christ Church, Philadelphia, in 1754.</p>\n\n<p>A son, also Thomas Mears, acquired full control of the foundry in October 1818 when seven parties of Lester descendants sold up. The younger Mears took over the businesses of four rival bell-founders and, it seems clear, undertook works of improvement. By 1840 the firm had only one major competitor in Britain (W. &amp; J. Taylor of Oxford and Loughborough). The next generation, Charles and George Mears, ran the foundry from 1844 to 1859, the highlight of this period being the casting in 1858 of Big Ben (13.7 tons), still the foundry’s largest bell. From 1865 George Mears was partnered by Robert Stainbank. Thereafter the business traded as Mears &amp; Stainbank up to 1968. Arthur Hughes became the foundry manager in 1884 and took charge of operations in 1904.</p>\n\n<p>Given the ownership history, there was little significant investment in the buildings before 1818. However, the smithery end of the eastern outbuilding does appear to have been altered if not rebuilt between 1794 and 1813. Around 1820 a small pair of three-storey houses was added beyond a gateway that gave access to the foundry yard. There are also early nineteenth-century additions behind the centre and west bays of the main house. Thereafter, possibly following a fire in 1837 or in the 1850s, the smithery site was redeveloped as a three-storey workshop/warehouse block extending across a retained gateway. Furnaces were rebuilt in 1846 and 1848, and work of this period probably also included the workshop that encloses the inner yard with a largely glazed north wall. A large additional workshop or back foundry had been added to the far south-west by the 1870s, by when the pair of houses to the south-east had been adapted to use by the foundry, their doors and windows blocked. The whole Plumber’s Row range has latterly been used for making handbells and timber bell wheels.</p>\n\n<p>That workshop was damaged during the Second World War. Proposals to rebuild entirely behind the Whitechapel Road houses emerged in 1958 by when the foundry was already protected by listing. The workshops were considered expendable, but even then it was suggested that the timber jib crane on the east wall should be preserved. First plans were shelved and a more modest scheme of 1964–5 was postponed for want of capital, though plant and furnaces were replaced and there were repairs. In 1972 Moss Sprawson tried to acquire the site for office development. For the foundry, Douglas Hughes (one of Arthur’s grandsons) proposed a move east across Fieldgate Street to what was then a car park owned by the Greater London Council. A move entirely out of London was also considered. The GLC’s Historic Buildings Division became involved in trying to maintain what it considered ‘a unique and important living industry where crafts essentially unchanged for 400 years are practised by local craftsmen.’[^3] But plans came unstuck again in 1976 when the GLC conceded it had no locus to help keep the business in situ. Even so, in the same year the UK gave the USA a Bicentennial Bell cast in Whitechapel. A large new engineering workshop was at last built in 1979–81, with James Strike as architect. At the back of the site, it was faced with arcaded yellow stock brick on conservation grounds. In 1984–5 the GLC oversaw and helped pay for underpinning and refurbishment of the front buildings. The shopfront was grained and the external window shutters were renewed and painted dark green. In 1997 proprietorship passed to Douglas Hughes’s nephew, Alan Hughes, and his wife, Kathryn. The foundry continues to manufacture, but not without concerns that it will after all be obliged to leave Whitechapel.</p>\n\n<p>We are very grateful to Alan Hughes for showing us round the premises and sharing his knowledge of the foundry.</p>\n\n<p>[^1]: D. L. Munby, Industry and Planning in Stepney, 1951, p. 254<br>\n[^2]: Amherst D. Tyssen, ‘The History of the Whitechapel Bell-Foundry’, Transactions of the London and Middlesex Archaeological Society, vol. 5, 1923, p. 211<br>\n[^3]: London Metropolitan Archives, LMA/4441/01/0821</p>\n\n<p> </p>\n	\N	\N	0	1	2	t	f	2016-05-09	<p>The Whitechapel Bell Foundry is a remarkable survival. Its business cards\nclaim it as ‘Britain’s oldest manufacturing company’ and ‘the world’s most\nfamous bell foundry’ – the first not readily contradicted, the second\nunverifiable but plausible. It has been said that the bell foundry ‘is so\nconnected with the history of Whitechapel that it would be impossible to move\nit without wanton disregard of the associations of many generations.’<sup id="fnref:1"><a class="footnote-ref" href="#fn:1" rel="footnote">1</a></sup> The\nbusiness, principally the making of church bells, has operated continuously in\nWhitechapel since at least the 1570s, on its present site with the existing\nhouse and office buildings since the mid 1740s.</p>\n<p>The foundry’s origins have been traced to either Robert Doddes in 1567 or\nRobert Mot in 1572, giving rise to a traditional foundation date of 1570. It\nis said then to have been in Essex Court (later Tewkesbury Court, where\nGunthorpe Street is now). There is no continuous thread, but it has also been\nsuggested that the Elizabethan establishment had grown out of a foundry in\nAldgate that can be tracked back to Stephen Norton in 1363.</p>\n<p>From 1701 Richard Phelps was in charge. He made the great (5¼ ton) clock bell\nfor St Paul’s Cathedral in 1716. When he died in August 1738 he was succeeded\nby Thomas Lester, aged about 35, who had been his foreman. It has been\nsupposed that within the year Lester had moved the foundry into new buildings\non the present site on Whitechapel Road, a belief which can be traced to\nAmherst Tyssen’s account of the history of the foundry in 1923, where he\nrelated that ‘according to the tradition preserved in the foundry and\ncommunicated to me by Mr John Mears more than sixty years ago, Thomas Lester\nbuilt the present foundry in the year 1738 and moved his business to it. The\nsite was said to have been previously occupied by the Artichoke Inn.’<sup id="fnref:2"><a class="footnote-ref" href="#fn:2" rel="footnote">2</a></sup> That\nhas never been corroborated and it is implausible as such a move would take\nmore than a few months.</p>\n<p>Contemporary documentation suggests a slightly later date for the move. An\nadvertisement in the Daily Advertiser of 31 August 1743 reads: ‘To be let on a\nBuilding Lease, The Old Artichoke Alehouse, together with the House adjoining,\nin front fifty feet, and in Depth a hundred and six, situated in Whitechapel\nStreet, the Corner turning into Stepney Fields.’ Those measurements tally well\nwith the foundry site. Stepney Manor Court Rolls refer to ‘the Artichoke\nAlehouse, late in the occupation of John Cowell now empty’ on 8 April 1743 and\nto ‘a new built messuage now in possession of Thomas Leicester, formerly two\nold houses’ on 15 May 1747. A sewer rates listing of February 1743/4 does not\nmention Lester at the site. The advertised building lease was no doubt taken\nby or sold on to Lester, who undertook redevelopment of the site in 1744–6,\nclearing the Artichoke. The motive for the move was no doubt the opportunity\nfor a larger foundry and superior accommodation on this more easterly and\ntherefore open site.</p>\n<p>The seven-bay brick range that is 32 and 34 Whitechapel Road is a single room\ndeep with three rooms in line on each storey, all heated from the back wall.\nIt was built to be Lester’s house and has probably always incorporated an\noffice. The Doric doorcase appears to be an original feature, while the\nshopfront at the east end is of the early nineteenth century, whether an\ninsertion or a replacement. Internally the house retains much original fielded\npanelling, a good original staircase, chimneypieces of several eighteenth- and\nnineteenth-century dates and, in the central room on the first floor, a fine\napsidal niche cupboard. Behind the east end is 2 Fieldgate Street, a\nseparately built house of just one room per storey, perhaps for a foreman. Its\nGibbsian door surround is of timber, as is its back wall.</p>\n<p>Eighteenth-century outbuildings to the south are single storeyed, a stables,\ncoach-house and smithery range along Fieldgate Street, and the foundry itself,\nacross a yard behind the west part of the house. Facing the street on the\nformer stabling range is a tablet inscribed: ‘This is Baynes Street’ with an\nillegible date, perhaps 1766. What is now Plumber’s Row bisected property\nowned by Edward Baynes from 1729, but the road is not otherwise recorded as\nhaving had this name.</p>\n<p>Thomas Lester took Thomas Pack into partnership in 1752 and acquired ownership\nof the foundry from a younger Edward Baynes in 1767. Lester’s nephew William\nChapman was a foundry foreman who, working at Canterbury Cathedral in 1762,\nmet William Mears, a young man he brought back to London to learn the bell-\nfounding trade. Lester died in 1769 and left the foundry to relatives to be\nleased to Pack and Chapman as partners. After Pack died in 1781 Chapman was\npushed out and for a few years descendants of Lester ran the establishment.\nTheir initiative failed and William Mears returned in partnership with his\nbrother Thomas, who came to Whitechapel from Canterbury. Ownership of the\nproperty remained divided among descendants of Lester and in 1810 Thomas Mears\nwas still trading as ‘late Lester, Pack and Chapman’. On a promotional sheet\nhe listed all the bells cast at the foundry since 1738, 1,858 in total, around\n25 per year – including some for St Mary le Bow in 1738, Petersburg in Russia\nin 1747 and Christ Church, Philadelphia, in 1754.</p>\n<p>A son, also Thomas Mears, acquired full control of the foundry in October 1818\nwhen seven parties of Lester descendants sold up. The younger Mears took over\nthe businesses of four rival bell-founders and, it seems clear, undertook\nworks of improvement. By 1840 the firm had only one major competitor in\nBritain (W. &amp; J. Taylor of Oxford and Loughborough). The next generation,\nCharles and George Mears, ran the foundry from 1844 to 1859, the highlight of\nthis period being the casting in 1858 of Big Ben (13.7 tons), still the\nfoundry’s largest bell. From 1865 George Mears was partnered by Robert\nStainbank. Thereafter the business traded as Mears &amp; Stainbank up to 1968.\nArthur Hughes became the foundry manager in 1884 and took charge of operations\nin 1904.</p>\n<p>Given the ownership history, there was little significant investment in the\nbuildings before 1818. However, the smithery end of the eastern outbuilding\ndoes appear to have been altered if not rebuilt between 1794 and 1813. Around\n1820 a small pair of three-storey houses was added beyond a gateway that gave\naccess to the foundry yard. There are also early nineteenth-century additions\nbehind the centre and west bays of the main house. Thereafter, possibly\nfollowing a fire in 1837 or in the 1850s, the smithery site was redeveloped as\na three-storey workshop/warehouse block extending across a retained gateway.\nFurnaces were rebuilt in 1846 and 1848, and work of this period probably also\nincluded the workshop that encloses the inner yard with a largely glazed north\nwall. A large additional workshop or back foundry had been added to the far\nsouth-west by the 1870s, by when the pair of houses to the south-east had been\nadapted to use by the foundry, their doors and windows blocked. The whole\nPlumber’s Row range has latterly been used for making handbells and timber\nbell wheels.</p>\n<p>That workshop was damaged during the Second World War. Proposals to rebuild\nentirely behind the Whitechapel Road houses emerged in 1958 by when the\nfoundry was already protected by listing. The workshops were considered\nexpendable, but even then it was suggested that the timber jib crane on the\neast wall should be preserved. First plans were shelved and a more modest\nscheme of 1964–5 was postponed for want of capital, though plant and furnaces\nwere replaced and there were repairs. In 1972 Moss Sprawson tried to acquire\nthe site for office development. For the foundry, Douglas Hughes (one of\nArthur’s grandsons) proposed a move east across Fieldgate Street to what was\nthen a car park owned by the Greater London Council. A move entirely out of\nLondon was also considered. The GLC’s Historic Buildings Division became\ninvolved in trying to maintain what it considered ‘a unique and important\nliving industry where crafts essentially unchanged for 400 years are practised\nby local craftsmen.’<sup id="fnref:3"><a class="footnote-ref" href="#fn:3" rel="footnote">3</a></sup> But plans came unstuck again in 1976 when the GLC\nconceded it had no locus to help keep the business in situ. Even so, in the\nsame year the UK gave the USA a Bicentennial Bell cast in Whitechapel. A large\nnew engineering workshop was at last built in 1979–81, with James Strike as\narchitect. At the back of the site, it was faced with arcaded yellow stock\nbrick on conservation grounds. In 1984–5 the GLC oversaw and helped pay for\nunderpinning and refurbishment of the front buildings. The shopfront was\ngrained and the external window shutters were renewed and painted dark green.\nIn 1997 proprietorship passed to Douglas Hughes’s nephew, Alan Hughes, and his\nwife, Kathryn. The foundry continues to manufacture, but not without concerns\nthat it will after all be obliged to leave Whitechapel.</p>\n<p>We are very grateful to Alan Hughes for showing us round the premises and\nsharing his knowledge of the foundry.</p>\n<div class="footnote">\n<hr />\n<ol>\n<li id="fn:1">\n<p>D. L. Munby, Industry and Planning in Stepney, 1951, p. 254  &#160;<a class="footnote-backref" href="#fnref:1" rev="footnote" title="Jump back to footnote 1 in the text">&#8617;</a></p>\n</li>\n<li id="fn:2">\n<p>Amherst D. Tyssen, ‘The History of the Whitechapel Bell-Foundry’,\nTransactions of the London and Middlesex Archaeological Society, vol. 5, 1923,\np. 211  &#160;<a class="footnote-backref" href="#fnref:2" rev="footnote" title="Jump back to footnote 2 in the text">&#8617;</a></p>\n</li>\n<li id="fn:3">\n<p>London Metropolitan Archives, LMA/4441/01/0821&#160;<a class="footnote-backref" href="#fnref:3" rev="footnote" title="Jump back to footnote 3 in the text">&#8617;</a></p>\n</li>\n</ol>\n</div>	f
3	A story about the Foundry	155	<p>Some text about the foundry as well.</p>\n	\N	\N	0	2	1	t	f	2016-05-09	<p>Some text about the foundry as well.</p>	f
\.


--
-- Name: map_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_document_id_seq', 3, true);


--
-- Data for Name: map_documenttype; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_documenttype (id, name) FROM stdin;
1	History
2	Story
\.


--
-- Name: map_documenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_documenttype_id_seq', 2, true);


--
-- Data for Name: map_feature; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_feature (id, geom, address, postcode, count, thumbnail, street, b_number, architect, b_name, b_type, builders, f_date, materials, original, rebuild_1, rebuild_2, storeys, c_area, listed, basement, type) FROM stdin;
155	0106000020E61000000100000001030000000200000016000000B88DA3364039B1BF71F41FA62BC249405950C9A1092DB1BFA6CF65212EC2494044DF3B79442AB1BFBE7723F32CC24940F35DBBFBD52CB1BF8FAFD6692CC249407F9B755BE72AB1BF0D22ACA42BC24940CC0F4903E627B1BF98FD6B5F2CC2494034114903E627B1BF9AFD6B5F2CC249403B0F4903E627B1BF98FD6B5F2CC2494089E2AC44D225B1BF49E203762BC249406EC0E335A520B1BFADE9A4EA29C24940D6617C44C71AB1BF09C2256F28C2494020164C757616B1BFD0A9BC0326C24940D2C51570FF14B1BF88892F2720C24940810D8CA66921B1BF51FEBF131EC2494007636FE20C2BB1BF0B7E10DB22C2494028811F302428B1BFAF3D3A6D23C249407ACE31B3002EB1BF47C6365526C24940019DDE779F2FB1BF7879CE0326C24940F37DC23CB933B1BF98744D0C28C24940C0E6AABEEF31B1BFB3C5116528C249404F6897350433B1BF1A8B20D828C24940B88DA3364039B1BF71F41FA62BC24940060000009163FF2D062DB1BF5C50139429C24940EAC5A3BBF128B1BFCCA10DFC27C249408EC4127D2B26B1BFECD71DA928C249408982D2FD2829B1BF06D4894429C24940478EA796AC2AB1BF988CA6042AC249409163FF2D062DB1BF5C50139429C24940	32-34 Whitechapel Road	E1 1DQ	2	uploads/features/155/industry.png	Whitechapel Road	32		Whitechapel Bell Foundry	\N		\N		1746	\N	\N	\N	False	False	False	
396	0106000020E6100000010000000103000000010000001000000040083BA50CF8B1BF9E3665730AC24940086E4DC7AE08B2BF33120A1815C24940A1AC26F7AE08B2BF2EE8251815C249405374C564AE08B2BF09D46A0C16C24940E657CF55A2F8B1BFBABA77FD17C249400798A8D163F7B1BFC146BA2C17C2494062DA43B698F8B1BF11ED38FE16C24940C5708E29CEF2B1BFB9A9DAF312C24940F3C7560CC0F5B1BF33D3F69C12C24940ADB4B36DCBF0B1BF73AC888B0FC24940D552F3C62AEFB1BFA87EA3CD0FC249407FF4E66CC8EEB1BF9604DF8A0FC24940EB2B091500EAB1BF4D5880B60CC24940014DA4419CF5B1BFC5C206E00AC24940EB4EB12E9CF5B1BF932DFBDF0AC2494040083BA50CF8B1BF9E3665730AC24940	77-82 Whitechapel High Street	E1 7QX	1		Whitechapel High Street	77		Whitechapel Gallery	\N		\N		\N	\N	\N	\N	False	False	False	
954	0106000020E6100000010000000103000000010000000C0000006F0EA28864B1B0BF6A1683F735C24940144074BFF7BBB0BF7173FAD235C249400111771D47C2B0BF8205D62432C249401C98D65DC0C4B0BF9353EBD935C24940E573131D39CEB0BF413AA3A534C24940D77C58A68ECEB0BF8F8BDEF034C24940009F05D96BD8B0BF3260A0503CC2494080B879FE87B3B0BF20357A6841C249404849EA6112ADB0BF0C187F323DC24940DD648C0C9BB5B0BF306D54173CC24940333A272C40AAB0BF735946453AC249406F0EA28864B1B0BF6A1683F735C24940	46 Whitechapel Road	E1 5NB	0	uploads/features/954/elm.png	Whitechapel Road			East London Mosque	\N		\N		\N	\N	\N	\N	False	False	False	
251	0106000020E61000000100000001030000000100000007000000B5218B4DAAC1B1BF65EB00EE48C2494017DAA742AAC1B1BF5B4FF6ED48C24940C73FF80EE2BEB1BFE1A0F63746C24940ECB496864CC2B1BF28A77AE245C24940E7B91B4810C5B1BF23B4259448C2494075E9FE5210C5B1BF1750309448C24940B5218B4DAAC1B1BF65EB00EE48C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
483	0106000020E6100000010000000103000000010000000500000034710C00418CAFBF4755B8A96FC24940ED8396AC0980AFBFCAE6FF6070C24940264B64289572AFBF1B00917A6BC249408B3A41E1EA80AFBF77280DA86AC2494034710C00418CAFBF4755B8A96FC24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1195	0106000020E6100000010000000103000000010000000500000071414DC939AAAEBF7455EE2922C2494070957F55C1AEAEBF94F7BA2926C249403AFA435BE2A5AEBF75E7575426C24940D83038B463A1AEBF5D76645C22C2494071414DC939AAAEBF7455EE2922C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1262	0106000020E610000001000000010300000001000000050000008FC217527E88AFBFCF4BA63A01C2494063186F76528BAFBF88C014E604C2494028B34C6F7259AFBF61DD58F105C24940EB6167AA0D57AFBF19C8CF3B02C249408FC217527E88AFBFCF4BA63A01C24940	7-15 Varden Street	E1 2JP	0	\N	Varden Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1323	0106000020E61000000100000001030000000100000006000000FFE57A49CCE6B1BF3587432232C149402B68E9A602E9B1BF1B840A2434C149408A2E1A0254E9B1BF25D5658D34C149409E6AAD8313E5B1BFD22461DA34C149409DD985F5ADE2B1BF01C11B8032C14940FFE57A49CCE6B1BF3587432232C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1325	0106000020E610000001000000010300000001000000070000009DD985F5ADE2B1BF01C11B8032C149409E6AAD8313E5B1BFD22461DA34C149400511A5513EE5B1BF69D4E31035C149407DA9F14BD4E0B1BFDC91846635C1494047EF89A1ACDEB1BF616DDA7233C14940D50783E02CDEB1BF326C15EF32C149409DD985F5ADE2B1BF01C11B8032C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1353	0106000020E61000000100000001030000000100000007000000763401291FC0B1BFFF8DC12D5CC14940AB8EC2243CB2B1BF8C4B1C355DC14940C8EFAE8B59AFB1BFB14AA78F5AC1494059BD896CABB7B1BF6E752D9859C14940C08637CA03B8B1BF6D664ED859C149400FC92C39F2BCB1BF10F7824B59C14940763401291FC0B1BFFF8DC12D5CC14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1354	0106000020E61000000100000001030000000100000006000000AB8EC2243CB2B1BF8C4B1C355DC1494010B5961C6BABB1BF04436CAA5DC149403042829720A8B1BF8CF76CB45AC1494041D9F60BB1A9B1BF620B598959C1494041AE4A23A5ADB1BF13C85EFF58C14940AB8EC2243CB2B1BF8C4B1C355DC14940	Simmons	E1 8LG	0	\N	Royal Mint Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	0106000020E610000001000000010300000001000000050000003D87D0A4D7EDB1BF49B0AED4A4C149408D8786BB61F7B1BF5520417CA3C14940288A242491FAB1BF9743509AA5C1494090A52F7D22F1B1BF014108F9A6C149403D87D0A4D7EDB1BF49B0AED4A4C14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	0106000020E610000001000000010300000001000000050000009ADE079E61F1B1BF9D31167F9FC149402D4B64D09EE7B1BF804AD506A1C149400DE6C60EBAE4B1BF4C9584FB9EC149403091BA3E5FEEB1BF773DF67E9DC149409ADE079E61F1B1BF9D31167F9FC14940	Student Castle, 65 Leman Street	E1 8NX	0	\N	Leman Street	65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	0106000020E610000001000000010300000001000000050000003266969162F4B1BF2373607EA1C1494085DCA30F7DEAB1BFBFEF87EBA2C149402D4B64D09EE7B1BF804AD506A1C149409ADE079E61F1B1BF9D31167F9FC149403266969162F4B1BF2373607EA1C14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	0106000020E610000001000000010300000001000000050000008D8786BB61F7B1BF5520417CA3C149403D87D0A4D7EDB1BF49B0AED4A4C1494085DCA30F7DEAB1BFBFEF87EBA2C149403266969162F4B1BF2373607EA1C149408D8786BB61F7B1BF5520417CA3C14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	0106000020E61000000100000001030000000100000009000000368489CCAAD7B2BF268E2D9FD8C1494016C3FA92F696B2BF26DD81A5E4C14940DFE213F6E77FB2BF36516933D8C1494065DE798FA5BFB2BF71B93630CCC14940A976B4A24CC4B2BF44A84F39CEC14940953EEDB19FC9B2BF0B509D4FCDC149405879A9AA52D8B2BFED3DC66BD5C149406EDE404948D3B2BF63545952D6C14940368489CCAAD7B2BF268E2D9FD8C14940	RBS	E1 7PT	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	0106000020E6100000010000000103000000010000001300000032547602B19AB2BFD9C6AA14A6C149404C14C3052EA1B2BFEBC2A4D5AEC14940ECD5CBD10BA1B2BFFB9954D8AEC14940EF48361AF98DB2BF1B3A93E1B0C14940F63CB141367CB2BF157BC422B3C14940E48200A17E75B2BFC4D21A34B4C149409388E80C206EB2BFE150FA5FB5C149403EE61657A86CB2BF671935CFB4C149408B6249691163B2BF7D00B451B6C14940A8F6317D8560B2BF32F981D3B4C14940E0FDAA0C945EB2BFEAEBE0AFB3C14940589B3A0A3D64B2BFDB835CA2B2C14940647B282EBC61B2BFBC683720B1C14940758C0FA2005CB2BF317D8B02B2C149405CC270389C59B2BF498072BAB0C14940A799BB59A055B2BFFDF5EF38AEC1494086E69CC98760B2BF2010F48CACC14940508C6A556D77B2BF3A65CDC4A8C1494032547602B19AB2BFD9C6AA14A6C14940	Michael's House, 12 Alie Street	E1 8AA	0	\N	Alie Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	0106000020E61000000200000001030000000100000014000000D38F7502EEC2B2BF21DD62F1BBC14940F28C569A54B5B2BF417FF088BDC14940397EC3AC10B3B2BF79CD7ADEBDC149402CA7717297AEB2BF54EB16E8BCC1494047B8433B0FADB2BF9992E068BBC1494040050CF203AFB2BF2A229892BAC14940AE2CEE9EDDAEB2BF2013B38FB9C1494077DF85B17DA7B2BF862ABF2CBAC14940F3E295D909A9B2BF847A3B67BCC149407FB3091691A7B2BF23771CC9BCC149407E8A002AEFA4B2BF1A5FBBD3BCC14940B276973F3198B2BF00252DF5BDC14940802EE7A0DF95B2BF46E67E66BDC149408567FE5FF992B2BFC4DF888EBDC149404D944817E284B2BFC7F8E624BFC14940F6C00A92017AB2BF476EB6AAB7C1494070BD3FC3E98FB2BF9FF9C615B5C149407504BCADE8ACB2BFF7B4646CB2C149406D66AFFEABB9B2BF9298D03DB1C14940D38F7502EEC2B2BF21DD62F1BBC149400103000000010000000B00000045A5265FB098B2BF1996B7D2C1C14940911ED749D99BB2BF78C3C9D0C3C149404CAF45B7379FB2BFD5EE0930C6C149403E002ADD7BA3B2BFFABF2AB7C8C149401E05D0413187B2BF2CC456BBCDC1494010EFB6095D78B2BF039D74E0C5C149407C0801E1467EB2BF9E75FAFDC3C149403579FD802B88B2BF49722B45C2C14940FB20B1F3F989B2BF4CE80D60C2C149406C0F1DB4AB95B2BF9852675DC0C1494045A5265FB098B2BF1996B7D2C1C14940	1 Alie Street	E1 8AA	0	\N	Alie Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	0106000020E610000001000000010300000001000000070000002A4DFBE92A6EB2BFAB42401BD2C1494029E14DDF3167B2BF07942077CEC14940CC69DA08186BB2BF2A9CDDA6CDC1494098885C255467B2BFA9DFD7C6CBC14940539FD46B8A74B2BF7F5E1A36C9C1494054402301227FB2BFB10673D2CEC149402A4DFBE92A6EB2BFAB42401BD2C14940	Maersk House, 1 Braham Street	E1 8AA	0	\N	Braham Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	0106000020E61000000100000001030000000100000005000000D61C5BC1FA44B2BF0B56B04DB4C14940188A33369740B2BF5F070304B5C14940B1F37006BD3CB2BF1DBBDA94B2C1494080FF6DB13B41B2BF6B5478E7B1C14940D61C5BC1FA44B2BF0B56B04DB4C14940	Rehena Food Store	E1 8DA	0	\N	North Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	0106000020E6100000010000000103000000010000000D0000004C14C3052EA1B2BFEBC2A4D5AEC1494032547602B19AB2BFD9C6AA14A6C149408007FF52139AB2BFB7F896A2A4C14940A7C55BB377B6B2BFA13E4B8EA3C14940FCD3850DFEB8B2BF2A492EADAAC1494084B6936D4ABAB2BF18005147ABC149402239AE16B6BAB2BFC8F189F7ABC1494023DE1949B5BAB2BF36F35081ACC1494003754329FDB9B2BFDFFDCFE6ACC149400AEDDF8C2CB8B2BF954DDE2DADC14940D95E61AC30B6B2BF0419DD55ADC14940E91653EEC0B3B2BF17381C60ADC149404C14C3052EA1B2BFEBC2A4D5AEC14940	6 Alie Street	E1 8AA	0	\N	Alie Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	0106000020E610000001000000010300000001000000090000006375355238FFB1BF8F15CBF1FCC149401C61EDE299E5B1BF52FD165801C24940E7FDD02DF6DBB1BFDB23F365FCC149401FD021FE75DEB1BFC4B477F8FBC14940F2E3DEA524DAB1BF2E673DA1F9C14940AE149FF06ED7B1BF0CBAAB1EFAC1494025EDB85B3FCEB1BF480E58AAF4C14940BEF4E139EBE8B1BF34E14FF4EFC149406375355238FFB1BF8F15CBF1FCC14940	London Metropolitan University	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	0106000020E61000000100000001030000000100000005000000AD2F9B6F05F8B1BF5BD5EF45D6C14940BA0A5CA8FC04B2BFD7A7306FD3C1494023B78EE9DD0CB2BF25725657D7C14940F04EC16B17FFB1BF2E85980BDAC14940AD2F9B6F05F8B1BF5BD5EF45D6C14940	Enterprise House	E1 8EB	0	\N	Buckle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	0106000020E61000000100000001030000000100000005000000BA0A5CA8FC04B2BFD7A7306FD3C14940713222038A1BB2BF9C40A3E1CEC14940AECD28623523B2BF144FBBD9D2C1494023B78EE9DD0CB2BF25725657D7C14940BA0A5CA8FC04B2BFD7A7306FD3C14940	19 Leman Street	E1 8EJ	0	\N	Leman Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	0106000020E61000000100000001030000000100000005000000713222038A1BB2BF9C40A3E1CEC14940636A47C7AF14B2BF48DECA43D0C149400EE23877440AB2BFA9909262CAC149407133904ABD10B2BF71ADF517C9C14940713222038A1BB2BF9C40A3E1CEC14940	The Dispensary, 19a Leman Street	E1 8EN	0	\N	Leman Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	0106000020E61000000100000001030000000100000005000000636A47C7AF14B2BF48DECA43D0C149401DACE8FB7D09B2BFC12F5A86D2C14940234C8C5503FFB1BF0B70D267CCC149400EE23877440AB2BFA9909262CAC14940636A47C7AF14B2BF48DECA43D0C14940	The Dispensary, 19a Leman Street	E1 8EN	0	\N	Leman Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	0106000020E610000001000000010300000001000000050000001DACE8FB7D09B2BFC12F5A86D2C149403068D0E154FAB1BF1D8770C4D5C149401E6DEB5FB3EEB1BFFC633AFCCFC14940234C8C5503FFB1BF0B70D267CCC149401DACE8FB7D09B2BFC12F5A86D2C14940	55-57 Alie Street	E1 8EB	0	\N	Alie Street	55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	0106000020E61000000100000001030000000100000005000000E119E913B03CB2BF8998264CAFC14940B177C90D2B2EB2BF8F6E5B19B1C149404E322918591FB2BFFE7C69E2A7C14940B31F94CF343AB2BF6606D5CCA5C14940E119E913B03CB2BF8998264CAFC14940	Square, 27-29 St Mark Street	E1 8BB	0	\N	St Mark Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	0106000020E6100000010000000103000000010000000C0000006B96FD34AF38B2BF9A0DFE60A4C149407BEE2591202AB2BFE9866869A5C14940DEA24A674B27B2BFF5DB67DB9EC14940F28028041E29B2BF109360AA9EC14940B9F51F6B7D27B2BF16523F509CC1494051109D136930B2BF00CCFF519BC149402BA630270132B2BF3537E51A9DC14940D3922B53AA2EB2BF92EE4D759DC1494087C6E73BAA2EB2BFAC04F07C9DC14940B493FDEEA72EB2BF46BB283E9EC149404ABAF0A3A632B2BFCE55D20D9EC149406B96FD34AF38B2BF9A0DFE60A4C14940	35 St Mark Street	E1 8BB	0	\N	St Mark Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	0106000020E6100000010000000103000000010000000D00000067058AFDFB27B2BF3C0680A4A4C14940C68590E3131AB2BF6F7157E3A5C1494008E79587A611B2BFCE8FADF59FC14940DBCF8D18721CB2BFDCA8FD829EC14940A4EBA3556C1BB2BF2DF865AF9DC14940611E9463D221B2BFB6A4B6D39CC1494065196C2A1123B2BFBA6A99EA9DC1494002FEC8182E25B2BF082B87BF9DC1494036C973988126B2BF217764649FC14940D1688C14871FB2BF32E43205A0C14940FDEF10500923B2BF3E5B963FA3C14940A89E21277426B2BFC2E7F5FDA2C1494067058AFDFB27B2BF3C0680A4A4C14940	35 St Mark Street	E1 8BB	0	\N	St Mark Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	0106000020E61000000100000001030000000100000008000000AF961F66D32DB2BFFE986D4B98C14940844938162525B2BF782032F898C149405188100DB024B2BFA4794E5198C1494045284F88FD21B2BFDEB83E8798C14940F8562171BC1FB2BFA3B4167396C1494000C2F2BA2823B2BFF1684B2396C149400F96B632482BB2BF854C1E5195C14940AF961F66D32DB2BFFE986D4B98C14940	35 St Mark Street	E1 8BB	0	\N	St Mark Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	0106000020E6100000010000000103000000010000000500000000064BA2871FB2BFB3DC498099C1494061F408018114B2BF5C512D519AC14940AF305E32E911B2BF706F8D0598C14940C9478185631DB2BFC4B5DAFE96C1494000064BA2871FB2BFB3DC498099C14940	35 St Mark Street	E1 8BB	0	\N	St Mark Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	0106000020E61000000100000001030000000100000005000000DFC17E6DAE16B2BF36C8F6809DC149404BAD7FA77F0EB2BFFC8C9E659EC1494012ADC4290506B2BFE233931399C14940DA002D32B70EB2BF2B2C003098C14940DFC17E6DAE16B2BF36C8F6809DC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	0106000020E610000001000000010300000001000000050000008D71E00B487DB2BF470DB6908AC14940F535C941287BB2BFD31010E687C14940B66412FFD77EB2BFFFF8E1A087C149403139D6F4AA80B2BFBA0335558AC149408D71E00B487DB2BF470DB6908AC14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	0106000020E610000001000000010300000001000000050000008430B590D164B2BFD0CE7A4C8CC14940899868F6BD62B2BFDDB3EA038AC14940C9604650B067B2BFF873809D89C14940717E89908B69B2BF2F348AEF8BC149408430B590D164B2BFD0CE7A4C8CC14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	0106000020E61000000100000001030000000100000005000000994F7A190B23B2BFF9A3F20392C14940607F44590D1DB2BFB7D4787A92C14940CE7A15ACEE18B2BF38AFFABE8CC14940F2785810391FB2BF2D3493388CC14940994F7A190B23B2BFF9A3F20392C14940	Cafe Spice Namaste, 16 Prescot Street	E1 8AZ	0	\N	Prescot Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	0106000020E61000000100000001030000000100000007000000EC821370721CB2BF7665EDA291C149401514BB959B15B2BFC8A0F83492C14940DC40C5E49C16B2BFAABACC6293C149406B4013030000B2BF09A45C0695C1494038353089AAFDB1BF9C68C34892C14940FFB95B4A611BB2BF59DDDD2690C14940EC821370721CB2BF7665EDA291C14940	Princess Of Prussia, 15 Prescot Street	E1 8AZ	0	\N	Prescot Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	0106000020E6100000010000000103000000010000000C0000008D8F96320E68B2BF650A7361BAC14940E5D8976F4A75B2BF581BE357B8C1494099A66BE85D83B2BFDCD2BFA7C0C14940B24E0B150976B2BFDC9926BCC2C14940760476A82A75B2BF0C6B4105C3C149404122E43EFA75B2BFE0142CDCC3C14940B93653EC9273B2BFF62D9D42C4C1494070A6D7FFE471B2BFB3B2A564C3C149405DE89A1BAB6BB2BF030EBDA7BFC1494010836CAC286FB2BF4800CC19BFC14940DF51F114BE6CB2BF71D3A399BDC149408D8F96320E68B2BF650A7361BAC14940	1 Alie Street	E1 8AA	0	\N	Alie Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	0106000020E61000000100000001030000000100000005000000427AA76B6794B2BFE1B7271AE5C1494032C161A13768B2BF32343510EDC14940E1F870E22054B2BF820A909AE0C14940DCBDE1353A7DB2BF3815D0BED8C14940427AA76B6794B2BFE1B7271AE5C14940	Aldgate Tower	E1 7PT	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	0106000020E6100000010000000103000000010000001200000029E14DDF3167B2BF07942077CEC14940FEB8A50A996CB2BF653B6649D1C149408A44F5DBAC69B2BF107F2660D2C14940A648AF303A6BB2BFA092BA7CD3C1494092FCBD5DC763B2BF13CF9953D5C149404E7ECC6E075AB2BF3AB0B562D7C14940DB8E287FAB50B2BF7EC69094D8C14940586DA9179949B2BF2D2E0553D9C14940AE1264E9FA46B2BF7AB5680BD8C14940183BA6D1D843B2BFE4C7E649D8C14940C616AC14E63EB2BFB0C185F3D5C14940E5BDA104F140B2BF00B8EC5BD5C1494085C811524E3EB2BFE40BDF26D4C14940E3197155AA4FB2BF7FB21210D0C14940440BC6336F5AB2BF50E9EBA6CEC149406631903E2A61B2BFB2E6D3BECDC14940C60D2A2AAE64B2BF3A1108BDCEC1494029E14DDF3167B2BF07942077CEC14940	Maersk House, 1 Braham Street	E1 8AA	0	\N	Braham Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	0106000020E61000000100000001030000000100000009000000C04CA89DE3C8B2BF4AD367F2C1C149402C24724858A2B2BF57BB650AC8C14940D4E450FC199BB2BF73062958C3C14940E2521EF051B7B2BFC757E5C0BFC14940F28C569A54B5B2BF417FF088BDC14940D38F7502EEC2B2BF21DD62F1BBC149403262E40116C5B2BF37DE4298BDC1494066C70F2587C3B2BF7EB66410BEC14940C04CA89DE3C8B2BF4AD367F2C1C14940	Standon House, 21 Mansell Street	E1 8AL	0	\N	Mansell Street	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	0106000020E61000000100000001030000000100000006000000167ED970C765B2BFDEE02DD1BEC149404E2A6E238860B2BFCBD81CABBBC149408D8F96320E68B2BF650A7361BAC14940DF51F114BE6CB2BF71D3A399BDC14940FC1E34BEB769B2BF0025A523BEC14940167ED970C765B2BFDEE02DD1BEC14940	24 Alie Street	E1 8AA	0	\N	Alie Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	0106000020E610000001000000010300000001000000050000000BE15EE81661B2BF4EFC0C91BFC14940170750F3045CB2BF1E55D570BCC149404E2A6E238860B2BFCBD81CABBBC14940167ED970C765B2BFDEE02DD1BEC149400BE15EE81661B2BF4EFC0C91BFC14940	26 Alie Street	E1 8AA	0	\N	Alie Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	0106000020E61000000100000001030000000100000005000000BF43395B775CB2BF4FB57D6BC0C149404277EC22E156B2BFE7BE0B52BDC14940170750F3045CB2BF1E55D570BCC149400BE15EE81661B2BF4EFC0C91BFC14940BF43395B775CB2BF4FB57D6BC0C14940	Halal Restaurant, 2/6 St Mark Street	E1 8BB	0	\N	St Mark Street	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	0106000020E6100000010000000103000000010000001100000003A99E5CEE43B2BF9EC1BC74C4C1494040193CF9D23EB2BFDA31BE56C5C1494039625A3BB339B2BFBA26E04DC2C149404277EC22E156B2BFE7BE0B52BDC14940BF43395B775CB2BF4FB57D6BC0C149400D76C5880E54B2BFBCE2FFDDC1C14940CC9E69E35F58B2BF27FF3735C4C1494030EEB8E4EB64B2BFEC0EF81CC2C14940793CFC749F67B2BF5C653580C3C149400DAB2419FB6AB2BF3F1EF0EEC2C14940F553DD2BAF6DB2BF633DA3A3C4C1494044719A3A446AB2BF619F0F2DC5C149400EF11FC7B66BB2BF8CF48418C6C149405618EBAAC94AB2BFD286E6F8CBC149403D71E0B8C243B2BFE77933B0C7C14940CCA88D9ED447B2BF6873AAE3C6C1494003A99E5CEE43B2BF9EC1BC74C4C14940	Maersk House, 1 Braham Street	E1 8AA	0	\N	Braham Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	0106000020E6100000010000000103000000010000000B00000039625A3BB339B2BFBA26E04DC2C14940CE6CEA87F441B2BF3DD77431C7C14940C3B62A304C33B2BF4B7D37A7C9C14940C2F0FDF45E38B2BFAD3FBDC4CCC14940BD8CA685213AB2BFEBF5EC5DCCC1494043368E8E753EB2BFA9F86E8FCEC149405218E1F82632B2BF2D7670E4D0C1494045E887F1B32AB2BFBE5534E8CCC149403CAA0428712CB2BFE01CAA4ACCC149404ADD755AA122B2BF2CE76143C6C1494039625A3BB339B2BFBA26E04DC2C14940	Whites Gentlemans Club	E1 8EN	0	\N	Leman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	0106000020E61000000100000001030000000100000005000000EA169DBD9358B2BF6BFF5B17B8C14940C154389A6754B2BFE012AEE3B8C14940F0366D2D1D50B2BF15068E3AB6C1494007AFF48B4654B2BF962BFF8EB5C14940EA169DBD9358B2BF6BFF5B17B8C14940	Halal Restaurant, 2/6 St Mark Street	E1 8BB	0	\N	St Mark Street	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	0106000020E610000001000000010300000001000000090000008B6249691163B2BF7D00B451B6C14940EA169DBD9358B2BF6BFF5B17B8C1494007AFF48B4654B2BF962BFF8EB5C1494073DD7236AA59B2BFD2EBF5A0B4C14940A821380DF258B2BFC6D98FBDB3C14940113BA4D75E5DB2BF971CAF1CB3C149408966C0A38D5DB2BF79B40916B3C14940A77E88C3B35EB2BFC8B178C2B3C149408B6249691163B2BF7D00B451B6C14940	24 Alie Street	E1 8AA	0	\N	Alie Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	0106000020E6100000010000000103000000010000000500000063FEACCF0550B2BF61193473B2C149409E3A52A9704BB2BF81F8A83EB3C1494085CE681B8A46B2BF2D97DB83B0C14940556ABA3DB64AB2BFEEC089B7AFC1494063FEACCF0550B2BF61193473B2C14940	Rehena Food Store	E1 8DA	0	\N	North Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	0106000020E610000001000000010300000001000000050000005CC270389C59B2BF498072BAB0C1494063FEACCF0550B2BF61193473B2C14940556ABA3DB64AB2BFEEC089B7AFC14940A799BB59A055B2BFFDF5EF38AEC149405CC270389C59B2BF498072BAB0C14940	Rehena Food Store	E1 8DA	0	\N	North Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	0106000020E610000001000000010300000001000000050000003A6268D7B2A9B2BF7EED7CE9A2C14940317F2B939CA8B2BFC2485FDC9FC149401F446C0BABB4B2BFB243F3A29FC149409B06D99CEFB5B2BFB279178FA2C149403A6268D7B2A9B2BF7EED7CE9A2C14940	Mansell Street	E1 8AL	0	\N	Mansell Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	0106000020E6100000010000000103000000010000000500000095ECF50303A2B2BFFFAE0217A0C149406C05B0B9F1A2B2BF970A243DA3C14940582A34E75299B2BFBB3D5D8AA3C14940064B441E4198B2BF8FAA0659A0C1494095ECF50303A2B2BFFFAE0217A0C14940	6 Alie Street	E1 8AA	0	\N	Alie Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	0106000020E61000000100000001030000000100000007000000317F2B939CA8B2BFC2485FDC9FC1494010942E891CA8B2BFBB5244399EC149409D8454A121AAB2BFD036B42C9EC14940B8EBCCDFBDA9B2BF1F5BF9519CC149400FD1D87364B3B2BF291A120A9CC149401F446C0BABB4B2BFB243F3A29FC14940317F2B939CA8B2BFC2485FDC9FC14940	Mansell Street	E1 8AL	0	\N	Mansell Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	0106000020E610000001000000010300000001000000070000009BC088BB85A5B2BF35F286929CC14940AF330796ECA5B2BFFC9F74DE9EC1494092EADF36C7A1B2BF850699FD9EC1494095ECF50303A2B2BFFFAE0217A0C14940064B441E4198B2BF8FAA0659A0C149406AA839C0EE96B2BF3F9D64E49CC149409BC088BB85A5B2BF35F286929CC14940	6 Alie Street	E1 8AA	0	\N	Alie Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	0106000020E6100000010000000103000000010000000500000032C10C746BACB2BF5D6E053E9CC14940C13D3733A0ABB2BFF2067FFF98C1494033D8503F38B2B2BFE7500CE598C149400FD1D87364B3B2BF291A120A9CC1494032C10C746BACB2BF5D6E053E9CC14940	E1 61	E1 8AL	0	\N	Mansell Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	0106000020E61000000100000001030000000100000005000000E8238D837CA3B2BF1D64861399C14940464A6EC6CDA4B2BFC12F8F969CC149406AA839C0EE96B2BF3F9D64E49CC14940D487146AAA95B2BFD759709499C14940E8238D837CA3B2BF1D64861399C14940	6 Alie Street	E1 8AA	0	\N	Alie Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	0106000020E61000000100000001030000000100000007000000625A85F915ABB2BFD9611B9097C14940B6B8F58E4FA6B2BF8CD9CCA897C149402DE97800A4A5B2BFF76CCA2596C149408B472C3EB3B1B2BF65A87EB895C1494033D8503F38B2B2BFE7500CE598C14940C13D3733A0ABB2BFF2067FFF98C14940625A85F915ABB2BFD9611B9097C14940	E1 61	E1 8AL	0	\N	Mansell Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	0106000020E610000001000000010300000001000000070000002DE97800A4A5B2BFF76CCA2596C14940B6B8F58E4FA6B2BF8CD9CCA897C149405DF3F55999A1B2BF7C1F93C297C149401D00076D06A2B2BFA0C5272199C14940D487146AAA95B2BFD759709499C149409842D8A0B894B2BF18A674BB96C149402DE97800A4A5B2BFF76CCA2596C14940	CIPFA	E1 8AN	0	\N	West Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	0106000020E610000001000000010300000001000000050000000843293B78ABB2BF61EB5C6B85C149409EAA3C87618EB2BF0500382286C1494074B39845148CB2BFADE6D53881C14940B5F7B44AADA9B2BF14AD05DB7FC149400843293B78ABB2BF61EB5C6B85C14940	CIPFA	E1 8AN	0	\N	West Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	0106000020E610000001000000010300000001000000050000005F1154F8DC90B2BF628DEE768CC1494051148060F1ADB2BF680DEC2F8BC149408B472C3EB3B1B2BF65A87EB895C149409842D8A0B894B2BF18A674BB96C149405F1154F8DC90B2BF628DEE768CC14940	CIPFA	E1 8AN	0	\N	West Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	0106000020E610000001000000010300000001000000050000009EAA3C87618EB2BF0500382286C149400843293B78ABB2BF61EB5C6B85C1494051148060F1ADB2BF680DEC2F8BC149405F1154F8DC90B2BF628DEE768CC149409EAA3C87618EB2BF0500382286C14940	CIPFA	E1 8AN	0	\N	West Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	0106000020E61000000100000001030000000100000005000000A70EE1876F42B2BFA9E0664A8FC14940F57CE7DFDA3FB2BF8AF67A6C8CC14940F40BCA437143B2BFEE06311E8CC14940E68C1362EB45B2BFAAA8DFFC8EC14940A70EE1876F42B2BFA9E0664A8FC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	0106000020E610000001000000010300000001000000050000002392D1912835B2BFB3F9FF508DC1494045728A9EC837B2BFF3A3553990C1494040D46D101634B2BF664FBB8990C14940030BF9D47B31B2BF60B419A68DC149402392D1912835B2BFB3F9FF508DC14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	0106000020E6100000010000000103000000010000000500000075EDEB59F338B2BFC04427038DC149401D22EA3F933BB2BF89DB12E38FC1494045728A9EC837B2BFF3A3553990C149402392D1912835B2BFB3F9FF508DC1494075EDEB59F338B2BFC04427038DC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	0106000020E610000001000000010300000001000000050000007002F743823CB2BFBD9980B58CC14940C34DDD611F3FB2BF5D7521948FC149401D22EA3F933BB2BF89DB12E38FC1494075EDEB59F338B2BFC04427038DC149407002F743823CB2BFBD9980B58CC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	0106000020E61000000100000001030000000100000005000000F57CE7DFDA3FB2BF8AF67A6C8CC14940A70EE1876F42B2BFA9E0664A8FC14940C34DDD611F3FB2BF5D7521948FC149407002F743823CB2BFBD9980B58CC14940F57CE7DFDA3FB2BF8AF67A6C8CC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	0106000020E61000000100000001030000000100000005000000F2705CBEA755B2BFE8F078828DC149402F3B01D58A53B2BF3FFB2B1F8BC149409FE69646BE58B2BFFA8835C28AC14940C0B41E38E95AB2BFEA5000188DC14940F2705CBEA755B2BFE8F078828DC14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	0106000020E6100000010000000103000000010000000500000002D7FDF91D4EB2BF9E90448B8BC149406A4138052C50B2BF0D678DF18DC14940580D2D11C24AB2BF95BD395F8EC14940AFDEA4B4B348B2BFAEA85FFC8BC1494002D7FDF91D4EB2BF9E90448B8BC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	0106000020E610000001000000010300000001000000050000002F3B01D58A53B2BF3FFB2B1F8BC14940F2705CBEA755B2BFE8F078828DC149406A4138052C50B2BF0D678DF18DC1494002D7FDF91D4EB2BF9E90448B8BC149402F3B01D58A53B2BF3FFB2B1F8BC14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	0106000020E6100000010000000103000000010000000500000035D3E10FA75DB2BF56730F628AC149405CFFB13DCA5FB2BF328829B58CC14940C0B41E38E95AB2BFEA5000188DC149409FE69646BE58B2BFFA8835C28AC1494035D3E10FA75DB2BF56730F628AC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	0106000020E61000000100000001030000000100000005000000899868F6BD62B2BFDDB3EA038AC149408430B590D164B2BFD0CE7A4C8CC149405CFFB13DCA5FB2BF328829B58CC1494035D3E10FA75DB2BF56730F628AC14940899868F6BD62B2BFDDB3EA038AC14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	0106000020E6100000010000000103000000010000000500000050FB6DD94C72B2BF400013678BC149404104F810D46FB2BFD29BC8B188C1494064EFD5E89773B2BF84ABB67388C149401A03F63FC375B2BF9EEC862A8BC1494050FB6DD94C72B2BF400013678BC14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	0106000020E61000000100000001030000000100000005000000E12AE9C44677B2BFA1ADE33088C1494056E190457879B2BF1A1E49E08AC149401A03F63FC375B2BF9EEC862A8BC1494064EFD5E89773B2BF84ABB67388C14940E12AE9C44677B2BFA1ADE33088C14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	0106000020E61000000100000001030000000100000005000000F535C941287BB2BFD31010E687C149408D71E00B487DB2BF470DB6908AC1494056E190457879B2BF1A1E49E08AC14940E12AE9C44677B2BFA1ADE33088C14940F535C941287BB2BFD31010E687C14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	0106000020E610000001000000010300000001000000050000004104F810D46FB2BFD29BC8B188C1494050FB6DD94C72B2BF400013678BC1494090DD613D7D6EB2BFC1DD5FB88BC149409526B746416CB2BFD7B22F0389C149404104F810D46FB2BFD29BC8B188C14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	0106000020E61000000100000001030000000100000008000000C8C46A821A2FB2BF4A8059CA99C14940C5B1BA674226B2BFCBD50C8F9AC14940EDBC87DAE725B2BF2B5A92FB99C14940FAF9093AA723B2BFAB87581B9AC149403F194B0D0223B2BFB04E952799C14940844938162525B2BF782032F898C14940AF961F66D32DB2BFFE986D4B98C14940C8C46A821A2FB2BF4A8059CA99C14940	35 St Mark Street	E1 8BB	0	\N	St Mark Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	0106000020E61000000100000001030000000100000008000000DC98FFE70325B2BF296769B59AC14940C8C46A821A2FB2BF4A8059CA99C1494051109D136930B2BF00CCFF519BC1494005EB6576F02CB2BFE74D7DB29BC14940924C583FD328B2BFD38297299CC149402577E7B34A28B2BF78DE3E649BC14940888FC63ED425B2BFB47F1D8C9BC14940DC98FFE70325B2BF296769B59AC14940	35 St Mark Street	E1 8BB	0	\N	St Mark Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	0106000020E610000001000000010300000001000000050000004FB07F248545B2BFDF2F7B58BCC1494042F830A50137B2BF7BDC7A62B3C14940B1F37006BD3CB2BF1DBBDA94B2C14940B5B0088FFE4AB2BFC28B2C6ABBC149404FB07F248545B2BFDF2F7B58BCC14940	Club Oops!, 30 Alie Street	E1 8DA	0	\N	Alie Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	0106000020E61000000100000001030000000100000005000000441301D0DE45B2BFCCD2105AB8C14940AC5E28BCB84AB2BF57D6229FB7C149402B26E2B6434EB2BFB65CCAD2B9C1494095227D04A249B2BFE36D3692BAC14940441301D0DE45B2BFCCD2105AB8C14940	Halal Restaurant, 2/6 St Mark Street	E1 8BB	0	\N	St Mark Street	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	0106000020E6100000010000000103000000010000000500000048846DAECF41B2BF059487B9B5C14940D2DF44F59B46B2BF93F509EEB4C14940AC5E28BCB84AB2BF57D6229FB7C14940441301D0DE45B2BFCCD2105AB8C1494048846DAECF41B2BF059487B9B5C14940	Rehena Food Store	E1 8DA	0	\N	North Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	0106000020E6100000010000000103000000010000000900000015D52AC49703B2BF32F1327EAAC149404FD6A5FF0FF9B1BF0B0ACF24A3C1494068EEEC5202FEB1BF7E8E015FA2C14940DFE5FF6F00FCB1BF26E99A0AA1C149404D7ED369EA04B2BF80E91F9B9FC149402ED2EE63BC0EB2BF6CE4EAD3A5C1494057707E9DBC07B2BFA8F820EEA6C14940448D4166990BB2BFB1890575A9C1494015D52AC49703B2BF32F1327EAAC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	0106000020E61000000100000001030000000100000005000000A0C59BF40641B2BF4C374D19BDC149403E1A6687913BB2BFEA5590BEB9C14940294C75A21240B2BF2B35E9FEB8C149404FB07F248545B2BFDF2F7B58BCC14940A0C59BF40641B2BF4C374D19BDC14940	Club Oops!, 30 Alie Street	E1 8DA	0	\N	Alie Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	0106000020E61000000100000001030000000100000005000000200B48C33836B2BFE3590FA2BAC149408CC717B6D12CB2BFBDD73BDBB4C1494042F830A50137B2BF7BDC7A62B3C14940294C75A21240B2BF2B35E9FEB8C14940200B48C33836B2BFE3590FA2BAC14940	Club Oops!, 30 Alie Street	E1 8DA	0	\N	Alie Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	0106000020E6100000010000000103000000010000000E0000008CC717B6D12CB2BFBDD73BDBB4C14940CE7DB2C49033B2BFEC964A00B9C14940F35DE1B49C2EB2BFA80399D5B9C14940E2B18B1A2030B2BFF359B1E6BAC14940BDBE0D774C1EB2BFC2D501CFBDC14940800B3831C51CB2BF7F9B1506BEC14940E31AA5D73416B2BF354CA0FFBEC14940E7F9E992410EB2BF2E7E65C4B9C14940E8A32DE8C218B2BFB55BA5F0B7C14940601967A58B1AB2BF9631341BB9C149405534223CF821B2BFEEC68CE6B7C149405C4762ACEF1FB2BFB044F6C7B6C14940C66FDBCDC528B2BF7286E270B5C149408CC717B6D12CB2BFBDD73BDBB4C14940	The Black Horse	E1 8EU	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	0106000020E610000001000000010300000001000000080000009AD6802B4B23B2BFD3205915C2C149406980258E481DB2BF3D1C77F2C2C14940241CBEA35D17B2BFD1D7EBC2BFC14940E31AA5D73416B2BF354CA0FFBEC14940AD229CC6901EB2BFB1E298C1BDC1494077028140BC1FB2BF90C8508ABEC1494098328172791EB2BF79D302B8BEC149409AD6802B4B23B2BFD3205915C2C14940	The Black Horse	E1 8EU	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	0106000020E6100000010000000103000000010000000500000050E300CBD61DB2BF52B8019DAEC149407F15EEB1D415B2BF08AB3DBDAFC14940F9E42D068113B2BF50ECAB15AEC14940D49A6FB7191BB2BF3538ECFBACC1494050E300CBD61DB2BF52B8019DAEC14940	Square, 27-29 St Mark Street	E1 8BB	0	\N	St Mark Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	0106000020E610000001000000010300000001000000090000006B230D4B720FB2BFEECE29ACAEC14940DF02D222480BB2BFDE60C1FAABC14940E8E38E24A510B2BFE31D393EABC14940BFCAA8EAF00FB2BFB7F6D9CFAAC14940031751D4F50DB2BFEA031A0DABC14940448D4166990BB2BFB1890575A9C14940EAE95F567913B2BF7D75CC43A8C14940D49A6FB7191BB2BF3538ECFBACC149406B230D4B720FB2BFEECE29ACAEC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	0106000020E6100000010000000103000000010000000900000024C08D8BFF0AB2BF6393884CAFC1494073B36F401E0CB2BF68F65A0FB0C149406E7BBFB29B09B2BF2DFE4167B0C14940B3BD3C76A316B2BFC1A12A4FB8C14940E7F9E992410EB2BF2E7E65C4B9C1494082E78A159BFFB1BFA570A132B0C14940AC1E4C920408B2BF1677B0F3AEC149408219C668DC08B2BF1A37B191AFC1494024C08D8BFF0AB2BF6393884CAFC14940	Cashmere House	E1 8NX	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	0106000020E610000001000000010300000001000000050000008EAFF469FD23B2BF72BECC84B2C149409A9E05A45D1BB2BF213C49DCB3C14940008699914C19B2BF63FBC382B2C149402350D211C521B2BF8146E03AB1C149408EAFF469FD23B2BF72BECC84B2C14940	The Black Horse	E1 8EU	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	0106000020E61000000100000001030000000100000005000000B6307EDE4617B2BFCDB3AD35B1C1494036959C82E31FB2BF70D7F9FDAFC149402350D211C521B2BF8146E03AB1C14940008699914C19B2BF63FBC382B2C14940B6307EDE4617B2BFCDB3AD35B1C14940	Square, 27-29 St Mark Street	E1 8BB	0	\N	St Mark Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	0106000020E610000001000000010300000001000000050000007F3991E62515B2BF7DEBD0D5AFC1494050E300CBD61DB2BF52B8019DAEC1494036959C82E31FB2BF70D7F9FDAFC14940B6307EDE4617B2BFCDB3AD35B1C149407F3991E62515B2BF7DEBD0D5AFC14940	Square, 27-29 St Mark Street	E1 8BB	0	\N	St Mark Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	0106000020E61000000100000001030000000100000005000000F969FF2D921DB2BF390B6442B5C149405EFA6CC33C26B2BF95969AEAB3C14940C66FDBCDC528B2BF7286E270B5C149405C4762ACEF1FB2BFB044F6C7B6C14940F969FF2D921DB2BF390B6442B5C14940	The Black Horse	E1 8EU	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	0106000020E610000001000000010300000001000000050000009A9E05A45D1BB2BF213C49DCB3C149408EAFF469FD23B2BF72BECC84B2C149405EFA6CC33C26B2BF95969AEAB3C14940F969FF2D921DB2BF390B6442B5C149409A9E05A45D1BB2BF213C49DCB3C14940	The Black Horse	E1 8EU	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	0106000020E61000000100000001030000000100000009000000E1D775407831B2BFDFB336E0BBC1494017CEC9F52A36B2BF6E6258EBBEC149409AD6802B4B23B2BFD3205915C2C1494048DE604BED1FB2BF9CE59EBBBFC1494038FACA0D9E24B2BF71C280ECBEC14940F36D277DD723B2BF71F77B61BEC1494019C83DFA8E25B2BFF2226B20BEC149401C0634492D25B2BF0AC412D2BDC14940E1D775407831B2BFDFB336E0BBC14940	The Black Horse	E1 8EU	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	0106000020E61000000100000001030000000100000005000000222F6D225C36B2BF31572E9CBAC149403F191B5EF13BB2BF1314D6F9BDC1494017CEC9F52A36B2BF6E6258EBBEC1494016F02FCBE930B2BF4554ED83BBC14940222F6D225C36B2BF31572E9CBAC14940	Inteeka, 36 Alie Street	E1 8DN	0	\N	Alie Street	36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	0106000020E610000001000000010300000001000000050000003E1A6687913BB2BFEA5590BEB9C14940E35F8178D13FB2BFEE8D1E5BBCC1494056474470953AB2BF535E1438BDC14940222F6D225C36B2BF31572E9CBAC149403E1A6687913BB2BFEA5590BEB9C14940	Club Oops!, 30 Alie Street	E1 8DA	0	\N	Alie Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	0106000020E61000000100000001030000000100000005000000872AF2298E06B2BF81DEB1F4ADC14940A970348516FEB1BFC1078E2CAFC149403E218921A3FCB1BF5DFB6F2CAEC14940AD9F04822605B2BF80ACD0FEACC14940872AF2298E06B2BF81DEB1F4ADC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	0106000020E610000001000000010300000001000000050000008BBA3E264005B2BF543F86A9ABC149403E6883DD08FBB1BF16DD781EADC14940FDEC487479F9B1BFFE28A617ACC149408B409BDFCC03B2BFE83743A3AAC149408BBA3E264005B2BF543F86A9ABC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	0106000020E61000000100000001030000000100000005000000A970348516FEB1BFC1078E2CAFC14940872AF2298E06B2BF81DEB1F4ADC14940AC1E4C920408B2BF1677B0F3AEC1494082E78A159BFFB1BFA570A132B0C14940A970348516FEB1BFC1078E2CAFC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	0106000020E610000001000000010300000001000000060000003E6883DD08FBB1BF16DD781EADC149408BBA3E264005B2BF543F86A9ABC14940B656FC92CB06B2BF6114D8C0ACC14940AD9F04822605B2BF80ACD0FEACC149403E218921A3FCB1BF5DFB6F2CAEC149403E6883DD08FBB1BF16DD781EADC14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	0106000020E610000001000000010300000001000000050000003091BA3E5FEEB1BF773DF67E9DC149400DE6C60EBAE4B1BF4C9584FB9EC14940A7DAD65332E1B1BF11F816DD9CC14940C164422147EBB1BF45A261709BC149403091BA3E5FEEB1BF773DF67E9DC14940	Student Castle, 65 Leman Street	E1 8NX	0	\N	Leman Street	65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	0106000020E6100000010000000103000000010000000500000090A52F7D22F1B1BF014108F9A6C14940288A242491FAB1BF9743509AA5C14940A18D10E27402B2BF67C0B8D3AAC14940FDEC487479F9B1BFFE28A617ACC1494090A52F7D22F1B1BF014108F9A6C14940	The Oliver Conquest, 70 Leman Street	E1 8EN	0	\N	Leman Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	0106000020E61000000100000001030000000100000030000000AF8283A37C81B2BFF2E0163AA4C14940F710EDE08F76B2BFBC860E56A5C14940E20B3F024370B2BF6F4B9864A6C14940686F65875E6FB2BFC2FE7392A5C1494098E10566646CB2BF443E1BE3A5C14940B98047C4446AB2BFDFF51AEFA3C14940B83B8E33D867B2BF01F7C630A4C14940983CE82CC36AB2BF1529CDDFA6C14940A6A31E308B63B2BF600D0F1BA8C14940502830AD4960B2BFA921F2D8A4C14940FDE8AE929A5CB2BF408FAC34A5C14940B25F60BD2E5FB2BFD7B651C9A7C14940887E13D15559B2BFBF9BE95AA8C14940CC3187D5A158B2BF268DCCA6A7C14940D6F5FD7AFE54B2BFEB3D6201A8C14940B0C62FE68C53B2BFEC41888FA6C14940DD3DFE6C2A55B2BFB3E74F67A6C14940FC38A7B38654B2BF99E777C3A5C14940C92836DFE656B2BFAC1E5188A5C1494010F7EBEB7356B2BF17544815A5C149406D886EBF2B4FB2BF792A98CAA5C14940A40DB3BC7A4CB2BF674F1319A3C149407CEC39B4854EB2BF7A0C36E6A2C14940C73FA31D6E4DB2BF43926ACEA1C149405D53D55D2E47B2BF2F61026AA2C14940BFA1F896CC45B2BF7B0FF807A1C14940F87399ABC551B2BFD11CDBDD9FC149403420C6420350B2BFCE151D1B9EC1494088903E2FC04AB2BF5ACF219E9EC149407159EDA09A48B2BF4FA92A789CC14940C0F1A99D2059B2BF5423C0DC9AC149409CD80EEC665BB2BFCCF07B239DC1494031A1C129C954B2BF3A0B39C89DC149401E3CBF178E56B2BF67547C8D9FC149407485D1C65C5AB2BFA096AF2E9FC14940B78340F2C75BB2BFF7F81E9AA0C14940E01C1DB33662B2BF8B24F4F99FC1494044BB5E90635FB2BF62B84A269DC14940760670B4B06CB2BF10CB18DB9BC14940A2C46AD1C26FB2BF8758C6ED9EC14940B3B402AB9F6BB2BF04A2CA549FC1494038336F7F7E6FB2BF84C75434A3C14940247D13005D72B2BF210EE4ECA2C14940BA1670D84B74B2BF016D16DCA4C14940468EAB10D275B2BFF4E4A299A4C149403C0ADC450873B2BF4C22709FA1C14940F5EBB2BF707EB2BF4F313B95A0C14940AF8283A37C81B2BFF2E0163AA4C14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	0106000020E61000000100000001030000000100000005000000E9F556763445B2BF17AE7D2A98C14940E7A31D85093FB2BF276887BE98C1494093D1B7B7673DB2BFC262300497C149406CA6A7758B43B2BF4E16BE7396C14940E9F556763445B2BF17AE7D2A98C14940	English Martyrs RC Primary School	E1 8BB	0	\N	Scarborough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	0106000020E610000001000000010300000001000000150000005AF7B2F41921B1BFC3DEC362F5C14940C95DF894FE1FB1BFD3BA6E0FF5C14940BD587D476B1EB1BF5B91EDC6F4C14940BE372A57AC1CB1BFD6ACB18EF4C14940723D07A1351BB1BF26149E76F4C14940CCD7067F5E19B1BFCA729071F4C14940CCD7067F5E19B1BFCA729071F4C149400B73C5DAC817B1BFF5AC42A6F4C14940E8181BE2D916B1BFE93983D7F4C1494030F361E1BE15B1BF7E744D21F5C1494032A83D270915B1BFEB58A16FF5C149401BC84368EE13B1BFCC0202C4F5C149400C1802329E07B1BFF354A5C1F5C14940E7C935A31705B1BFEB4D2E71F2C14940F0B697464F02B1BF3CCEB695F0C14940C2DE32683901B1BFF54B3A33EFC1494088EE5C6BF101B1BF3419A7DEE9C149402C0573361E2AB1BF28A97673EAC14940E995A46DD32DB1BFC2A90452F4C14940B855E1A1F12AB1BF721FBC36F5C149405AF7B2F41921B1BFC3DEC362F5C14940	Dryden Building, 37 Commercial Road	E1 1LF	0	\N	Commercial Road	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	0106000020E61000000100000001030000000100000005000000C7E44520D34FB1BFF2054C9C06C249401FA959B76438B1BFAEFBF232F4C14940885E20350244B1BFACB290C0F2C149409C4313CFC45AB1BF2C672A3305C24940C7E44520D34FB1BFF2054C9C06C24940	1-13 Adler Street	E1 1EE	0	\N	Adler Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	0106000020E6100000010000000103000000010000001000000001DA7DFCF68EB1BF5088952001C24940507341EE7D8FB1BF8B600A3701C2494056D5B016988DB1BF7F9F6B8801C24940AD19E5A5FC8FB1BFD9790A4303C249401239C9A44C5CB1BF845185CC0AC2494060948B632059B1BF7EAC37D008C24940380FDF281A57B1BF87CFFB0B09C2494097CC08B3DD58B1BF569EE14F0AC24940EF57A9FB7D55B1BFE6D47DB30AC24940FBE125941452B1BFAEA74D6108C2494097F16F69C357B1BF1A2D2A8D07C249407C0A39698858B1BF754DD7EE07C24940C60F1DDB658BB1BF6E80AAA300C24940FD38FDFB848AB1BF6D800DF7FFC14940165336AA168DB1BF595C6A9CFFC1494001DA7DFCF68EB1BF5088952001C24940	Naylor Building East, 15 Adler Street	E1 1HD	0	\N	Adler Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	0106000020E61000000100000001030000000100000007000000FE7F3504F1A7B1BFEA7700B5FFC14940CCC5F24FCB98B1BF11CB64D501C24940227EE758058BB1BFBE347CE1F6C149400A7C48BF518DB1BFD530F390F6C14940C9994229CD8BB1BF41979B8DF5C149400F7F59B7EB98B1BFBF0FA7B3F3C14940FE7F3504F1A7B1BFEA7700B5FFC14940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	0106000020E610000001000000010300000001000000070000009AB3B9F748D4B1BFF03E3130F0C149403487DB5B97B8B1BF9E63ED4BF5C149401C69BE2B3BB9B1BFD91F190DF4C14940716392D641BCB1BFE315A908F3C14940EC767C7AE4BDB1BFC5CF60EBEDC14940ECC30BA770D4B1BF17D1EC5AEEC149409AB3B9F748D4B1BFF03E3130F0C14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	0106000020E610000001000000010300000001000000090000000056ED6072A2B1BF27F2EE86EEC149401A2FD6EE71A2B1BF83ECF486EEC149409C3A38D8869CB1BF00C68C8FEFC149403A95FFFCF099B1BF538AFCF4EDC14940312E5AA9839AB1BF65B4CB80EDC1494022DB8ABD049CB1BF72973D19EDC14940735EEAA418A3B1BF16D32828EDC1494068FA159513A4B1BFB4530A35EEC149400056ED6072A2B1BF27F2EE86EEC14940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	0106000020E61000000100000001030000000100000005000000F20EC0CF7DF3B1BF5F7BFCC728C24940EC010E01BAE6B1BFB9AC41772AC2494007CD869CEBE4B1BF5BB3BC1F29C24940D1EBDE6FC5F1B1BF885CCC7027C24940F20EC0CF7DF3B1BF5F7BFCC728C24940	Geet Ghar, 24 Osborn Street	E1 6TE	0	\N	Osborn Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	0106000020E61000000100000001030000000100000009000000A2EE5850CB80B1BFD9091601F0C149406A83BB33B685B1BF003C1F4BF3C149407F73711A0786B1BF8F31EE4BF4C149404BE663D7F170B1BF47543B15F7C149408F38625F436BB1BFFC46B328F3C14940EE1147C1885CB1BF659B9814F5C14940B69821D8E756B1BF69E31588F0C149402F68CEEDDC7BB1BFCCF41180ECC14940A2EE5850CB80B1BFD9091601F0C14940	Hult International Business School, 33 Commercial Road	E1 1LD	0	\N	Commercial Road	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	0106000020E6100000010000000103000000010000000E000000239C043E7B4BB1BFFD55FF24EEC1494040E48DA55645B1BF313F0A18EEC149404FBB4CC4F144B1BF93106C97EFC1494055545589353FB1BFCF97FA75EFC149401E5C7E0DD33FB1BF8DA4CE81EEC149400583E720053DB1BF2C33E47BEEC14940AC762B43F13CB1BF32558666EFC149406C06B7F50338B1BF7AD47031EFC14940DEB8D8FD0438B1BFA9D73791EDC14940940E7201E333B1BFD3872773EDC1494008EC262EA433B1BFFAE70A9DEBC1494028D619C64D35B1BFECA11DEBEAC14940850FCFD8344AB1BF30C850D7EBC14940239C043E7B4BB1BFFD55FF24EEC14940	Morrison Buildings North, 35a Commercial Road	E1 1LB	0	\N	Commercial Road	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	0106000020E61000000100000001030000000100000010000000494F6B11D2EFB1BF73AAA2EB25C24940A5745DB85FE9B1BFCA86B0D126C2494097AC1D7A9BEAB1BF4E0E20AE27C2494085AFA985E3E6B1BF5D1CD33228C24940484CDBF986E5B1BF856C7F3F27C24940D6D96DAB2BE3B1BFA5B9989327C24940F5C822A52BE3B1BF2287999327C24940F8E41CB3D7DDB1BF1EDD914128C24940CBC2F61BD4D8B1BFAAFA7F5624C249409C973FE664DBB1BF1148860624C24940E4E69C6756D1B1BFBF9B9D851CC2494094B653394DD7B1BFBCFC5D871BC24940CFA8982A4DD7B1BFB53F52871BC24940CF6566F7BEE0B1BF4E21842D1AC24940ED506B4B25E1B1BFBD67F27B1AC24940494F6B11D2EFB1BF73AAA2EB25C24940	The Lane Lounge Bar	E1 6TE	0	\N	Osborn Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	0106000020E610000001000000010300000001000000050000004041172CFBC7B1BFBCCEEB4721C24940874175114AC1B1BF829711FA22C24940B1F5C4FA0BBAB1BFD734BE1F20C249407B8AFC0152C0B1BFB2E613A21EC249404041172CFBC7B1BFBCCEEB4721C24940	E1 Business Centre, 7 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	0106000020E6100000010000000103000000010000000A0000002A7DB8715EB8B1BFE9838AE71AC249404F559726B0B6B1BFAA7D06981BC249403B1108440BBAB1BF53064BFF1CC249403D51485DACB8B1BFCF5B21671DC249403D6A9A447FBAB1BF49AEB7F51DC249407309DC1267B6B1BF6042E7F71EC249406203B2063DB2B1BF23ED46A41DC249403D228B57E4ABB1BF8B913C411BC249403CFBE159F2B3B1BF84B48E3C19C249402A7DB8715EB8B1BFE9838AE71AC24940	E1 Business Centre, 7 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	0106000020E61000000100000001030000000100000006000000C49B2B3E5FAEB1BF3BC5F49B1EC2494092DCE7115FAEB1BF3025ED9B1EC24940941B0FB277A8B1BFA6D53B241CC24940CA044B27E4ABB1BFC59F35411BC2494044E671D63CB2B1BF61FB3FA41DC24940C49B2B3E5FAEB1BF3BC5F49B1EC24940	The Nag's Head, 17-19 Whitechapel Road	E1 7QR	0	\N	Whitechapel Road	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	0106000020E6100000010000000103000000010000000C000000C15FB9C1A0BAB1BFD3C5CFD938C24940FDC23D4846BEB1BF31F2E0263BC24940988C354346BEB1BFFB2FEC263BC2494037C478F40CADB1BF39FC20F33CC24940500BC0A1739FB1BFFBAEA3AA34C24940CCF76EDCAEA5B1BF9D80F5AC33C249401D666EE991A7B1BF38A4211135C2494098577CAF30A9B1BFEBEF2EDF34C24940C17DE0DD63B0B1BFADED0CCF39C2494092D530D0FBB4B1BF6A80A43839C249402D39112B37B5B1BF0269DBA339C24940C15FB9C1A0BAB1BFD3C5CFD938C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	0106000020E61000000100000001030000000100000008000000D9722DDBCBA1B1BF342E82B426C2494099CE87EDC777B1BF5A16DE3A30C24940B3A98ED11A75B1BF1960464530C2494024BA3081876AB1BF436639552BC249405A820D01BF6AB1BF97D918BD2AC2494023A0C974E895B1BF86110BC920C249405380F4AB2CA2B1BF43B230F425C24940D9722DDBCBA1B1BF342E82B426C24940	Argos	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	0106000020E6100000010000000103000000010000000F0000000034083B2FA5B1BF02BF9FAB31C24940F76DDDA574A4B1BF15D15B9233C24940C6795119E4A1B1BF99A6467A33C249402B391AB036A2B1BF1BDCDCD232C249401E405322CFA0B1BF38DCE5C732C24940F7AD5F9B2FA0B1BFD3B634D533C24940B18ABCF9FC8AB1BFB8C8427432C249400C0A04FF318BB1BF8D02170E32C2494030A4CBA1D984B1BF631D3EAC31C24940ACB3A8859786B1BF3764A7E72EC24940DC8649B39690B1BFCCF1967A2FC24940089975E6C490B1BFBCE096252FC24940ED048301C0A3B1BF257EC37530C2494091EBEB2FE4A2B1BF7BDCC58631C249400034083B2FA5B1BF02BF9FAB31C24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	0106000020E61000000100000001030000000100000006000000262014112424B1BF228032EA38C2494073CED010292CB1BFD372B9B83CC2494020AC45FA282CB1BF7C34CDB83CC2494051B9657F5025B1BF53B1DFFF3DC249403B0A1F91C11DB1BFD583B8243AC24940262014112424B1BF228032EA38C24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	0106000020E61000000100000001030000000100000008000000B1AEA36B9D77B1BFFB3C9D6136C24940504786380C72B1BFE5E75C6B37C249401CD618C98971B1BF6F98941F37C24940F80ADD9B4A66B1BFD3BBCDF238C24940DBE94858105DB1BFCCFE5B4934C24940649D053D6466B1BF79DC810733C24940D130DC82066EB1BF5DD2024231C24940B1AEA36B9D77B1BFFB3C9D6136C24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	0106000020E61000000100000001030000000100000006000000676EA7257362B1BF6F1935203AC24940F32ED593E652B1BF73044BD53DC24940DC74BE39C448B1BFD2858DD438C24940164406BE1B52B1BFAA190B6837C2494027B8874E035AB1BFA0AA729835C24940676EA7257362B1BF6F1935203AC24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	0106000020E610000001000000010300000001000000110000008692A6A19C7FB1BF5170CFCE38C24940FE56E7935380B1BF848B0B3F39C249402FAB92619072B1BF1F45B1773BC24940D7A5B57DBF71B1BF159FE6F53AC24940B4B939DC566FB1BFEC8B66533BC24940A126FB15E56EB1BF57ED8CFA3AC24940FB9CCF64916EB1BF2D279A093BC249401F7A7E5D1D6CB1BFD40F2C9F39C24940E4AC51F69674B1BF3FB2BA4A38C24940929930FE0B74B1BF58305FED37C24940782320C0AB77B1BF5577874C37C24940EEEF738C8578B1BF538553BB37C249407BE1615D607FB1BFF21ED49836C24940F667F3BD7681B1BFC2648CA637C2494015F9ABA4B680B1BF2235FED437C2494017E42783CD81B1BF5785086238C249408692A6A19C7FB1BF5170CFCE38C24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	0106000020E61000000100000001030000000100000008000000CACBFFB2714DB1BF3AE0F2F13EC24940C110E296DB4DB1BF50B31AFA3EC2494065547816883DB1BF6879521441C24940425AC6207330B1BF1777986544C24940233A68CFC926B1BF7490D6553FC249405AF20F13B236B1BF31A65EEC3CC249408A1B93DF1D43B1BFDD6B74DB39C24940CACBFFB2714DB1BF3AE0F2F13EC24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	0106000020E6100000010000000103000000010000001F00000072E1F015EC6CB1BF8499F3833CC24940846C5BEB186FB1BFABAFB2A83DC249404A5B9BC3C670B1BF415E73643DC249402C4183CBF674B1BF6059163040C24940EE243758E88AB1BF7A1B80B83CC249408393C91E8C86B1BFCA3907093AC2494086D820838F88B1BF472C98B739C24940CC8D1538C186B1BFEA2EDF9A38C2494068CDF8C6A58CB1BFA77A83AC37C24940BB8DAD10798EB1BF32CE4FCC38C24940C3FCCC655B90B1BF2CE0198038C24940B7A81B2F4F94B1BF873E48F13AC24940D4D6929ACD93B1BF42908B0A3BC24940B57D19172E94B1BF0498973C3BC249408F0B37A5B59CB1BF8A9A25FD39C24940FB3F7EAA909DB1BFCBCF09843AC249402E884EE35A9FB1BF1803A33B3AC24940F3F08AC090A2B1BF7C1ACF353CC249401E415ECAF09EB1BFE8936EC83CC24940CA47F183E29FB1BF1D604E5D3DC24940B437E3E55194B1BF76F518313FC249401F8168A31F69B1BFD1BCE50746C24940205A53B1A168B1BFA2101EA245C24940BC9A1BF01566B1BF8CA2E71246C249402E39B7D01161B1BFB4A891F942C2494029AD7A33256BB1BFB3AD066241C249400ED48365746BB1BFE3A1F74F41C24940863988FD2D6BB1BF394C692541C24940114375CAE26AB1BFB6C77B3341C24940018F09DC4565B1BF07711EC43DC2494072E1F015EC6CB1BF8499F3833CC24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	0106000020E61000000100000001030000000100000006000000020BCC8B79A0B1BF25DF7FFA44C24940E272578D8BA9B1BF937399F043C24940F735BCB08BA9B1BF2E6695F043C2494049F2897FC0AAB1BFEDD46CF744C2494019C8D168E7A1B1BFC3E5F11446C24940020BCC8B79A0B1BF25DF7FFA44C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	0106000020E61000000100000001030000000100000006000000F3802F90ABC1B1BF5DFEDD7A41C249401901549DDACAB1BF4B95988940C24940D4AB97C2DACAB1BF51C2948940C2494089D4B89ADACBB1BFAB72FC8141C24940562BECD38EC2B1BF0315DE6342C24940F3802F90ABC1B1BF5DFEDD7A41C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	0106000020E610000001000000010300000001000000090000007880D17E3FAAB1BF2C9738A41FC249403330FB4F3FAAB1BFEF8B31A41FC249408F743AC9B0A4B1BFA7EAAF1E1DC24940941B0FB277A8B1BFA6D53B241CC2494092DCE7115FAEB1BF3025ED9B1EC24940C49B2B3E5FAEB1BF3BC5F49B1EC249401F23A86F5FB9B1BFFC44BCDF23C24940D3ADBCF00BB5B1BF15E6A8C124C249407880D17E3FAAB1BF2C9738A41FC24940	UAE Money Exchange, 21 Whitechapel Road	E1 7QR	0	\N	Whitechapel Road	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	0106000020E610000001000000010300000001000000070000007C53C9EE87ADB1BFDC86842124C249402591DF2077A0B1BF37FCDC361EC249408F743AC9B0A4B1BFA7EAAF1E1DC249403330FB4F3FAAB1BFEF8B31A41FC24940F7B1BCF00BB5B1BF1AE6A8C124C2494032328DFD62AEB1BF534C075026C249407C53C9EE87ADB1BFDC86842124C24940	Best Star One Food and Wine, 23 Whitechapel Road	E1 7QR	0	\N	Whitechapel Road	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	0106000020E61000000100000001030000000100000006000000D94611A28AABB1BFDF0DF11826C24940DC6D7726759CB1BFD4ED9D401FC249402591DF2077A0B1BF37FCDC361EC249401257C9EE87ADB1BFD286842124C249404F347C1A2EAEB1BF10BC5EB525C24940D94611A28AABB1BFDF0DF11826C24940	Mutual Trust Bank Exchange, 25 Whitechapel Road	E1 7QR	0	\N	Whitechapel Road	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	0106000020E61000000100000001030000000100000005000000DC6D7726759CB1BFD4ED9D401FC24940554C11A28AABB1BFDB0DF11826C24940F177F6588AA6B1BFFFEB051227C24940640E2B7D1498B1BF3458E56220C24940DC6D7726759CB1BFD4ED9D401FC24940	Spitalfields Crypt Trust, 27 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	0106000020E6100000010000000103000000010000000A00000045F58A4B77CEB1BF77C0EB3E13C249407E7AE1FE15D6B1BF7DA8CBEE16C249402E678DE515D6B1BFF776E2EE16C24940279CDD17EEC7B1BF70581CFC19C249401C6628FEA4BEB1BF27CF8D531CC249402DEB9D9C3FC1B1BFD308D2231DC24940BCE3891033BFB1BFA3083FAA1DC249404239AC3E79BFB1BF578F7A951DC24940C303228AF2B3B1BF51A6953C19C2494045F58A4B77CEB1BF77C0EB3E13C24940	E1 Business Centre, 7 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	0106000020E6100000010000000103000000010000000B000000CF6566F7BEE0B1BF4E21842D1AC24940CFA8982A4DD7B1BFB53F52871BC249405A75428283D4B1BF1A58A57F19C24940F43C1FEF72D8B1BF53B2DBAD18C24940B243212F16D6B1BF4D9AD2EE16C249402E678DE515D6B1BFF776E2EE16C249407E7AE1FE15D6B1BF7DA8CBEE16C2494045F58A4B77CEB1BF77C0EB3E13C24940625B86A789D4B1BF1BADB8C111C24940B38EA61707D6B1BF3533CEE011C24940CF6566F7BEE0B1BF4E21842D1AC24940	Clifton, 1 Whitechapel Road	E1 7QR	0	\N	Whitechapel Road	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	0106000020E6100000010000000103000000010000000600000010CCCF92CAF6B1BF9E2E515A2BC249407451A270CAF6B1BF488F555A2BC2494062ED735C44DFB1BF8AF6A75D2EC24940F72CAB917CDDB1BF282835392DC24940A7A5EB9C19F5B1BF742EE8082AC2494010CCCF92CAF6B1BF9E2E515A2BC24940	Braai, 28 Osborn Street	E1 6TE	0	\N	Osborn Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	0106000020E6100000010000000103000000010000000F000000D1EBDE6FC5F1B1BF885CCC7027C2494007CD869CEBE4B1BF5BB3BC1F29C2494052144510BAE6B1BF70FA4C772AC2494032A1B9F57BDBB1BF3EC94DF02BC24940D0428E8016D7B1BFB4132E1E29C249402D97CCC1D7DDB1BF2A579D4128C24940F8E41CB3D7DDB1BF1EDD914128C24940F5C822A52BE3B1BF2287999327C24940D6D96DAB2BE3B1BFA5B9989327C24940484CDBF986E5B1BF856C7F3F27C2494085AFA985E3E6B1BF5D1CD33228C2494097AC1D7A9BEAB1BF4E0E20AE27C24940A5745DB85FE9B1BFCA86B0D126C24940494F6B11D2EFB1BF73AAA2EB25C24940D1EBDE6FC5F1B1BF885CCC7027C24940	Arbor City Hotel, 12-20 Osborn Street	E1 6TE	0	\N	Osborn Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	0106000020E61000000100000001030000000100000007000000A7A5EB9C19F5B1BF742EE8082AC24940F72CAB917CDDB1BF282835392DC2494032A1B9F57BDBB1BF3EC94DF02BC2494052144510BAE6B1BF70FA4C772AC24940EC010E01BAE6B1BFB9AC41772AC24940F20EC0CF7DF3B1BF5F7BFCC728C24940A7A5EB9C19F5B1BF742EE8082AC24940	Apples and Pears, 26 Osborn Street	E1 6TE	0	\N	Osborn Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	0106000020E6100000010000000103000000010000000700000000C8536C7CF8B1BF8F926BAC2CC24940494FBC4C7CF8B1BF9CE271AC2CC2494022E2D95D41E1B1BF6E673FA42FC2494062ED735C44DFB1BF8AF6A75D2EC249407451A270CAF6B1BF488F555A2BC2494010CCCF92CAF6B1BF9E2E515A2BC2494000C8536C7CF8B1BF8F926BAC2CC24940	Sajna, 30 Osborn Street	E1 6TE	0	\N	Osborn Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	0106000020E61000000100000001030000000100000007000000E9EFBD7D37F6B1BFDC8CA4B435C249408C4C005B37F6B1BF9E639CB435C24940D819F060F6F3B1BF14299EA133C249408054C57A7FF9B1BFE8226A0633C24940DBE9B33E06FCB1BF7E9ECB2835C24940F087EB2FD0FAB1BF1C05744035C24940E9EFBD7D37F6B1BFDC8CA4B435C24940	The Archers, 42 Osborn Street	E1 6TE	0	\N	Osborn Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	0106000020E61000000100000001030000000100000005000000BC3ED38C47E4B1BF5DC555412FC249407367260BD2E6B1BF75B1597830C24940C12D496C93E3B1BF7702692131C2494022E2D95D41E1B1BF6E673FA42FC24940BC3ED38C47E4B1BF5DC555412FC24940	Sajna, 30 Osborn Street	E1 6TE	0	\N	Osborn Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	0106000020E6100000010000000103000000010000000A000000BA881B4CFDFCB1BF4BA2DD2E30C24940AC78F6811FEFB1BFD9D806DA31C24940E967C609F9E9B1BF0F71141F31C24940F9D258BE02E5B1BF83C9170D32C24940C12D496C93E3B1BF7702692131C249407367260BD2E6B1BF75B1597830C24940BC3ED38C47E4B1BF5DC555412FC24940494FBC4C7CF8B1BF9CE271AC2CC2494000C8536C7CF8B1BF8F926BAC2CC24940BA881B4CFDFCB1BF4BA2DD2E30C24940	32-38 Osborn Street	E1 6TE	0	\N	Osborn Street	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	0106000020E6100000010000000103000000010000000A0000005592B3617AFBB1BF72DE682132C24940CF361E1AF9FEB1BF56AAF0A731C2494065731CE78401B2BFC67AA36333C2494080F66886FC01B2BFD4E0662F34C24940A0439D4DBB00B2BFBB0CD9CC34C24940DBE9B33E06FCB1BF7E9ECB2835C249403BA7CC41C4F9B1BF609BB23233C24940ECC5FDCA35FCB1BFD13DD1E232C2494031FFC62536FCB1BF65679FDE32C249405592B3617AFBB1BF72DE682132C24940	The Archers, 42 Osborn Street	E1 6TE	0	\N	Osborn Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	0106000020E6100000010000000103000000010000000A0000003E351E1AF9FEB1BF57AAF0A731C24940949673317AFBB1BFECEC612132C249409331C91C7AFBB1BF25E76F2132C24940A36ED06F33E8B1BF72EF1A1934C24940F9D258BE02E5B1BF83C9170D32C24940E967C609F9E9B1BF0F71141F31C24940AC78F6811FEFB1BFD9D806DA31C24940BA881B4CFDFCB1BF4BA2DD2E30C2494052CCAECA3BFEB1BF9E49122731C249403E351E1AF9FEB1BF57AAF0A731C24940	Easy Mobile UK, 40 Osborn Street	E1 6TE	0	\N	Osborn Street	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	0106000020E610000001000000010300000001000000070000003B0B090E01F1B1BF2F71683836C24940CECF41EC00F1B1BFB421603836C24940FD69FB5091EEB1BFFC99573634C24940D819F060F6F3B1BF14299EA133C249408C4C005B37F6B1BF9E639CB435C24940E9EFBD7D37F6B1BFDC8CA4B435C249403B0B090E01F1B1BF2F71683836C24940	Sweet Point Food and Wine, 2 Old Montague Street	E1 6TE	0	\N	Old Montague Street	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	0106000020E61000000100000001030000000100000006000000FD69FB5091EEB1BFFC99573634C24940CECF41EC00F1B1BFB421603836C249403B0B090E01F1B1BF2F71683836C249400AF86EA564ECB1BFC4D1F6AC36C24940024E2CB458E9B1BFF8A347C634C24940FD69FB5091EEB1BFFC99573634C24940	Clarke and Lloyds, 8 Old Montague Street	E1 6TE	0	\N	Old Montague Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	0106000020E610000001000000010300000001000000070000004E7EAFE9E0B5B1BF710C5A5F01C2494048A85D9811C5B1BF7156E81FFFC14940D7B75D9811C5B1BF6D56E81FFFC14940CFDC33AE3EC6B1BFF2084CDFFFC1494058147E74E1C3B1BF109CF48900C24940492D145851B7B1BF29C5175E02C249404E7EAFE9E0B5B1BF710C5A5F01C24940	Sushino En, 2 White Church Lane	E1 7QR	0	\N	White Church Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	0106000020E6100000010000000103000000010000000A0000007C4294F3D1CBB1BFD9551B1600C249408EBEDBE9F3CFB1BF0C50964303C24940737A2CDDF3CFB1BFBAD5A44303C249408A51ECDC65C4B1BFCCA8F6BF04C2494054364D2246BCB1BF6D645CCB05C24940492D145851B7B1BF29C5175E02C2494074FEBD3A67BFB1BFE9D8CC3001C2494039137E74E1C3B1BF129CF48900C24940FB3419285CC4B1BFB280ABFD00C249407C4294F3D1CBB1BFD9551B1600C24940	Sushino En, 2 White Church Lane	E1 7QR	0	\N	White Church Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	0106000020E61000000100000001030000000100000007000000986CB5E247B4B1BF15AD8A4400C24940AA70FCE28EBCB1BF1731CB29FFC1494074CC07657DC3B1BF60A04326FEC149409DC75D9811C5B1BF6B56E81FFFC14940D7B75D9811C5B1BF6D56E81FFFC149404E7EAFE9E0B5B1BF710C5A5F01C24940986CB5E247B4B1BF15AD8A4400C24940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	0106000020E61000000100000001030000000100000008000000DA679AD1C1B2B1BF4F5FD736FFC14940EE982BDC15BBB1BFEC00131DFEC149405EB84A90FEC1B1BF2E789E2BFDC14940CEC64A90FEC1B1BF2D789E2BFDC14940C9DB07657DC3B1BF5EA04326FEC14940AA70FCE28EBCB1BF1731CB29FFC14940986CB5E247B4B1BF15AD8A4400C24940DA679AD1C1B2B1BF4F5FD736FFC14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	0106000020E6100000010000000103000000010000000C0000001B5FB79941B2B1BF8ADD15D5FDC1494085B7A72FC1B9B1BFC10A4DDAFCC14940AEBDC04BC1B9B1BF28A045DAFCC149406C45E75FC1B9B1BFD7FC53DAFCC149406FE6F0BD1CC0B1BF207D57F9FBC149401BC24A90FEC1B1BF2B789E2BFDC14940938004AF16BBB1BF41BF031DFEC14940EE982BDC15BBB1BFEC00131DFEC14940DA679AD1C1B2B1BF4F5FD736FFC149403E3C1B394AB1B1BF54832533FEC14940D30A50A741B2B1BF925621D5FDC149401B5FB79941B2B1BF8ADD15D5FDC14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	0106000020E6100000010000000103000000010000000A0000008549F20F3BB0B1BFA760891FFCC14940B9D5AB6E58B4B1BFAF6C8F89FBC149403DB0058D58B4B1BF789C8989FBC149401107B1C60BB9B1BF6175DE8BFAC149406001BECBBEB9B1BFEEFE7AFAFAC1494026F7DB1A95BDB1BF389BA95AFAC14940DCF3F0BD1CC0B1BF207D57F9FBC1494085B7A72FC1B9B1BFC10A4DDAFCC149401B5FB79941B2B1BF8ADD15D5FDC149408549F20F3BB0B1BFA760891FFCC14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	0106000020E610000001000000010300000001000000070000003DB0058D58B4B1BF789C8989FBC14940B9D5AB6E58B4B1BFAF6C8F89FBC149408549F20F3BB0B1BFA760891FFCC149401F6DB33F84ADB1BF809F3ED5F9C14940C91DC4AF6EB5B1BF00057D77F8C149406FFBB0C60BB9B1BF6675DE8BFAC149403DB0058D58B4B1BF789C8989FBC14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	0106000020E6100000010000000103000000010000000C0000004660D39FAC43B1BF0F96DBD214C24940AA397FB03557B1BFE2A63E1511C249403E26F9DD3557B1BFFD0B421511C2494079001E421F73B1BFC2337F421FC24940BDF32EE77069B1BFE7A1354A21C24940007F475ED361B1BF08EC63D61DC24940F8DCED2E0E58B1BF2C62FAF41FC24940CF6DF3C98F56B1BF1E90C04C1FC24940AD69AD545953B1BF321440E21FC24940CAFACFE45D4EB1BF049A66371DC24940DBBF1D511652B1BF4F6E478A1CC249404660D39FAC43B1BF0F96DBD214C24940	Qbic London City, 42 Adler Street	E1 1EE	0	\N	Adler Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	0106000020E610000001000000010300000001000000050000009C8047C1C95FB1BFE5EAE65B23C24940BC2DB27D3B5DB1BF5C13A5E623C249407D5FD89B8955B1BFBBB3456320C24940ACE1ED2E0E58B1BF2862FAF41FC249409C8047C1C95FB1BFE5EAE65B23C24940	Audiotec, 10 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	0106000020E610000001000000010300000001000000050000007E70714D3B5DB1BFA6219EE623C2494075909DF81A5AB1BF4708129D24C24940DE23B3884652B1BF3A97571021C249407D5FD89B8955B1BFBBB3456320C249407E70714D3B5DB1BFA6219EE623C24940	Audiotec, 10 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	0106000020E6100000010000000103000000010000000F000000CA909DF81A5AB1BF4808129D24C24940C9C92EAFA256B1BF3CC5BA6E25C249401EE7DB288456B1BF695F356325C24940671F0E3F074FB1BF3FCE202B22C249408677EEA11E49B1BFB33CB59A1FC24940731A01CFA941B1BF7259322D21C24940E0098671D13BB1BF3E68E49A1EC24940E69F7CB2AA4EB1BF7A567BB51AC24940F4CD1D511652B1BF4B6E478A1CC24940A707D0E45D4EB1BFF99966371DC24940F873AD545953B1BF2C1440E21FC2494071A9B4A74550B1BF33EF918120C24940A4350FAD6352B1BF71B6AE9221C24940C6EE057B3153B1BF16E4B87821C24940CA909DF81A5AB1BF4808129D24C24940	Rythm Factory, 16-18 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	0106000020E61000000100000001030000000100000006000000ADE7DB288456B1BF695F356325C24940DAC9E628504FB1BFFA52DE1027C2494098BE7B4F254AB1BF314B76E824C24940D63101CFA941B1BF6859322D21C24940ED81EEA11E49B1BFB33CB59A1FC24940ADE7DB288456B1BF695F356325C24940	Rythm Factory, 16-18 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	0106000020E61000000100000001030000000100000006000000ECE9A5F84F4FB1BF4D61D71027C24940F0FC4467FE46B1BF8233CDD628C2494083A54CA93234B1BFE566751D20C2494085168671D13BB1BF4368E49A1EC24940FFDE3A1F254AB1BF7D596FE824C24940ECE9A5F84F4FB1BF4D61D71027C24940	Kay Textiles Ltd, 20 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	0106000020E610000001000000010300000001000000050000006D080437FE46B1BFDA41C6D628C24940ED5AA68EAA43B1BF34519F9129C24940FCB87CBA5938B1BF2C3E336224C2494013ACC110EB3BB1BF7770DBC723C249406D080437FE46B1BFDA41C6D628C24940	Kay Textiles Ltd, 20 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	0106000020E61000000100000001030000000100000005000000055E655EAA43B1BF8F5F989129C249409F2DC730C040B1BFD743602E2AC24940598DC88D6D35B1BF7C8610EB24C2494032B77CBA5938B1BF363E336224C24940055E655EAA43B1BF8F5F989129C24940	Whitechapel Bell Foundry, 32-34 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	0106000020E61000000100000001030000000100000006000000AA298600C040B1BF3452592E2AC249407B9A07408E3DB1BF3E2134DA2AC24940BA8173A45837B1BF06C11CFA27C24940D60985E68F3AB1BF2DC0194D27C24940FBF2C2DE5C3CB1BF583E8F2228C24940AA298600C040B1BF3452592E2AC24940	Whitechapel Bell Foundry, 32-34 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	0106000020E61000000100000001030000000100000005000000B08EC60F8E3DB1BF9A2F2DDA2AC2494002A3E4664039B1BF11E626A62BC24940E36797350433B1BF1A8B20D828C2494081AFB2623E37B1BF6E8903EE27C24940B08EC60F8E3DB1BF9A2F2DDA2AC24940	Whitechapel Bell Foundry, 32-34 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	0106000020E6100000010000000103000000010000000600000087133082A7B8B1BF5961FED70AC24940CC8D9D0763B3B1BF5452D7E60BC24940B26228349AACB1BF0E8C4C9D08C249400B2B129977B3B1BF9BC3513C07C24940402E361021B9B1BFF32FA0FA09C2494087133082A7B8B1BF5961FED70AC24940	Sushino En, 2 White Church Lane	E1 7QR	0	\N	White Church Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	0106000020E610000001000000010300000001000000060000008F69D26877B3B1BF9ED14A3C07C24940B26228349AACB1BF0E8C4C9D08C249405B5C710690ABB1BFAB8001CC08C24940FBAA7A45B1A8B1BF96CC198E07C24940F1063E0717B1B1BF04C68EAA05C249408F69D26877B3B1BF9ED14A3C07C24940	Chez Rob, 4 White Church Lane	E1 7QR	0	\N	White Church Lane	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	0106000020E6100000010000000103000000010000000A0000000748FED616B1B1BF04D487AA05C2494043D73A15B1A8B1BF99DA128E07C24940AE561CC344A6B1BFD263932008C2494025369B078CA6B1BFC625144708C249405A8B89454AA5B1BFF7A2799208C2494006C45FAAEDA4B1BFABC6A16108C24940E070A18FBD9FB1BF78666A7709C24940842233AFB89BB1BF6799FD8307C24940DF2E7E7BD6ADB1BF9C0027E203C249400748FED616B1B1BF04D487AA05C24940	Altab Ali Park	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
159	0106000020E610000001000000010300000001000000080000002303E0764AACB1BFA66009D602C24940438345688C9DB1BFC1A2D09605C24940FE842DA5BB9BB1BF83F7D99804C2494082D5F6E5019EB1BF4FCED5F703C249406879C8AA03A5B1BF70E3CFBE02C24940B2850F8EC9A4B1BF3BF0FFA102C249400163912889AAB1BFB9BCBAA501C249402303E0764AACB1BFA66009D602C24940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	0106000020E6100000010000000103000000010000000700000029F6A98B96A6B1BF8D969588F0C149406EBDA92E00A0B1BF518A39B7F1C14940C1F2548F2A9EB1BF657AE893F0C14940D83EB43E34A4B1BFEE6A9C6DEFC14940DC594B6EF6A6B1BF3F8FD6F2EEC149409C727CBD9DAAB1BFC5210EE3EFC1494029F6A98B96A6B1BF8D969588F0C14940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
161	0106000020E61000000100000001030000000100000008000000E247A45234A4B1BF8BCF946DEFC14940D83EB43E34A4B1BFEE6A9C6DEFC14940C1F2548F2A9EB1BF657AE893F0C149409C3A38D8869CB1BF00C68C8FEFC149401A2FD6EE71A2B1BF83ECF486EEC149400056ED6072A2B1BF27F2EE86EEC1494088A8151F72A2B1BFC0DEFB86EEC14940E247A45234A4B1BF8BCF946DEFC14940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	0106000020E61000000100000001030000000100000007000000138122506DAAB1BF71144D62EDC14940BA503875F2AAB1BF08ADB85EF3C14940E64206E239A4B1BF49F73956F4C149406EBDA92E00A0B1BF518A39B7F1C1494029F6A98B96A6B1BF8D969588F0C1494035697CBD9DAAB1BFCA210EE3EFC14940138122506DAAB1BF71144D62EDC14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	0106000020E61000000100000001030000000100000005000000C418E31F6DAAB1BF31224662EDC149402BF73C8D9DAAB1BF932F07E3EFC14940C684D66413A4B1BF77610335EEC149404AEBAA7418A3B1BFD6E02128EDC14940C418E31F6DAAB1BF31224662EDC14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	0106000020E61000000100000001030000000100000006000000D8FF75072CE7B1BF098925D704C249407764BAFA04E7B1BFD4940AFE04C2494058EFEF0A41E4B1BF0D6805A405C2494080550AD90EDFB1BF7F6828A103C249402F80C09BFEE3B1BFE5DB56FE02C24940D8FF75072CE7B1BF098925D704C24940	London Metropolitan University	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	0106000020E610000001000000010300000001000000050000001E82B0DA40E4B1BF1276FEA305C24940C30AF0136AE0B1BF1196C18306C249403351A42005DBB1BF5F11863504C249409D550AD90EDFB1BF846828A103C249401E82B0DA40E4B1BF1276FEA305C24940	London Metropolitan University	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	0106000020E610000001000000010300000001000000060000005B2B6AE04CD8B1BF3A59F00B03C24940040FF0136AE0B1BF1196C18306C249406C740498A5DCB1BF648F707607C24940842E955D07D6B1BFD49C790205C249403251A42005DBB1BF6411863504C249405B2B6AE04CD8B1BF3A59F00B03C24940	Straits Times Kopitiam	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
167	0106000020E61000000100000001030000000100000007000000FD091073F4D3B1BFA8016A8C03C24940802C955D07D6B1BFD69C790205C24940BBF3C467A5DCB1BF6C9D697607C2494053BFDF18CED8B1BF3C786F5C08C24940FEEC202118D2B1BF2951B79105C2494089F105A799CFB1BF7F1DD70604C24940FD091073F4D3B1BFA8016A8C03C24940	Straits Times Kopitiam	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	0106000020E61000000100000001030000000100000008000000E634A0E8CDD8B1BF4786685C08C24940E377EFD8A6D4B1BFAA4E823B09C24940171D4116A1D0B1BF5C0EBC6507C24940BD5B3A734AD1B1BFB38E1C3807C24940281DC979FFCCB1BFAE1B455604C24940E769C67699CFB1BF7C2BD00604C24940CA62E1F017D2B1BF2B5FB09105C24940E634A0E8CDD8B1BF4786685C08C24940	Straits Times Kopitiam	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	0106000020E610000001000000010300000001000000090000002AE3AFA8A6D4B1BFB75C7B3B09C2494006E28887D1D0B1BF4EB98E160AC24940202637E848C8B1BFED96C6B006C249408C79C6429ECBB1BF88A4D22706C249402BF6E6F4E2C8B1BF371F29E004C249401321C979FFCCB1BFAF1B455604C24940875D3A734AD1B1BFB38E1C3807C24940BF1B4116A1D0B1BF5A0EBC6507C249402AE3AFA8A6D4B1BFB75C7B3B09C24940	Straits Times Kopitiam	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	0106000020E61000000100000001030000000100000006000000A0C3DD4376C6B1BF1FEDEEBD06C249405FF6654BF2BEB1BF4EAF063908C24940B17661825CBCB1BFE6B2B93F07C249400263CE0057BCB1BFC6D1609306C24940B805549DC2C3B1BFF304779205C24940A0C3DD4376C6B1BF1FEDEEBD06C24940	Sushino En, 2 White Church Lane	E1 7QR	0	\N	White Church Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	0106000020E61000000100000001030000000100000009000000A26991457413B2BF9EC53B4141C24940F70ED258D811B2BFB0E34D8C40C24940EA27BABA5310B2BFB6DACDA13FC24940CDF93885B619B2BFCC8A4F1E3EC24940BCDAC000571DB2BFEBE778C33FC24940132D5797231DB2BFC85D017640C24940AFECDE802E17B2BF2DDD354441C24940B068AC1B9416B2BFDBC916D540C24940A26991457413B2BF9EC53B4141C24940	Bengal Cuisine, 12 Brick Lane	E1 6PU	0	\N	Brick Lane	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	0106000020E6100000010000000103000000010000000800000047FFF854B619B2BF6599481E3EC24940C5BF09525010B2BF2653D59F3FC24940A46CDCE4F80FB2BF793965B03FC24940785EBB4A790EB2BF335057EB3EC249403E2321612A11B2BFE267CD683EC24940F09688973210B2BF040384E93DC249402C31B00BDB16B2BFD6CBA0A63CC2494047FFF854B619B2BF6599481E3EC24940	William Hill, 10 Brick Lane	E1 6PU	0	\N	Brick Lane	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	0106000020E61000000100000001030000000100000007000000DF3770DBDA16B2BF6EDA99A63CC24940610CFE9C3A10B2BF92EEEEE73DC24940EB748E76430FB2BFE35EAB583DC2494064805778370CB2BFD5989CDB3DC24940006C54E7950AB2BF6D43D5033DC249407FD93909C213B2BF805C1A3E3BC24940DF3770DBDA16B2BF6EDA99A63CC24940	Travel Link, 6 Brick Lane	E1 6PU	0	\N	Brick Lane	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	0106000020E6100000010000000103000000010000000700000036E1F9D8C113B2BF106B133E3BC249409E9328CA0D0BB2BF1C9E9AEC3CC24940BE7D88667009B2BF4079DD293CC24940D9982A5FFD0BB2BFFF87FAA23BC24940730F5279F20AB2BF2F823F253BC24940CA634AB0ED10B2BF8766F0E839C2494036E1F9D8C113B2BF106B133E3BC24940	S Karir and Sons Ltd, 2 Brick Lane	E1 6PU	0	\N	Brick Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	0106000020E61000000100000001030000000100000008000000486C0A80ED10B2BF1575E9E839C2494066091249F20AB2BFC09038253BC24940DD3336A4C708B2BF23B0CB973BC24940EBCE0F794F07B2BF82E496E63AC2494030A77F567209B2BF78269F753AC24940958B390C7608B2BF48B6C5FE39C24940DF026AD0A20EB2BFDC303AB838C24940486C0A80ED10B2BF1575E9E839C24940	S Karir and Sons Ltd, 2 Brick Lane	E1 6PU	0	\N	Brick Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
176	0106000020E610000001000000010300000001000000080000005F0C2AA0A20EB2BF683F33B838C249405086F9DB7508B2BFD7C4BEFE39C24940E4B4DDF9D506B2BF562D1D5139C2494041D244B1E902B2BF8A15A6C239C2494038D4395E3701B2BFB6CAC84C38C249409E343132B109B2BF96D67B5737C24940B7DE03C1C30BB2BF6B24836B37C249405F0C2AA0A20EB2BF683F33B838C24940	S Karir and Sons Ltd, 2 Brick Lane	E1 6PU	0	\N	Brick Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	0106000020E610000001000000010300000001000000080000006F0F138DC6FBB1BF71D8BEDC38C2494099EBB606DDFDB1BF8457FDAB3AC2494051AB3B0BDDFDB1BF113909AC3AC24940E9CE528F4FFCB1BF65B8F8D83AC24940F89E140BC8FCB1BFE4F1AE403BC24940D3D10C377BF9B1BF8BE030A03BC24940D365B27ADCF6B1BFAC4ED25E39C249406F0F138DC6FBB1BF71D8BEDC38C24940	Pubali Exchange Company UK Limited, 3 Old Montague Street	E1 6TE	0	\N	Old Montague Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	0106000020E61000000100000001030000000100000005000000CCB8DB4361F7B1BF276A07493DC24940329C06C8F9EEB1BFA9CA1E1B3EC249403476774E52EBB1BF8A9335B33AC249400778F8C1ABF3B1BFFD270BD439C24940CCB8DB4361F7B1BF276A07493DC24940	Open House Estates, 5 Old Montague Street	E1 6TE	0	\N	Old Montague Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	0106000020E610000001000000010300000001000000060000002237C765B2F5B1BF78BB0E733DC24940C359BD873EFDB1BF9A24F5F144C24940BF4093E89BF4B1BFD7898FCA45C2494077F63E3615EDB1BF5B24344F3EC249404E9C06C8F9EEB1BFA7CA1E1B3EC249402237C765B2F5B1BF78BB0E733DC24940	Open House Estates, 5 Old Montague Street	E1 6TE	0	\N	Old Montague Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	0106000020E61000000100000001030000000100000005000000F5FD64E4100CB2BFFC68077942C24940DA327D4E9800B2BFCBBD55A043C24940DC61A2534FFEB1BFDD65BB1941C249409ADCBE679B09B2BFBA654C0140C24940F5FD64E4100CB2BFFC68077942C24940	Moonlight, 8 Brick Lane	E1 6PU	0	\N	Brick Lane	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	0106000020E610000001000000010300000001000000080000005FF6654BF2BEB1BF4EAF063908C24940A0C3DD4376C6B1BF1FEDEEBD06C24940BD3375B9D4C8B1BFC11284C407C2494046651754FBC6B1BFC118CE4408C24940B2A3DE9293CDB1BF3C04C3F20AC24940A5BB66AD21CBB1BF43EB2EA40BC24940D7B02E2F2FC8B1BF5001E7B30BC249405FF6654BF2BEB1BF4EAF063908C24940	Sushino En, 2 White Church Lane	E1 7QR	0	\N	White Church Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	0106000020E61000000100000001030000000100000007000000CF1C816BFEE3B1BFE2E94FFE02C2494026530AD90EDFB1BF7F6828A103C24940A450A42005DBB1BF6511863504C24940672E955D07D6B1BFD69C790205C24940A38AD042F4D3B1BFA60F638C03C24940D77EB762E8E1B1BF2C92D6D701C24940CF1C816BFEE3B1BFE2E94FFE02C24940	London Metropolitan University	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
183	0106000020E610000001000000010300000001000000060000001FCA8E758282B1BF53C20E8EECC149401EBF4A89C983B1BF2C35AF49EFC14940D5598105CA83B1BFBD1DB849EFC14940BF6DD1CB9380B1BFA363BED9EFC1494043B98EBDDC7BB1BF89020B80ECC149401FCA8E758282B1BF53C20E8EECC14940	Fresh, 29 Commercial Road	E1 7QL	0	\N	Commercial Road	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
184	0106000020E61000000100000001030000000100000009000000D489204F628EB1BF1C2C906EEDC149408BCCF67A4695B1BFCB93CF33F1C14940959356794D88B1BFC7AA81D9F2C1494041E4BF192186B1BFC3A67344F1C14940F21300007F8BB1BF01007370F0C14940D666F764D289B1BF5882EA8EEFC14940D7D558FBC584B1BFE8AC6769F0C14940E4F56ACFE482B1BF8720CF71EFC14940D489204F628EB1BF1C2C906EEDC14940	Fresh, 29 Commercial Road	E1 7QL	0	\N	Commercial Road	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	0106000020E6100000010000000103000000010000000700000081A019803ECFB1BFCCD0794644C24940173803A507D2B1BFECC7891347C249407AD434B607D2B1BFA0AB931347C249402D63E69DF9CDB1BF9D3F557747C2494027135CE058CBB1BFC9C948A844C24940560CFB3EBCCEB1BFD9043F5344C2494081A019803ECFB1BFCCD0794644C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	0106000020E610000001000000010300000001000000060000007423A6C886BBB1BFFD66F68B46C249404BF290035CBEB1BF7371524549C2494030CCA0055CBEB1BFC51F5E4549C2494013564F9CE0BAB1BF470564A149C249404ACAF661F0B7B1BF1AD8BDE546C249407423A6C886BBB1BFFD66F68B46C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	0106000020E610000001000000010300000001000000060000006F1D573056ADB1BF021CA02A48C2494069C7D3F95EB0B1BF6638A9E24AC2494015309C055FB0B1BF3CC7B3E24AC2494012E73C4A1DADB1BFC5C631374BC249400CF2D26C43AAB1BFFE945B7A48C249406F1D573056ADB1BF021CA02A48C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	0106000020E6100000010000000103000000010000000700000034AB24F9159EB1BFBCFD7FBA49C249407D8ECB8F80A1B1BF80C6765C4CC24940D03A349D80A1B1BFBA1B815C4CC24940AEE36547E99DB1BFA525C8C84CC24940B6F1F23DE99DB1BF1D81BDC84CC2494022AF470ABA9AB1BFF6660D224AC2494034AB24F9159EB1BFBCFD7FBA49C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	0106000020E610000001000000010300000001000000050000001E3CA744D6A6B1BF4DE676CF58C24940F3D1F22F7E9EB1BF2CDC52BC59C24940B9EB82F43C9DB1BF126C2A6258C24940C345BF0895A5B1BF6F7C4E7557C249401E3CA744D6A6B1BF4DE676CF58C24940	Zara's Corner	E1 5JJ	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	0106000020E61000000100000001030000000100000005000000F3D1F22F7E9EB1BF2CDC52BC59C249401E3CA744D6A6B1BF4DE676CF58C24940F49B8CA7C6A7B1BF6A7780D259C2494069AD3EDE839FB1BFA0384FD65AC24940F3D1F22F7E9EB1BF2CDC52BC59C24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	0106000020E61000000100000001030000000100000005000000C345BF0895A5B1BF6F7C4E7557C24940B9EB82F43C9DB1BF126C2A6258C249407ED91DCB079CB1BFD5CB031557C249400539E6DE5FA4B1BFB8E1272856C24940C345BF0895A5B1BF6F7C4E7557C24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	0106000020E610000001000000010300000001000000050000000539E6DE5FA4B1BFB8E1272856C249407ED91DCB079CB1BFD5CB031557C2494083E4B5D0D19AB1BFDDF0FBC655C24940122414E429A3B1BF421720DA54C249400539E6DE5FA4B1BFB8E1272856C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
193	0106000020E61000000100000001030000000100000005000000122414E429A3B1BF421720DA54C2494083E4B5D0D19AB1BFDDF0FBC655C2494098C9682EA099B1BFC57BA27D54C249403D395A41F8A1B1BFEDADC69053C24940122414E429A3B1BF421720DA54C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
194	0106000020E610000001000000010300000001000000050000003D395A41F8A1B1BFEDADC69053C2494098C9682EA099B1BFC57BA27D54C24940E598EDCF5D98B1BF0A6B402253C249408DAD6CE2B5A0B1BF0EAA643552C249403D395A41F8A1B1BFEDADC69053C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	0106000020E610000001000000010300000001000000050000008DAD6CE2B5A0B1BF0EAA643552C24940E598EDCF5D98B1BF0A6B402253C2494078DA50D74C97B1BF9941D40752C24940A9A702A7A69FB1BFC7E71D1151C249408DAD6CE2B5A0B1BF0EAA643552C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	0106000020E61000000100000001030000000100000005000000B7B73E7EC493B1BFFA6028E554C24940E4B4D2245F91B1BFEBC35AAE52C24940C057F9F40795B1BF89B8555352C24940C562B0F44597B1BF2240399254C24940B7B73E7EC493B1BFFA6028E554C24940	17 Casson Street	E1	0	\N	Casson Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	0106000020E61000000100000001030000000100000005000000E4B4D2245F91B1BFEBC35AAE52C24940B7B73E7EC493B1BFFA6028E554C24940230B21CF8990B1BFD71B8D3155C249407B6BF543538EB1BF976C20FA52C24940E4B4D2245F91B1BFEBC35AAE52C24940	17 Casson Street	E1	0	\N	Casson Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	0106000020E610000001000000010300000001000000070000003A92E93635A2B1BF64B64B215DC249406458414D35A2B1BF05BB3E215DC24940CE6AABA59AA9B1BFB7C0446F5CC249405602EDA3D2AAB1BFB2F61CD25DC2494066E842E66FA3B1BF4CBCDD865EC24940FF8C827D35A2B1BF21AC45215DC249403A92E93635A2B1BF64B64B215DC24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	0106000020E6100000010000000103000000010000000500000066E842E66FA3B1BF4CBCDD865EC249405602EDA3D2AAB1BFB2F61CD25DC24940C3D2F57507ACB1BF786559315FC24940DBFB8A8FC2A4B1BF99150B0860C2494066E842E66FA3B1BF4CBCDD865EC24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	0106000020E61000000100000001030000000100000007000000A15BAE385C9EB1BFDD6330B95BC2494052F6ADAACD9FB1BFC9B2EA555DC24940739B641BCE9FB1BF140EE1555DC249400D2C4345CE9FB1BF547EE8555DC249401329EEAE0397B1BF0FE075165EC2494094BC0F4F9895B1BFBFBD2B795CC24940A15BAE385C9EB1BFDD6330B95BC24940	Zara's Corner	E1 5JJ	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
201	0106000020E61000000100000001030000000100000005000000BDDFB48BE39DB1BFE42E73C660C24940D2762184829BB1BF18CE95B55EC24940C261FBC9DD9FB1BF28A1F3485EC2494018498A59E4A1B1BFCD6EFE4E60C24940BDDFB48BE39DB1BFE42E73C660C24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	0106000020E61000000100000001030000000100000005000000D2762184829BB1BF18CE95B55EC24940BDDFB48BE39DB1BFE42E73C660C249404B051C850C9AB1BFE03E093961C2494064891AE0E297B1BF2B3BF10F5FC24940D2762184829BB1BF18CE95B55EC24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	0106000020E610000001000000010300000001000000050000004743DEB56293B1BF1D5B2BF961C249402E0967B04990B1BFFCDCB1835EC249409BCAA68E9393B1BFE98DA12F5EC249402F5D5A86A496B1BFE5AF269661C249404743DEB56293B1BF1D5B2BF961C24940	25 Casson Street	E1	0	\N	Casson Street	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
204	0106000020E6100000010000000103000000010000000500000011A90F9C5791B1BF21B457B85FC24940B843DEB56293B1BF1D5B2BF961C249405FDF70258F8FB1BFA9B20B6862C249400C1E127DAB8DB1BF9013921160C2494011A90F9C5791B1BF21B457B85FC24940	27 Casson Street	E1	0	\N	Casson Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	0106000020E6100000010000000103000000010000000500000017E42B99A18CB1BF85B7BB5261C249409AABB3414D85B1BF3014851862C2494057CABA662584B1BF0A5A19A960C24940A2F84FA6568BB1BFCCF395E65FC2494017E42B99A18CB1BF85B7BB5261C24940	27 Casson Street	E1	0	\N	Casson Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
206	0106000020E610000001000000010300000001000000050000009AABB3414D85B1BF3014851862C2494033693025148CB1BFB4C6425C61C249400FCFEF3C338DB1BFE2DF05A462C249407F961A696686B1BF6ADAAE7563C249409AABB3414D85B1BF3014851862C24940	27 Casson Street	E1	0	\N	Casson Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	0106000020E61000000100000001030000000100000007000000D2DD010FF489B1BF6EA36E1E60C2494057CABA662584B1BF0A5A19A960C24940520405BCEE82B1BFC0B048275FC249404FC736759E88B1BFD873BEA65EC249407BBC7CAF9E88B1BFFD9BC4A65EC24940CD2A78A59E88B1BFF264C5A65EC24940D2DD010FF489B1BF6EA36E1E60C24940	25 Casson Street	E1	0	\N	Casson Street	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	0106000020E610000001000000010300000001000000070000007BBC7CAF9E88B1BFFD9BC4A65EC249404FC736759E88B1BFD873BEA65EC24940520405BCEE82B1BFC0B048275FC249408AE3E3EFD781B1BFC61D0CCD5DC2494063566FC4D18AB1BF3E6EEB0A5DC24940FE07D25EC58BB1BF9FFBAB585EC249407BBC7CAF9E88B1BFFD9BC4A65EC24940	23 Casson Street	E1	0	\N	Casson Street	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	0106000020E610000001000000010300000001000000050000004C596FC4D18AB1BF3E6EEB0A5DC2494049DFE3EFD781B1BFC61D0CCD5DC2494025DF8CEC7780B1BF3979E2175CC249402F57F70A7189B1BFA783255E5BC249404C596FC4D18AB1BF3E6EEB0A5DC24940	21 Casson Street	E1	0	\N	Casson Street	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	0106000020E6100000010000000103000000010000000500000015ECB2001288B1BF54CE0B6C5BC2494025DF8CEC7780B1BF3979E2175CC249409A33187D737FB1BF87A273D45AC24940619406910D87B1BF10FC9C285AC2494015ECB2001288B1BF54CE0B6C5BC24940	19 Casson Street	E1	0	\N	Casson Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	0106000020E610000001000000010300000001000000050000006B1D42581D88B1BFD44045095AC249409A33187D737FB1BF87A273D45AC249407751758B4D7EB1BF5B9C676759C24940F12F3EF01187B1BF31C5A3A058C249406B1D42581D88B1BFD44045095AC24940	17 Casson Street	E1	0	\N	Casson Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	0106000020E61000000100000001030000000100000006000000FED038893A7DB1BF5A8ADF1158C24940085DE4BBD684B1BF85ACE06857C249408D1324DFD684B1BF9550D76857C24940612A219FE785B1BF4EF690BB58C249407751758B4D7EB1BF5B9C676759C24940FED038893A7DB1BF5A8ADF1158C24940	15 Casson Street	E1	0	\N	Casson Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	0106000020E610000001000000010300000001000000070000004586B7EB87ECB1BF6BF9040953C249403DA4258486EFB1BF786541BC55C249404D2B954486EFB1BF552F52BC55C24940925E5B437EEBB1BF6290991A56C24940530EED227EEBB1BFDAA1911A56C24940A2289F37D9E8B1BFEA52386453C249404586B7EB87ECB1BF6BF9040953C24940	Novem House, 9 Chicksand Street	E1	0	\N	Chicksand Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	0106000020E61000000100000001030000000100000007000000F6578999D2F5B1BF7A7BC9BF4BC249401ABB751124FFB1BF2EE02AC74AC249403DD4783924FFB1BF8E4629C74AC249403264C5923400B2BF1D8B5EDE4BC24940A1A0877D3400B2BF066273DE4BC2494035918372D0F6B1BF4E9207C44CC24940F6578999D2F5B1BF7A7BC9BF4BC24940	Bengal Cuisine, 12 Brick Lane	E1 6PU	0	\N	Brick Lane	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	0106000020E61000000100000001030000000100000005000000DD23A9E9EE0FB2BF24539EE451C249407FA37B7F52F8B1BF3D2BAD0D54C24940D8DECB66D5F5B1BF910E8B8D51C249406B058773540DB2BF72AAFD464FC24940DD23A9E9EE0FB2BF24539EE451C24940	Vibeca Apartments, 7 Chicksand Street	E1	0	\N	Chicksand Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	0106000020E61000000100000001030000000100000005000000D794889AB51CB2BF6FDEC8414FC249407A0DF381E110B2BF75EBCD5050C24940957D688D800EB2BF49AFAFED4DC24940EFAEC51A401AB2BF37060ECA4CC24940D794889AB51CB2BF6FDEC8414FC24940	Best One, 20 Brick Lane	E1 6PU	0	\N	Brick Lane	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	0106000020E610000001000000010300000001000000050000007FBC7CAF7028B2BF2881783152C24940B901220F5620B2BF4CF8F2F852C249409F467A26DB1CB2BF0D52A0674FC24940766DEB0AE224B2BFEA95E8A64EC249407FBC7CAF7028B2BF2881783152C24940	Modern Saree Centre, 28 Brick Lane	E1 6PU	0	\N	Brick Lane	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	0106000020E6100000010000000103000000010000000A000000821088DB4626B2BFDA27710A50C249400350A5FC5132B2BF591785F14EC24940C260ED195232B2BF0CCA78F14EC249406E817B921234B2BF3B61C5B450C2494044F26DBAC730B2BF6C57B9F950C249403D7B44FC2A31B2BFE881864E51C24940AB521653522BB2BFAF3571E251C2494059259282FF2AB2BF94231E8D51C2494048E534D00828B2BFAD150ACA51C24940821088DB4626B2BFDA27710A50C24940	Modern Saree Centre, 28 Brick Lane	E1 6PU	0	\N	Brick Lane	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	0106000020E6100000010000000103000000010000000600000031FC72DEAD22B2BF2D2402654CC24940D0B3650DAB2DB2BFC35117534BC2494093669F31AB2DB2BFC5D211534BC249407AD65471612FB2BFF6FDB20D4DC249401DF3A7D76124B2BF4FD637284EC2494031FC72DEAD22B2BF2D2402654CC24940	Z Butt Textiles, 24 Brick Lane	E1 6PU	0	\N	Brick Lane	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	0106000020E6100000010000000103000000010000000600000099B50B47D71BB2BF8F0D32E246C2494005E8A54B4A27B2BFE1C97CD145C24940893D60764A27B2BF3FCE7DD145C2494017A584F00329B2BF56B4C79E47C2494068FF2847C91DB2BF7DB839B548C2494099B50B47D71BB2BF8F0D32E246C24940	PBL Exchange (UK	E1 6PU	0	\N	Brick Lane	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	0106000020E6100000010000000103000000010000000500000053BB7B69261DB2BF5842FA2F48C249401A4AAC5A6D15B2BF9A0D48FC48C249406518DB29B611B2BFCB6BA06A45C249400F191DFE7219B2BF2E23F3A144C2494053BB7B69261DB2BF5842FA2F48C24940	PBL Exchange (UK	E1 6PU	0	\N	Brick Lane	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	0106000020E610000001000000010300000001000000070000007F409D06A74CB1BF03E5271DF1C14940E25363F5A33AB1BFDF8361FDF1C1494071614D3AFA39B1BFDB2949BDF0C1494005136667D446B1BF40C70A12F0C14940578600E1BD46B1BF2838418CEEC14940A8C5C2D6424BB1BFC3B5DBA2EEC149407F409D06A74CB1BF03E5271DF1C14940	Morrison Buildings North, 35a Commercial Road	E1 1LB	0	\N	Commercial Road	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
256	0106000020E6100000010000000103000000010000000700000057FA0D3BE6A4B1BFA92415F64BC249400652692DE6A4B1BF37A10AF64BC24940DC4D210379A1B1BFCF85175249C24940774BBE207AA4B1BF16C479F548C24940F965171FDDA7B1BF4B55A79C4BC249402175CE2CDDA7B1BFC013B29C4BC2494057FA0D3BE6A4B1BFA92415F64BC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
257	0106000020E610000001000000010300000001000000060000002175CE2CDDA7B1BFC013B29C4BC24940F965171FDDA7B1BF4B55A79C4BC24940774BBE207AA4B1BF16C479F548C24940B9FDF35859A7B1BF3EEFF09C48C24940BEB58757A7AAB1BFA51A95484BC249402175CE2CDDA7B1BFC013B29C4BC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	0106000020E61000000100000001030000000100000017000000B1274C7CAAD4B1BFEA0EA17059C24940A646206EC8D0B1BF3C3E06DB59C24940ED431A3E76D0B1BFF39EE8A059C249400AA24968A6C5B1BF8434C3795AC24940C78F669317C6B1BF948588F85AC24940BF7C1D7D19C4B1BF33787C165BC2494023DED68EB8C3B1BF9C9DC2975AC24940C139108588B9B1BF966C2D845BC249400DD85AA47BB8B1BFC71D29825BC24940BD21DE8302B7B1BF47C6E65B5BC24940721F809460B6B1BF6A84EB055BC249400F720CD0DAB1B1BF2D787D2A56C24940A54A7B79E0B0B1BFA1478D3E56C249402900C0C479B0B1BF2BF2BF9555C249403AA7EBB85DB1B1BF30689F8755C24940958371017CAEB1BF4794A0FF51C24940B6FF12B584ADB1BFD872D00552C24940389F33B999ACB1BFAAEB5BFA50C2494045219B30E9B5B1BFC85F081850C24940940D69596EBCB1BFBD5A04D857C2494007F1D91470BEB1BF644D092958C24940988AA9308ED1B1BF55BE5E9056C24940B1274C7CAAD4B1BFEA0EA17059C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	0106000020E610000001000000010300000001000000050000002F27C9A66B9BB1BFD6538D642BC249408A775C753396B1BFDEEEDC912CC24940F20B1E2A4E94B1BF4283ACC02BC24940516323018499B1BFB0DD96922AC249402F27C9A66B9BB1BFD6538D642BC24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	0106000020E61000000100000001030000000100000005000000DB9CF89D7610B2BF4CC1D3164BC24940307EC274B207B2BF856CE5F34BC249407EE4C3C96305B2BF456FB89C49C24940BB23EFE12E0EB2BFD65EE6C348C24940DB9CF89D7610B2BF4CC1D3164BC24940	Bengal Cuisine, 12 Brick Lane	E1 6PU	0	\N	Brick Lane	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	0106000020E610000001000000010300000001000000050000003DE0F0C0837DB1BFAF7B7BA434C249403CFACCF6E175B1BF7BB4482B34C24940BE938F363A77B1BF54B9D53D32C2494026CF859FAE7EB1BF8AA59EB432C249403DE0F0C0837DB1BFAF7B7BA434C24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	0106000020E6100000010000000103000000010000000500000060B94C0EF894B1BF0D6D0C5436C24940B5E331FF848AB1BFC4F9EDAD35C24940894D0DBFE28BB1BF2990449133C24940556B68614096B1BF07EE223034C2494060B94C0EF894B1BF0D6D0C5436C24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	0106000020E61000000100000001030000000100000007000000C260ED195232B2BF0CCA78F14EC249400350A5FC5132B2BF591785F14EC24940507F80FA5F26B2BF6EFBA21F50C2494098F8A7D76124B2BF4BD637284EC249406ADDC4392F30B2BF4EE0B7F84CC2494071DB52675C30B2BFD9379CF84CC24940C260ED195232B2BF0CCA78F14EC24940	Modern Saree Centre, 28 Brick Lane	E1 6PU	0	\N	Brick Lane	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	0106000020E61000000100000001030000000100000007000000553548ECD820B2BF2A7EAC7F4AC24940370EAA53D92BB2BF93AEB57C49C2494091A62A79D92BB2BFC59BB17C49C2494093669F31AB2DB2BFC5D211534BC24940D0B3650DAB2DB2BFC35117534BC2494031FC72DEAD22B2BF2D2402654CC24940553548ECD820B2BF2A7EAC7F4AC24940	Sangeeta, 22 Brick Lane	E1 6PU	0	\N	Brick Lane	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	0106000020E6100000010000000103000000010000000600000091A62A79D92BB2BFC59BB17C49C24940370EAA53D92BB2BF93AEB57C49C24940553548ECD820B2BF2A7EAC7F4AC24940E5E10B7B021FB2BF7363CA9848C249404CCEA75AEA29B2BFD31BA08847C2494091A62A79D92BB2BFC59BB17C49C24940	IFIC Money Transfer (UK	E1 6PU	0	\N	Brick Lane	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	0106000020E6100000010000000103000000010000000A000000893D60764A27B2BF3FCE7DD145C2494005E8A54B4A27B2BFE1C97CD145C2494099B50B47D71BB2BF8F0D32E246C249404A753DB6CC19B2BF2DC920F844C24940BEC61E11321CB2BFC7F9A1B544C24940857EB3DCFA1BB2BFE306256644C24940FF40329A2722B2BF6B0150DB43C249401921DB8B7122B2BFAFD9AC2B44C24940605EBD297025B2BF9058E8E143C24940893D60764A27B2BF3FCE7DD145C24940	PBL Exchange (UK	E1 6PU	0	\N	Brick Lane	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	0106000020E61000000100000001030000000100000007000000CB67ACDDB8F2B1BF67AD0E9248C249401ED843C211FCB1BF3EF70DA147C24940109221E811FCB1BFED260AA147C24940BAB1745E3AFDB1BF9CEAF7D048C24940F14899383AFDB1BFB2BAFBD048C24940D41A2153E1F3B1BF930DFCC149C24940CB67ACDDB8F2B1BF67AD0E9248C24940	Open House Estates, 5 Old Montague Street	E1 6TE	0	\N	Old Montague Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	0106000020E61000000100000001030000000100000006000000109221E811FCB1BFED260AA147C249401ED843C211FCB1BF3EF70DA147C24940CB67ACDDB8F2B1BF67AD0E9248C249402FEC7C0889F1B1BF1E04925A47C2494018697E74EEFAB1BF4F613F7646C24940109221E811FCB1BFED260AA147C24940	Open House Estates, 5 Old Montague Street	E1 6TE	0	\N	Old Montague Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	0106000020E61000000100000001030000000100000007000000D41A2153E1F3B1BF930DFCC149C24940F14899383AFDB1BFB2BAFBD048C24940BAB1745E3AFDB1BF9CEAF7D048C2494033BF20F01EFEB1BF80494BBB49C24940F56513CA1EFEB1BFC6404FBB49C249404491DD52CDF4B1BFB8CAEDB34AC24940D41A2153E1F3B1BF930DFCC149C24940	Open House Estates, 5 Old Montague Street	E1 6TE	0	\N	Old Montague Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	0106000020E610000001000000010300000001000000070000003DD4783924FFB1BF8E4629C74AC249401ABB751124FFB1BF2EE02AC74AC24940F6578999D2F5B1BF7A7BC9BF4BC249404491DD52CDF4B1BFB8CAEDB34AC24940F56513CA1EFEB1BFC6404FBB49C2494033BF20F01EFEB1BF80494BBB49C249403DD4783924FFB1BF8E4629C74AC24940	Bengal Cuisine, 12 Brick Lane	E1 6PU	0	\N	Brick Lane	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	0106000020E6100000010000000103000000010000000600000035918372D0F6B1BF4E9207C44CC24940A1A0877D3400B2BF066273DE4BC249403264C5923400B2BF1D8B5EDE4BC24940F3A1DD002401B2BFF45CD4D34CC249407D981FF7C5F7B1BFE092BBBF4DC2494035918372D0F6B1BF4E9207C44CC24940	Kiran Apartments, 7A Chicksand Street	E1	0	\N	Chicksand Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	0106000020E61000000100000001030000000100000007000000F927942E36F0B1BF4994DCAD52C2494070784DBA39F3B1BF8DBBB86555C249401100E1C639F3B1BF65E6C26555C249404D2B954486EFB1BF552F52BC55C249403DA4258486EFB1BF786541BC55C249404586B7EB87ECB1BF6BF9040953C24940F927942E36F0B1BF4994DCAD52C24940	Novem House, 9 Chicksand Street	E1	0	\N	Chicksand Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	0106000020E61000000100000001030000000100000007000000A2289F37D9E8B1BFEA52386453C24940530EED227EEBB1BFDAA1911A56C24940925E5B437EEBB1BF6290991A56C24940D10CFF03FCE7B1BFCBC6A86C56C2494036835614FCE7B1BF07669C6C56C24940D59ABA3247E5B1BFE743A5BC53C24940A2289F37D9E8B1BFEA52386453C24940	Hudson Building, 11 Chicksand Street	E1	0	\N	Chicksand Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	0106000020E61000000100000001030000000100000007000000D59ABA3247E5B1BFE743A5BC53C2494036835614FCE7B1BF07669C6C56C24940D10CFF03FCE7B1BFCBC6A86C56C24940BBFDB8BA96E4B1BFCAAC12BC56C24940DDF9C78D96E4B1BF81D80BBC56C24940DE2E8627DDE1B1BF8229341154C24940D59ABA3247E5B1BFE743A5BC53C24940	Hudson Building, 11 Chicksand Street	E1	0	\N	Chicksand Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	0106000020E61000000100000001030000000100000007000000DE2E8627DDE1B1BF8229341154C24940DDF9C78D96E4B1BF81D80BBC56C24940BBFDB8BA96E4B1BFCAAC12BC56C249402F4F6DAF7EE1B1BF041F6E0457C2494098B641B77EE1B1BF1260620457C249401379C2BCA0DEB1BFF20C596154C24940DE2E8627DDE1B1BF8229341154C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	0106000020E610000001000000010300000001000000070000001379C2BCA0DEB1BFF20C596154C2494098B641B77EE1B1BF1260620457C249402F4F6DAF7EE1B1BF041F6E0457C24940CD6C52E359DEB1BFF4D2F34D57C24940762C77BB59DEB1BFBB49EC4D57C2494029F1FBF4BCDBB1BFD1BAEAA854C249401379C2BCA0DEB1BFF20C596154C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	0106000020E6100000010000000103000000010000000600000029F1FBF4BCDBB1BFD1BAEAA854C24940762C77BB59DEB1BFBB49EC4D57C24940CD6C52E359DEB1BFF4D2F34D57C24940C0D127838ADBB1BFE8C7AB8F57C2494035F8194DEDD8B1BFF2FE89EE54C2494029F1FBF4BCDBB1BFD1BAEAA854C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	0106000020E610000001000000010300000001000000060000001100E1C639F3B1BF65E6C26555C2494070784DBA39F3B1BF8DBBB86555C24940F927942E36F0B1BF4994DCAD52C249406043C0E41FF4B1BFFFCFF34C52C249403459AF4FDFF6B1BFD26F7A1055C249401100E1C639F3B1BF65E6C26555C24940	Novem House, 9 Chicksand Street	E1	0	\N	Chicksand Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
244	0106000020E610000001000000010300000001000000090000000D2C4345CE9FB1BF547EE8555DC24940739B641BCE9FB1BF140EE1555DC2494052F6ADAACD9FB1BFC9B2EA555DC24940A15BAE385C9EB1BFDD6330B95BC24940337C31603CA8B1BF356DE3E05AC24940CE6AABA59AA9B1BFB7C0446F5CC249406458414D35A2B1BF05BB3E215DC249403A92E93635A2B1BF64B64B215DC249400D2C4345CE9FB1BF547EE8555DC24940	Zara's Corner	E1 5EN	0	\N	Spelman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	0106000020E610000001000000010300000001000000050000005087F233588CB1BF94DFFBBF62C24940B52EB8D6538CB1BFE6B95CBB62C24940243921D18C8FB1BFC28B2C6562C24940606E37168E8FB1BFD25DF06662C249405087F233588CB1BF94DFFBBF62C24940	27 Casson Street	E1	0	\N	Casson Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
246	0106000020E610000001000000010300000001000000070000008D1324DFD684B1BF9550D76857C24940085DE4BBD684B1BF85ACE06857C24940FED038893A7DB1BF5A8ADF1158C249407CC6C353317CB1BF3B1B83C856C249404127CA9AC883B1BF6030681956C249400BD638CCC883B1BFB172701956C249408D1324DFD684B1BF9550D76857C24940	13 Casson Street	E1	0	\N	Casson Street	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
247	0106000020E610000001000000010300000001000000060000000BD638CCC883B1BFB172701956C249404127CA9AC883B1BF6030681956C249407CC6C353317CB1BF3B1B83C856C24940126980901C7BB1BF8364CD7055C24940F2191B4CC582B1BF44212BD754C249400BD638CCC883B1BFB172701956C24940	11 Casson Street	E1	0	\N	Casson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
248	0106000020E6100000010000000103000000010000000700000036B9F76E2DB1B1BFAF37FBC647C24940C6A0DD8F17B4B1BFDFAB1F824AC24940EB2D3B9B17B4B1BF9A512A824AC2494015309C055FB0B1BF3CC7B3E24AC2494069C7D3F95EB0B1BF6638A9E24AC249406F1D573056ADB1BF021CA02A48C2494036B9F76E2DB1B1BFAF37FBC647C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
249	0106000020E6100000010000000103000000010000000700000043F7C2B58BB7B1BF637F91284AC2494039C4FBA98BB7B1BFAFF186284AC24940AB3BCDDD82B4B1BF491B7E7047C24940A365AD8A20B8B1BF1AC5AE1247C249409A29AD69E2BAB1BF4D7A28A149C24940D7623E6010BBB1BF9DFD4ACD49C2494043F7C2B58BB7B1BF637F91284AC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
250	0106000020E61000000100000001030000000100000007000000EB2D3B9B17B4B1BF9A512A824AC24940C6A0DD8F17B4B1BFDFAB1F824AC2494036B9F76E2DB1B1BFAF37FBC647C24940AB3BCDDD82B4B1BF491B7E7047C2494039C4FBA98BB7B1BFAFF186284AC2494043F7C2B58BB7B1BF637F91284AC24940EB2D3B9B17B4B1BF9A512A824AC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
252	0106000020E6100000010000000103000000010000000700000075E9FE5210C5B1BF1750309448C24940E7B91B4810C5B1BF23B4259448C24940ECB496864CC2B1BF28A77AE245C24940C19F1B13DDC5B1BF63AA458945C2494037A106249DC8B1BF4BA2523648C24940506253229DC8B1BF979D5E3648C2494075E9FE5210C5B1BF1750309448C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
253	0106000020E61000000100000001030000000100000006000000506253229DC8B1BF979D5E3648C2494037A106249DC8B1BF4BA2523648C24940C19F1B13DDC5B1BF63AA458945C249407EF1DA8637C9B1BFFB795A3545C24940DAFD22F7E4CBB1BF00DCABDF47C24940506253229DC8B1BF979D5E3648C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
254	0106000020E6100000010000000103000000010000000700000030CCA0055CBEB1BFC51F5E4549C249404BF290035CBEB1BF7371524549C249407423A6C886BBB1BFFD66F68B46C24940C73FF80EE2BEB1BFE1A0F63746C2494017DAA742AAC1B1BF5B4FF6ED48C24940B5218B4DAAC1B1BF65EB00EE48C2494030CCA0055CBEB1BFC51F5E4549C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
255	0106000020E61000000100000001030000000100000007000000D03A349D80A1B1BFBA1B815C4CC249407D8ECB8F80A1B1BF80C6765C4CC2494034AB24F9159EB1BFBCFD7FBA49C24940DC4D210379A1B1BFCF85175249C249400652692DE6A4B1BF37A10AF64BC2494057FA0D3BE6A4B1BFA92415F64BC24940D03A349D80A1B1BFBA1B815C4CC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
258	0106000020E6100000010000000103000000010000000700000022AF470ABA9AB1BFF6660D224AC24940B6F1F23DE99DB1BF1D81BDC84CC24940AEE36547E99DB1BFA525C8C84CC249409D373F91D59AB1BFDC938E254DC2494052C1F484D59AB1BF485884254DC24940762ECD81A897B1BFAC43A5804AC2494022AF470ABA9AB1BFF6660D224AC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	0106000020E610000001000000010300000001000000070000008BA4969B7894B1BF9A3BE5E24AC24940C510DE00A097B1BF913C45864DC24940790FEE0DA097B1BF382950864DC249408AD16F0AE393B1BFF63F07F74DC24940C4CC7EFDE293B1BF3B6DFCF64DC24940DC6E8418BE90B1BFBD41D6554BC249408BA4969B7894B1BF9A3BE5E24AC24940	11 Casson Street	E1	0	\N	Casson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	0106000020E61000000100000001030000000100000007000000790FEE0DA097B1BF382950864DC24940C510DE00A097B1BF913C45864DC249408BA4969B7894B1BF9A3BE5E24AC24940762ECD81A897B1BFAC43A5804AC2494052C1F484D59AB1BF485884254DC249409D373F91D59AB1BFDC938E254DC24940790FEE0DA097B1BF382950864DC24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	0106000020E61000000100000001030000000100000007000000DC6E8418BE90B1BFBD41D6554BC24940C4CC7EFDE293B1BF3B6DFCF64DC249408AD16F0AE393B1BFF63F07F74DC24940FFF9394B5790B1BF89E3F0614EC249405DD9533E5790B1BFF019E6614EC24940E26A6BD8348DB1BFAEADD8C24BC24940DC6E8418BE90B1BFBD41D6554BC24940	11 Casson Street	E1	0	\N	Casson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	0106000020E61000000100000001030000000100000007000000E26A6BD8348DB1BFAEADD8C24BC249405DD9533E5790B1BFF019E6614EC24940FFF9394B5790B1BF89E3F0614EC249405E4E2261818CB1BFF3C396D54EC24940DAAF214D818CB1BF7EC88CD54EC24940EE2BA1057389B1BFDC17AB364CC24940E26A6BD8348DB1BFAEADD8C24BC24940	11 Casson Street	E1	0	\N	Casson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	0106000020E61000000100000001030000000100000007000000EE2BA1057389B1BFDC17AB364CC24940DAAF214D818CB1BF7EC88CD54EC249405E4E2261818CB1BFF3C396D54EC2494064480E9BED88B1BF346C72414FC249400C79BB8DED88B1BFE18B67414FC2494097F33663BF85B1BFBE19C8A84CC24940EE2BA1057389B1BFDC17AB364CC24940	11 Casson Street	E1	0	\N	Casson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	0106000020E6100000010000000103000000010000000600000097F33663BF85B1BFBE19C8A84CC249400C79BB8DED88B1BFE18B67414FC2494064480E9BED88B1BF346C72414FC24940C63AA7CA3985B1BF322214B14FC249401152D4100782B1BF7A9B751B4DC2494097F33663BF85B1BFBE19C8A84CC24940	11 Casson Street	E1	0	\N	Casson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	0106000020E610000001000000010300000001000000060000000A347307AED5B1BFB510CBB946C2494053451FFCADD5B1BFDBE5C0B946C2494026AD01B395D2B1BFF283A1F243C2494080F2AFAA6ED6B1BFF8BD309243C249400B835A2760D9B1BF13FFDF5E46C249400A347307AED5B1BFB510CBB946C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
266	0106000020E610000001000000010300000001000000060000000B835A2760D9B1BF13FFDF5E46C249400CF2AFAA6ED6B1BFF8BD309243C24940D472EC0E21DAB1BFA79A0A3C43C249404E845593C7DCB1BF856C170B46C2494053D52E9CC7DCB1BF64CC210B46C249400B835A2760D9B1BF13FFDF5E46C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	0106000020E6100000010000000103000000010000000700000053D52E9CC7DCB1BF64CC210B46C249404E845593C7DCB1BF856C170B46C249400E73EC0E21DAB1BFA59A0A3C43C249402222A56D58DDB1BFB3470CEE42C249401B8D0E080EE0B1BF27FA84BA45C24940EEA2F6100EE0B1BF516B8FBA45C2494053D52E9CC7DCB1BF64CC210B46C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	0106000020E61000000100000001030000000100000007000000EEA2F6100EE0B1BF516B8FBA45C249401B8D0E080EE0B1BF27FA84BA45C249405921A56D58DDB1BFB5470CEE42C2494097B4028976E0B1BFED474E9642C2494063A3281332E3B1BF1C0C416D45C249406C6F371D32E3B1BFC57F4B6D45C24940EEA2F6100EE0B1BF516B8FBA45C24940	Zipcar	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	0106000020E610000001000000010300000001000000060000006C6F371D32E3B1BFC57F4B6D45C2494063A3281332E3B1BF1C0C416D45C2494097B4028976E0B1BFED474E9642C2494090293A4397E3B1BF6123CD4742C249402190B6672CE6B1BFCDD00A2445C249406C6F371D32E3B1BFC57F4B6D45C24940	Zipcar	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	0106000020E610000001000000010300000001000000070000007AD434B607D2B1BFA0AB931347C24940173803A507D2B1BFECC7891347C2494081A019803ECFB1BFCCD0794644C2494026AD01B395D2B1BFF283A1F243C2494053451FFCADD5B1BFDBE5C0B946C249400A347307AED5B1BFB510CBB946C249407AD434B607D2B1BFA0AB931347C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	0106000020E61000000100000001030000000100000007000000D4AB97C2DACAB1BF51C2948940C249401901549DDACAB1BF4B95988940C24940F3802F90ABC1B1BF5DFEDD7A41C24940C68A6D3485C0B1BF8A64144D40C249402305CD5CA5C9B1BF0C11565D3FC24940AE6B1482A5C9B1BFAD3D525D3FC24940D4AB97C2DACAB1BF51C2948940C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
272	0106000020E61000000100000001030000000100000006000000AE6B1482A5C9B1BFAD3D525D3FC249402305CD5CA5C9B1BF0C11565D3FC24940C68A6D3485C0B1BF8A64144D40C2494070BA549562BFB1BFD3981F233FC24940FB3FC3F784C8B1BFE6BE2B453EC24940AE6B1482A5C9B1BFAD3D525D3FC24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	0106000020E61000000100000001030000000100000006000000C3F2F9954CA8B1BF1D60FAE042C24940D037B4724CA8B1BF2194FEE042C249402EE8BB362A9FB1BF23BE9FF743C24940B64D1C2BB19DB1BF2ACC8BD442C24940BCFDEE97E1A6B1BFE27204AC41C24940C3F2F9954CA8B1BF1D60FAE042C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	0106000020E61000000100000001030000000100000007000000F735BCB08BA9B1BF2E6695F043C24940E272578D8BA9B1BF937399F043C24940020BCC8B79A0B1BF25DF7FFA44C249402EE8BB362A9FB1BF23BE9FF743C24940D037B4724CA8B1BF2194FEE042C24940C3F2F9954CA8B1BF1D60FAE042C24940F735BCB08BA9B1BF2E6695F043C24940	Spelman House	E1	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	0106000020E61000000100000001030000000100000006000000F70ED258D811B2BFB0E34D8C40C24940A26991457413B2BF9EC53B4141C24940A2A3810CE213B2BF360D3E9041C24940957651F15F0EB2BF055BE64E42C249408CB4AE47E50CB2BF22105E3E41C24940F70ED258D811B2BFB0E34D8C40C24940	Bengal Cuisine, 12 Brick Lane	E1 6PU	0	\N	Brick Lane	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	0106000020E6100000010000000103000000010000000900000051AB3B0BDDFDB1BF113909AC3AC2494099EBB606DDFDB1BF8457FDAB3AC249406F0F138DC6FBB1BF71D8BEDC38C2494041CAF92D3701B2BF41D9C14C38C2494027C50481E902B2BF17249FC239C2494019C4B5ACE203B2BFE7331B993AC249408D286A6FE6FFB1BF8CCD710C3BC249401C5645E946FFB1BF0F8020833AC2494051AB3B0BDDFDB1BF113909AC3AC24940	S Karir and Sons Ltd, 2 Brick Lane	E1 6PU	0	\N	Brick Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
277	0106000020E61000000100000001030000000100000007000000C0882294F0BFB1BF5A47EA2123C24940DDB64F7B54BBB1BFE4F9CDF023C249405F0EBB92DEB1B1BF117C79601FC24940C49B2B3E5FAEB1BF3BC5F49B1EC249406203B2063DB2B1BF23ED46A41DC249407309DC1267B6B1BF6042E7F71EC24940C0882294F0BFB1BF5A47EA2123C24940	The Nag's Head, 17-19 Whitechapel Road	E1 7QR	0	\N	Whitechapel Road	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	0106000020E61000000100000001030000000100000005000000AA036CABF8CBB1BF957D5EFC2AC24940677D789648C8B1BF13D7D07F2BC249409AD00714FCBFB1BF266D3C3526C24940589254B4BFC3B1BFFB529B7F25C24940AA036CABF8CBB1BF957D5EFC2AC24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	0106000020E61000000100000001030000000100000005000000B18D4A14E5E5B1BFE553171F37C24940A10FBC3EBCDFB1BFA59599DB37C2494037FD624F10DFB1BFAA5D181937C24940337527C1E7E4B1BF15D74F6436C24940B18D4A14E5E5B1BFE553171F37C24940	Zipcar	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	0106000020E6100000010000000103000000010000000700000037FD624F10DFB1BFAA5D181937C2494043A3A520D0D2B1BF27F9676B2FC2494037FD624F10DFB1BFAA5D181937C24940038A90819FD9B1BF6F927ED337C24940DC8C502A7ED4B1BF124C410F34C24940733FF1C210D9B1BF6826FC7033C2494037FD624F10DFB1BFAA5D181937C24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	0106000020E610000001000000010300000001000000050000000E23C10AE6CEB1BF8553CEF92FC2494043A3A520D0D2B1BF27F9676B2FC2494018AC152407D8B1BF36A529B032C24940776313C2B8D3B1BF1C07C03B33C249400E23C10AE6CEB1BF8553CEF92FC24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	0106000020E61000000100000001030000000100000005000000EEC620DF7431B1BF89AB282444C249405EB5F5B38449B1BFFAE031DA3FC2494094215E287652B1BF95BFF4BA44C249402C9725785A3AB1BFE1D345DC48C24940EEC620DF7431B1BF89AB282444C24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	0106000020E61000000100000001030000000100000007000000CC4880B2D93AB1BF74CB6AC648C2494079C663F40750B1BF71D07D2545C2494057694FF24154B1BF2053B5BA47C24940EB5E3BB82748B1BF0763ACBE49C2494074A5A7BA284AB1BF8A8BBBE84AC24940C44759B76941B1BF548F0E654CC24940CC4880B2D93AB1BF74CB6AC648C24940	Evelyn House	E1 5NW	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
284	0106000020E610000001000000010300000001000000070000000107FE25AA5EB1BF22C239A72DC24940E083577B7F66B1BF0FA301B731C249401EBE07947F66B1BF33940BB731C2494020AC45FA282CB1BF7C34CDB83CC2494073CED010292CB1BFD372B9B83CC24940262014112424B1BF228032EA38C249400107FE25AA5EB1BF22C239A72DC24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	0106000020E610000001000000010300000001000000060000001EBE07947F66B1BF33940BB731C24940E083577B7F66B1BF0FA301B731C249400107FE25AA5EB1BF22C239A72DC249408C6E0CF6CE64B1BF258C92782CC24940EA421C58286DB1BF44E1667530C249401EBE07947F66B1BF33940BB731C24940	East London Works, 75 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	0106000020E61000000100000001030000000100000005000000F0D0363C3284B1BF79141BC73DC24940AB53FC8C957BB1BFEC8B41243FC249409BFE23CF2875B1BF5DEAE9133BC249403F05D374BE7DB1BF4A876EAB39C24940F0D0363C3284B1BF79141BC73DC24940	Black Lion House, 45 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	0106000020E61000000100000001030000000100000017000000988C354346BEB1BFFB2FEC263BC24940FDC23D4846BEB1BF31F2E0263BC24940C15FB9C1A0BAB1BFD3C5CFD938C24940F62BB91176A1B1BF4D584B8D29C249408A26CFE11CA5B1BF7B563F0A29C249408D7BE721BBA9B1BFF7252F2928C24940068E30C424ABB1BFCC42ECD628C24940DD976E29A6B1B1BF144A79C427C24940AE00FA2749AEB1BFE0EBED5426C249403524E6977EB5B1BF3093D7F624C24940C0882294F0BFB1BF5A47EA2123C24940589254B4BFC3B1BFFB529B7F25C2494031CD682090AEB1BF50E8377E29C249404FA36B9BEDB5B1BF1A43610E2EC24940AA036CABF8CBB1BF957D5EFC2AC2494043A3A520D0D2B1BF27F9676B2FC24940995F9EC75BBCB1BFA811929C32C2494036635061B8C3B1BF9F49653737C249409AFAB35464D1B1BF4E933A2935C2494085D6E57DA1D1B1BF6AE51C7F35C249405874ED2AACD5B1BF5416E71C35C24940FE01BC3538DAB1BFCA0A413C38C24940988C354346BEB1BFFB2FEC263BC24940	Green Dragon Yard	E1 6TE	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	0106000020E61000000100000001030000000100000005000000202637E848C8B1BFED96C6B006C249405D5C369928C5B1BFF7D59D7305C249402BF6E6F4E2C8B1BF371F29E004C249408C79C6429ECBB1BF88A4D22706C24940202637E848C8B1BFED96C6B006C24940	Straits Times Kopitiam	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	0106000020E6100000010000000103000000010000000500000006E28887D1D0B1BF4EB98E160AC24940B2A3DE9293CDB1BF3C04C3F20AC2494046651754FBC6B1BFC118CE4408C24940997D02F02BCAB1BF4D12237107C2494006E28887D1D0B1BF4EB98E160AC24940	Straits Times Kopitiam	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	0106000020E6100000010000000103000000010000000B000000737A2CDDF3CFB1BFBAD5A44303C249408EBEDBE9F3CFB1BF0C50964303C24940AFB83E5151CCB1BF99731B6B00C249405F4C4E600ACBB1BFF7AF1749FFC14940CECC33AE3EC6B1BFF3084CDFFFC14940827EE8707EB8B1BF52769A21F7C14940699A34EF5DC8B1BFE4F868A3F4C149402DD2021CA2D6B1BF30274564FDC149404E7142C1EED1B1BF5E24200FFEC149408610BB5BB3D7B1BFB1A39E4402C24940737A2CDDF3CFB1BFBAD5A44303C24940	London Metropolitan University	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	0106000020E61000000100000001030000000100000005000000C91DC4AF6EB5B1BF00057D77F8C1494023AADA3564B9B1BFC0E3A8B3F7C14940F3E9DB1A95BDB1BF3A9BA95AFAC149408204BECBBEB9B1BFEFFE7AFAFAC14940C91DC4AF6EB5B1BF00057D77F8C14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	0106000020E610000001000000010300000001000000070000003D2691D5F887B1BF47F79299ECC1494019733BFAAC88B1BFAA0D7A6EEEC14940C3DE154CAD88B1BFF0578A6EEEC14940D5598105CA83B1BFBD1DB849EFC149401EBF4A89C983B1BF2C35AF49EFC149401FCA8E758282B1BF53C20E8EECC149403D2691D5F887B1BF47F79299ECC14940	Fresh, 29 Commercial Road	E1 7QL	0	\N	Commercial Road	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	0106000020E61000000100000001030000000100000006000000C3DE154CAD88B1BFF0578A6EEEC1494019733BFAAC88B1BFAA0D7A6EEEC149403D2691D5F887B1BF47F79299ECC149406CEE6809F68CB1BF25B417A4ECC14940CA1E607F628EB1BF5B1E976EEDC14940C3DE154CAD88B1BFF0578A6EEEC14940	Fresh, 29 Commercial Road	E1 7QL	0	\N	Commercial Road	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	0106000020E6100000010000000103000000010000000700000048CBCAFF9C82B1BFF85459C0F7C14940CF2723CD2386B1BF5CC824CCFAC14940E1ADB5FC537FB1BF5DD66DCAFBC149406EF21329257EB1BFBE77DEDCFAC14940712882715481B1BF264CD77EFAC14940AE710D1BC87EB1BF0665624FF8C1494048CBCAFF9C82B1BFF85459C0F7C14940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
295	0106000020E61000000100000001030000000100000013000000D1E735E7997DB1BF5CCD7398F8C14940FA7F82765A7FB1BFC447E83FFAC14940B6C8265ABF76B1BFB83A9853FBC14940A13D2A419F77B1BF7C2E5C8CFCC149404A04A8D60373B1BF1A9AA532FDC149405CD94B2E8875B1BF4E2944F9FEC149403E315CDC7667B1BFC628B9B200C249403B5DC0B59764B1BFE48999AFFEC149404D25553B945DB1BFC4244594FFC149404C60AFD6BD4EB1BFD3BE83E3F4C14940CC3B9D06A74CB1BF03E5271DF1C149403ECBB301094AB1BF03DC6B61EBC14940A8C18EBDDC7BB1BF8A020B80ECC14940B69821D8E756B1BF69E31588F0C14940EE1147C1885CB1BF659B9814F5C149400AC8C720AA5DB1BF1F1D8130F6C14940C2DD457D8C69B1BF5C87D8C8F4C1494024F7450ABF70B1BFF006E631FAC14940D1E735E7997DB1BF5CCD7398F8C14940	Hult International Business School, 33 Commercial Road	E1 1LD	0	\N	Commercial Road	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
296	0106000020E610000001000000010300000001000000110000004274B1E744A1B1BF92D8F38C13C24940376552756EA2B1BF5867EC1914C249409A38DFA8C28FB1BFB356FF3519C249405F286325B68CB1BF7F78F2F817C24940DDE54EA58188B1BF81CF7E3719C24940D9EE30072B82B1BF85E83B1917C2494050102639E687B1BF83DFFF3515C249403F94A118AD86B1BF3CDF15C214C24940574176F3D88BB1BF40399C4613C24940182C366CDE8CB1BF0BC7E9A013C24940B4082ED7E188B1BFD97BBCC614C2494039DEFE78E489B1BF0BC3984215C24940DB564079CD84B1BFF5519A0517C24940095ECE3B9688B1BF8828344418C249407A07FA1E1C8DB1BFED37EEFD16C249404A16D6BD0D90B1BF9363C23A18C249404274B1E744A1B1BF92D8F38C13C24940	Altab Ali Park	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	0106000020E6100000010000000103000000010000000B000000108BCDEC648EB1BF4BAE20F305C24940FC148D51FB8FB1BF861D7B8205C2494054DEAAA49991B1BF671E162705C249401A869D3A5F93B1BF2A085E1005C24940D05190622B95B1BF5B84E43805C24940C18BDA28B696B1BFA8F75C6805C24940825A43EC1298B1BF24F65BD905C24940CF9CDB0EE298B1BFDF1F059B06C249405F0A10587198B1BFC88BBC6A07C24940C12BFAB27B97B1BF426A6BDC07C24940108BCDEC648EB1BF4BAE20F305C24940	Altab Ali Park	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	0106000020E61000000100000001030000000100000005000000E283E8864478B1BFDA45F52D10C24940D1F6AFB1B975B1BFEE24D09810C24940E5828EC0D274B1BFD35C030A10C24940B42156F64277B1BFBC6783A50FC24940E283E8864478B1BFDA45F52D10C24940	Altab Ali Park	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	0106000020E61000000100000001030000000100000005000000EA6E8E9859BAB1BF57F3E64B0CC249408EC3B006EEB9B1BF2142044B0CC24940FF6A73E1F3B9B1BF95E8CD050CC249401548D85966BAB1BF68D9A5040CC24940EA6E8E9859BAB1BF57F3E64B0CC24940	Sushino En, 2 White Church Lane	E1 7QR	0	\N	White Church Lane	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	0106000020E61000000100000001030000000100000005000000D9C77DC7F2B9B1BFE0A8E5B10CC2494060AE98004ABAB1BF4FC4B6B40CC24940A7DC499A32BAB1BF9F0CCF790DC249406072DFECE1B9B1BFAB0725790DC24940D9C77DC7F2B9B1BFE0A8E5B10CC24940	Altab Ali Park	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	0106000020E6100000010000000103000000010000000D0000003E26F9DD3557B1BFFD0B421511C24940AA397FB03557B1BFE2A63E1511C249404660D39FAC43B1BF0F96DBD214C249403630D6AF1440B1BFA54F55E612C249402B522FEE1E1EB1BF935A08E517C2494051BF07370720B1BF2E5E1C2819C24940164A92BA991BB1BFB522D3CE19C24940BFBB6D16B619B1BF1D7AD18E18C24940D0138C118717B1BFBBFB09E118C249402400C5905A12B1BF4FC9A97415C249404A17A612654BB1BFC350E2100DC249407B05F24C6C51B1BF942FC0240EC249403E26F9DD3557B1BFFD0B421511C24940	Qbic London City, 42 Adler Street	E1 1EE	0	\N	Adler Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
302	0106000020E610000001000000010300000001000000040000008928618D4AACB1BF959E18D602C24940179141794AACB1BF47C824D602C249402303E0764AACB1BFA66009D602C249408928618D4AACB1BF959E18D602C24940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	0106000020E6100000010000000103000000010000000A000000BA503875F2AAB1BF08ADB85EF3C14940138122506DAAB1BF71144D62EDC149405C424BAB0AB6B1BFF2D77385EDC149407FCEC9AD65B5B1BF39D59E8CF2C149403762C4F21CB3B1BF61AE9EEDF2C1494028D03F1E42B1B1BFB2AF927CF2C149402CA2679B51B1B1BF968ADF1FF2C14940BEDB161A08AFB1BF5BD35517F2C14940CA9E6F91A4AEB1BFA28D9FD6F2C14940BA503875F2AAB1BF08ADB85EF3C14940	London Fire Brigade Whitechapel	E1	0	\N	Manningtree Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	0106000020E61000000100000001030000000100000008000000438345688C9DB1BFC1A2D09605C249402303E0764AACB1BFA66009D602C24940179141794AACB1BF47C824D602C249408928618D4AACB1BF959E18D602C2494033723E4BD6ADB1BF990E20E203C24940D4301189709CB1BF3DBB105F07C249407468063FD399B1BF3EA3484806C24940438345688C9DB1BFC1A2D09605C24940	Naylor Building West, 1 Assam Street	E1 7QL	0	\N	Assam Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
305	0106000020E610000001000000010300000001000000060000000B5EBBFBD52CB1BF8FAFD6692CC24940DAA105DAF129B1BF3D39AB0B2DC24940C80F4903E627B1BF9AFD6B5F2CC2494069FC27276F28B1BF18C431432CC24940679B755BE72AB1BF0D22ACA42BC249400B5EBBFBD52CB1BF8FAFD6692CC24940	Whitechapel Bell Foundry, 32-34 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	0106000020E61000000100000001030000000100000006000000054872907339B1BF68ACE8D326C24940EC7DC23CB933B1BF98744D0C28C24940EE9CDE779F2FB1BF7879CE0326C24940E58BC88D6D35B1BF888610EB24C24940F74E78315939B1BF755245CB26C24940054872907339B1BF68ACE8D326C24940	Whitechapel Bell Foundry, 32-34 Whitechapel Road	E1 1DQ	0	\N	Whitechapel Road	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	0106000020E610000001000000010300000001000000090000009C8047C1C95FB1BFE5EAE65B23C24940F8DCED2E0E58B1BF2C62FAF41FC249401AEAC2B1C35CB1BFAF6A65EF1EC24940C99DFE0AAB5DB1BF06156F571FC24940D132E296BB62B1BFBFFFDB3E1EC249406AFC95856469B1BF19C3833D21C249401EB2B1616469B1BF0463823D21C2494083F32EE77069B1BFE8A1354A21C249409C8047C1C95FB1BFE5EAE65B23C24940	ecourier.co.uk	E1 1DQ	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	0106000020E6100000010000000103000000010000000D000000FEE75B7F7447B1BF9E2247C408C249408D28BAE1863CB1BFBAA8A3F409C2494092E2CF6A7D3BB1BF50B53E2209C249401E97AAF8A139B1BF7EB9D05F09C24940A6B96B97DC38B1BFA4F84E8C08C249405BA8607E3337B1BF8E62EAB208C249404FBB5429E131B1BFE4DFB0E203C249408998B8409A33B1BFABAD539E03C24940A353E4482332B1BF90A06D4B02C24940FA7AD98F473FB1BFF6170EA900C24940E2B6D52A8046B1BFAE7D6EC006C24940EBCC57AB4D45B1BFB8FE86EA06C24940FEE75B7F7447B1BF9E2247C408C24940	St Boniface German Church, 47 Adler Street	E1 1EE	0	\N	Adler Street	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
309	0106000020E61000000100000001030000000100000014000000B0C47E3A543DB1BF412685B90AC2494049B3947A9D34B1BF80905DD50BC24940907869D80A35B1BF3B5303290CC24940EC91B684CE24B1BF31896E9B0EC24940AE2955A73523B1BF8600F0C90DC249409825E298891EB1BFC68731570EC24940B050CD927612B1BF6AEE34A004C24940B7292B4EF917B1BF8DDA970704C24940FBEE370E9618B1BF73FC218B04C2494028ACF602751CB1BFEEA0C81C04C24940112F4ED30B1EB1BF6BC50A5405C24940B7C012E25E20B1BF83609C1B05C24940201A224A5F25B1BFE655392409C24940ABEAC78A262FB1BF586694F607C249407C21EFEF9A31B1BF5D13DC220AC24940A898FFA93A39B1BF66BE972C09C249403A96AAF8A139B1BF80B9D05F09C2494092E2CF6A7D3BB1BF50B53E2209C249408D28BAE1863CB1BFBAA8A3F409C24940B0C47E3A543DB1BF412685B90AC24940	Albany Court, 18 Plumbers Row	E1 1EE	0	\N	Plumbers Row	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	0106000020E61000000100000001030000000100000005000000F6FE49EEECF6B0BFD733B99103C24940102CAF12420EB1BF0747592301C24940079060D09C1FB1BFEDCEA1870FC249409A002C2DD606B1BF0D934B1A13C24940F6FE49EEECF6B0BFD733B99103C24940	Albany Court, 18 Plumbers Row	E1 1EE	0	\N	Plumbers Row	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	0106000020E6100000010000000103000000010000000E000000789E2BBFC63CB1BF0AE9B1F800C24940A353E4482332B1BF90A06D4B02C249408998B8409A33B1BFABAD539E03C249404FBB5429E131B1BFE4DFB0E203C249403A394F29B52FB1BF36A1401104C249401A4A7EB01C2DB1BF8DF9F8BA01C24940B38E37562E31B1BF951C624A01C249405D0247B0CB30B1BFD3E18FF100C2494084B2670E9233B1BF55A1C7A400C24940E1B6595CE230B1BF20099739FEC14940A15549F5D839B1BFBE079241FDC14940A1EE0FB9703CB1BF5ECD3597FFC14940271460025F3BB1BFDCA8CBB4FFC14940789E2BBFC63CB1BF0AE9B1F800C24940	Cornell Building, 1 Coke Street	E1 1LF	0	\N	Coke Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	0106000020E61000000100000001030000000100000016000000A15549F5D839B1BFBE079241FDC14940E1B6595CE230B1BF20099739FEC14940EB9B07AA3E28B1BFDD952F2FFFC14940C26FE6A4EF29B1BF2E77B2B400C249403099C700B627B1BF5A5C52F200C24940FAE7BBB71429B1BF0E93D32D02C249404655CD927612B1BF6CEE34A004C24940102CAF12420EB1BF0747592301C24940F6FE49EEECF6B0BFD733B99103C24940C780B2E63CEDB0BF0997D767FAC14940054E5EACF1EFB0BFDB9695FBF8C1494048B446910916B1BF0EFA3D72F8C14940149BCBC63D1AB1BF2B679CA9FEC14940EE11D38A1F1EB1BF39FE1E93FEC1494005A05C67111EB1BF9B6085F3FDC1494099568BA2A921B1BF435496EBFDC14940F3B96A5AB721B1BF035C7086FEC149405A892EED3E24B1BF4FD12973FEC14940FF91DB79E622B1BF3827AAFEF7C149407B3AD78B9530B1BFFE3A95C7F7C14940411E955F4533B1BFF71F9353F8C14940A15549F5D839B1BFBE079241FDC14940	Cornell Building, 1 Coke Street	E1 1LF	0	\N	Coke Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	0106000020E61000000100000001030000000100000005000000E6B99EF0F5E4B1BF4272AB7A10C24940341CD6EBF9E0B1BF2FA9E43611C24940A7C10493F2DDB1BF71E6BF280FC24940D2CCA35526E1B1BFD7CBFF660EC24940E6B99EF0F5E4B1BF4272AB7A10C24940	Audio Time UK, 75 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	0106000020E610000001000000010300000001000000060000008B37642526E1B1BFF3D9F8660EC249407F52467DA6E6B1BFBB85E75E0DC249409109647D9AEBB1BF78DEBF0710C24940EB1148B40EE6B1BF754AA81411C2494057B99EF0F5E4B1BF4272AB7A10C249408B37642526E1B1BFF3D9F8660EC24940	KVJ, 76 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	76	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
315	0106000020E61000000100000001030000000100000005000000787E244D9AEBB1BF93ECB80710C24940DDC9064DA6E6B1BFD593E05E0DC249407DAC484500EAB1BF354A87B60CC2494029F4E66CC8EEB1BF9604DF8A0FC24940787E244D9AEBB1BF93ECB80710C24940	Whitechapel Gallery Cafe	E1 7QX	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	0106000020E610000001000000010300000001000000060000001A338C279DFFB1BF4189A92209C249400F59ECFAE305B2BFA1784B4C08C2494088AF97A1B30AB2BFC59946260BC249405F13B0159404B2BF3B7298010CC24940D46B2F7F8503B2BFF98608820BC249401A338C279DFFB1BF4189A92209C24940	KFC, 84 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
317	0106000020E6100000010000000103000000010000000500000032A4C4E1B60FB2BF1387A4660AC249408AFD7357B60AB2BF2AD0B1A607C24940D25F657EEE0DB2BFD29BEC2907C24940BA2D5949DF12B2BF783A95CE09C2494032A4C4E1B60FB2BF1387A4660AC24940	Dulce, 86 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	86	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	0106000020E61000000100000001030000000100000005000000F42D5949DF12B2BF753A95CE09C24940B22E264EEE0DB2BFDAA9E52907C24940234575E00512B2BF7B0EA38F06C249407C63B758DD16B2BF754F5A1409C24940F42D5949DF12B2BF753A95CE09C24940	Cashino	E1 7QX	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	0106000020E61000000100000001030000000100000006000000E94475E00512B2BF7C0EA38F06C249402EC64DFFCB17B2BF20F83E8B05C24940573B92F4B21DB2BFAA7A119408C24940D95C19191C18B2BF26184FBB09C249407C63B758DD16B2BF764F5A1409C24940E94475E00512B2BF7C0EA38F06C24940	Alberts, 88 Gunthorpe Street	E1 7RQ	0	\N	Gunthorpe Street	88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
320	0106000020E61000000100000001030000000100000008000000FCAA0ECFCB17B2BF2706388B05C24940591AA47EFB1DB2BFE9E3324C04C249406D8474CE5223B2BF8A1F630207C24940D776542C8820B2BF73BA9D8C07C24940E2D1163C3922B2BFF8AE786B08C249402158CACAB61EB2BFD110C81909C24940901D53C4B21DB2BFB7880A9408C24940FCAA0ECFCB17B2BF2706388B05C24940	Alberts, 88 Gunthorpe Street	E1 7RQ	0	\N	Gunthorpe Street	88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
321	0106000020E61000000100000001030000000100000009000000FC75359E5223B2BF962D5C0207C24940410E654EFB1DB2BFECF12B4C04C24940A6D68EB8A821B2BFF2BDE97E03C24940B02B1BB42827B2BFB58D2B2F06C24940057A66C6392CB2BF3BAEC7E408C24940D4FCA76C992FB2BFEAB3DBC30AC24940E185B8C69D2AB2BF937D3BA30BC2494040F6BAD38B22B2BF0A04E02807C24940FC75359E5223B2BF962D5C0207C24940	Burger King, 90 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	0106000020E61000000100000001030000000100000008000000D8D34F88A821B2BFF5CBE27E03C24940BC9CD1703528B2BF93D62B1E02C24940B97E2573742BB2BFDEF211A003C249402E2D33840629B2BF49F4DD0E04C24940E237AE999130B2BF657EE51808C24940027966C6392CB2BF3DAEC7E408C24940C226DC832827B2BFBF9B242F06C24940D8D34F88A821B2BFF5CBE27E03C24940	Oi Hanoi, 91 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	0106000020E6100000010000000103000000010000000800000098A992403528B2BF91E4241E02C249401D9B94397C2AB2BF31F64DA301C24940EFD1B5E87933B2BFC834DFE905C2494097DBDAD16E34B2BFE0582B5E06C249405AFC4C1BC531B2BF49C54DEF06C249407EED92A0F52AB2BFC64D9AB603C24940AF8AE642742BB2BFDE000BA003C2494098A992403528B2BF91E4241E02C24940	Atlantis House, 92 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	92	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
324	0106000020E61000000100000001030000000100000006000000BD6971DB923BB2BF3129E3BA01C249407D5C24697036B2BF9839EF59FFC14940C59B3356163FB2BF8153DF94FDC14940C4EFBE96EE47B2BFB8E2CCC401C249405039FC1C373FB2BFAA5F949D03C24940BD6971DB923BB2BF3129E3BA01C24940	Kuddus Kamal Solicitor, 95 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
325	0106000020E6100000010000000103000000010000000900000012CDBB9C632FB2BF7D1AC6FC09C249404837D7426436B2BF5CA83DD208C24940764E55372D39B2BF9329E2720AC2494005B04DE66B3BB2BF661A2E130AC249408EC0EAD06641B2BF1956D3910DC2494081F599DFE538B2BF1F355BFC0EC249408F5142119737B2BFFF41B3380EC24940618F83DFB936B2BF3B3B895D0EC2494012CDBB9C632FB2BF7D1AC6FC09C24940	Whitechapel High Street Car Park	E1 7QX	0	\N	Whitechapel Car Park		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
326	0106000020E61000000100000001030000000100000005000000C6A0C4B24A7EB3BF2357BE8F14C24940D15991E09B7BB3BFD4DF003815C249406F7B0779AE77B3BFE15807A513C249404626908E497AB3BF028FF4FB12C24940C6A0C4B24A7EB3BF2357BE8F14C24940	Franceskka Fabrics	E1 7TD	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
327	0106000020E610000001000000010300000001000000060000004626908E497AB3BF028FF4FB12C249406A4871ED847DB3BFD6CF412A12C24940109B26D2777FB3BF28AB871813C24940039E7D871881B3BF180486E113C24940C39FC4B24A7EB3BF2357BE8F14C249404626908E497AB3BF028FF4FB12C24940	Franceskka Fabrics	E1 7TD	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
328	0106000020E61000000100000001030000000100000006000000B18840571881B3BF58127FE113C249402A9A26D2777FB3BF27AB871813C2494056E3F7104084B3BF3C0A94D311C24940972FD0300B86B3BFC4898A6A12C24940CBD7F6838F85B3BFBEDD19BC12C24940B18840571881B3BF58127FE113C24940	Elegant Textile	E1 7JF	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
329	0106000020E6100000010000000103000000010000000500000070DBBAE03F84B3BF77188DD311C24940F39A26D2777FB3BF2AAB871813C249406A4871ED847DB3BFD6CF412A12C24940117685EFE681B3BF861BF50D11C2494070DBBAE03F84B3BF77188DD311C24940	City Of Textile, 70 Middlesex Street	E1 7JF	0	\N	Middlesex Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	0106000020E61000000100000001030000000100000006000000B96D48BFE681B3BFBD29EE0D11C249409B740779AE77B3BFE35807A513C24940304FC7D19A74B3BFA358E9AE12C24940AFFC90423F78B3BF5315ACC011C24940BDDDD53D217FB3BF999FBEFA0FC24940B96D48BFE681B3BFBD29EE0D11C24940	Antique	E1 7JF	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	0106000020E61000000100000001030000000100000007000000BE334712CC71B3BFB1A326C00EC249403B54311FCC71B3BF1CF212C00EC24940A1345CE0BA77B3BFCA4E005A0DC24940752F8D97FA79B3BFEB4E74260EC24940128998BFD370B3BFB216B08710C24940E0B3ECE1E96EB3BF14390C5A0FC24940BE334712CC71B3BFB1A326C00EC24940	Flying Burrito, 62 Middlesex Street	E1 7JF	0	\N	Middlesex Street	62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
332	0106000020E61000000100000001030000000100000005000000049198BFD370B3BFAE16B08710C24940752F8D97FA79B3BFEB4E74260EC249407C38A43FC67CB3BF24C29A240FC24940B9E36E8A0873B3BF7B5290A611C24940049198BFD370B3BFAE16B08710C24940	Electric Blue Gallery	E1 7JF	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
333	0106000020E6100000010000000103000000010000000500000065E46E8A0873B3BF795290A611C249407C38A43FC67CB3BF24C29A240FC24940BDDDD53D217FB3BF999FBEFA0FC24940A79123CFF074B3BF6BC46C9712C2494065E46E8A0873B3BF795290A611C24940	Antique	E1 7JF	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	0106000020E61000000100000001030000000100000007000000A1345CE0BA77B3BFCA4E005A0DC249403B54311FCC71B3BF1CF212C00EC24940BE334712CC71B3BFB1A326C00EC2494009BBECE1E96EB3BF13390C5A0FC2494051AC8D71F16AB3BFFA9F60620DC249405AACC5C13C72B3BFC6D7A5660BC24940A1345CE0BA77B3BFCA4E005A0DC24940	Cityprint, 58-60 Middlesex Street	E1 7JF	0	\N	Middlesex Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
335	0106000020E61000000100000001030000000100000005000000919D1952CA68B3BF743F3DEE0AC24940FCE765E3236DB3BF6D506BBE09C24940C9149CC0816FB3BFD9A5D7800AC24940A221D4797D6AB3BF5AD7E6AC0BC24940919D1952CA68B3BF743F3DEE0AC24940	Fine Touch, 54 Middlesex Street	E1 7JF	0	\N	Middlesex Street	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	0106000020E61000000100000001030000000100000005000000A221D4797D6AB3BF5AD7E6AC0BC24940C9149CC0816FB3BFD9A5D7800AC2494018A188913C72B3BFF0E59E660BC24940B1DA76A50D6DB3BF08D266CC0CC24940A221D4797D6AB3BF5AD7E6AC0BC24940	Tan Fashions	E1 7JF	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	0106000020E61000000100000001030000000100000006000000562E3CFCB665B3BF4EC08ADC09C249406D3D7BD06968B3BFE20E9B030BC24940A6DF41D96968B3BF2AC3AA030BC24940A4504AFEE764B3BF27E117CB0BC249400D42FDEBEA61B3BFD472E07B0AC24940562E3CFCB665B3BF4EC08ADC09C24940	Anil Gift House Ltd, 1 New Goulston Street	E1 7LL	0	\N	New Goulston Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	0106000020E610000001000000010300000001000000060000007EDB28B3236DB3BF925E64BE09C249405EC4A432C968B3BFCF6ECDED0AC249404B243EA06968B3BF081D94030BC24940E015FFCBB665B3BF6ECE83DC09C24940A757B5AEBE6AB3BFBC30D3F408C249407EDB28B3236DB3BF925E64BE09C24940	Monex International, 52 Middlesex Street	E1 7JF	0	\N	Middlesex Street	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	0106000020E6100000010000000103000000010000000B0000008B0AD538CF63B3BFFBF020500BC24940FA3BB1F6FB62B3BFA0BEA78E0BC24940ABC3C272D366B3BFD624E7040EC24940C6AC3693E75CB3BF62CDFB6010C24940B949D856CF5DB3BF2D053E2311C24940CD65A94F1F54B3BF8A1EEA9212C249407BF7DFF71F48B3BF980E1E7F14C249406D441D168F41B3BF42D1B19C10C24940488FE7D51C42B3BF31C2685B0FC24940284911031962B3BFDD6C20900AC249408B0AD538CF63B3BFFBF020500BC24940	Ladbrokes	E1 7LL	0	\N	New Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
340	0106000020E610000001000000010300000001000000080000001EFEEF51C269B3BF849F1E7E18C249405961031DC269B3BF86B4187E18C249401E975706C564B3BF55AE0C5E16C249403DCCC71CC564B3BF40A2085E16C249400758C7D19A74B3BF9B58E9AE12C24940FE7B0779AE77B3BFE15807A513C249401E313312957AB3BF9E8BB7CE14C249401EFEEF51C269B3BF849F1E7E18C24940	Beauty Stone 	E1 7TD	0	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
341	0106000020E6100000010000000103000000010000000D0000001E975706C564B3BF55AE0C5E16C249405961031DC269B3BF86B4187E18C249401EFEEF51C269B3BF849F1E7E18C24940F3AD404DC269B3BF3CA61F7E18C249403F1B73362956B3BF53C20D071CC24940C86A96465748B3BF3326F63D1EC24940ED17692B5346B3BF663F4A041DC24940E68222245647B3BF830DC0CC1CC2494006150B9AF43CB3BF64F3D34E16C249402607E0F71F48B3BF8C0E1E7F14C24940C661A94F1F54B3BF891EEA9212C24940B038D091B55CB3BFA7659EBE17C249401E975706C564B3BF55AE0C5E16C24940	Merchant House	E1 7TD	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	0106000020E61000000100000001030000000100000009000000F9EC3E7E5353B3BF1B39E3C207C2494039647B5A645EB3BF0B15097704C249408AA5DC70645EB3BF85F2067704C24940D2778B114E64B3BF25C3655506C24940215AE2E74964B3BF3DD4601D07C24940CB5407EBCC55B3BF6EEFBA2009C24940869BDE219852B3BFD9FBD71208C249405DC7F6A05353B3BF0D32EEC207C24940F9EC3E7E5353B3BF1B39E3C207C24940	The Bell	E1 7LL	0	\N	New Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	0106000020E61000000100000001030000000100000006000000B7E175CF555AB3BF29A6C62E03C24940619BF7C3555AB3BF64D5CB2E03C2494094A2485F9F4FB3BFF56F3D9706C2494065229044074CB3BFCD8C566905C24940F561A840F156B3BFC463461C02C24940B7E175CF555AB3BF29A6C62E03C24940	Lofthouse	E1 7LL	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	0106000020E6100000010000000103000000010000000700000094A2485F9F4FB3BFF56F3D9706C24940619BF7C3555AB3BF64D5CB2E03C24940B7E175CF555AB3BF29A6C62E03C249408AA5DC70645EB3BF85F2067704C2494039647B5A645EB3BF0B15097704C24940F9EC3E7E5353B3BF1B39E3C207C2494094A2485F9F4FB3BFF56F3D9706C24940	Lofthouse	E1 7LL	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	0106000020E61000000100000001030000000100000005000000F561A840F156B3BFC463461C02C24940BB229044074CB3BFD08C566905C249405D239D90DC47B3BF2287E02A04C24940DEBD736DA852B3BF096B1ECE00C24940F561A840F156B3BFC463461C02C24940	Lofthouse	E1 7LL	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	0106000020E61000000100000001030000000100000006000000AA2A179FCB51B3BFA508D97B00C249404EBD736DA852B3BF096B1ECE00C24940D0239D90DC47B3BF2287E02A04C24940B63B3F0FA543B3BFD3CD5BCF02C2494062FEF6AE7D4EB3BF94DF7E70FFC14940AA2A179FCB51B3BFA508D97B00C24940	Lofthouse	E1 7LL	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
347	0106000020E6100000010000000103000000010000000500000064FFF6AE7D4EB3BF94DF7E70FFC149400C3C3F0FA543B3BFD5CD5BCF02C249400A3150D43840B3BFFE3974B901C249408F2BEE372C4BB3BF70C4E764FEC1494064FFF6AE7D4EB3BF94DF7E70FFC14940	Lofthouse	E1 7LL	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	0106000020E6100000010000000103000000010000000500000095B423F49946B3BFD5F02CF2FCC14940AA3AEE372C4BB3BF70C4E764FEC149400A3150D43840B3BFFE3974B901C2494081E4BAB0B63BB3BFB350774C00C2494095B423F49946B3BFD5F02CF2FCC14940	Lofthouse	E1 7LL	0	\N	Middlesex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
349	0106000020E6100000010000000103000000010000000A000000FC0720BC5E53B3BFEE00A01B09C24940EDD60003B534B3BFDF815B920DC24940B51650AFA52DB3BFD1D2D1F90CC24940E290859E1623B3BFFE030F3D07C249400004AACF5529B3BF240CA31E06C2494044B8432C1331B3BF501E47BD04C24940FA357CE9CE32B3BF804843E304C24940241899DA1A37B3BF9113CF1407C2494074FF3551F045B3BF2FDD25A404C24940FC0720BC5E53B3BFEE00A01B09C24940	London Watches UK Ltd	E1 7LL	0	\N	New Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
350	0106000020E6100000010000000103000000010000000B000000F7303BC0593DB3BFB2E48FD7FAC14940061DE07E2D2DB3BFC856F3A0FFC1494073A8B7A2211BB3BFB6FC277102C249403358725D1709B3BF8F306817F9C14940B131CD460DF1B2BF52EB1464EDC149407153B9D9960BB3BF88C6A915E8C1494020E6427D251DB3BF156A32BEEEC1494037A60495E111B3BFE99FBA65F1C1494020D76269181CB3BF05D5FD85F5C14940598157A8C627B3BF5AF0B9B5F2C14940F7303BC0593DB3BFB2E48FD7FAC14940	St Botolph Street	E1 8AH	0	\N	St. Botolph Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
351	0106000020E61000000100000001030000000100000009000000DE8654BAADD6B2BF8E403814E8C1494019ABECBE5FCDB2BF4045AD53EAC14940573B2E413CD6B2BF01AA8BE5EDC14940775C67E69BCEB2BF995135BDEFC1494031AC9B362DC7B2BFFD8D1C14ECC149404D1820866EC2B2BF819C4A6FE9C149402E2CA32489BEB2BF0475C654E6C14940E1208F50A0D0B2BF78CC0675E3C14940DE8654BAADD6B2BF8E403814E8C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	0106000020E6100000010000000103000000010000001100000018844D4E35F5B2BFCC3909B6FDC14940530352E635F5B2BF8252FFAEFDC14940494128E67AFBB2BFF412089EFCC149402F6B1BED7AFBB2BF0887F79DFCC1494004CE65167BFBB2BFFA040F9EFCC149408BA41A31D0FFB2BF95A456E0FBC1494051BAD356D904B3BFF888C8BDFEC14940F056F3AFC106B3BF43693F6AFEC14940C5F63F1A5C23B3BF8405B00310C2494058DE44801E17B3BF41AD8FF011C24940BCB111760605B3BF44136C5D07C2494058F2B702A602B3BFACD79CA307C24940A3F8AD21A6FBB2BFC444ECB803C249401FB37F32BCF6B2BF08443CED00C249401F4C442DF2F9B2BFF877A16000C24940E72FE0613FF5B2BF6FF94FB4FDC1494018844D4E35F5B2BFCC3909B6FDC14940	Herbert House	E1 7AL	0	\N	Old Castle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	0106000020E6100000010000000103000000010000000C000000E3D86D996CEEB2BF09CEB3F5F2C14940B07D0E8C11E3B2BF78F2C366F5C1494059E29C9990E0B2BFBE133636F4C14940D664D23CB7DFB2BF8C51225CF4C149405EA9D689C3E0B2BF96C5B5F4F4C149400B40C0E84EDAB2BF1FA6AD26F6C14940054C67E69BCEB2BF995135BDEFC14940E3392E413CD6B2BF01AA8BE5EDC14940D927292063D9B2BF31728331EDC14940EA2E689300D1B2BF0A7A4873E9C14940459054BAADD6B2BF82403814E8C14940E3D86D996CEEB2BF09CEB3F5F2C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
354	0106000020E6100000010000000103000000010000000C000000E076CE9687D9B2BFAC47E05AF7C149407251F89187D9B2BF66F5ED5AF7C1494007809D2418C9B2BFFA8F3BA3FAC1494085185CEABAB4B2BFEDD516F6F0C14940321152B9EEB5B2BF578D0BB7F0C1494049A9FCA5BAB3B2BF6D2903ABEFC149408B6C2D10D7BBB2BF047ABA01EEC149401E6FD5E804C4B2BFA406A9E4F1C1494048EABDDEF8C5B2BF267B427EF1C14940C154A7D373C7B2BF0ADB5332F2C149402320619F7FCCB2BFECAEBE29F1C14940E076CE9687D9B2BFAC47E05AF7C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
355	0106000020E6100000010000000103000000010000000D0000002DB2AB459210B3BF8DE70B7211C24940D8CF6C8DE2F7B2BF5A76DB2615C24940A5549E90AAEAB2BF51D697B70CC24940D7B52863F702B3BF69A0D2F608C2494041FD2CCEC807B3BFB08DF5C60BC24940FD4452137503B3BFF8A4997F0CC2494083A739142202B3BF87F3ACB90BC249402A014241E0F4B2BFF5775EEF0DC249408BA379B31AFBB2BF8B0DACD411C2494010E886233A09B3BF2CBE01BC0FC249409C8AAC62B708B3BF501CFA7F0FC24940AA130C0F3C0CB3BFDB58D9E90EC249402DB2AB459210B3BF8DE70B7211C24940	Herbert House	E1 7AL	0	\N	Old Castle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
356	0106000020E6100000010000000103000000010000000A000000CA636DDB55ABB2BFBF5D2F56F8C14940AB482DFA1785B2BF9B283FAEFEC14940878EC43E8E75B2BF02BD7225F6C14940D89E24BF4D7AB2BFB6706837F5C149400A181465A677B2BFB8A4BDD7F3C14940A2438F61BA94B2BFBB1BFB93EEC149406B9A1BDD5E96B2BF2BBABC4CEFC14940BBDD586BD999B2BFF68BC896EEC1494007422DA0769EB2BF58CEC6C4F0C14940CA636DDB55ABB2BFBF5D2F56F8C14940	One Commercial Street	E1 7PT	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	0106000020E61000000100000001030000000100000005000000CC5A8499FFA9B2BFA2C6EA00F2C149407F0992D7B1A5B2BF9A5EE4CCF2C149409DF93E7A599AB2BFA23D1DD6ECC149403883EB39589EB2BF5C52C418ECC14940CC5A8499FFA9B2BFA2C6EA00F2C14940	Aldgate Stationers	E1 6BF	0	\N	Tyne Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	0106000020E6100000010000000103000000010000000B0000000BBCEC9BDFC3B2BF12061030FFC1494094344D7726BEB2BFCDC31D1200C24940F0F891D7B1A5B2BF9B5EE4CCF2C149409B4BAC256EABB2BFAD0A46C5F1C149404D5934BA91C4B2BF02ED09A3FDC14940C86B7E4A17C2B2BF68B191FFFDC14940142C2D29A9C2B2BF19B71361FEC14940515EB78FD2CCB2BF1FA64664FCC14940DAF4159FD5CDB2BFE5CDD5E3FCC14940228DDDCC85C3B2BF2B2C6AEEFEC149400BBCEC9BDFC3B2BF12061030FFC14940	Ibis London City, 5 Commercial Street	E1 6BF	0	\N	Commercial Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	0106000020E61000000100000001030000000100000008000000218BB471C834B3BF9580D91121C249409672FD41C834B3BFAC8CD21121C24940DBE296579E1DB3BF9CC5B81D13C24940E44762D9FF25B3BF27AA2ACF11C24940E54F0C81DF38B3BF3ED194961DC24940AA1BD377BF39B3BFD160A8731DC24940BA264690313EB3BF2523EE3920C24940218BB471C834B3BF9580D91121C24940	Happy Days	E1 7LL	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	0106000020E6100000010000000103000000010000000F000000801A79840001B3BF56B048CA1CC2494061AD7529ECFBB2BF90B836C319C24940F7A051658E14B3BF05506CE615C24940F1055763DA18B3BF986BB0A818C24940ADD762512C15B3BFBEE8C43619C2494022F1A90E4414B3BF51B8E6AF18C2494081B64D9B8B0CB3BFF45FF4E819C249404311F3998A0DB3BF6AF750871AC2494057AE9A56010CB3BF319B36C21AC24940930D3D860E0BB3BFD248CC281AC2494070A885D60507B3BF622C2BC21AC24940A804A445C707B3BFD54BEE2A1BC24940A86FE47C6106B3BF603C13721BC2494080927CFD2F07B3BFCAE841021CC24940801A79840001B3BF56B048CA1CC24940	Jacobson House	E1 7AL	0	\N	Old Castle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	0106000020E6100000010000000103000000010000000600000038D74753E5A0B2BF24B1A9FC27C24940D2D75C1CFAAEB2BFFD9B89C925C24940B8A6886D76B3B2BF3DA76A3E28C24940DCB5EC4322B2B2BF9F392E1D29C249401E6BF94A33A3B2BFC2988C6E29C2494038D74753E5A0B2BF24B1A9FC27C24940	The Culpepper, 40 Commercial Street	E1 6LP	0	\N	Commercial Street	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
362	0106000020E61000000100000001030000000100000006000000366E06D28368B2BFAD6AA28D13C2494047667D948368B2BF808B9D8D13C249400EA8049C2E62B2BFD54FF4B10FC2494000E7F784BC68B2BF71C85FAA0EC249404C39E3D3356FB2BF590E4A8212C24940366E06D28368B2BFAD6AA28D13C24940	Canon Barnett School	E1 7RQ	0	\N	Whitechapel Car Park		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	0106000020E6100000010000000103000000010000000B0000001ADFF1E5BA69B2BF669E477A15C24940F70AFBFC0775B2BFDFBB9D231CC2494009663192906FB2BF7CF0C1EF1CC2494000A5CE547C70B2BF6897148D1DC2494085C78B44A06DB2BFE291D7F71DC249406478E5B8A26BB2BF9153D2A31CC24940941C4279975DB2BF132B23B01EC24940EBECC624FF56B2BF7C1A80491AC24940C07C09D19066B2BFD82D3F0418C2494060C31EC70264B2BF0063CD4F16C249401ADFF1E5BA69B2BF669E477A15C24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	0106000020E6100000010000000103000000010000000B0000000C5C19ED274DB2BF84AAB8D02DC24940E70294460A3DB2BFE1B24A4520C2494010A303268739B2BF3A13FF301FC249402C7D82312141B2BF24D9204C1EC24940E4779E6D7642B2BFD136D8601DC249401BCBB2C79745B2BFF0C9D66F1DC249408E9BB196655BB2BFC944CD272CC24940E8A0E3BB3E5AB2BF397DB60A2DC24940DE0D9DE27F58B2BF55B9B1452DC249406D607B97D755B2BFF2F909272DC249400C5C19ED274DB2BF84AAB8D02DC24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	0106000020E6100000010000000103000000010000001300000065B4D33A6929B2BF4F60E9C130C2494086060F4E6929B2BF33E4DCC130C249405DB6AEBC4326B2BF9D63F9A22DC2494042C41448E72DB2BFA55A10DE2CC2494059069C5E482DB2BF124D9C472CC24940A4B7BED1C234B2BF7DD0D4822BC24940F8B44054C532B2BF204876A029C24940CAC1CFE32A3FB2BF0FCB425A28C24940D1A22614A442B2BF7D021CA42BC24940BA6496615E40B2BF7791E6DF2BC249405142B64C9E42B2BFC10D4CF12DC24940AC7BEB5ACA45B2BF77AEAD9E2DC24940ADDDEC1B8946B2BF8F7B0C502EC24940CB40A3C14143B2BF37E2E89B2EC2494021D07B604042B2BF2A96D1B32EC249400DFA1B8E1A43B2BF056ADDC92FC24940982CCDD1292AB2BF2273998A31C2494047B24E7E6929B2BFBDD5E3C130C2494065B4D33A6929B2BF4F60E9C130C24940	Sky UK, 1 Brick Lane	E1 6PU	0	\N	Brick Lane	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	0106000020E6100000010000000103000000010000000D000000ACB7DEB04205B2BFD254DFCC27C2494097FDC43AD606B2BF43A2CED528C249400579F0D44205B2BF567BE80C29C249404CF770253601B2BF2914E7AE29C249403CFC84B5CBFCB1BFD9B1DD0127C249409B02EC3134F9B1BF2C6C31A723C2494077764B764CFFB1BF0A89980423C24940F9D330F6F200B2BFC372A1E923C249403540FFBFEC0AB2BF8E4B29D822C24940581366BCD60FB2BF052DF3CD25C249405CBD75D1B80DB2BFA1F781F325C2494081891996120EB2BF367B8E7126C24940ACB7DEB04205B2BFD254DFCC27C24940	Sonali Bank, 29-33 Osborn Street	E1 6TE	0	\N	Osborn Street	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	0106000020E61000000100000001030000000100000009000000583EAC0134F9B1BF817A2AA723C24940023D266993F6B1BFD0CFB25421C24940DC7FB38DBFFDB1BFED0C878A20C249400F7EFD160E01B2BFF4FF0AE01FC249409BF4DC8D7202B2BF8386740921C249400159F5AB1D00B2BFF529134F21C249403318BD70AC01B2BFA278C89B22C2494081BE0B464CFFB1BF5B97910423C24940583EAC0134F9B1BF817A2AA723C24940	Stolen Space, 17 Osborn Street	E1 6TE	0	\N	Osborn Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
368	0106000020E61000000100000001030000000100000008000000526E1EC807FFB1BF6988DFD61DC24940F8CCCEBC9419B2BF3DB89A221BC2494034A6E75E531EB2BF2C6682391FC24940C30C80612018B2BFFA81B1EC1FC24940AA71ED7E1304B2BF116E3B3022C24940F0F4DC8D7202B2BF8586740921C249400D7DFD160E01B2BFF4FF0AE01FC24940526E1EC807FFB1BF6988DFD61DC24940	Whitechapel Gallery, 77-82 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	0106000020E61000000100000001030000000100000008000000CE8DCBD86430B2BFB59EA1841FC24940942C9E6F7527B2BFB180AF9A20C249400C152235D223B2BF6B5FB2E51DC24940C8A98F57791DB2BFC992967D1EC249403FD5CEBC9419B2BF3FB89A221BC24940F65A6B8C5F14B2BF0286E8C916C24940E761E9DA6022B2BF8D6702FA14C24940CE8DCBD86430B2BFB59EA1841FC24940	Whitechapel Gallery, 77-82 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	0106000020E610000001000000010300000001000000060000008EB0DCF48C11B2BF89C5F0F31BC24940219870A1FF0BB2BF5311AAFF17C249400CA496B77014B2BF73135ED816C249409C53E7B87014B2BF732C5FD816C249400FDACEBC9419B2BF45B89A221BC249408EB0DCF48C11B2BF89C5F0F31BC24940	Whitechapel Gallery, 77-82 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	0106000020E61000000100000001030000000100000005000000B1B4C6E8590EB2BF3FE5B7AC19C249401C329DC48C11B2BFC9D3E9F31BC24940F47797082A0AB2BFC2EA87B41CC249401A964E5C8E07B2BF0D35206F1AC24940B1B4C6E8590EB2BF3FE5B7AC19C24940	Whitechapel Gallery, 77-82 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	0106000020E61000000100000001030000000100000009000000B30D0F2C8E07B2BF4943196F1AC24940598197082A0AB2BFC2EA87B41CC24940526E1EC807FFB1BF6988DFD61DC249408D314DEED4FAB1BF23AB0B6F1AC24940AA9CBA610FF0B1BFBDA4CCA81BC24940048D37D43BEEB1BFE01FE5181AC249407E9A61AEE300B2BF654C7FF917C2494087A5E0DCD604B2BF4FE8021E18C24940B30D0F2C8E07B2BF4943196F1AC24940	Stolen Space, 17 Osborn Street	E1 6TE	0	\N	Osborn Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	0106000020E610000001000000010300000001000000060000004859E1E48960B2BF022A92CDFFC14940029074500555B2BFE0C29633FAC1494080441414E55DB2BF4D4C5F8DF8C14940EE842E851A62B2BF689B6AE1F8C14940838780D27C6BB2BF9211AFBFFDC149404859E1E48960B2BF022A92CDFFC14940	Sportec	E1 7RQ	0	\N	Whitechapel High Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	0106000020E610000001000000010300000001000000060000006798AC6BA276B2BF7133138803C24940F7E9E2C6076CB2BFCF1BA1A405C249405166C32BBB68B2BF191B36EC03C249409554E1E48960B2BF002A92CDFFC14940838780D27C6BB2BF9211AFBFFDC149406798AC6BA276B2BF7133138803C24940	Memories Bistro, 2 Commercial Street	E1 7PT	0	\N	Commercial Street	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
375	0106000020E6100000010000000103000000010000000A0000007323EEF9CB6FB2BFE8B7689B07C24940DEB02635887AB2BF4CD8109005C24940CDB98B4E887AB2BF5654099005C24940E0717141237FB2BFF00A0F7C08C2494092AD9529187BB2BF405A3E3D09C24940143FF9F67C77B2BF3E0CD95B07C24940BA05125E316EB2BFB362F61709C24940D8E2533D846CB2BF09F5313808C249404E7C9710CC6FB2BF0289749B07C249407323EEF9CB6FB2BFE8B7689B07C24940	E1 Cycles, 4 Commercial Street	E1 6LP	0	\N	Commercial Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
376	0106000020E61000000100000001030000000100000009000000F9CC7D369294B2BF58A6C2D015C24940D3A81F945B8FB2BF7C71A0B516C24940E673C87A5B8FB2BF5F5CB3B516C24940601638AB858BB2BF828C735517C24940C20F20C2278AB2BFAD0D2B8416C24940A6CA58D21478B2BF8562037519C2494055BF240CCA70B2BF7058791815C249402F582361668CB2BFEC8C639A10C24940F9CC7D369294B2BF58A6C2D015C24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	0106000020E61000000100000001030000000100000011000000418511B4CF81B2BFDE6CB99C2AC24940A6E0ED22BD80B2BF3C7833B227C249409DBF56F49C91B2BF6788B8FE26C24940DD5CAEA6F38CB2BF42C011FE23C249406BFECF0EF28AB2BF2A94A94B24C249409C133007AA88B2BFA9FDB82323C24940906B9605AA88B2BFD0F9A12323C249405FF16E37AA88B2BF4EEFBF2323C249401005CCFABA8AB2BF007722CE22C2494095E87A3EC689B2BFE4980A3B22C2494042EB4FD4DF91B2BF214A4BEB20C24940C1B0C142E79FB2BF9119257429C24940CD782E23F991B2BF019BFBE629C249401DFD29AD2691B2BFC54F13E227C249401C014F3E238FB2BFD8DFAEFC27C24940ACB911F8DD8FB2BF08BB09042AC24940418511B4CF81B2BFDE6CB99C2AC24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	0106000020E61000000100000001030000000100000005000000D2D75C1CFAAEB2BFFD9B89C925C2494038D74753E5A0B2BF24B1A9FC27C2494052FA57D9CA9CB2BF34430E6A25C24940E9EB80386EAAB2BF983E214C23C24940D2D75C1CFAAEB2BFFD9B89C925C24940	Capital Square, 38 Commercial Street	E1 6LP	0	\N	Commercial Street	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
379	0106000020E61000000100000001030000000100000020000000906B9605AA88B2BFD0F9A12323C249409C133007AA88B2BFA9FDB82323C249406BFECF0EF28AB2BF2A94A94B24C2494047565B8E1286B2BFA930220825C24940FBABA3024E88B2BF88EE3A7826C249403BD31E3BE380B2BF42E093DE26C249406BAB0C99AF7FB2BFCBFD773A26C24940E16456FEB57BB2BFDAC71AF426C24940E81C1C1E0279B2BFA686048325C249408EAE72176876B2BF44CAB9BC25C2494086D3692F4F6AB2BF68F5C4781EC24940F8C78B44A06DB2BFE291D7F71DC24940C8A4CE547C70B2BF6697148D1DC249405F663192906FB2BF7AF0C1EF1CC24940A00AFBFC0775B2BFDDBB9D231CC24940D70B544C0B72B2BF2B4637611AC2494002C71FA81178B2BFD0AB347319C2494077C538C63A83B2BFCB9697A417C249404B715AF00E86B2BF39DBD65719C24940DCA8BEBBD490B2BF235D1E9717C249400C4A5EC45B8FB2BF4363A7B516C24940E673C87A5B8FB2BF5F5CB3B516C24940D3A81F945B8FB2BF7C71A0B516C24940F9CC7D369294B2BF58A6C2D015C2494013211FAE589AB2BF7545DE7F19C24940BB204E89988AB2BF4786F00F1CC249406DC513BFD987B2BF2D13996B1AC24940B8E27B0EF787B2BF96DF367D1AC24940460BD530AB75B2BFC9429B731DC2494087833DB6EA78B2BF598D61671FC24940D278001E6D80B2BF88481D301EC24940906B9605AA88B2BFD0F9A12323C24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	0106000020E6100000010000000103000000010000000B000000EFB515FD177CB2BF626E2DFC2AC249407E71EEE2E478B2BF2C3DC01D2BC24940D706AA888177B2BFD5676F1628C24940CE61A2B15278B2BF5992300D28C24940B40EA27EEE77B2BF0B9FFD2D27C249405030CE823F7AB2BFA4A49E1627C24940300ABD4F9D7AB2BF7FD470F527C2494099948A4A287BB2BFEEA982ED27C24940848A2D3A287BB2BFCBD888ED27C2494019B733EA177CB2BFC93827FC2AC24940EFB515FD177CB2BF626E2DFC2AC24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
381	0106000020E610000001000000010300000001000000080000002A72EEE2E478B2BF303DC01D2BC24940A72153B69071B2BF692A516D2BC24940AEFC75424E70B2BFD3C1200A29C24940EAFF797C1F73B2BF447F684D28C24940CBC6C28F1F73B2BFBBDB5D4D28C249406314B9AC1F73B2BFDE706F4D28C24940A007AA888177B2BFD6676F1628C249402A72EEE2E478B2BF303DC01D2BC24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	0106000020E610000001000000010300000001000000160000002D4A413D0D4EB2BF17ADBD5B1BC2494006C8AB53B354B2BFF52B2A5E1AC2494040E0A15F075DB2BF4B9C59DB1FC249407805A2167561B2BF73089E251FC2494004884F689C6CB2BFBD750FEB25C249403E2AA49A1F69B2BFECF12C7A26C24940748BD270286AB2BF0A8DF41A27C249407B2EDED7B06FB2BF495FE83726C24940CBC6C28F1F73B2BFBBDB5D4D28C24940EAFF797C1F73B2BF447F684D28C24940AEFC75424E70B2BFD3C1200A29C24940012453B69071B2BF692A516D2BC24940DBD565AC0463B2BFA104B20E2CC24940A00BB63A8060B2BFE6EFD26D2BC2494075A543086165B2BFC356D7E329C24940F80345A6D467B2BFDC35ADD229C24940D91DA6B72A68B2BFBA8E87CE2AC24940413246A2EA6AB2BFAD098EC22AC2494028A8CE909F6AB2BF19ABCB9F28C24940C98E68839166B2BF82DD505228C2494091A51DAF0563B2BF5AE1CEE028C249402D4A413D0D4EB2BF17ADBD5B1BC24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	0106000020E6100000010000000103000000010000000A000000079374500555B2BFDDC29633FAC149404859E1E48960B2BF022A92CDFFC149404B0486216762B2BFF09F0DB600C2494061CB1291C35FB2BFC608C03901C24940E23A2793A861B2BFECE5E23702C24940A43D4627075AB2BFB6D3088F03C2494087D2603B7456B2BFC4A7F1B101C249409315F4417150B2BFE618708FFEC149408C0662A37B4BB2BF336762F9FBC14940079374500555B2BFDDC29633FAC14940	College of Advanced Studies, 102-105 Whitechapel High Street	E1 7RQ	0	\N	Whitechapel High Street	102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	0106000020E6100000010000000103000000010000000A0000008895F4D66335B2BF115C1B4B03C2494041DA8BCB6335B2BF4CE00C4B03C249409869E3C50730B2BFF880ADA900C249407D5C24697036B2BF9839EF59FFC14940BD6971DB923BB2BF3129E3BA01C249409A779A1B8338B2BF9AA3465B02C24940650A807B883AB2BFD110525103C2494042F6EB3BF936B2BFD2D2CC0B04C2494049BDCAFB6335B2BF49D2134B03C249408895F4D66335B2BF115C1B4B03C24940	Delices, 94 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	94	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	0106000020E6100000010000000103000000010000000C0000009869E3C50730B2BFF880ADA900C2494041DA8BCB6335B2BF4CE00C4B03C249408895F4D66335B2BF115C1B4B03C24940DAFBEB3BF936B2BFD2D2CC0B04C249408FFA18E8553AB2BFD11C4D9405C2494088F8A845FE3BB2BFE1E8414E05C2494064F6C5597640B2BF979DE6D307C249409AA96752FB3BB2BF8B6308C008C2494016D9C4DED434B2BFA49A419D05C24940D3D1B5E87933B2BFC934DFE905C249404F588838B82AB2BFD52DE6BF01C249409869E3C50730B2BFF880ADA900C24940	Costcutter, 93 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	0106000020E61000000100000001030000000100000007000000CDF78C20C31CB2BF21E464B90CC24940E15AB01EC31CB2BFF96056B90CC2494097F029CB6E26B2BFC6DC263B0BC24940792B5A1B092CB2BFC751F8F80EC24940E5CF87914F22B2BF158A356A10C24940AB8AEF4EC31CB2BFE0525DB90CC24940CDF78C20C31CB2BF21E464B90CC24940	Alberts, 88 Gunthorpe Street	E1 7RQ	0	\N	Gunthorpe Street	88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
387	0106000020E610000001000000010300000001000000070000005D695871B30AB2BFD8A73F260BC249409516ADCAE305B2BFAE86444C08C2494023047457B60AB2BF24D0B1A607C2494032A4C4E1B60FB2BF1387A4660AC249401E1C5CDCDE0EB2BF6EF3938F0AC24940CC55132AA70DB2BF94394CBB0AC249405D695871B30AB2BFD8A73F260BC24940	Perfume Warehouse, 85 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	85	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
388	0106000020E6100000010000000103000000010000001400000085AC26F7AE08B2BF2EE8251815C24940E96D4DC7AE08B2BF33120A1815C2494063083BA50CF8B1BF9E3665730AC2494001358C279DFFB1BF4189A92209C24940FABE6EAF8503B2BFE4780F820BC249406315B0159404B2BF367298010CC249407995525AA70DB2BF802B53BB0AC24940F5D499A2E10FB2BFD1B2730C0CC249405BC3D2C1AE0EB2BFF320D94E0CC24940DFEA1B397C17B2BFCAF100B111C2494092AD9FAB2A1CB2BFFE5AB11111C24940BE0A54CC631EB2BF4C5CFB6812C249406343ACB14417B2BF4838565413C249401CCCF379D418B2BF3AFF825814C249409875CC360212B2BF61335B3215C249408EEAF8D6A20FB2BF1E5DC72715C2494089FD58637A0BB2BFAA0111C015C249404ACF4E2B550AB2BF911A70E514C24940052833F7AE08B2BFDA12111815C2494085AC26F7AE08B2BF2EE8251815C24940	Whitechapel Gallery, 77-82 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
389	0106000020E61000000100000001030000000100000005000000F60CD00A8CE2B1BF1DA7DE4712C24940D8B11653FAE6B1BF89CA3E7C11C249401DAD28CACAE9B1BF1AA12F8613C24940357A98D320E5B1BFB164932614C24940F60CD00A8CE2B1BF1DA7DE4712C24940	KF Enterprise, 3 Osborn Street	E1 6TE	0	\N	Osborn Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	0106000020E61000000100000001030000000100000005000000C910E999CAE9B1BF41AF288613C24940F28194DF27EBB1BF74E5774F14C24940DED720BBA5E6B1BF4A74571215C249409AAF366910E5B1BF7A7CBA2814C24940C910E999CAE9B1BF41AF288613C24940	Southern Fried Chicken, 5 Osborn Street	E1 6TE	0	\N	Osborn Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	0106000020E610000001000000010300000001000000050000007630E18AA5E6B1BF7682501215C24940F3E454AF27EBB1BF9EF3704F14C24940D1EB04CF9DECB1BFDE80AEF614C24940EF24F0C1E4E7B1BF9004CBC615C249407630E18AA5E6B1BF7682501215C24940	Southern Fried Chicken, 5 Osborn Street	E1 6TE	0	\N	Osborn Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	0106000020E6100000010000000103000000010000000D000000CA22D9CC37F5B1BFAF7D638017C24940A181DF9A37F5B1BF296E5B8017C249401987EBFA07ECB1BFE50E29BB18C249402D415F8588E7B1BFE81CBFDC15C24940F87CB091E4E7B1BFBC12C4C615C24940984EC59E9DECB1BF0A8FA7F614C249403CAF1A2B83EFB1BF0E5C037714C2494045FDAD72A6F1B1BF17186FAC15C249401154245AB4F5B1BF4821C8F914C24940CB47048698F8B1BF43FB31FE16C24940020369A163F7B1BFF354B32C17C249409B1B1FCB37F5B1BFF55F628017C24940CA22D9CC37F5B1BFAF7D638017C24940	Osborne House, 9-13 Osborn Street	E1 6TE	0	\N	Osborn Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	0106000020E61000000100000001030000000100000006000000C69D2F9BBC41B2BF235188461AC24940A7840C5CBD36B2BFEA49374A1CC249409C8599F32323B2BFA6E78BE011C24940B44946C8C32DB2BF488957EE0FC249403299A6CA6B35B2BF922A933A14C24940C69D2F9BBC41B2BF235188461AC24940	Whitechapel High Street Car Park	E1 7QX	0	\N	Whitechapel Car Park		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
394	0106000020E61000000100000001030000000100000006000000341CD6EBF9E0B1BF2FA9E43611C24940E6B99EF0F5E4B1BF4272AB7A10C249405E1248B40EE6B1BF754AA81411C24940B1EFF13CD9E6B1BF2859388211C249408DAF0F3B8CE2B1BFF798E54712C24940341CD6EBF9E0B1BF2FA9E43611C24940	Audio Time UK, 75 Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	0106000020E610000001000000010300000001000000060000001987EBFA07ECB1BFE50E29BB18C24940A181DF9A37F5B1BF296E5B8017C24940CA22D9CC37F5B1BFAF7D638017C24940A075ADE94AF6B1BF3053383218C24940C26AD605C8ECB1BFE7BAA53519C249401987EBFA07ECB1BFE50E29BB18C24940	Osborne House, 9-13 Osborn Street	E1 6TE	0	\N	Osborn Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
397	0106000020E610000001000000010300000001000000080000003312CDDFEB14B2BF2CFEA31A0EC2494094C78B1C0E19B2BFC6CAEE520DC24940C0FB5A240E19B2BF8040E1520DC24940A5FFCA4C0E19B2BFABBCF5520DC2494072CAD97ABF19B2BFF536F0340DC24940A2AFCB3C6D1EB2BF630B3F5410C2494087DB9D001119B2BF8799928310C249403312CDDFEB14B2BF2CFEA31A0EC24940	Freedom Bookshop, 85a Whitechapel High Street	E1 7QX	0	\N	Whitechapel High Street	85	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
398	0106000020E6100000010000000103000000010000001300000097F029CB6E26B2BFC6DC263B0BC24940E15AB01EC31CB2BFF96056B90CC24940CDF78C20C31CB2BF21E464B90CC24940FFA48BAAD11BB2BF3C6CC9E00CC249407CDC9E83361AB2BF148F53090CC24940C48DEC247B17B2BFAE2BBA860CC24940C0FB5A240E19B2BF8040E1520DC2494094C78B1C0E19B2BFC6CAEE520DC249403312CDDFEB14B2BF2CFEA31A0EC24940731C5CDCDE0EB2BF70F3938F0AC2494032A4C4E1B60FB2BF1287A4660AC249409E2D5949DF12B2BF7B3A95CE09C249400963B758DD16B2BF764F5A1409C24940C231DAE81B18B2BF372648BB09C24940CAFF1394B21DB2BFC696039408C24940E153CACAB61EB2BFD310C81909C24940AE81B90F3922B2BFB6FA706B08C24940B8BBD70B3922B2BF07BD716B08C2494097F029CB6E26B2BFC6DC263B0BC24940	Cashino	E1 7QX	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
399	0106000020E610000001000000010300000001000000100000000EA8049C2E62B2BFD54FF4B10FC2494047667D948368B2BF808B9D8D13C24940366E06D28368B2BFAD6AA28D13C249401239BCC48368B2BF527DA48D13C24940C9B034471F6AB2BFECE3038D14C24940841B11B90B55B2BF8B46F8D717C249400490593C6554B2BF4CB23A7817C24940421AF6E76B4BB2BFB4AD8CFB18C2494045672DA3BC48B2BF7754806E16C24940C646CC460D4AB2BF99362D3316C2494045E7B2BBC446B2BF2569A41B14C2494024B9A5D8AD51B2BF52938F5412C24940A32907813E52B2BF618141AC12C24940F36445A3CC5DB2BF82A2C0BA10C249400DD9CEA44E5DB2BF2344F07510C249400EA8049C2E62B2BFD54FF4B10FC24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
400	0106000020E61000000100000001030000000100000008000000A6E0ED22BD80B2BF3C7833B227C24940418511B4CF81B2BFDE6CB99C2AC24940CAB49DD01A7CB2BF08F3B6DA2AC2494019B733EA177CB2BFC93827FC2AC24940848A2D3A287BB2BFCBD888ED27C2494099948A4A287BB2BFEEA982ED27C24940E3906C6A287BB2BF66CA8FED27C24940A6E0ED22BD80B2BF3C7833B227C24940	Toynbee Hall	E1 7RQ	0	\N	Gunthorpe Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	0106000020E61000000100000001030000000100000007000000F7E9E2C6076CB2BFCF1BA1A405C249406798AC6BA276B2BF7133138803C2494045994E9F747AB2BF5F058C8305C24940CDB98B4E887AB2BF5654099005C24940DEB02635887AB2BF4CD8109005C249407323EEF9CB6FB2BFE8B7689B07C24940F7E9E2C6076CB2BFCF1BA1A405C24940	E1 Cycles, 4 Commercial Street	E1 6LP	0	\N	Commercial Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
402	0106000020E6100000010000000103000000010000000C0000007EB8AEBC4326B2BF9C63F9A22DC2494086060F4E6929B2BF33E4DCC130C2494065B4D33A6929B2BF4F60E9C130C24940C7192F760110B2BF2D12FBD732C24940015D7DDA9907B2BFBDA4F4512EC24940B297258CF213B2BF2D86160D2DC2494020ACC2B8FD14B2BFF8940B0A2EC249407756C8B22625B2BFB9F9679E2CC2494011D7E7AD5229B2BFC6CD47352CC249405AB5769BE429B2BF3946DCC22CC24940A7C978E4C825B2BF51F4B6372DC249407EB8AEBC4326B2BF9C63F9A22DC24940	Sonali Bank, 29-33 Osborn Street	E1 6TE	0	\N	Osborn Street	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
403	0106000020E61000000100000001030000000100000010000000F0843DAA9907B2BF2DB3ED512EC249402C9746D76303B2BF83C6AA432BC24940A20771253601B2BF2114E7AE29C24940CB78F0D44205B2BF547BE80C29C249406A12EE2D2B08B2BF11EF76DC2AC24940AE1671904C1EB2BF92187C5428C24940346A2FC56F1CB2BF5CA8E00727C24940A9FEDAFF9826B2BF8C42F2D825C249400582D0F7FD24B2BF1F30129624C249400971B73BA235B2BFB9D4A19322C2494021098A4EFD39B2BFB7BF9FE925C24940701C79C4223CB2BFAFA56AB525C24940F55990B32A3FB2BF73D93B5A28C24940A1340124C532B2BF85566FA029C249405A96258CF213B2BF2D86160D2DC24940F0843DAA9907B2BF2DB3ED512EC24940	Sonali Bank, 29-33 Osborn Street	E1 6TE	0	\N	Osborn Street	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	0106000020E61000000100000001030000000100000005000000AB482DFA1785B2BF9B283FAEFEC14940CA636DDB55ABB2BFBF5D2F56F8C14940E394BB2FE7B7B2BF439CCAB9FFC1494012DE2D793592B2BF0F9701BB05C24940AB482DFA1785B2BF9B283FAEFEC14940	Ibis London City, 5 Commercial Street	E1 6BF	0	\N	Commercial Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	0106000020E6100000010000000103000000010000001C00000007809D2418C9B2BFFA8F3BA3FAC149407251F89187D9B2BF66F5ED5AF7C14940E076CE9687D9B2BFAC47E05AF7C1494032FF35C287D9B2BF7BE7F45AF7C149404C1F26A511E3B2BFBDDECF66F5C14940B07D0E8C11E3B2BF78F2C366F5C14940E3D86D996CEEB2BF09CEB3F5F2C14940F4A7649FE9F7B2BFA6F7D56EF7C14940DBF5FCB1FAF0B2BF34663FDDF8C14940D551BE0F4FF5B2BF9868D853FBC149401FFD909D4FF8B2BF060861D0FAC149402F6B1BED7AFBB2BF0887F79DFCC14940494128E67AFBB2BFF412089EFCC14940530352E635F5B2BF8252FFAEFDC1494018844D4E35F5B2BFCC3909B6FDC149400BFB69C83DF0B2BF11A5898FFEC149406128202D8EF8B2BF498F774A03C24940F0EF9D1176E6B2BFADD2CF6206C249405430B9F5A1E5B2BFB44B22EA05C249405F79A2574CE2B2BF3B77F97906C24940D9DB2137C2E5B2BF71923E1E08C249407A95CE1DDAEAB2BF1CA5D36207C24940B12C500927EBB2BFDEE3508D07C2494036637DA74FE5B2BF7128CF7308C24940362553D45EE1B2BFD3A1C6A406C249408EB6702217D8B2BF03B3F23B02C249401778446FC8D8B2BFCE4EA21702C2494007809D2418C9B2BFFA8F3BA3FAC14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	0106000020E61000000100000001030000000100000007000000DB7CEE6EF2AEB2BFA4305328EEC14940F3C23C2671B4B2BF2C0B3EEAECC14940F4635DBD38B8B2BF2EA463BFEEC1494097F2D37EB3B3B2BFBE02ADA7EFC14940602FBA83E6B5B2BFF605A9B8F0C14940C4491EBABAB4B2BFC6E30FF6F0C14940DB7CEE6EF2AEB2BFA4305328EEC14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	0106000020E6100000010000000103000000010000000500000093E1977DDEACB2BFC793533EE9C1494095BBCA235AB1B2BF73BBE674E8C14940F3B4EFDFD6BBB2BFD687B301EEC14940E95D5DBD38B8B2BF39A463BFEEC1494093E1977DDEACB2BFC793533EE9C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	0106000020E610000001000000010300000001000000060000005B098DF359B1B2BF35C9DF74E8C14940E4F07A8C75B6B2BFCE4C2BAAE7C14940330CEA4214C6B2BF4A7F9578F1C14940545B4C09DBC3B2BF436BD3D0F1C1494077FDB1AFD6BBB2BFA995AC01EEC149405B098DF359B1B2BF35C9DF74E8C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
409	0106000020E610000001000000010300000001000000080000004D4A3D5C75B6B2BF8B5A24AAE7C149407E9765F488BEB2BFC082BF54E6C14940597DE2556EC2B2BF46AA436FE9C14940A656FA2B6ACAB2BF963F73ACEDC14940EF7A8A492BC6B2BFCBA8AC73EEC1494077DBC2C69AC9B2BF3578A446F0C14940D7BB8BE966C5B2BFCFA9D80BF1C149404D4A3D5C75B6B2BF8B5A24AAE7C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	0106000020E61000000100000001030000000100000006000000F3C23C2671B4B2BF2C0B3EEAECC14940DB7CEE6EF2AEB2BFA4305328EEC1494050C8BB5A11A8B2BFAE2B72D2EAC149404231F58A90A8B2BF6D1E941BEAC14940359ED5ADDEACB2BF04865A3EE9C14940F3C23C2671B4B2BF2C0B3EEAECC14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	0106000020E6100000010000000103000000010000000500000062621A78C627B3BF3DFEB2B5F2C1494077D76269181CB3BF05D5FD85F5C14940FDA50495E111B3BFE99FBA65F1C1494003E6427D251DB3BF166A32BEEEC1494062621A78C627B3BF3DFEB2B5F2C14940	St Botolph Street	E1 8AH	0	\N	St. Botolph Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	0106000020E61000000100000001030000000100000007000000D80A0BA679F2B2BF30A1AAF3E0C1494074D8667E8EF0B2BF52731754E1C14940A12F5BE09BEAB2BF61C04350DFC149405F5673667CE0B2BF10B96117E1C14940F1C397583CDFB2BF0B3E9D92E0C149403F7BD89222EBB2BF9694E07ADEC14940D80A0BA679F2B2BF30A1AAF3E0C14940	London Metropolitan University	E1 8AH	0	\N	Goulston Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
413	0106000020E61000000100000001030000000100000009000000875589EE342FB3BF6229CA9121C24940E68635408820B3BF77394B151AC2494090101F0C0A1CB3BF381C28D817C24940D294019BF715B3BF1C3A274F14C24940DBE296579E1DB3BF9CC5B81D13C249409672FD41C834B3BFAC8CD21121C24940218BB471C834B3BF9580D91121C24940E0A7C26F2733B3BF8D6A393721C24940875589EE342FB3BF6229CA9121C24940	Jacobson House	E1 7AL	0	\N	Old Castle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
414	0106000020E6100000010000000103000000010000000D000000968935408820B3BF75394B151AC24940875589EE342FB3BF6229CA9121C24940F26FEA9BA00BB3BF4A071DC224C2494049F0BAF04408B3BFF59BC0D222C24940270B2B1AE30CB3BF5994C74822C249406263FE7C5D0CB3BFCB0010D821C24940D8D0A05E2B10B3BF828B997B21C24940516FD4B83E0FB3BF22CACED720C24940568FD4567011B3BF4702059020C24940976857B61E0FB3BFE8C002F51EC24940BDF34C4E2A12B3BF2707C7881EC24940C1DA239D370FB3BF341FA2651CC24940968935408820B3BF75394B151AC24940	Arcadia Court, 45 Old Castle Street	E1 7TD	0	\N	Old Castle Street	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
415	0106000020E61000000100000001030000000100000009000000F8DE7CC04408B3BF57AAB9D222C24940DDD7882BDA00B3BFF7E8AB531EC249409752CBF60C0CB3BF95ADFBD41CC24940568FD4567011B3BF4702059020C249403E5305FC410FB3BF7F4B2BDA20C24940560994BE2010B3BF5338907C21C24940EE61FE7C5D0CB3BFCD0010D821C24940990B2B1AE30CB3BF5994C74822C24940F8DE7CC04408B3BF57AAB9D222C24940	Arcadia Court, 45 Old Castle Street	E1 7TD	0	\N	Old Castle Street	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
416	0106000020E610000001000000010300000001000000050000000EE939E336F2B2BFA8382BA31CC2494031AAB24F4C00B3BF3431D0B625C249409268950378E3B2BF94D7ACEA26C2494099301A7A6BDDB2BFA3117EF422C249400EE939E336F2B2BFA8382BA31CC24940	Sloane Apartments, 54 Old Castle Street	E1 7AL	0	\N	Old Castle Street	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
417	0106000020E61000000100000001030000000100000007000000351078368B94B2BF5A3F468B08C24940F2701C164AA3B2BFDAB3082106C249406699AA0938B7B2BFCF582D5604C2494002AD57ADE2C0B2BFCAC1EE8609C24940F9277EB88BADB2BFC9546B620CC24940B6B07D65859FB2BF02BE19910EC24940351078368B94B2BF5A3F468B08C24940	Kensington Apartments	E1 6BF	0	\N	Pomell Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
418	0106000020E61000000100000001030000000100000007000000B6B07D65859FB2BF02BE19910EC24940F9277EB88BADB2BFC9546B620CC24940977457ADE2C0B2BFD67C299817C24940EDB789CB87D3B2BFAD9811DF14C24940953B962C73DCB2BFCD526EED19C24940AE59680CBFBDB2BF0A4F99F71EC24940B6B07D65859FB2BF02BE19910EC24940	Denning Point	E1 6LP	0	\N	Commercial Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
419	0106000020E6100000010000000103000000010000000700000010D8DCF3EDEBB2BF96E9BFBE17C24940953B962C73DCB2BFCD526EED19C24940EDB789CB87D3B2BFAD9811DF14C249401C0D042892D1B2BF94E6B1C213C2494002AD57ADE2C0B2BFCAC1EE8609C24940525227624CD2B2BFD1EBA93107C2494010D8DCF3EDEBB2BF96E9BFBE17C24940	New Evershed House	E1 7AL	0	\N	Old Castle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
420	0106000020E6100000010000000103000000010000000500000002AD57ADE2C0B2BFCAC1EE8609C249406699AA0938B7B2BFCF582D5604C24940AB0839EA23C8B2BF794C9DED01C24940525227624CD2B2BFD1EBA93107C2494002AD57ADE2C0B2BFCAC1EE8609C24940	Bradbury Court	E1 6BF	0	\N	Pomell Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
421	0106000020E610000001000000010300000001000000050000001D61DBFADAC1B2BF836E9CBA22C2494099301A7A6BDDB2BFA3117EF422C249409268950378E3B2BF94D7ACEA26C24940E78283FE8ECAB2BF778AB78528C249401D61DBFADAC1B2BF836E9CBA22C24940	Ladbroke House, 41 Commercial Street	E1 6LN	0	\N	Commercial Street	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
422	0106000020E61000000100000001030000000100000005000000EF7F64043F0DB0BFBF23005962C24940E3751D9A1F12B0BFDAAA53D161C24940A8B01FDEC614B0BF7B2AE42764C24940C411B1837310B0BF8111313365C24940EF7F64043F0DB0BFBF23005962C24940	Bar Nakoda	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
423	0106000020E61000000100000001030000000100000008000000C411B1837310B0BF8111313365C24940C18E0AEA4D0DB0BFD097E09265C2494007A70717BE0DB0BF2DFD490966C249402273BCA57F06B0BF102EF7BB66C24940F3E751DA2303B0BFBE3CE76F63C2494081F39C1ED409B0BF842B70B862C24940EF7F64043F0DB0BFBF23005962C24940C411B1837310B0BF8111313365C24940	Bar Nakoda	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
424	0106000020E61000000100000001030000000100000008000000CD1AEC1C3313B1BFD42BE9F33EC249406EAEB0CE2D0EB1BFAFD5F3443CC2494031867DF51714B1BFC12F4B663BC249402FC9A7892017B1BF45DBB16C3BC24940209D372EF31CB1BF2416F0533EC24940A679545D2019B1BF62E95A393FC24940F4FAB056E216B1BFEAE0064B3EC24940CD1AEC1C3313B1BFD42BE9F33EC24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
425	0106000020E61000000100000001030000000100000009000000D21863075512B1BFE07AD56F41C24940E92DFC70630AB1BF146AA5D33CC249406EAEB0CE2D0EB1BFAFD5F3443CC24940CD1AEC1C3313B1BFD42BE9F33EC24940158143AF9012B1BFBD54FE103FC24940483978097514B1BF0FCD560140C249402203BA90F412B1BF1C9CFC4640C24940A6927CBB6814B1BF3B15281941C24940D21863075512B1BFE07AD56F41C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
426	0106000020E610000001000000010300000001000000050000000990AA5A1B07B1BFC5EC314240C2494024EC69790D03B1BFBA85CDE73DC24940C506FF2EBA06B1BF258B785D3DC24940C0F83017CB0AB1BFE6E290A53FC249400990AA5A1B07B1BFC5EC314240C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
427	0106000020E61000000100000001030000000100000006000000E92DFC70630AB1BF146AA5D33CC24940D21863075512B1BFE07AD56F41C24940EA6E69342F0FB1BF1D9A32F341C24940C0F83017CB0AB1BFE6E290A53FC24940C506FF2EBA06B1BF258B785D3DC24940E92DFC70630AB1BF146AA5D33CC24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	0106000020E61000000100000001030000000100000007000000AE956E7126F6B0BF6AD4B59D45C249407B56C97ED5F2B0BF5B56130E44C24940868A9D1EBCF0B0BF27685FA343C2494075BA935ECDECB0BFA4261E8641C2494048A4A486CEF1B0BFC0DAB8AD40C24940AF5206E97AF9B0BFD74F4CF444C24940AE956E7126F6B0BF6AD4B59D45C24940	38-44 Whitechapel Road	E1 5NB	0	\N	Whitechapel Road	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
429	0106000020E610000001000000010300000001000000070000004CF9810070F2B0BF08B3975A46C24940EB55E5327FE9B0BFB5880A1542C2494075BA935ECDECB0BFA4261E8641C24940868A9D1EBCF0B0BF27685FA343C249407B56C97ED5F2B0BF5B56130E44C24940AE956E7126F6B0BF6AD4B59D45C249404CF9810070F2B0BF08B3975A46C24940	London Mosque Centre, 46 Whitechapel Road	E1 1JX	0	\N	Whitechapel Road	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	0106000020E61000000100000001030000000100000008000000AF5206E97AF9B0BFD74F4CF444C2494048A4A486CEF1B0BFC0DAB8AD40C249402DF675DCCEF6B0BF56E676D53FC2494024EC69790D03B1BFBA85CDE73DC249400990AA5A1B07B1BFC5EC314240C24940252B673236FBB0BF5F8A963B42C24940375F286ABDFEB0BF7F53B4E843C24940AF5206E97AF9B0BFD74F4CF444C24940	38-44 Whitechapel Road	E1 5NB	0	\N	Whitechapel Road	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
431	0106000020E61000000100000001030000000100000005000000AE0087C320EEB0BFCB03D73547C249402FF56A3E08E6B0BFEB59DAAA42C24940EB55E5327FE9B0BFB5880A1542C249404CF9810070F2B0BF08B3975A46C24940AE0087C320EEB0BFCB03D73547C24940	London Mosque Centre, 46 Whitechapel Road	E1 1JX	0	\N	Whitechapel Road	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
432	0106000020E610000001000000010300000001000000070000002CA3C2A370E1B0BF479A9C0B47C249404F46F0BA26DCB0BF83BC195644C24940F4102FB244E5B0BF08CDE1CB42C249402FF56A3E08E6B0BFEB59DAAA42C24940AE0087C320EEB0BFCB03D73547C24940D5F17CF737E5B0BFB6401AFB48C249402CA3C2A370E1B0BF479A9C0B47C24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
433	0106000020E610000001000000010300000001000000060000003338C36C82E2B0BF4E8E04F149C24940EFCF5F0213D9B0BF276926DB44C249404F46F0BA26DCB0BF83BC195644C24940D5F17CF737E5B0BFB6401AFB48C249402A18BDE4CAE5B0BFF624BE3B49C249403338C36C82E2B0BF4E8E04F149C24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
434	0106000020E6100000010000000103000000010000000500000029AD635AABDFB0BF9BC51F7D4AC24940E2100FD23BD6B0BFC3A4F95545C24940EFCF5F0213D9B0BF276926DB44C249403338C36C82E2B0BF4E8E04F149C2494029AD635AABDFB0BF9BC51F7D4AC24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
435	0106000020E6100000010000000103000000010000000A000000740783136BD9B0BF4E605D254AC249409E3C6CDDF5D7B0BF55FC5E6949C249403AF30F142ED9B0BF3A590E2D49C249401A3A69E162D3B0BFE28B18D145C24940E2100FD23BD6B0BFC3A4F95545C249408F23C1966CDBB0BFA8A9A12B48C2494029AD635AABDFB0BF9BC51F7D4AC24940AB25587438DDB0BFA5919CF84AC2494088AD8F14D7DAB0BF232402D549C24940740783136BD9B0BF4E605D254AC24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
436	0106000020E610000001000000010300000001000000080000009E3C6CDDF5D7B0BF55FC5E6949C24940740783136BD9B0BF4E605D254AC24940B792E7696CDBB0BFC3A316814BC249400E394122B7D1B0BF688C5C8C4DC249407CD7C183B7C7B0BFE2C3ABC947C2494091B5619FA3CEB0BF06675B9E46C249406C3C9809C3D4B0BFE15C8E074AC249409E3C6CDDF5D7B0BF55FC5E6949C24940	Bar Indo, 133 Whitechapel Road	E1 1DT	0	\N	Whitechapel Road	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
437	0106000020E610000001000000010300000001000000060000009E3C6CDDF5D7B0BF55FC5E6949C249406C3C9809C3D4B0BFE15C8E074AC2494091B5619FA3CEB0BF06675B9E46C249401A3A69E162D3B0BFE28B18D145C249403AF30F142ED9B0BF3A590E2D49C249409E3C6CDDF5D7B0BF55FC5E6949C24940	Bar Indo, 133 Whitechapel Road	E1 1DT	0	\N	Whitechapel Road	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
438	0106000020E61000000100000001030000000100000005000000EA956D50AFC9B0BF2CCB8EFD4EC2494016BEE391B0BDB0BFAE84940251C2494076D107D210B5B0BF6A06A3764BC24940DB00DB8851C1B0BF690E0D9C49C24940EA956D50AFC9B0BF2CCB8EFD4EC24940	Shell	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
439	0106000020E6100000010000000103000000010000000B0000007B0B7CFFA120B1BF64C5D85640C24940BB3EE8B53A18B1BFEE7EE6E041C24940A03524882D16B1BFE232FEC540C24940A6927CBB6814B1BF3B15281941C249402203BA90F412B1BF1C9CFC4640C24940483978097514B1BF0FCD560140C24940158143AF9012B1BFBD54FE103FC24940F4FAB056E216B1BFEAE0064B3EC24940A679545D2019B1BF62E95A393FC24940209D372EF31CB1BF2416F0533EC249407B0B7CFFA120B1BF64C5D85640C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
440	0106000020E610000001000000010300000001000000040000000CA40FEE1E1DB1BF987C3F5C49C249404BC7A74A7022B1BF9C64094D48C249404BC7A74A7022B1BF9C64094D48C249400CA40FEE1E1DB1BF987C3F5C49C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
441	0106000020E610000001000000010300000001000000060000004BC7A74A7022B1BF9C64094D48C249400F9E08309527B1BF29F348D04AC249401B1067033313B1BFB048D9DF4EC24940C06C6DED460DB1BF04D882CC4CC249400CA40FEE1E1DB1BF987C3F5C49C249404BC7A74A7022B1BF9C64094D48C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
442	0106000020E6100000010000000103000000010000000B0000004BC7A74A7022B1BF9C64094D48C249404BC7A74A7022B1BF9C64094D48C249400CA40FEE1E1DB1BF987C3F5C49C2494064F9999BD71AB1BF2181513F48C2494044078554BC21B1BFE3CEBFDF46C2494018D46F8BC31EB1BF6BCC226C45C249405A996A6B8E1AB1BFBAB9B84246C249403911FF564E16B1BF99603C2F44C2494078D6DCB66623B1BFC12AE7D941C249403B26E456E22BB1BFB8424F6B46C249404BC7A74A7022B1BF9C64094D48C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
443	0106000020E61000000100000001030000000100000017000000C06C6DED460DB1BF04D882CC4CC249401B1067033313B1BFB048D9DF4EC249400F9E08309527B1BF29F348D04AC249404BC7A74A7022B1BF9C64094D48C249403B26E456E22BB1BFB8424F6B46C24940F350EF528C35B1BF1741829A4BC2494088F82476CD34B1BF0FB304254CC249408D1D4F005535B1BFDE9A1B7B4CC249404FD9456A9A36B1BF446727B24CC249406250D418D135B1BFA0D148084EC2494013217CAF0534B1BF95A361214EC2494060E17199A933B1BF51BB689E4EC24940076E0239EA10B1BFCFB3BFDD55C24940E68A73BDF8F6B0BFE08741925BC249402ACB7D3EE1F5B0BF78FD93165BC24940E503756777F2B0BF755EBDD65BC2494047144AF49AECB0BF3982C83E59C24940E169A19252F1B0BF8AE1383558C24940FA50F9B459F2B0BFB30FA9A958C249401FC6E6AF78F3B0BF0A4E8D6A58C249404F73570166EAB0BFB82FC06654C2494039842182D8F5B0BF33FC50E251C24940C06C6DED460DB1BF04D882CC4CC24940	Micro Business Park, 46-50 Greatorex Street	E1	0	\N	Greatorex Street	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
444	0106000020E610000001000000010300000001000000090000001FE6D2C4A5D6B0BFE9AFF0A456C24940B7C16EC621CBB0BF1E04AC4A59C249406ABE70FFDFC3B0BFA9126BFA55C24940D4DEB2205FCFB0BF750D2E8753C249404C301F83E0D0B0BF6E114CEF53C24940BAABB15632D3B0BF546FC27153C24940C433BE77E2D5B0BF496E81AE54C249406FDA674D7CD3B0BFFFCE573055C249401FE6D2C4A5D6B0BFE9AFF0A456C24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
445	0106000020E61000000100000001030000000100000009000000832F6C647ED1B0BF2ABD404F5CC24940D98A950DCEDAB0BF3268B9305AC249407012076424DEB0BF745CF5B25BC249402721F01F88DDB0BFCEA386DA5BC2494032BC89867ADEB0BF2AEB9D445CC249404C5E369DD1E5B0BFFAA6DCAA5AC249407951E9DC08ECB0BF4ADDF2705DC24940F4598C6AEDDBB0BFBD6FDAF560C24940832F6C647ED1B0BF2ABD404F5CC24940	13 Spring Walk	E1 5JA	0	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
446	0106000020E61000000100000001030000000100000008000000B7C16EC621CBB0BF1E04AC4A59C249401FE6D2C4A5D6B0BFE9AFF0A456C24940A20CB9F88FD7B0BF6FBB6D7356C24940A6F64517FADDB0BFCEF24A6759C249405B1FB82FACDAB0BFADF41E1A5AC249400E586FC180D1B0BF8B085E335CC24940E936931F1FD1B0BF3205CA065CC24940B7C16EC621CBB0BF1E04AC4A59C24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
447	0106000020E6100000010000000103000000010000000B0000002A2844A066E5B0BF36CC00634EC2494087A450DFFCDEB0BF9D55029F4FC24940E6A7DF6FDCDFB0BFEAB0AAFC4FC24940DDE383F876CDB0BF6B79A7AA53C2494000DDBB6DA7CCB0BF4693C84553C2494051E2BAE7DBC2B0BFCBB5D33B55C2494019D5D1EDEFBAB0BF75171E2F52C24940FD2CA44928C6B0BFB84166FB4FC24940B68FD55811C7B0BFAA1BF56E50C2494056A6C7A5C1DFB0BF9BC68B964BC249402A2844A066E5B0BF36CC00634EC24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
448	0106000020E61000000100000001030000000100000005000000B670B1C1BBACB0BF67F9736C4FC24940F7E0CE2033A8B0BF0997642F50C2494072A6EAF038A3B0BF653C6A334DC249401EE4EAA9EFA7B0BF1718916F4CC24940B670B1C1BBACB0BF67F9736C4FC24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
449	0106000020E61000000100000001030000000100000005000000F7E0CE2033A8B0BF0997642F50C24940B670B1C1BBACB0BF67F9736C4FC24940CCB0338469B1B0BF0E9F715652C249404FA791CDFCACB0BF7CD9470E53C24940F7E0CE2033A8B0BF0997642F50C24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
450	0106000020E6100000010000000103000000010000001C000000953347290771B0BF43C3F92C59C24940D98E44176E6BB0BF57B8CB9455C249404543E3C4ABA3B0BF258743784DC24940F7E0CE2033A8B0BF0997642F50C24940AD4A046066ABB0BF8D82981A52C249407DDCEF5BF7A0B0BF92F117CC53C24940446A9F0234A3B0BF4884712355C24940036D2B02FFA7B0BF973E4E5C54C24940FB36728280AAB0BFF51174F554C24940B14162B6A9ADB0BFF5FEA49954C2494015714E3F1FAFB0BF08ADF74A55C24940A411E905D3A5B0BFD941E03257C24940459F1A801DA6B0BFF36BB37757C249407DCB88E473A2B0BF606EC82558C249401B69D4A968A3B0BF37BE11A658C249408504C00FA59FB0BF112CFA5859C249400892DD951A9DB0BFC684B29358C24940EB90BCAE1192B0BF2423E70D5AC2494033D8EE44D18FB0BF3F6AF36A58C2494088517F2FFB91B0BF6191CA2058C24940BADCB9709C91B0BFD1F5B99F57C2494050E4400BF899B0BFF2600C6456C24940FBA1D0F27198B0BFB688C36255C24940E0E362ADBA8CB0BF54ED461D57C249409A6524291889B0BF749C8EB754C24940018960A4AA74B0BF27091DBB57C24940F05A6C97EC75B0BF4ADF797D58C24940953347290771B0BF43C3F92C59C24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
451	0106000020E61000000100000001030000000100000005000000D98E44176E6BB0BF57B8CB9455C24940953347290771B0BF43C3F92C59C249408D885793A967B0BFE135B58E5AC249403C6ADBBE2562B0BF627685EB56C24940D98E44176E6BB0BF57B8CB9455C24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
452	0106000020E610000001000000010300000001000000080000008D885793A967B0BFE135B58E5AC2494083F306847C67B0BFAEE9EFA15CC249402F5398B13A63B0BF2B014E215DC24940E4DC5F2D205EB0BFA54330C95BC2494097E0493BE659B0BF935EEC665CC24940570CBEFD7954B0BF49F850C858C249403C6ADBBE2562B0BF627685EB56C249408D885793A967B0BFE135B58E5AC24940	The East London Mosque	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
453	0106000020E6100000010000000103000000010000000500000097E0493BE659B0BF935EEC665CC24940699FB829FD4CB0BFE66E972E5EC24940F0187F05C047B0BF86BA017C5AC24940570CBEFD7954B0BF49F850C858C2494097E0493BE659B0BF935EEC665CC24940	Prime Land Property, 124 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	0106000020E6100000010000000103000000010000000700000065542D637F4CB0BFC195D1D55DC24940FFAB32F59648B0BF2326CB635EC24940B15078916E47B0BF862590985DC24940FA67B3E0FE44B0BF23BF12F15DC249407F7725774C41B0BFEDD620685BC24940F0187F05C047B0BF86BA017C5AC2494065542D637F4CB0BFC195D1D55DC24940	Jaan Sports, 128 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
455	0106000020E61000000100000001030000000100000008000000FA67B3E0FE44B0BF23BF12F15DC2494034F676054C47B0BFB50958A65FC24940A71E74F7E947B0BF74ABBD3860C249404400565D0346B0BF37BB1C4261C24940ADB6F3822A43B0BF6E04D0D061C2494096D555347B3BB0BFD11DD5285CC249407F7725774C41B0BFEDD620685BC24940FA67B3E0FE44B0BF23BF12F15DC24940	Oxygen	E1 1JU	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
492	0106000020E61000000100000001030000000100000005000000EDE275BD2DEDAEBF3686EA8078C24940DAD04FD2D6DFAEBF5EE7D6D273C249409D20FCD1B0E7AEBF4243506173C249405723A73D92F4AEBFDF81800778C24940EDE275BD2DEDAEBF3686EA8078C24940	Grave Maurice	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
456	0106000020E6100000010000000103000000010000000F000000606D289E4293B0BFF85CA87E5BC2494076F8BE8B448EB0BF10184D465CC249407A3D6DD1108FB0BF3F5DB6D35CC249405EC64AAB208CB0BFCB5967495DC249407136D0FC638BB0BFA5335BB95CC24940FFD35BF0ED7EB0BFF8E7A8AB5EC2494084650A95FC80B0BF47BB3E0060C24940EE27773E1F7BB0BF4F5C25E260C24940D26884EDBC79B0BF9D7801FD5FC24940224BC8F9E572B0BF51CB760461C24940D6AC59A1D969B0BF3B2F722A5BC249407C2F1E18E776B0BFC168AB3359C24940F70639641E7CB0BFDA7B39935CC24940301B8F583F90B0BF1838DF8B59C24940606D289E4293B0BFF85CA87E5BC24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
457	0106000020E61000000100000001030000000100000007000000E610829F6676B0BF7B1D8FAE64C2494001AFE4BA3569B0BFA20EECB366C249408A5EB2D72B5FB0BFC459AE9D60C24940728987B94261B0BF4691D74760C24940AABB36ABD266B0BFB7F23EA763C24940BE5CFFA1CC71B0BF39844BE461C24940E610829F6676B0BF7B1D8FAE64C24940	PFC	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
458	0106000020E610000001000000010300000001000000050000003905BEC3807EB0BF110FE10E6CC249407C01A67E7E76B0BF950833A66DC24940D2DDEC15A774B0BFCAC84DBF6CC2494033472327AE7CB0BF7CD807276BC249403905BEC3807EB0BF110FE10E6CC24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
459	0106000020E610000001000000010300000001000000050000007174C1A8A861B0BF9263EFD067C249406F78E845085CB0BF29E1976C65C249409753992FF55EB0BFD2A85BD064C249408C7BB3EF7164B0BFA4C9023A67C249407174C1A8A861B0BF9263EFD067C24940	The East London Mosque	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
460	0106000020E610000001000000010300000001000000050000007C6E61FE36BDB0BF79FB105F5DC24940AEBA6FE00BB6B0BF65943CCC5EC24940C7319F4601B3B0BFE29E04535DC24940FBD6FEAC32BAB0BFFF88FDE35BC249407C6E61FE36BDB0BF79FB105F5DC24940	Motorcycle parking	E1 5NB	0	\N	Davenant Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
461	0106000020E6100000010000000103000000010000000500000038F27D17CEAFB0BF1CF5662568C24940133912DF7CAAB0BF9F5374CC65C24940BFB5969236ADB0BF0744623365C24940CEF71E1A84B2B0BFB60C7D8D67C2494038F27D17CEAFB0BF1CF5662568C24940	4 Spring Walk	E1 5JA	0	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
462	0106000020E61000000100000001030000000100000005000000AB9DA7A8EB8AB0BF2E42765D70C24940AA2D619AA685B0BF584074016EC2494073A7D179F388B0BF6C464C4E6DC24940169868FF408EB0BFF0DC67A86FC24940AB9DA7A8EB8AB0BF2E42765D70C24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
463	0106000020E6100000010000000103000000010000000600000017E47FCF34A1B0BF087301966BC249409764AD5E9D9BB0BF08B6E20569C2494012864E5A599EB0BFA1DE377668C24940B79B5D01A4A3B0BF9FB10CCF6AC2494044ABD0410AA4B0BF714E94036BC2494017E47FCF34A1B0BF087301966BC24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
464	0106000020E61000000100000001030000000100000005000000B8AA3DCAE131B0BFBC84713B60C2494076E191022127B0BF03FACCBD61C24940BD978F294423B0BF4993EE825FC24940F1BAA5D6D82EB0BF743FD9FC5DC24940B8AA3DCAE131B0BFBC84713B60C24940	fashion corner, 132 Whitechapel Road	E1 1JU	0	\N	Whitechapel Road	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
465	0106000020E61000000100000001030000000100000008000000C906F7B3AD26B0BFF1B33B7B61C2494069E3394F1224B0BFF66D4EFF61C24940478E615C4A26B0BFB1CF772263C24940F4ABF87CF121B0BF2D7642AA63C24940863B821A3A1EB0BFA170B5BF60C24940FC266D7EE91EB0BF979CA43160C24940BD978F294423B0BF4993EE825FC24940C906F7B3AD26B0BFF1B33B7B61C24940	fashion corner, 132 Whitechapel Road	E1 1JU	0	\N	Whitechapel Road	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
466	0106000020E61000000100000001030000000100000005000000478E615C4A26B0BFB1CF772263C2494084C9CB12C729B0BF316C666165C24940A9FFC5671524B0BFE36C7BF765C24940F4ABF87CF121B0BF2D7642AA63C24940478E615C4A26B0BFB1CF772263C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
467	0106000020E61000000100000001030000000100000005000000EF98A57F062BB0BF682B2C4266C24940C5F349C90625B0BF3C4EBAFA66C24940A9FFC5671524B0BFE36C7BF765C2494084C9CB12C729B0BF316C666165C24940EF98A57F062BB0BF682B2C4266C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
468	0106000020E61000000100000001030000000100000007000000CFD90F6DB828B0BFD0EC59F26AC2494007A2E7DC5730B0BF3C9C21006AC24940552CEEE5B138B0BF62C3F62C69C2494035174887503AB0BFF2F8E6566AC249404FD7917D4232B0BFB3C9C2686BC249403AEBF49B7D2AB0BF178BE68C6CC24940CFD90F6DB828B0BFD0EC59F26AC24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
469	0106000020E610000001000000010300000001000000080000003AEBF49B7D2AB0BF178BE68C6CC24940F4E81C9B5432B0BF41B61E666BC249406F85C2C24838B0BFB6BCEE9B6AC24940A0020850913AB0BF2E4E62456CC24940883D396EE134B0BFB6F2AC246DC2494012241EAC8835B0BF5F4F2DA76DC249408734EC97252DB0BF7207A0476FC249403AEBF49B7D2AB0BF178BE68C6CC24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
470	0106000020E61000000100000001030000000100000006000000360EE568385BB0BF551E025379C24940B33308C3BF52B0BFBCC4C0D27AC2494079AE1059ED50B0BF92E3A1CA79C2494041AC9C0DE955B0BF7AB777EC78C24940E7DDF06A6B59B0BF75440F5378C24940360EE568385BB0BF551E025379C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	0106000020E6100000010000000103000000010000000E00000083B3E7FC3A7EB0BFAA19516C72C249405E0B2925C57BB0BF64B96FED72C2494024D04AAC057DB0BF52FD848073C249404DB24D449077B0BF8C2D68AA74C249405A9D9F792776B0BFEC8D291474C24940601CB7B23672B0BF8FA7F6E274C24940188852836D73B0BF693A0A7D75C2494045D9F6DB1D6EB0BF1DAAE38B76C249408B9D4F521D6DB0BF364291EE75C249405D4D0AEF126BB0BF8A49A85976C249401F56BA790F66B0BFB9EC73F873C2494062E8FF030979B0BF0CFDA51470C249407E8DEDC4E679B0BF99BAE77D70C2494083B3E7FC3A7EB0BFAA19516C72C24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
472	0106000020E61000000100000001030000000100000008000000C7C31E9E8304B0BFB3683BC964C249405CC71E9E8304B0BFB7683BC964C24940900664E37302B0BFBC7DBB1365C24940C29BA4579B04B0BF35EA716367C24940360004186000B0BFB16E501068C249409FD3D71C65F8AFBF28486C3264C24940F3E751DA2303B0BFBE3CE76F63C24940C7C31E9E8304B0BFB3683BC964C24940	Bar Nakoda	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	0106000020E610000001000000010300000001000000070000006779E5E8F3F9AFBFFA23792269C2494087E3280AFFEFAFBF4C6BE7A664C249409FD3D71C65F8AFBF28486C3264C24940A0848EC359FEAFBF2FF5FAF366C24940360004186000B0BFB16E501068C24940F711CEC5CE00B0BFD47CF67D68C249406779E5E8F3F9AFBFFA23792269C24940	Bar Nakoda	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
474	0106000020E610000001000000010300000001000000050000000B68B76232F3AFBF7F42E09269C24940C90FA60B0CE9AFBF4F08480765C2494087E3280AFFEFAFBF4C6BE7A664C249408DBA59D97BF9AFBFD47A3BEC68C249400B68B76232F3AFBF7F42E09269C24940	Bar Nakoda	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
475	0106000020E61000000100000001030000000100000005000000AD81C3A830EBAFBF3F082A716AC249402C878890C1E0AFBF5D54447A65C24940C90FA60B0CE9AFBF4F08480765C249400B68B76232F3AFBF7F42E09269C24940AD81C3A830EBAFBF3F082A716AC24940	Bar Nakoda	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
476	0106000020E610000001000000010300000001000000050000002C878890C1E0AFBF5D54447A65C24940AD81C3A830EBAFBF3F082A716AC249408C29388175E3AFBFE25AF3FC6AC24940886C33AD0CD8AFBFC44404F365C249402C878890C1E0AFBF5D54447A65C24940	Bar Nakoda	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
477	0106000020E610000001000000010300000001000000050000002CFCBAD61FD0AFBF2680725B66C249404FFFD343C1DDAFBFE0F7F0776CC24940A0CB9105DBD6AFBFC290D5F66CC24940B5662F853BC8AFBF5F6470C366C249402CFCBAD61FD0AFBF2680725B66C24940	Bar Nakoda	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
478	0106000020E61000000100000001030000000100000005000000B47DB3B2D0CFAFBFE6C1146C6DC2494026BB896A28C0AFBF3DB2D62D67C24940B5662F853BC8AFBF5F6470C366C24940A0CB9105DBD6AFBFC290D5F66CC24940B47DB3B2D0CFAFBFE6C1146C6DC24940	BT	E1 1JU	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
479	0106000020E6100000010000000103000000010000000700000026BB896A28C0AFBF3DB2D62D67C24940B47DB3B2D0CFAFBFE6C1146C6DC24940423F805D10D1AFBF3FB893EC6DC24940335D648020C7AFBF2A7531926EC24940C81EE2C34CBBAFBFA21386B369C2494002FA2A98B7B6AFBF77223DAA67C2494026BB896A28C0AFBF3DB2D62D67C24940	McDonald's	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
480	0106000020E61000000100000001030000000100000005000000C81EE2C34CBBAFBFA21386B369C249400937E6A77FB3AFBFD96067336AC249407732426D59AEAFBF7BD7711F68C2494002FA2A98B7B6AFBF77223DAA67C24940C81EE2C34CBBAFBFA21386B369C24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481	0106000020E610000001000000010300000001000000060000003ED8BF87A1B9AFBFE22321056CC24940DA45A5E707AFAFBF58D00DB76CC24940460E94E880ACAFBFF6DFFCB96BC249404805F71E11B3AFBF34F30E4F6BC24940B74150D62BB7AFBF0CB4B50D6BC249403ED8BF87A1B9AFBFE22321056CC24940	McDonald's	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
482	0106000020E6100000010000000103000000010000000E000000A24A49E9CDA7AFBF0F73120E71C2494090ABBE929C98AFBF859679FB71C249403620E2A17799AFBFE381C35F72C24940F8B7EDD1A293AFBF3375BAC472C24940A875B3A93391AFBFC99CFEA771C24940C061D68E579BAFBF474471FF70C2494067FBD0665097AFBF3553C2576FC249402A114C16988DAFBF8DE802E86FC24940502CA1CEE38CAFBF54DA9EF16FC249408B3A41E1EA80AFBF77280DA86AC24940C6426C82A081AFBF14150F986AC24940ABB058011193AFBFE397349269C24940145158407496AFBF78E5AABB69C24940A24A49E9CDA7AFBF0F73120E71C24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
484	0106000020E61000000100000001030000000100000006000000D3A60DAE867AAFBFEE18245F6EC24940DBC0BD127D74AFBFB1C861C76EC24940CD16115D6470AFBF59A8403F6DC24940FEB542B23F6BAFBFBFB9E9ED6BC24940264B64289572AFBF1B00917A6BC24940D3A60DAE867AAFBFEE18245F6EC24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
485	0106000020E61000000100000001030000000100000009000000FEB542B23F6BAFBFBFB9E9ED6BC24940CD16115D6470AFBF59A8403F6DC24940DBC0BD127D74AFBFB1C861C76EC24940C7FB7050CE6EAFBF0961B8226FC24940F2637DB16770AFBF6DD655C16FC249407F10CA732869AFBF9362D13570C2494091A814C16960AFBF99BC6CD26CC2494022FD7FFE7061AFBF3B57E66B6CC24940FEB542B23F6BAFBFBFB9E9ED6BC24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
486	0106000020E610000001000000010300000001000000070000000756EF829773AFBF7F29B30E74C24940CE7DC5C0326DAFBF906D6C7C71C2494034710C00418CAFBF4755B8A96FC24940502CA1CEE38CAFBF54DA9EF16FC24940A875B3A93391AFBFC99CFEA771C249401F75D9934792AFBF92DF102672C249400756EF829773AFBF7F29B30E74C24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
487	0106000020E61000000100000001030000000100000009000000254ED6FADB16AFBF09730BC373C249407EC08DA5DF0FAFBF81604D1C71C24940B886B633C328AFBFCEEE6CB46FC24940723D9B028A2FAFBF71920D4872C2494099D89F71CF3CAFBFC4166D2077C24940AAD98BE04E29AFBFD4203F7A78C2494079157F492526AFBF4B73808177C2494009C207BB1223AFBF6A6E37BF77C24940254ED6FADB16AFBF09730BC373C24940	Pizza Hut	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
488	0106000020E6100000010000000103000000010000000600000092F257FD5317AFBFA29C54C079C24940D1E1B6EB2C02AFBF84F05DE271C249407EC08DA5DF0FAFBF81604D1C71C24940254ED6FADB16AFBF09730BC373C2494075129BBC3826AFBF526531C678C2494092F257FD5317AFBFA29C54C079C24940	Pizza Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
489	0106000020E6100000010000000103000000010000000500000055BE4478BA0FAFBFF9B07A437AC24940013067E91BFAAEBFB843005772C24940D1E1B6EB2C02AFBF84F05DE271C2494092F257FD5317AFBFA29C54C079C2494055BE4478BA0FAFBFF9B07A437AC24940	Pizza Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
490	0106000020E61000000100000001030000000100000005000000C62D3CFFB308AFBFA57540BF7AC24940DFBD53567AF2AEBFE54157C572C24940013067E91BFAAEBFB843005772C2494055BE4478BA0FAFBFF9B07A437AC24940C62D3CFFB308AFBFA57540BF7AC24940	Grave Maurice	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
491	0106000020E61000000100000001030000000100000005000000CEEB8DA129FEAEBF6325C27D7BC249409D20FCD1B0E7AEBF4243506173C24940DFBD53567AF2AEBFE54157C572C24940C62D3CFFB308AFBFA57540BF7AC24940CEEB8DA129FEAEBF6325C27D7BC24940	Grave Maurice	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
493	0106000020E61000000100000001030000000100000008000000285C75353BDEAEBF37FA6BA376C249402F6CB83E9CD7AEBF85E0D14974C24940DAD04FD2D6DFAEBF5EE7D6D273C2494053AFCDFDAEE6AEBF12C1332676C24940EDE275BD2DEDAEBF3686EA8078C2494058ACEEE834E6AEBFC88037FD78C2494057C776D59EDFAEBF1DECA18C76C24940285C75353BDEAEBF37FA6BA376C24940	Grave Maurice	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
494	0106000020E61000000100000001030000000100000007000000267A043154D9AEBF76C09EFD78C249400B02F43700CEAEBF8143C3D474C249402F6CB83E9CD7AEBF85E0D14974C24940285C75353BDEAEBF37FA6BA376C249407274B5A275DBAEBF3F92E4D076C24940F29C92C9C3DFAEBFECC0D59778C24940267A043154D9AEBF76C09EFD78C24940	Grave Maurice	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
495	0106000020E610000001000000010300000001000000070000006C172297E0D3AEBF9329ED4F7AC24940B41207175EC5AEBFEF48975175C249400B02F43700CEAEBF8143C3D474C24940267A043154D9AEBF76C09EFD78C249404EC01EE45FD8AEBFAF7C501079C249404EC828286BDAAEBFEA2935C079C249406C172297E0D3AEBF9329ED4F7AC24940	Londis	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
496	0106000020E61000000100000001030000000100000005000000FCD2A28EB5C1AEBFE07530967AC2494023024DEF6CB5AEBF4B05183876C24940B41207175EC5AEBFEF48975175C249401791F3A3F1D1AEBFE05B97A579C24940FCD2A28EB5C1AEBFE07530967AC24940	Londis	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
497	0106000020E610000001000000010300000001000000090000001D4C23D11896AEBF54434FFC7AC24940A326D6420898AEBFD32E9DDF7AC24940349FC10E01A6AEBF650783E87CC249401C676135388EAEBF3536B99780C24940D8101B5FE986AEBF283029AC7DC24940C15E0E79F782AEBF12E1B32F7CC24940AC58A704707CAEBFB87FCE9379C24940C9E5E558FB8FAEBF37B5CA7378C249401D4C23D11896AEBF54434FFC7AC24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
498	0106000020E61000000100000001030000000100000009000000AC58A704707CAEBFB87FCE9379C24940C15E0E79F782AEBF12E1B32F7CC249407142073E2180AEBF2DFAE95B7CC249403A194401E183AEBF95A46CDB7DC24940D8101B5FE986AEBF283029AC7DC249401C676135388EAEBF3536B99780C24940746DC5F75F7EAEBF9F2DB4A481C2494044B9FB14576CAEBF7134F7817AC24940AC58A704707CAEBFB87FCE9379C24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
499	0106000020E6100000010000000103000000010000000500000044B9FB14576CAEBF7134F7817AC249406D000448F57CAEBFAED6FB1581C249405D0823236B72AEBFF3799ABB81C24940F9D75ED00962AEBF1FFD16207BC2494044B9FB14576CAEBF7134F7817AC24940	Whitechapel Market	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
500	0106000020E61000000100000001030000000100000006000000178F10FDA45EAEBFBC2D44667EC249407B496D6ECA57AEBF7FE034BA7BC24940F9D75ED00962AEBF1FFD16207BC249405D0823236B72AEBFF3799ABB81C24940002E94526768AEBF5403085082C24940178F10FDA45EAEBFBC2D44667EC24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
501	0106000020E610000001000000010300000001000000050000001E5010975463AEBF0D03F23282C249406E8AC2641F53AEBF216269007CC249407B496D6ECA57AEBF7FE034BA7BC24940A26962D38B67AEBFACC53CF281C249401E5010975463AEBF0D03F23282C24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
502	0106000020E6100000010000000103000000010000000700000081C32F46DF59AEBF0454A08A82C2494002F76F467749AEBFD42AA4917CC249406E8AC2641F53AEBF216269007CC2494020D9BD96BD61AEBFEF03529781C249400FDB583F6A5FAEBF01CC49C181C249400477300A4660AEBFD539613582C2494081C32F46DF59AEBF0454A08A82C24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
503	0106000020E610000001000000010300000001000000050000002B79E57E6550AEBF50C8C2AA82C24940777037131741AEBF3B349B0F7DC2494002F76F467749AEBFD42AA4917CC2494099C260E6B758AEBF3FF2181F82C249402B79E57E6550AEBF50C8C2AA82C24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
504	0106000020E610000001000000010300000001000000050000006C6519EFE844AEBFD2087C4F82C2494085E5586BA737AEBF4E99849D7DC24940777037131741AEBF3B349B0F7DC24940A5E40739FC4DAEBF1A23AEC881C249406C6519EFE844AEBFD2087C4F82C24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
505	0106000020E610000001000000010300000001000000060000002781F3ECE339AEBF0158570382C24940D0316F2DAC35AEBF3F4B5D8380C24940144D5388092FAEBF2B241B1F7EC2494085E5586BA737AEBF4E99849D7DC24940776E7F738242AEBF1B98D67581C249402781F3ECE339AEBF0158570382C24940	Whitechapel Market	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
506	0106000020E610000001000000010300000001000000070000005504B9F1472BAEBFE1AC0BC080C249400FF8D2027E25AEBF0460A7AE7EC24940144D5388092FAEBF2B241B1F7EC24940D0316F2DAC35AEBF3F4B5D8380C2494096316F2DAC35AEBF404B5D8380C249403C3EEB231C2CAEBFF3C0231681C249405504B9F1472BAEBFE1AC0BC080C24940	Whitechapel Market	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
507	0106000020E6100000010000000103000000010000000500000035A2AADEA921AEBF2476A95381C249409EF22968EE1BAEBFDFE1703E7FC249400FF8D2027E25AEBF0460A7AE7EC249405504B9F1472BAEBFE1AC0BC080C2494035A2AADEA921AEBF2476A95381C24940	Whitechapel Market	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
508	0106000020E610000001000000010300000001000000050000009EF22968EE1BAEBFDFE1703E7FC2494035A2AADEA921AEBF2476A95381C249407271B6BB6118AEBFEE1520E281C249401CB5C1F02513AEBF907287C27FC249409EF22968EE1BAEBFDFE1703E7FC24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
509	0106000020E6100000010000000103000000010000000700000069A93BA969B5AEBF9B72D73A76C24940FCD2A28EB5C1AEBFE07530967AC24940738EB58E30B9AEBFA31257277BC2494075FCFBB006BBAEBF8DC732D37BC24940396A60E0D8B3AEBF2A7C12437CC24940247D5F71F0A4AEBF79AB963277C2494069A93BA969B5AEBF9B72D73A76C24940	Whitechapel Market	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	0106000020E61000000100000001030000000100000007000000247D5F71F0A4AEBF79AB963277C24940A776BAD071AEAEBF1B873B6D7AC249406BE1258E1BAAAEBF9738B2BC7AC24940E4DF6E1AE0A6AEBF14BAF59B79C2494026E5742BB2A2AEBFD75F8CE679C24940E9D87FCA779CAEBF16A531BA77C24940247D5F71F0A4AEBF79AB963277C24940	Whitechapel Market	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	0106000020E61000000100000001030000000100000007000000CCACF31D3650AFBF9F102A366FC249407D8B2488C14BAFBFB65417956DC24940C34AB3292452AFBF24AAF2316DC249404B57B09DBA54AFBF948F366A6DC2494021F08C19F65CAFBFFF70B37570C24940D4DFF0B73355AFBF76831A0771C24940CCACF31D3650AFBF9F102A366FC24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
512	0106000020E61000000100000001030000000100000005000000B2F73C4E5533AFBFAF294C106FC249402EA5B1BB8043AFBFF2CDFB1B75C2494070E6D7991339AFBFD97180CD75C24940B886B633C328AFBFCEEE6CB46FC24940B2F73C4E5533AFBFAF294C106FC24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
513	0106000020E61000000100000001030000000100000007000000852564A7C03CAFBF63D40B7E6EC24940858B096D0843AFBFA0DCCCFC70C249404E64AC15DB46AFBFBD74147272C24940EC096D662C4CAFBF71A35B8874C249402EA5B1BB8043AFBFF2CDFB1B75C24940B2F73C4E5533AFBFAF294C106FC24940852564A7C03CAFBF63D40B7E6EC24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
514	0106000020E61000000100000001030000000100000008000000323E11B4B943AFBF63C8C7116EC24940ADF3780CF44DAFBF5BCDD4CD71C249404E64AC15DB46AFBFBD74147272C249405A7EF5A32E43AFBFAE7D43FA70C249404C8B096D0843AFBFA0DCCCFC70C24940858B096D0843AFBFA0DCCCFC70C24940852564A7C03CAFBF63D40B7E6EC24940323E11B4B943AFBF63C8C7116EC24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	0106000020E610000001000000010300000001000000060000007D8B2488C14BAFBFB65417956DC24940CCACF31D3650AFBF9F102A366FC24940D4DFF0B73355AFBF76831A0771C24940ADF3780CF44DAFBF5BCDD4CD71C24940323E11B4B943AFBF63C8C7116EC249407D8B2488C14BAFBFB65417956DC24940	Chicken Hut	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
516	0106000020E610000001000000010300000001000000050000001CB5C1F02513AEBF907287C27FC24940A08E31B56215AEBF0249EBAA80C2494070888640B6DFADBFED7DB5F983C2494026B2254B70DDADBFD428411483C249401CB5C1F02513AEBF907287C27FC24940	Whitechapel Idea Store	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
517	0106000020E6100000010000000103000000010000000700000026B2254B70DDADBFD428411483C2494070888640B6DFADBFED7DB5F983C249409006E77D5AE8ADBF8C9D7C2E87C2494017B296CF97DCADBF19D2A2FE87C249402D73DB347FD2ADBFB6303E7184C249404D6BBBEB21D3ADBFBA712DBE83C2494026B2254B70DDADBFD428411483C24940	Whitechapel Idea Store	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
518	0106000020E61000000100000001030000000100000007000000A7D12062FCD4ADBF6647637F8EC2494039252CDC39A1ADBF4F7D7CA591C249404C64A4036B97ADBF53B662EC8CC249405C725FA30592ADBF841AC84C8DC2494032864CB51884ADBF037E898887C24940800DADEFBCBBADBFAE45AE3483C24940A7D12062FCD4ADBF6647637F8EC24940	Whitechapel Idea Store	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
519	0106000020E61000000100000001030000000100000005000000CD14637BDDEFADBFBB408AE389C249400B7ACFB97EE3ADBFF035A0AD8AC2494059A1BE2FA1DFADBFA5BEFD4889C249402964B0F0FFEBADBFFDD5E77E88C24940CD14637BDDEFADBFBB408AE389C24940	Whitechapel Idea Store	E1 1AA	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	0106000020E6100000010000000103000000020000000E000000B48A5025566AADBF4D41A6B194C24940C627072C9661ADBF335E182D94C24940C627072C9661ADBF335E182D94C2494042706644EC5EADBF4D55108393C249409B77B5086A45ADBF82C133EB94C2494057B225220C3CADBF0A7366D290C24940D6995ED2EA34ADBF3127422E91C2494019AB64CCFA29ADBF634C2C148CC2494064E354F0CD52ADBFA8DF10D989C24940D42034930B54ADBFDF55A14E8AC249403959238CF971ADBFA14839A188C249403306706A5F7FADBF95727EF487C24940A78449B0E797ADBF1A6BA74192C24940B48A5025566AADBF4D41A6B194C249400D000000C1DC05DCEF76ADBFED8502A88FC249401BC3B6A6DA74ADBF32F1FAC08EC2494021F44BF0DB7BADBF0EFC4C5C8EC24940C65AA8D66875ADBFE879E8908BC24940AF1CA618A878ADBFC43B3D628BC249400DE26E007772ADBF159A98C588C24940CA2545BA145BADBFB8AC4F128AC24940B328F3A94F5CADBF7583E7B58AC2494089B8754FEC5EADBF9CF67F908AC24940BF1E83A5F561ADBF257191FB8BC249402622227B0159ADBFECE0EF7A8CC24940B922A09A9B63ADBF8F67BBB590C24940C1DC05DCEF76ADBFED8502A88FC24940	Albion Yard, 331-335 Whitechapel Road	E1 1BW	0	\N	Whitechapel Road	331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	0106000020E61000000100000001030000000100000008000000D6995ED2EA34ADBF3127422E91C24940F5DCA55A5737ADBFA493D13892C24940470E6F71F72FADBF63B3089C92C24940E15BDD40202EADBFC29332D391C249404FAF053F6226ADBF08430D4392C24940EB14D7AE4D1AADBF459760FA8CC2494019AB64CCFA29ADBF634C2C148CC24940D6995ED2EA34ADBF3127422E91C24940	Albion Yard, 331-335 Whitechapel Road	E1 1BW	0	\N	Whitechapel Road	331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	0106000020E6100000010000000103000000010000000F000000E9D87FCA779CAEBF16A531BA77C2494026E5742BB2A2AEBFD75F8CE679C24940CB5BF8E837C1AEBFEB4029E87EC2494057BB7FEA2FBFAEBF2E86A0447FC24940D4F9FF2A43CEAEBF65575E2C81C24940E991A2F4D5F9AEBFAAD443AB7EC24940D5B17184F42DAFBF44C868AC7BC24940DDA0990D173BAFBFA3F9FBBB80C24940912F008375F0AEBFBB83367285C24940415CA714D7EEAEBFB3732FBF84C2494097FD905A21E1AEBF53F4D28485C24940A326D6420898AEBFD32E9DDF7AC249402CE847910996AEBF604C44FD7AC24940C9E5E558FB8FAEBF37B5CA7378C24940E9D87FCA779CAEBF16A531BA77C24940	Trinity Hall, 6 Durward Street	E1 5BA	0	\N	Durward Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	0106000020E610000001000000010300000001000000050000002B04C5E24B2EAFBFC1A6993A8AC2494020026BA3A910AFBFEE6DF24B8CC24940C6E200B89D01AFBF6D90AC5E87C24940643D0DB6EA1EAFBFAD776B3185C249402B04C5E24B2EAFBFC1A6993A8AC24940	Trinity Hall, 6 Durward Street	E1 5BA	0	\N	Durward Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
524	0106000020E61000000100000001030000000100000005000000DA04347AA33DAFBF499A81B294C24940334CE2C9C828AFBF8191C08E97C24940552D6CD1CAFEAEBF8868361C90C24940ABE1ED9ABF17AFBF2C90105F8EC24940DA04347AA33DAFBF499A81B294C24940	Trinity Hall, 6 Durward Street	E1 5BA	0	\N	Durward Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	0106000020E61000000100000001030000000100000005000000B3F7FC38A7FDAFBF6760703A7BC249403A6755CB3FF7AFBF934CB69578C249409A2244AE0E00B0BF933408FE77C24940B9951D015F03B0BFBE94F1AA7AC24940B3F7FC38A7FDAFBF6760703A7BC24940	83 Durward Street	E1 5BA	0	\N	Durward Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
560	0106000020E61000000100000001030000000100000005000000DF8FC4866678B0BF7A5BA30669C24940D844DF315470B0BF992226A16AC249401CAA6618F66DB0BF40E2477869C24940DA8250980E76B0BFD56F8BDC67C24940DF8FC4866678B0BF7A5BA30669C24940	PFC	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
526	0106000020E6100000010000000103000000010000000600000052B6DFF3E3ECAFBFA35FAEC17CC24940FDCC2A4156E7AFBFEDDD1D767AC249404C3DEB2421F0AFBF3AE36AF879C24940E10126499BF4AFBF72C543C97BC24940E9929C58B4F5AFBF98252E467CC2494052B6DFF3E3ECAFBFA35FAEC17CC24940	81 Durward Street	E1 5BA	0	\N	Durward Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
527	0106000020E610000001000000010300000001000000060000004B0546115CDDAFBF53FC1ACA7EC249406A18A4D30BD7AFBF34C9C3587CC249400BBC3AE11AD8AFBF21CE35487CC249402736BA9942E1AFBFF4A158BC7BC249409FDC465FC3E6AFBF092114377EC249404B0546115CDDAFBF53FC1ACA7EC24940	75 Durward Street	E1 5BA	0	\N	Durward Street	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
528	0106000020E61000000100000001030000000100000006000000FA187B331818B0BFB4895CB477C2494082A7C031E814B0BFAAD7744E75C24940661AEB17C019B0BFA55CBBAE74C249400A9E1911481DB0BFC31B8D5977C249404A4F9DF57218B0BF3288EAF877C24940FA187B331818B0BFB4895CB477C24940	95 Durward Street	E1 5BA	0	\N	Durward Street	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
529	0106000020E61000000100000001030000000100000006000000EFA484278A2DB0BFE4DC69157DC249403516ACBC1B24B0BF4A0742057EC249404E8092F9B51DB0BFE099E09C77C2494005307396BA1DB0BF56DAF08776C249401D7F20C08A26B0BF56ECAA4A75C24940EFA484278A2DB0BFE4DC69157DC24940	24 Vallance Road	E1 5NU	0	\N	Vallance Road	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
530	0106000020E6100000010000000103000000010000000800000035E63504161EB0BF035905626CC249409D7B2894EE21B0BF15211E9D6FC2494050238AE8C020B0BF6693AB7470C2494042C935939D19B0BFA9025F1671C24940E1126390B617B0BF3FE9D6FE6EC2494022C41B262819B0BFB68D22DE6EC249401DE9262B9D17B0BFE368CD2B6DC2494035E63504161EB0BF035905626CC24940	95 Durward Street	E1 5BA	0	\N	Durward Street	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	0106000020E610000001000000010300000001000000050000001D7F20C08A26B0BF56ECAA4A75C2494005307396BA1DB0BF56DAF08776C24940225B12CD6E1AB0BF2EB08C0C74C24940F954977E7024B0BFA500461C73C249401D7F20C08A26B0BF56ECAA4A75C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
532	0106000020E610000001000000010300000001000000190000000CA40FEE1E1DB1BF987C3F5C49C249404F73570166EAB0BFB82FC06654C2494011244F9714E9B0BF8E3866D953C2494058B009774FE8B0BFF976390C54C249403304400F81E9B0BFED28928D54C2494018A3E052E6E1B0BF16A9523956C249407B3FF3A3DCE4B0BFCA5C87B557C24940A6F64517FADDB0BFCEF24A6759C24940A20CB9F88FD7B0BF6FBB6D7356C249401FE6D2C4A5D6B0BFE9AFF0A456C249406FDA674D7CD3B0BFFFCE573055C24940C433BE77E2D5B0BF496E81AE54C24940BAABB15632D3B0BF546FC27153C249404C301F83E0D0B0BF6E114CEF53C24940D4DEB2205FCFB0BF750D2E8753C2494046AC115419E0B0BF8A212D2A50C24940E6A7DF6FDCDFB0BFEAB0AAFC4FC2494087A450DFFCDEB0BF9D55029F4FC249402A2844A066E5B0BF36CC00634EC249402A442BB06B14B1BFB337F0D444C24940DF1DAE74F613B1BFBCB71F9A44C249403911FF564E16B1BF99603C2F44C249405A996A6B8E1AB1BFBAB9B84246C24940983104903318B1BF8C90D8D846C249400CA40FEE1E1DB1BF987C3F5C49C24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
533	0106000020E610000001000000010300000001000000090000002A442BB06B14B1BFB337F0D444C2494076AA42DB9808B1BF98D8073C47C24940D8C885CDBEFDB0BF4515F1CF41C249400990AA5A1B07B1BFC5EC314240C24940C0F83017CB0AB1BFE6E290A53FC24940EA6E69342F0FB1BF1D9A32F341C24940188BAD3BF011B1BF4F0E1A7F43C24940DF1DAE74F613B1BFBCB71F9A44C249402A442BB06B14B1BFB337F0D444C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
534	0106000020E6100000010000000103000000010000000C0000007702663235E8B0BFA7C4FBD04DC249407728DE94ECE1B0BFD41AC58C4AC24940A42FF947C5EFB0BFC5E8CFF347C24940AE0087C320EEB0BFCB03D73547C249404CF9810070F2B0BF08B3975A46C24940AE956E7126F6B0BF6AD4B59D45C24940AF5206E97AF9B0BFD74F4CF444C24940582766E763FDB0BFC25A5E2D44C249401B3F3E4F1DFFB0BF3A07200C45C24940C5E038B3B702B1BF554BF64B44C2494076AA42DB9808B1BF98D8073C47C249407702663235E8B0BFA7C4FBD04DC24940	The Denim Factory, 4-6 Davenant Street	E1 5NB	0	\N	Davenant Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
535	0106000020E61000000100000001030000000100000007000000BB3EE8B53A18B1BFEE7EE6E041C249407B0B7CFFA120B1BF64C5D85640C2494078D6DCB66623B1BFC12AE7D941C24940DF1DAE74F613B1BFBCB71F9A44C24940188BAD3BF011B1BF4F0E1A7F43C249400EA0544DE718B1BF848ADF3D42C24940BB3EE8B53A18B1BFEE7EE6E041C24940	Islamic Bank of England	E1	0	\N	Greatorex Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
536	0106000020E61000000100000001030000000100000006000000D858319867C0B0BF609CC75B64C249400DE56798CBC6B0BF8976990463C249400DE56798CBC6B0BF8976990463C24940F23A1647C2C9B0BFFE578E7764C24940AF59230663C3B0BF23C595C665C24940D858319867C0B0BF609CC75B64C24940	7 Spring Walk	E1 5JA	0	\N	\N	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
537	0106000020E61000000100000001030000000100000006000000ECB3F08B68BDB0BF660741EF62C2494082EF8DD5D6C3B0BF01D8949261C249400DE56798CBC6B0BF8976990463C249400DE56798CBC6B0BF8976990463C24940D858319867C0B0BF609CC75B64C24940ECB3F08B68BDB0BF660741EF62C24940	Motorcycle parking	E1 5NB	0	\N	Davenant Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
538	0106000020E610000001000000010300000001000000060000008C2AB06EB8BAB0BF77473DA861C2494019C6449926C1B0BF3877114260C2494082EF8DD5D6C3B0BF01D8949261C2494082EF8DD5D6C3B0BF01D8949261C24940ECB3F08B68BDB0BF660741EF62C249408C2AB06EB8BAB0BF77473DA861C24940	Motorcycle parking	E1 5NB	0	\N	Davenant Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
539	0106000020E610000001000000010300000001000000050000002F797C2AECB7B0BFC25DD85360C24940302461038EBEB0BFCC371EFD5EC2494019C6449926C1B0BF3877114260C249408C2AB06EB8BAB0BF77473DA861C249402F797C2AECB7B0BFC25DD85360C24940	Motorcycle parking	E1 5NB	0	\N	Davenant Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
540	0106000020E61000000100000001030000000100000005000000368F82D402B0B0BF8601B0DF5BC249402672372811B7B0BF91A702625AC24940FBD6FEAC32BAB0BFFF88FDE35BC24940C7319F4601B3B0BFE29E04535DC24940368F82D402B0B0BF8601B0DF5BC24940	Motorcycle parking	E1 5NB	0	\N	Davenant Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
541	0106000020E61000000100000001030000000100000006000000AEBA6FE00BB6B0BF65943CCC5EC249407C6E61FE36BDB0BF79FB105F5DC249404912BEFAF3BFB0BFF3B4E0B55EC24940302461038EBEB0BFCC371EFD5EC24940DE1E6BB5D3B8B0BFD2281B2560C24940AEBA6FE00BB6B0BF65943CCC5EC24940	Motorcycle parking	E1 5NB	0	\N	Davenant Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
542	0106000020E610000001000000010300000001000000050000002672372811B7B0BF91A702625AC24940368F82D402B0B0BF8601B0DF5BC249408D98448AD4ACB0BF4D212D555AC2494076AA42D60EB4B0BFC34CF1E458C249402672372811B7B0BF91A702625AC24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
543	0106000020E610000001000000010300000001000000070000008D98448AD4ACB0BF4D212D555AC24940DE7CDC32DDA7B0BF07CC4CC757C24940F63B648FC0B3B0BF5028FB9655C2494084FAC30A2EB6B0BFDD4C74DF56C2494078C24694AFB1B0BF83C744B357C2494076AA42D60EB4B0BFC34CF1E458C249408D98448AD4ACB0BF4D212D555AC24940	Salvation Army	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
544	0106000020E61000000100000001030000000100000005000000133912DF7CAAB0BF9F5374CC65C2494038F27D17CEAFB0BF1CF5662568C24940E0D008C8B1ACB0BF0354B5D368C249409B38182A61A7B0BFF2C0067B66C24940133912DF7CAAB0BF9F5374CC65C24940	3 Spring Walk	E1 5JA	0	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
545	0106000020E610000001000000010300000001000000050000009B38182A61A7B0BFF2C0067B66C24940E0D008C8B1ACB0BF0354B5D368C24940EACBDCDB71A9B0BF3130CF8969C249405BDB4FDF21A4B0BFB3B6673167C249409B38182A61A7B0BFF2C0067B66C24940	2 Spring Walk	E1 5JA	0	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
546	0106000020E610000001000000010300000001000000050000005BDB4FDF21A4B0BFB3B6673167C24940EACBDCDB71A9B0BF3130CF8969C24940CB0984BB5EA6B0BF9BC01A366AC249409BF9A9570FA1B0BF998CF6DD67C249405BDB4FDF21A4B0BFB3B6673167C24940	2 Spring Walk	E1 5JA	0	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
547	0106000020E610000001000000010300000001000000050000009BF9A9570FA1B0BF998CF6DD67C24940CB0984BB5EA6B0BF9BC01A366AC24940B79B5D01A4A3B0BF9FB10CCF6AC2494012864E5A599EB0BFA1DE377668C249409BF9A9570FA1B0BF998CF6DD67C24940	1 Spring Walk	E1 5JA	0	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
548	0106000020E610000001000000010300000001000000050000009764AD5E9D9BB0BF08B6E20569C2494017E47FCF34A1B0BF087301966BC249407C1F99BA579EB0BF6C2C032A6CC2494072F76696BE98B0BFBBDD359D69C249409764AD5E9D9BB0BF08B6E20569C24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
549	0106000020E6100000010000000103000000010000000500000072F76696BE98B0BFBBDD359D69C249407C1F99BA579EB0BF6C2C032A6CC249404B170E472C9BB0BFAA3F31CE6CC249405863DBA3A295B0BF7E0EF6446AC2494072F76696BE98B0BFBBDD359D69C24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
550	0106000020E610000001000000010300000001000000050000005863DBA3A295B0BF7E0EF6446AC249404B170E472C9BB0BFAA3F31CE6CC249407B15D814B097B0BFF2208E846DC24940E2497CF33E92B0BFEACC64F36AC249405863DBA3A295B0BF7E0EF6446AC24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	0106000020E61000000100000001030000000100000005000000E2497CF33E92B0BFEACC64F36AC249407B15D814B097B0BFF2208E846DC24940622C327A4B94B0BFDCA320316EC249407202295DD48EB0BF4AF41CA56BC24940E2497CF33E92B0BFEACC64F36AC24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
552	0106000020E610000001000000010300000001000000050000007202295DD48EB0BF4AF41CA56BC24940622C327A4B94B0BFDCA320316EC24940A3FA698ED390B0BF7ACD56E46EC24940FEF0D1C6608BB0BF75F4575A6CC249407202295DD48EB0BF4AF41CA56BC24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
553	0106000020E61000000100000001030000000100000006000000FEF0D1C6608BB0BF75F4575A6CC24940A3FA698ED390B0BF7ACD56E46EC24940ADCA2926DF8DB0BFB7AD017D6FC2494073A7D179F388B0BF6C464C4E6DC2494015355D952E88B0BF013029026DC24940FEF0D1C6608BB0BF75F4575A6CC24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	0106000020E61000000100000001030000000100000005000000AA2D619AA685B0BF584074016EC24940AB9DA7A8EB8AB0BF2E42765D70C249405D75AB15B587B0BFC188FD0B71C24940064A71DA6482B0BF9BEEC1B26EC24940AA2D619AA685B0BF584074016EC24940	Davenant House	E1 5NT	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
555	0106000020E61000000100000001030000000100000005000000064A71DA6482B0BF9BEEC1B26EC249405D75AB15B587B0BFC188FD0B71C249409ABB6537CD84B0BFB5B6D1A971C24940FBB0B8A5687FB0BF30ACA7576FC24940064A71DA6482B0BF9BEEC1B26EC24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
556	0106000020E61000000100000001030000000100000005000000FBB0B8A5687FB0BF30ACA7576FC249409ABB6537CD84B0BFB5B6D1A971C2494097CE9203F881B0BFB7F7AF4372C24940C8AA8CB6A47CB0BFF82F13E66FC24940FBB0B8A5687FB0BF30ACA7576FC24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
557	0106000020E61000000100000001030000000100000005000000C8AA8CB6A47CB0BFF82F13E66FC2494097CE9203F881B0BFB7F7AF4372C24940014C469B317FB0BF288C6ADA72C249406EE75E48E779B0BF26E7CB7D70C24940C8AA8CB6A47CB0BFF82F13E66FC24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
558	0106000020E6100000010000000103000000010000000500000033472327AE7CB0BF7CD807276BC24940D2DDEC15A774B0BFCAC84DBF6CC24940296B79059472B0BFE25C30BB6BC24940106D387EA07AB0BF5A96D7216AC2494033472327AE7CB0BF7CD807276BC24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
559	0106000020E61000000100000001030000000100000005000000106D387EA07AB0BF5A96D7216AC24940296B79059472B0BFE25C30BB6BC24940D844DF315470B0BF992226A16AC24940DF8FC4866678B0BF7A5BA30669C24940106D387EA07AB0BF5A96D7216AC24940	Pauline House	E1 5NU	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	0106000020E61000000100000001030000000100000005000000DA8250980E76B0BFD56F8BDC67C249401CAA6618F66DB0BF40E2477869C24940F4454ACD036CB0BFBD3B378468C24940D2435D5F2174B0BFC0E878E766C24940DA8250980E76B0BFD56F8BDC67C24940	PFC	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
562	0106000020E61000000100000001030000000100000005000000D2435D5F2174B0BFC0E878E766C24940F4454ACD036CB0BFBD3B378468C2494009EA29D52B6AB0BF4E430B9D67C2494070B4D1344E72B0BF48AF58FF65C24940D2435D5F2174B0BFC0E878E766C24940	PFC	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
563	0106000020E61000000100000001030000000100000005000000D08A9FA0C755B0BFE57264546AC249402D8F68236950B0BF0E5D40D967C249404E4FE9415253B0BF6706CF3D67C24940C46B6721BE58B0BFEA59E6B369C24940D08A9FA0C755B0BFE57264546AC24940	Jaan Sports, 128 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
564	0106000020E6100000010000000103000000010000000500000095D6F145B85BB0BF3E07A31269C24940F490CBD03A56B0BF1B947BA266C24940D4429A704A59B0BF1FB701FF65C24940A47FD3A59B5EB0BF30EE307668C2494095D6F145B85BB0BF3E07A31269C24940	The East London Mosque	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	0106000020E6100000010000000103000000010000000500000013AB8202794FB0BF77C207AA6BC24940C7FD5158F249B0BF9CE8763269C24940B57F0063154DB0BFBB5BF08A68C2494088755B339B52B0BF985F4B006BC2494013AB8202794FB0BF77C207AA6BC24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
566	0106000020E610000001000000010300000001000000050000002D8F68236950B0BF0E5D40D967C24940D08A9FA0C755B0BFE57264546AC2494088755B339B52B0BF985F4B006BC24940B57F0063154DB0BFBB5BF08A68C249402D8F68236950B0BF0E5D40D967C24940	Jaan Sports, 128 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
567	0106000020E61000000100000001030000000100000005000000C7FD5158F249B0BF9CE8763269C2494013AB8202794FB0BF77C207AA6BC249405F9FF0E20B4CB0BFEEEE9E636CC24940721AEE45AB46B0BFEB9081E169C24940C7FD5158F249B0BF9CE8763269C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
568	0106000020E61000000100000001030000000100000005000000F490CBD03A56B0BF1B947BA266C2494095D6F145B85BB0BF3E07A31269C24940C46B6721BE58B0BFEA59E6B369C249404E4FE9415253B0BF6706CF3D67C24940F490CBD03A56B0BF1B947BA266C24940	The East London Mosque	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
569	0106000020E610000001000000010300000001000000050000006F78E845085CB0BF29E1976C65C249407174C1A8A861B0BF9263EFD067C24940A47FD3A59B5EB0BF30EE307668C24940D4429A704A59B0BF1FB701FF65C249406F78E845085CB0BF29E1976C65C24940	The East London Mosque	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
570	0106000020E6100000010000000103000000010000000D0000008C4A68C7765CB0BF4FC7307061C2494074371EAAD752B0BFB8C7D7D262C249403BDA5EEEE951B0BFAD905E3962C24940C06C9600FF4EB0BFE06512A562C24940FFAB32F59648B0BF2326CB635EC2494065542D637F4CB0BFC195D1D55DC24940699FB829FD4CB0BFE66E972E5EC249404069652C134EB0BF763443085EC249402714FFF3C350B0BF911B52DB5FC249401FEFC1BEA351B0BFDDA764BA5FC24940BBD8FC68A252B0BFF97B406460C249405F91351F8759B0BFE0DE63555FC249408C4A68C7765CB0BF4FC7307061C24940	Prime Land Property, 124 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	0106000020E610000001000000010300000001000000080000008061B8493A3CB0BF109E978267C2494063C6F4B93C32B0BF3DE2F20269C24940D1576586932CB0BF1855D6C365C249403591FA63C92DB0BF25E0428F65C2494076E191022127B0BF03FACCBD61C24940B8AA3DCAE131B0BFBC84713B60C2494061B1D5A5F936B0BF4E8A538563C249408061B8493A3CB0BF109E978267C24940	fashion corner, 132 Whitechapel Road	E1 1JU	0	\N	Whitechapel Road	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
572	0106000020E610000001000000010300000001000000050000009003E4564B2EB0BFE59C098F68C24940820D2FAC5C27B0BF4CC3DC7C69C249405272C8002426B0BF2C970D2D68C249402383D414922CB0BF13F4885867C249409003E4564B2EB0BFE59C098F68C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
573	0106000020E61000000100000001030000000100000005000000820D2FAC5C27B0BF4CC3DC7C69C249409003E4564B2EB0BFE59C098F68C2494007A2E7DC5730B0BF3C9C21006AC24940CFD90F6DB828B0BFD0EC59F26AC24940820D2FAC5C27B0BF4CC3DC7C69C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
574	0106000020E61000000100000001030000000100000005000000C5F349C90625B0BF3C4EBAFA66C24940EF98A57F062BB0BF682B2C4266C249402383D414922CB0BF13F4885867C249405272C8002426B0BF2C970D2D68C24940C5F349C90625B0BF3C4EBAFA66C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
575	0106000020E6100000010000000103000000010000000500000072007D6F414DB0BF7C8D0B4871C2494036ABA09EA344B0BF448AE5B872C2494010376F1BB642B0BF133E559E71C24940979410B44F4BB0BF49E82F2E70C2494072007D6F414DB0BF7C8D0B4871C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
576	0106000020E6100000010000000103000000010000000500000084D426B9204CB0BF1EF6CE4879C24940629F6A0E1154B0BF32842FE177C2494041AC9C0DE955B0BF7AB777EC78C24940CD88ABA1EE4DB0BF0CD9604E7AC2494084D426B9204CB0BF1EF6CE4879C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
577	0106000020E61000000100000001030000000100000005000000801AB57FBD50B0BF6F64549074C249400BFEC85CB348B0BF7AB304FE75C249400ADE9AB3C046B0BFC079A2E374C24940D0486798B84EB0BF63F82F7973C24940801AB57FBD50B0BF6F64549074C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
578	0106000020E61000000100000001030000000100000005000000B33308C3BF52B0BFBCC4C0D27AC24940360EE568385BB0BF551E025379C249405D0BFD31FA5CB0BFA20BBC4C7AC24940D2155EC36B54B0BFB2F81EC57BC24940B33308C3BF52B0BFBCC4C0D27AC24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
579	0106000020E61000000100000001030000000100000005000000629F6A0E1154B0BF32842FE177C2494084D426B9204CB0BF1EF6CE4879C249406B10CC385B4AB0BF0EB4FF4778C24940B0C3D08D4B52B0BF0C5160E076C24940629F6A0E1154B0BF32842FE177C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
580	0106000020E61000000100000001030000000100000006000000B0C3D08D4B52B0BF0C5160E076C249406B10CC385B4AB0BF0EB4FF4778C24940C96FB943A748B0BFA3AE1F5177C249403E18A0F77B4AB0BF8603960077C249400D179343A950B0BF5BAE81F375C24940B0C3D08D4B52B0BF0C5160E076C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
581	0106000020E6100000010000000103000000010000000600000036ABA09EA344B0BF448AE5B872C2494072007D6F414DB0BF7C8D0B4871C24940ECAB1711DF4EB0BF671A473272C24940CD0B7360F94CB0BF3C32AD8772C24940CFE84EF84746B0BFE00A92A973C2494036ABA09EA344B0BF448AE5B872C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
582	0106000020E61000000100000001030000000100000005000000979410B44F4BB0BF49E82F2E70C2494010376F1BB642B0BF133E559E71C249401A8196C01641B0BF6FC184B070C2494047BE8D0E9F49B0BF008C2F396FC24940979410B44F4BB0BF49E82F2E70C24940	22 Vallance Road	E1 5NU	0	\N	Vallance Road	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
583	0106000020E610000001000000010300000001000000060000000BFEC85CB348B0BF7AB304FE75C24940801AB57FBD50B0BF6F64549074C2494043B5A78EAB52B0BF626D229B75C249400D179343A950B0BF5BAE81F375C249403E18A0F77B4AB0BF8603960077C249400BFEC85CB348B0BF7AB304FE75C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
584	0106000020E61000000100000001030000000100000005000000D0486798B84EB0BF63F82F7973C249400ADE9AB3C046B0BFC079A2E374C2494091CB0FE8F944B0BF0F4F17E273C24940CD0B7360F94CB0BF3C32AD8772C24940D0486798B84EB0BF63F82F7973C24940	BT	E1 5JA	0	\N	Old Montague Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
585	0106000020E61000000100000001030000000100000005000000D9F97B85961CB0BFA8D425146BC2494035E63504161EB0BF035905626CC249405F97D85CD115B0BF11E1CC636DC24940CF0E01883714B0BFFE3B751C6CC24940D9F97B85961CB0BFA8D425146BC24940	95 Durward Street	E1 5BA	0	\N	Durward Street	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
586	0106000020E610000001000000010300000001000000050000002BFE8F268E1CB0BFCCA946146BC2494043EDBC573714B0BFE94A6E1C6CC24940B05766F02F12B0BFD0815FA46AC2494009AA0717DF1AB0BFC273019169C249402BFE8F268E1CB0BFCCA946146BC24940	95 Durward Street	E1 5BA	0	\N	Durward Street	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
587	0106000020E6100000010000000103000000010000000500000077DAD109BD18B0BF108A753271C24940AFC9DEA07702B0BFE6FC93B273C24940EF6B1B09A7FBAFBFA8CF86BE6FC2494081E4F0926A14B0BFBE35003A6DC2494077DAD109BD18B0BF108A753271C24940	91 Durward Street	E1 5BA	0	\N	Durward Street	91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
588	0106000020E610000001000000010300000001000000090000001D1B162C95FFAFBF6918FBCD73C24940FEF5252ED2E1AFBF2F034E8B75C2494044D977D6F9DFAFBF32FD05BD74C249405419F88CF5E2AFBFDDC75D9574C2494008941E6CC8E0AFBF7DB9B2AF73C249405E3D2F60C7F1AFBFD67A00C872C249402EF76F3D13EFAFBFD088989271C2494044E1A616CFF8AFBF43C6830971C249401D1B162C95FFAFBF6918FBCD73C24940	81 Durward Street	E1 5BA	0	\N	Durward Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
589	0106000020E610000001000000010300000001000000060000004FFFD343C1DDAFBFE0F7F0776CC249402CFCBAD61FD0AFBF2680725B66C24940886C33AD0CD8AFBFC44404F365C249408C29388175E3AFBFE25AF3FC6AC249407205AB7A71E5AFBFB4A689EA6BC249404FFFD343C1DDAFBFE0F7F0776CC24940	Bar Nakoda	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
590	0106000020E610000001000000010300000001000000070000004805F71E11B3AFBF34F30E4F6BC24940460E94E880ACAFBFF6DFFCB96BC2494052D4543A96A4AFBFBD0345A168C249407732426D59AEAFBF7BD7711F68C249406D79ADF783B3AFBF15CC24356AC249406A15FC01B3B0AFBF1CBDFB616AC249404805F71E11B3AFBF34F30E4F6BC24940	McDonald's	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
591	0106000020E61000000100000001030000000100000005000000FD8799A86DC2AFBF1C8DECA26CC24940438B9F0A7CB1AFBF0035BEAC6DC24940DA45A5E707AFAFBF58D00DB76CC24940095A98B4EDBFAFBF2A6C6C9B6BC24940FD8799A86DC2AFBF1C8DECA26CC24940	McDonald's	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
592	0106000020E61000000100000001030000000100000005000000D50E952DA2C4AFBFB04A5D8B6DC24940C49FFB4ADCB3AFBF8A60A79A6EC24940438B9F0A7CB1AFBF0035BEAC6DC24940FD8799A86DC2AFBF1C8DECA26CC24940D50E952DA2C4AFBFB04A5D8B6DC24940	McDonald's	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
593	0106000020E61000000100000001030000000100000005000000C49FFB4ADCB3AFBF8A60A79A6EC24940D50E952DA2C4AFBFB04A5D8B6DC24940335D648020C7AFBF2A7531926EC249406D38775F8EB6AFBFC51392A86FC24940C49FFB4ADCB3AFBF8A60A79A6EC24940	McDonald's	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
594	0106000020E61000000100000001030000000100000007000000CBBC998BB086AFBF4615A1047CC249402122008194ADAFBF30DF6C3379C249402052A9A58EB3AFBFF1AA5C337BC249400A52494596AFAFBFA97F75887BC249404E9A2B06F4B1AFBF92C6336A7CC24940A445DE3EE990AFBF92BA2F0780C24940CBBC998BB086AFBF4615A1047CC24940	57-71 Durward Street	E1 5BA	0	\N	Durward Street	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
595	0106000020E61000000100000001030000000100000005000000CE7DC5C0326DAFBF906D6C7C71C249407F10CA732869AFBF9362D13570C24940F2637DB16770AFBF6DD655C16FC24940327BAE82E373AFBFB644E11771C24940CE7DC5C0326DAFBF906D6C7C71C24940	McDonald's	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
596	0106000020E61000000100000001030000000100000005000000FBDF9087D952AFBFD7D5AF1674C2494074F93E6C2763AFBFFDF44C1E73C249403716E2896F65AFBF6DE312F873C249404BF088885B55AFBF425C820175C24940FBDF9087D952AFBFD7D5AF1674C24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
597	0106000020E6100000010000000103000000010000000600000074F93E6C2763AFBFFDF44C1E73C24940FBDF9087D952AFBFD7D5AF1674C24940EC096D662C4CAFBF71A35B8874C24940E204EC6D9149AFBFE544978273C24940FFB386D35E60AFBFE74DA01472C2494074F93E6C2763AFBFFDF44C1E73C24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
598	0106000020E610000001000000010300000001000000060000004BF088885B55AFBF425C820175C249403716E2896F65AFBF6DE312F873C2494023C7EF920168AFBF3EDE67ED74C24940121FEEBD095AAFBFFE7B46EE75C24940DC193DA57C56AFBFE392416B75C249404BF088885B55AFBF425C820175C24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
599	0106000020E61000000100000001030000000100000006000000FFB386D35E60AFBFE74DA01472C24940E204EC6D9149AFBFE544978273C249408B5F2B198148AFBF4265B51773C24940FB1A2E043F56AFBF0308067D71C249401AC78665755DAFBF8CD6B5FE70C24940FFB386D35E60AFBFE74DA01472C24940	Chicken Hut	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
600	0106000020E610000001000000010300000001000000060000002BF1E80E9771AFBF6FF3CB927EC24940732E1F97243EAFBFA1986EE981C24940DDA0990D173BAFBFA3F9FBBB80C24940D5B17184F42DAFBF44C868AC7BC24940E2E09921D962AFBFB05EB36D78C249402BF1E80E9771AFBF6FF3CB927EC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	0106000020E61000000100000001030000000100000009000000E10A81A68EEBAEBF2C50E73B7DC249400A2D431CA3C2AEBF25593FB47FC2494077570B0EF8BEAEBF4D31913D7FC24940CB5BF8E837C1AEBFEB4029E87EC249403937ECA9D6B1AEBF1EBD5F627CC249406C172297E0D3AEBF9329ED4F7AC249407220B61332D7AEBF25FE94747BC249408F8594FC9DE3AEBF82A75B9B7AC24940E10A81A68EEBAEBF2C50E73B7DC24940	Londis	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
602	0106000020E6100000010000000103000000010000000500000099D89F71CF3CAFBFC4166D2077C2494070E6D7991339AFBFD97180CD75C24940FBDF9087D952AFBFD7D5AF1674C24940DC193DA57C56AFBFE392416B75C2494099D89F71CF3CAFBFC4166D2077C24940	Chicken Hut	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
603	0106000020E61000000100000001030000000100000006000000A7FC110F01FCAEBF5DC44FB67AC24940454DE4022AEFAEBF8ED306C07BC24940D173C38C6CE7AEBF6E6983E778C24940EDE275BD2DEDAEBF3686EA8078C24940C142075695F4AEBF9E7D9E0878C24940A7FC110F01FCAEBF5DC44FB67AC24940	Grave Maurice	E1 1AA	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	0106000020E610000001000000010300000001000000080000008F8594FC9DE3AEBF82A75B9B7AC249407220B61332D7AEBF25FE94747BC249406C172297E0D3AEBF9329ED4F7AC249404EC828286BDAAEBFEA2935C079C249404EC01EE45FD8AEBFAF7C501079C24940267A043154D9AEBF76C09EFD78C24940F29C92C9C3DFAEBFECC0D59778C249408F8594FC9DE3AEBF82A75B9B7AC24940	Grave Maurice	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
605	0106000020E610000001000000010300000001000000050000000B7ACFB97EE3ADBFF035A0AD8AC24940CD14637BDDEFADBFBB408AE389C249405FC21CA65BF3ADBF67E8CC258BC2494054467C2118E7ADBF4D31B4F98BC249400B7ACFB97EE3ADBFF035A0AD8AC24940	Whitechapel Idea Store	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
606	0106000020E610000001000000010300000001000000050000002964B0F0FFEBADBFFDD5E77E88C2494059A1BE2FA1DFADBFA5BEFD4889C24940566647FA22DCADBF8AA7B60688C249409006E77D5AE8ADBF8C9D7C2E87C249402964B0F0FFEBADBFFDD5E77E88C24940	Whitechapel Idea Store	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	0106000020E61000000100000001030000000100000005000000DD9864281DC1AFBFFBB85F8481C24940703F24CF0EA9AFBF08FBBF5284C249405C908D70059FAFBFFEC8D53B82C249407F0F219E18B7AFBF91E47A6D7FC24940DD9864281DC1AFBFFBB85F8481C24940	57-71 Durward Street	E1 5BA	0	\N	Durward Street	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	0106000020E610000001000000010300000001000000150000000C7F478F54EAADBF49156C9896C249405925F8AF45E1ADBFBC94862797C249406ECAB4E7A1DEADBFD8D11A3F96C249402C81A001B7D8ADBFA4B2B1AE96C24940F9A0E66A4D84ADBFF35CA4269CC24940D1D94A317E79ADBF6760D99597C24940EB8C0F48DB6CADBFE2529C5A98C249407F4675B2756CADBFFA96373F98C2494007939830C566ADBFF1CE0B9E98C2494003B073D93362ADBF704187EB96C2494065E7DA442D68ADBF57F3DA7F96C249404C4DBB239466ADBF4A58CCE995C249404F61167D617AADBF2E014BA894C2494060A207ACFD7CADBF6621D7C395C24940F2C9CFDA2D8EADBF72177FAD94C249400EE3ABC34B90ADBF2EEB477095C2494077B0A7CC81A6ADBFEF265DFC93C2494011EEF581EFA1ADBFAD62232992C2494084FFAE9797D7ADBF309F470A8FC249407C4C640D0EDDADBF4682576B91C249400C7F478F54EAADBF49156C9896C24940	Whitechapel Idea Store	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	0106000020E61000000100000001030000000100000028000000C0CF4BE35909AEBFD4850CD4A1C2494009D87486540AAEBFB2C18D04A2C249400C2D9BC01292ADBFA6158DB8AAC249409D2CDEDDA88EADBF1A9CADC5A9C24940B3AEC8DE1172ADBFF46A16E9ABC24940936D01AA1873ADBFCE619033ACC249401C520A736F63ADBF08A2FD68ADC24940E1BA82E9BC5FADBF6DD68A44ACC249400604AD82DB31ADBFD79EBB8EAFC24940A4167668282CADBFE2B65EDDAFC2494059CE7AB92626ADBFAC3FC213B0C24940B258BB527E20ADBFD16E521FB0C24940261AB06FE919ADBFBEE4C52CB0C249400DF102FAB914ADBF8E183BE7AFC249407053091DA707ADBF5E1678E7AEC2494036655BDC12FDACBF0B158218AEC249404422CA57FDF5ACBFD7D3EB8DADC249409080DDBE54F0ACBF96FCDDF4ACC249403173F50BB8EAACBF5D035053ACC249405357FE8672E8ACBFBB98D5AFABC2494095B04FB276E6ACBFDD647BCAAAC24940133EF98CD2E4ACBF1B10BB0CAAC249407DE095C1A2E4ACBF7A7DDC5FA9C24940591E3A1636E5ACBFAE8B5E07A9C2494025EAA34801E6ACBF5C7745A8A8C249401569B21048E7ACBFC146F416A8C249409EAA0E4D8EE9ACBF1201D77EA7C24940C4C81147D5ECACBF37E95ECDA6C2494005941CD217F0ACBF54599E4FA6C249404E93D2C2D6F4ACBF46B531F1A5C249402716997033FAACBF49FCE4A6A5C24940B32401444E00ADBF805ED476A5C24940ABB70092DA06ADBF3390B0AAA5C24940697006B8B40CADBFDABB09D9A5C24940E4979A8A2413ADBF05381B23A6C249402E15B7DD56EFADBFAAAF837D96C24940D6579EFE1CF6ADBFF0BC4AFE98C24940A186E60799EDADBF878B88A299C249403AF392887A01AEBF2569064EA0C24940C0CF4BE35909AEBFD4850CD4A1C24940	Albion Yard, 331-335 Whitechapel Road	E1 1BW	0	\N	Whitechapel Road	331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
610	0106000020E6100000010000000103000000010000001F00000011D42EB38661AEBF475FBF33BDC24940B462C6A3502EAEBFF2EB682CC1C249406B555319AE29AEBFC0D435DDBFC249402CB9D4F34D0DAEBF991A3808C2C24940C70CAF6DB70BAEBF3AF96093C1C2494094230F1972F8ADBFA021F00CC3C24940E0D6E3EF78F4ADBF131675E5C1C249406144451ACBE0ADBFCE934547C3C24940E0CC3CA87AD5ADBF62F0B23FC0C24940E5DB759344C6ADBFFEA2C458C1C24940D914664B6AB3ADBF0F2E5AE7BAC24940ED06D2EDECDAADBFFB196C01B8C24940E7DF7EC835CFADBF22BBA303B4C2494033D0AC156EC9ADBF257F286EB4C24940DF3EA64AC8C4ADBF2B62AD8EB4C249409C9B3B18CDBFADBF3418B345B4C249401CFEF51022BCADBFB7DC249DB3C24940455713CEEAB9ADBF32A98CDDB2C24940E10A46F211B6ADBFFACFE890B1C249406A723A5D87B2ADBF6FFEB45EB0C2494058EFB8B0CBA6ADBF98BC3268ACC249409C4CD946A19FADBF7C749CFCA9C24940596108CEFE9EADBFEB23BCC5A9C249401F88E725540AAEBF1BD18604A2C24940E9581113DF0EAEBF30C0A513A3C24940F71701F7E517AEBF5B8280FBA4C249402D48F3A4B01EAEBF99970EC8A6C2494075CC5DBB902BAEBF045F3AFEAAC24940490A6CF00132AEBF9345FB2DADC2494078C35864E156AEBFF004A498B9C2494011D42EB38661AEBF475FBF33BDC24940	Sainsbury's, 1 Cambridge Heath Road	E1 5SD	0	\N	Cambridge Heath Road	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	0106000020E6100000010000000103000000010000003D000000D7A1AB7CB844AFBFB078A22EAAC24940CB02E6FADF1AAFBF8768B130ADC24940AADD2B3D3E10AFBFA937FFB7A9C249403FC429ABB8F5AEBF68289E94ABC249400B85CFE464F3AEBFBCDFBED4AAC249402059E6300FE6AEBF39B781C6ABC24940D92E4B0A30E3AEBF098DD4E2AAC24940B04014C0E7D4AEBFD6BDA0FCABC249405BD9A87B28D0AEBF54B6297BAAC2494021FCE568C3A9AEBF68E8B86EADC249404D8BD6E71BACAEBFF001ED4DAEC249400263C3ED569DAEBF7C3E0E75AFC2494000DB14F654A2AEBFD4654812B1C249402A7C93CFAC86AEBF562739E6B2C24940DD9E3554A397AEBF012377B3B8C249401F74E9AF69C4AEBF5C7E1374B5C2494017956A54B3D2AEBFFCF97A51BAC249402E3E26387A92AEBF2780530DBFC2494060DBE7290185AEBFA4F13654BAC2494022FF3B55E277AEBF98C85045BBC2494057FB70B56C56AEBF5BF2DCDAAFC24940BC31408ECE56AEBF45983BCDAEC249408169F064344AAEBF36BF5027AAC24940049C159AC957AEBFA0A4AD0AA9C2494001B53FDF0636AEBF2513177A9EC249400E4928A1D361AEBFE017C4469BC2494094F2D2534063AEBF76B487C79BC24940B01FAA0DF08AAEBFCFCE58F298C24940894E6AD94895AEBF117FB79F9CC2494056D0F6D88B69AEBF2C2269FB9FC24940438D8CC4D767AEBF226ED5C69FC24940BA5F392F8460AEBF65466461A0C249406C3FC91C476DAEBF4BAC61ADA4C249408891AA042C61AEBFF893A18EA5C24940382FB0EADF68AEBF5077F42BA8C24940B99000632281AEBF80BD137AA6C249401ABAE14A9A79AEBF03C7DAB0A3C2494092DFFF143888AEBF169081AAA2C2494027EE960C318BAEBF8B2F2486A3C24940BC21D9729B98AEBF3C48CF8AA2C249400BADBDDB1D9CAEBF08DA5696A3C249405735EEADB8AAAEBFD8DA5A91A2C249405EBA099ADEABAEBF8AA72B06A3C249405328A89C91D3AEBFFFC4D827A0C249404926D6AD59CCAEBF2827EB929DC2494007D5121ED9D9AEBF3508639C9CC249407CCD6A7C4BD8AEBFB87D86119CC24940972859DF60E9AEBFF4EA93DD9AC249406840EAA4F6ECAEBFD34534159CC24940CF3098D00BF9AEBF4B8B96369BC2494070CCC3BB1705AFBFDC877A3C9FC249406AFC352CDB0FAFBF94B7B3779EC2494030BA37176819AFBF913AA224A2C24940632202CBD21FAFBFF0CCC5AFA1C249403F57E5B95F29AFBFF527B45CA5C2494041696711662FAFBFFF82E5F0A4C2494083395F8D5034AFBF5AAB829EA6C249406BBDF053E22EAFBF42BBC500A7C2494050DED41D5330AFBFACA82893A7C2494086C0D0A6983BAFBFA242B0D1A6C24940D7A1AB7CB844AFBFB078A22EAAC24940	Swanlea Secondary School	E1 5DJ	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
612	0106000020E6100000010000000103000000010000000500000094E36EF113C6AEBF1A3D34C1B3C24940170EC2FBB09CAEBFFC0F95E6B6C249405D7046C4B192AEBF15390EA4B3C249409B18F46BB9BCAEBF81136C95B0C2494094E36EF113C6AEBF1A3D34C1B3C24940	Swanlea Secondary School	E1 5DJ	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
613	0106000020E610000001000000010300000001000000290000007A9B2CB445DEAEBFCF33FFA68FC24940921E2A02ECDDAEBFB6767C8C8FC24940FC0F76E51FCEAEBF0CC453A790C24940C661970E67CDAEBF4D6F5D6C90C2494004C5932FD691AEBF3CE94B7294C2494051C12E3A6A92AEBFC47D22A294C24940D278E18A3A79AEBF9370D36B96C249403B804C4A6E78AEBF962F0D2696C2494099F774BD9D3DAEBF1E10336F9AC2494081C5F444F73EAEBFAD366CE19AC24940B9B5A6BA953CAEBF5AB2880A9BC249407B2B93C2F32EAEBF293A04009CC24940300FB9E38D21AEBF3D8A5B059DC2494061D4F7BA181EAEBFF591F8149DC24940AD964890CB17AEBF0A5826CB9CC24940F6AD19919B12AEBF1397F1F29BC249403BC867D40E10AEBFE13699E79AC2494054467C2118E7ADBF4D31B4F98BC249405FC21CA65BF3ADBF67E8CC258BC24940CEDBF29178FEADBFA8DAA96A8AC24940E5233E589F22AEBF150A459F97C2494006596B4A3121AEBF15BEF19F97C249409B30AA8EEC1FAEBFFEEBD0B797C24940693A62C9231FAEBF624C72F397C249401AE35C362B1FAEBF4F8B692098C2494068099849ED1FAEBF7A27C85C98C2494017772D399E21AEBF2E07059698C249406382EEE38223AEBF60600DC198C24940A76CA87EB325AEBF63E4FADB98C249400A4A040EF127AEBF8279CDDF98C24940A59F3164582AAEBF264F8CB798C249400111A016B22AAEBF0DBED47198C24940E6E8900D042AAEBF943C281598C249408D39F47A1970AEBF809E372693C249405C4356A5766FAEBF5C3E2DED92C2494039012B198188AEBF367F862F91C24940DAA89FDD1E89AEBF177A946191C249406447FEDC08CFAEBF3CDECB708CC24940456B07C748D0AEBFA2668DE38CC2494022DF5B2B3DD5AEBF770B6D8E8CC249407A9B2CB445DEAEBFCF33FFA68FC24940	Kempton Court	E1 5DJ	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	0106000020E610000001000000010300000001000000210000002E52047BCB80AEBF032ADD088EC24940129A93C2C97AAEBFCF4524BA8EC249408A28F713B970AEBFB3F4C76F8FC24940D50D8A406F66AEBFB27068F58FC249409E0890D19463AEBF5C1048F38EC24940C184A97E9E5EAEBFFE82CAFB8EC24940BCC568A0E957AEBF8AAF4A078FC24940FBAA8C8FBA51AEBF1759281A8FC249400D8C797CE947AEBF643C662A8FC24940064CC7EA663DAEBF8DBC1A038FC2494097FADFFF5934AEBF7DCC36D48EC24940F8351F93022CAEBF1BBA31838EC2494055C2B69BBB25AEBFCC37322F8EC24940E97B0FF2321FAEBFD4E0B7ED8DC24940686F02600F19AEBF69753A048EC24940B725186A0D15AEBFBB24BD8A8CC249403151B447F41BAEBF43522AEF8AC249402A84C24DD01DAEBF1B4FFB048BC24940B1785F9D7422AEBFEE24B1478BC24940F9D8E7F3D227AEBF8D4289998BC2494020A47FDFAF2EAEBFA83C05E98BC24940696B3B02CC35AEBF3EEF27298CC249400D68A085263CAEBF60DFE7488CC249408F3EA1A7AF46AEBF2D8378698CC24940781EE6B6D74BAEBFAB7410668CC2494037D3BDDC5D54AEBFF91F595F8CC249401851B04DF758AEBF8C3740648CC24940EF9BF396285DAEBFE037A5588CC249404526BE09F862AEBFF8A6BA388CC24940E268E217B068AEBF4FDF4B0E8CC249401F9DA128F46AAEBF5C3766888CC24940FEC54CCEC277AEBF24F51C6C8BC249402E52047BCB80AEBF032ADD088EC24940	Kempton Court	E1 5DJ	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
615	0106000020E61000000100000001030000000100000027000000BA37C24FFCB2AFBF7FF948FD95C249409CB1554C0DAEAFBFC761EE1E96C2494041A9FF6206B0AFBF6B311F3A98C24940B1D33CBAA8A0AFBFEB1EA78198C24940D87C2B7D2C9FAFBF9699A7C796C2494014752D89BC8DAFBFCC05F62B97C24940A70316DE518AAFBFA47F71A793C249407F575F7B8486AFBF10F6518693C24940C0E3F14FC382AFBF68D8102293C24940BA48174B7F81AFBF18D8DDBF92C24940F8ADD149C080AFBF8E66029E91C24940C8E3EE466480AFBFD8E7BDF490C249405C432D0DD17EAFBFCF493E8F90C249406407D638497CAFBF5E5F865090C2494049C3D2D2AE79AFBFF7BC6D3590C24940D77CA82FC377AFBF436CBB2890C2494086519D5FD974AFBFC699E72B90C249404CF791F84673AFBF85484F5E90C24940065E4923D571AFBFE74A9FA190C2494084312C639270AFBF086BC1F990C249407E1085CE1F70AFBFD83A6E4791C2494048E6228C2D70AFBF57DF4FC991C24940108C643E9370AFBF7C718B2792C24940F5BB79F5674BAFBF7D4A12DD96C24940EC2ED8BC6247AFBFE5D39B2B92C249405ED3BA2F9736AFBF44B3103C8DC249405636C0CC5633AFBFC64F80478CC24940D28AC1B06155AFBF74CC739489C24940169682DD9D80AFBFF08F48AC85C24940E5CA6F2CCC82AFBFB13C6E7585C249408DBF5F294784AFBF5B17325085C24940014F6AD2E784AFBFF73A8C2885C249409FAFDF001E85AFBFC116BAF284C24940C8908E1B2285AFBFF6FE332D84C24940B4E75FECB59BAFBF660DF5C783C24940D3C506230DA0AFBF351E9C5F88C24940E47F9A1EECA4AFBF74C5BB4C88C24940811D4BCBCEA7AFBF59C6A54D8BC24940BA37C24FFCB2AFBF7FF948FD95C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
616	0106000020E6100000010000000103000000010000000F000000EFA484278A2DB0BFE4DC69157DC2494028EA60D7312FB0BF200808F07EC249407AC4D9262B2FB0BF2D8F0D727FC24940CB795811E62EB0BF19EE4FD37FC249407E4C2634182EB0BFC0BC573080C2494062710997542CB0BF33E9D58180C24940419903BE2D2AB0BF7FE1A6A880C2494032CE54179428B0BF686C4A8D80C24940A590ADEFE907B0BF2C39CDD384C2494042FBC428F6E9AFBFD35F304E87C24940F8A4EC8797E3AFBF7073C9FB84C24940A0B17D9DED09B0BF3A7268C081C249404E3D28724D19B0BFA7CB49B17FC249403516ACBC1B24B0BF4A0742057EC24940EFA484278A2DB0BFE4DC69157DC24940	Wodeham Gardens	E1 5NU	0	\N	Wodeham Gardens		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	0106000020E61000000100000001030000000100000005000000B7769FC0FA11ADBF74B220CC94C24940F45FF6840236ADBF9F087FFD94C2494062074F769D34ADBFD6C67A2E9DC2494065E7623A4C10ADBF23FAF7079DC24940B7769FC0FA11ADBF74B220CC94C24940	Albion Yard, 331-335 Whitechapel Road	E1 1BW	0	\N	Whitechapel Road	331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	0106000020E61000000100000001030000000100000005000000E5D7875EC5BDAFBF1ADA376B88C24940C2A034E35DD0AFBF91E8F51388C249406AA9FA0DD8D1AFBF144C9AF689C2494066D5A23A44BFAFBF1DB3E2518AC24940E5D7875EC5BDAFBF1ADA376B88C24940	57-71 Durward Street	E1 5BA	0	\N	Durward Street	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
619	0106000020E6100000010000000103000000010000000700000066D5A23A44BFAFBF1DB3E2518AC2494025DE08EFE9D1AFBF8034ADF689C249404D8389972BD3AFBF09102E9F8BC2494030171E9266BFAFBF75F4C3FF8BC24940F57C77A5B2BEAFBFF82E545C8BC249400D020D5F29C0AFBFF104EC558BC2494066D5A23A44BFAFBF1DB3E2518AC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
620	0106000020E61000000100000001030000000100000005000000A0231C7B98C0AFBFCCDEE7988DC2494005A46C6F36D3AFBF243072458DC24940DC53BFD743D4AFBFF22A15C18EC24940E4DEAB4DABC1AFBF772C57188FC24940A0231C7B98C0AFBFCCDEE7988DC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	0106000020E61000000100000001030000000100000005000000E4DEAB4DABC1AFBF772C57188FC24940DC53BFD743D4AFBFF22A15C18EC24940AEC0CC5269D5AFBF048C4F4F90C24940F2E01686DBC2AFBF640B66A090C24940E4DEAB4DABC1AFBF772C57188FC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
622	0106000020E610000001000000010300000001000000060000007CE5E4AE69C3AFBFE2C1F89D90C24940D8E982896DC3AFBF62ACE69D90C24940D0C57A9107D6AFBF0801694C90C249402B4EF73320D7AFBF9F27B5D391C249400F880A2DECC4AFBF56881F2992C249407CE5E4AE69C3AFBFE2C1F89D90C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
623	0106000020E610000001000000010300000001000000070000000F880A2DECC4AFBF56881F2992C249402B4EF73320D7AFBF9F27B5D391C24940F95D7AD14FD8AFBF9B97E74993C24940915C5E4B75C7AFBF52C4FC9893C249401757D0B4BFC6AFBF634985DC92C249403DACA71C92C5AFBF05E575E492C249400F880A2DECC4AFBF56881F2992C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
624	0106000020E61000000100000001030000000100000005000000915C5E4B75C7AFBF52C4FC9893C24940F95D7AD14FD8AFBF9B97E74993C2494038804CA5F3D9AFBF707B54DF94C24940E4CF404699C8AFBF1698C53495C24940915C5E4B75C7AFBF52C4FC9893C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
625	0106000020E61000000100000001030000000100000006000000E4CF404699C8AFBF1698C53495C24940E1F5560A7FDAAFBF0764C6DC94C2494018E8D1CEE0DBAFBF720F238096C24940DF61096ADADBAFBFD70F418096C249404EAB442DA9C9AFBF539E92D096C24940E4CF404699C8AFBF1698C53495C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
626	0106000020E610000001000000010300000001000000050000004EAB442DA9C9AFBF539E92D096C2494018E8D1CEE0DBAFBF720F238096C24940B7C3D11301DDAFBF4874A0F497C249409C49AA13C8CAAFBF8D2E224A98C249404EAB442DA9C9AFBF539E92D096C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
627	0106000020E610000001000000010300000001000000050000009C49AA13C8CAAFBF8D2E224A98C24940B7C3D11301DDAFBF4874A0F497C24940871ECBB74FDEAFBF0F79297299C2494088D01D25B7CBAFBF88A76BC999C249409C49AA13C8CAAFBF8D2E224A98C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
628	0106000020E6100000010000000103000000010000000500000088D01D25B7CBAFBF88A76BC999C24940871ECBB74FDEAFBF0F79297299C24940E1AAA99D04E0AFBF64B675089BC249407238B6096CCDAFBFA5ECB75F9BC2494088D01D25B7CBAFBF88A76BC999C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
629	0106000020E610000001000000010300000001000000050000007238B6096CCDAFBFA5ECB75F9BC24940E1AAA99D04E0AFBF64B675089BC2494060A51F4826E1AFBF8C8EEC7C9CC24940A9CAFFB28DCEAFBFB5C92ED49CC249407238B6096CCDAFBFA5ECB75F9BC24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
630	0106000020E6100000010000000103000000010000000500000001FDD484A4CEAFBF3C8D25D49CC24940AB84F4193DE1AFBFA251E37C9CC249405109D39B5EE2AFBF21ABC8ED9DC249402E51097725D0AFBF8D124B439EC2494001FDD484A4CEAFBF3C8D25D49CC24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
631	0106000020E610000001000000010300000001000000050000002E51097725D0AFBF8D124B439EC249405109D39B5EE2AFBF21ABC8ED9DC249401DCF02111EE4AFBF4F1172649FC24940EAEA0A9657D1AFBF5F7232C09FC249402E51097725D0AFBF8D124B439EC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
632	0106000020E61000000100000001030000000100000005000000787AA68E7ED2AFBF1BFD90BA9FC24940B21D4697A4E5AFBF1F70A85C9FC24940C766E36122E7AFBFA884CC2AA1C24940EC1FCA8F1DD4AFBFD0253187A1C24940787AA68E7ED2AFBF1BFD90BA9FC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
633	0106000020E6100000010000000103000000010000000500000030171E9266BFAFBF75F4C3FF8BC24940D119217964D2AFBF7919FEA28BC24940A82EEDDDDED3AFBFF31A7F428DC24940A0231C7B98C0AFBFCCDEE7988DC2494030171E9266BFAFBF75F4C3FF8BC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
634	0106000020E610000001000000010300000001000000090000008C5CDB489724B0BF700A12B5A1C2494043EB640A3723B0BF648E91B9A1C24940B1B4EB1E2923B0BF7D32AAF9A1C2494029D0849CE91DB0BF5AA9E4FCA1C249408DEE6D83D81DB0BFD576BC0B9FC24940FD7F3453EF22B0BF9F101D229FC24940F56FE644D722B0BF7BC8D3AF9FC249407246405BA524B0BF586A3BB59FC249408C5CDB489724B0BF700A12B5A1C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
635	0106000020E6100000010000000103000000010000000500000003E73F6CE91DB0BFCEB8DDFCA1C24940AC14F1775C18B0BF91579801A2C24940A11EDB304118B0BF2B50CF1E9FC24940F881CCCBD81DB0BF339377209FC2494003E73F6CE91DB0BFCEB8DDFCA1C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
636	0106000020E610000001000000010300000001000000050000001F22AC475C18B0BF0A679101A2C24940518C5AA75D13B0BF28209803A2C249402EB050478613B0BF8E9990729FC24940539BFE144418B0BFBE8531729FC249401F22AC475C18B0BF0A679101A2C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
637	0106000020E61000000100000001030000000100000005000000B69115775D13B0BFA02F9103A2C249406CDC9165840EB0BF1B4B3AFDA1C24940345FF6F7AD0EB0BF74FB476A9FC2494034C00B178613B0BFFEA889729FC24940B69115775D13B0BFA02F9103A2C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
638	0106000020E61000000100000001030000000100000006000000A7DA4C35840EB0BF8F5A33FDA1C24940EFC9F381AA09B0BFA02BF9F5A1C2494049E1BF5DDD09B0BF845D6F7B9FC249409BC4C960DB09B0BFC6F6E66D9FC249402C68B1C7AD0EB0BFE20A416A9FC24940A7DA4C35840EB0BF8F5A33FDA1C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
639	0106000020E6100000010000000103000000010000000D00000039C0AE51AA09B0BF153BF2F5A1C2494047D872E69609B0BFC861CC69A2C2494055732E000704B0BF8E4D5F60A2C249406AA0EA1A0F04B0BF2FFB3AC2A1C24940F62EA3C18902B0BFD4AD8BC3A1C2494065B425A2A202B0BFD71ABACA9FC24940DD097E8E2904B0BFACD97BD19FC24940A6779CCF3404B0BFC16A7C439FC249405B613BCCDD09B0BF787E62489FC2494086C58430DB09B0BF3206E06D9FC24940F83AFD70D509B0BFB01CEEDB9FC24940015317B5C609B0BF1A54C293A0C2494039C0AE51AA09B0BF153BF2F5A1C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
640	0106000020E610000001000000010300000001000000060000009D74128B251EB0BF8C2C75DFA7C24940C7838794B715B0BF8595BCC6A7C24940044C9CABB615B0BF66673B44A6C24940EC4D45F6AF17B0BFC23273EDA5C2494082802AA91E1EB0BFF4F981EFA5C249409D74128B251EB0BF8C2C75DFA7C24940	Vallance Gardens	E1 5NU	0	\N	Lomas Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
641	0106000020E61000000100000001030000000100000005000000697BC0912B1EB0BFD925B391A9C24940810646A2B815B0BF09F95B86A9C249407C754264B715B0BF0BA5B5C6A7C24940A173CD5A251EB0BF123C6EDFA7C24940697BC0912B1EB0BFD925B391A9C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
642	0106000020E6100000010000000103000000010000000700000039535E24AD1FB0BF5B07EBD4AAC24940591CF03AB41FB0BFBE063EF9AAC249408153057FB915B0BF20D0AEF4AAC24940F3F10072B815B0BF95085586A9C249400D747B612B1EB0BF6435AC91A9C24940EA0288FBBA1FB0BF17B5868CA9C2494039535E24AD1FB0BF5B07EBD4AAC24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	0106000020E61000000100000001030000000100000005000000FDABB1757F1FB0BFA24A9FA5ACC249403F09007ABA15B0BF303D2F95ACC24940CA38C04EB915B0BFACDFA7F4AAC249406A11AB0AB41FB0BF4B1637F9AAC24940FDABB1757F1FB0BFA24A9FA5ACC24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
644	0106000020E61000000100000001030000000100000006000000C93DFA40F21EB0BF039F663DAEC24940A39D3969BB15B0BF403F3022AEC2494026E8BA49BA15B0BFBF4C2895ACC249401C9A6C457F1FB0BF335A98A5ACC2494047F1F90B421FB0BF35C2AB3EAEC24940C93DFA40F21EB0BF039F663DAEC24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
645	0106000020E61000000100000001030000000100000006000000ABDE2F521A1FB0BF00FA327FAFC24940948A7AA53C16B0BF4ED2866DAFC249408E9B3DEE4D16B0BF8997DA23AEC249406A24B510F21EB0BF98AE5F3DAEC24940B0D8B4DB411FB0BFCED1A43EAEC24940ABDE2F521A1FB0BF00FA327FAFC24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
646	0106000020E61000000100000001030000000100000006000000B883F3F1EE1EB0BF75D92B19B1C24940ECA19929BD15B0BF2E1B4F0AB1C249408B1CA830BC15B0BF6D07296DAFC24940685F35753C16B0BFE6E17F6DAFC24940F0C0EA211A1FB0BF9B092C7FAFC24940B883F3F1EE1EB0BF75D92B19B1C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
647	0106000020E61000000100000001030000000100000005000000F264357FD81EB0BF23C70178B2C24940DD1C94296B16B0BF18B95A70B2C2494048FAE88A7B16B0BF16397C0BB1C24940625FAEC1EE1EB0BF12E92419B1C24940F264357FD81EB0BF23C70178B2C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
648	0106000020E610000001000000010300000001000000060000003839A276501EB0BFF75051F4B3C249401BCC42EEBE15B0BFD49C92F9B3C24940DA770C01BE15B0BF897CE06FB2C24940D8E54EF96A16B0BFB8C85370B2C2494079BCB4CF4C1EB0BFFDED9E77B2C249403839A276501EB0BFF75051F4B3C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
649	0106000020E61000000100000001030000000100000005000000C358F3A4551EB0BF8389A969B5C24940C54CCAD0BF15B0BF4FD38B71B5C24940B38DFDBDBE15B0BF7DAC8BF9B3C2494094085D46501EB0BFA1604AF4B3C24940C358F3A4551EB0BF8389A969B5C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
650	0106000020E610000001000000010300000001000000050000004639B77B5B1EB0BF97946C0EB7C24940EFC121C0C015B0BF6AF5CAFEB6C24940A90885A0BF15B0BFF7E28471B5C24940F721AE74551EB0BF2899A269B5C249404639B77B5B1EB0BF97946C0EB7C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
651	0106000020E61000000100000001030000000100000005000000798C7D17611EB0BF11E494A2B8C24940B0439CB8C115B0BFA8A4369BB8C249405577DC8FC015B0BF1905C4FEB6C2494035FC714B5B1EB0BF44A4650EB7C24940798C7D17611EB0BF11E494A2B8C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
652	0106000020E61000000100000001030000000100000009000000FB80D2F7B51FB0BF552A4E3BBCC24940B91A9D6EAA12B0BF5E96CA31BCC2494077E9460EC112B0BF87149DC9B9C2494060B02029C215B0BF2D89F855B9C249407BF25688C115B0BF5AB42F9BB8C24940C95A4D253D1CB0BF22E9B9A0B8C24940BE8EBCCB2C1CB0BFD2B85073B9C2494037757FFCC81FB0BF9A18207EB9C24940FB80D2F7B51FB0BF552A4E3BBCC24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
653	0106000020E61000000100000001030000000100000007000000255F70350808B0BF7EBDF737B5C2494085D43BB44706B0BF93962BA8B5C2494008C534380107B0BF4739FD01B6C249401F6E0C868902B0BF8CC7C41CB7C249407BE8BC0DDBFBAFBF2CBE4478B5C24940F98F828FA204B0BF7A2C45DDB3C24940255F70350808B0BF7EBDF737B5C24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
654	0106000020E61000000100000001030000000100000005000000D1363D5FA204B0BF203C3EDDB3C2494006E6BC0DDBFBAFBF30BE4478B5C2494053F6A2667EF5AFBF47D9A335B4C24940D22E054F5401B0BFAF2EE68BB2C24940D1363D5FA204B0BF203C3EDDB3C24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
655	0106000020E61000000100000001030000000100000005000000ABD5BF1E5401B0BF503EDF8BB2C24940E62218067EF5AFBFE9E89C35B4C2494087E8B3AE14F0AFBFB8381823B3C249409C46567D39FDAFBF6A009A76B1C24940ABD5BF1E5401B0BF503EDF8BB2C24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
656	0106000020E610000001000000010300000001000000050000004D94CB1C39FDAFBF06109376B1C24940FD13294E14F0AFBF54481123B3C249404744A31F15EAAFBF5C8ADCF2B1C249408179194714F7AFBF4F0C023DB0C249404D94CB1C39FDAFBF06109376B1C24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
657	0106000020E6100000010000000103000000010000000500000069C78EE613F7AFBFE61BFB3CB0C249402F7018BF14EAAFBFF799D5F2B1C249401742C21764E3AFBF2C47779FB0C2494024274739F0EFAFBF721D6800AFC2494069C78EE613F7AFBFE61BFB3CB0C24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	0106000020E610000001000000010300000001000000050000004573BCD8EFEFAFBF0B2D6100AFC24940C56D37B763E3AFBFCA56709FB0C24940BDB5B19F8EDDAFBFD1119277AFC2494080E0692CEDE9AFBFDBC044E5ADC249404573BCD8EFEFAFBF0B2D6100AFC24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
659	0106000020E61000000100000001030000000100000006000000F7E0263F8EDDAFBF6A218B77AFC24940126E8F6FD7D7AFBF47EBFD2BB0C249401BF2B3EF1AD2AFBFDC44F4FDAEC2494045D4F7A561E3AFBF8A4132B9ACC24940492BDFCBECE9AFBF69D03DE5ADC24940F7E0263F8EDDAFBF6A218B77AFC24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
660	0106000020E61000000100000001030000000100000005000000261E6D4561E3AFBF1A512BB9ACC24940176E77B519D6AFBFEE2B9377AEC24940DB27657CFAD0AFBF43318B67ADC24940BBF91B61EDDDAFBFC4CE22BFABC24940261E6D4561E3AFBF1A512BB9ACC24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	0106000020E61000000100000001030000000100000007000000D8439100EDDDAFBF52DE1BBFABC24940871C4AB54CD5AFBF5A96D6D9ACC24940814FDA1BFAD0AFBFD4408467ADC249403277F68C96CDAFBF744501D1ADC24940133741055DC8AFBF4665C6A5ACC249405D4537E7EDD8AFBFFE268FA3AAC24940D8439100EDDDAFBF52DE1BBFABC24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
662	0106000020E610000001000000010300000001000000050000002790AC86EDD8AFBF8B3688A3AAC24940ED5E1941B9CCAFBF07ABC421ACC249401F50EE56E6C6AFBFD06C60FAAAC249400D434D3AFFD2AFBF807D0C7AA9C249402790AC86EDD8AFBF8B3688A3AAC24940	Trahorn Close	E1 5BA	0	\N	Trahorn Close		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
663	0106000020E610000001000000010300000001000000050000009B8DC2D9FED2AFBF078D057AA9C24940AE7A63F6E5C6AFBF5D7C59FAAAC249407E83610BFFC0AFBFD351F2CEA9C24940CB862F2941CDAFBF2F97F947A8C249409B8DC2D9FED2AFBF078D057AA9C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
664	0106000020E6100000010000000103000000010000000500000005D2A4C840CDAFBFB1A6F247A8C249407E83610BFFC0AFBFD351F2CEA9C24940DFCA4B4F7DBAAFBFF210E08DA8C24940CA62F339C9C6AFBFA721830BA7C2494005D2A4C840CDAFBFB1A6F247A8C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
665	0106000020E610000001000000010300000001000000060000003AAC68D9C8C6AFBF24317C0BA7C2494070F5C0EE7CBAAFBF7620D98DA8C249403F9DD25564B4AFBF914D127DA7C249409BA0C3866FC1AFBFF43462D0A5C249402EE9E1AA13C8AFBF51577CDEA6C249403AAC68D9C8C6AFBF24317C0BA7C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	0106000020E610000001000000010300000001000000050000007DEC38266FC1AFBF6F445BD0A5C24940ADC647F563B4AFBF165D0B7DA7C24940F570B9318BADAFBFDC10BC51A6C24940535AD591DABAAFBF8619188CA4C249407DEC38266FC1AFBF6F445BD0A5C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
667	0106000020E6100000010000000103000000010000000900000000A64A31DABAAFBFFF28118CA4C24940759C35BC11B0AFBF3A8F94FBA5C2494093FE35EF3BACAFBFB7769A4DA5C24940526C0E666DA6AFBFE345DA05A6C249408EBA45455B9BAFBFB34C9DE9A3C2494079AC5ADE9AB0AFBF5A2CC829A1C24940F08844BAC3BBAFBFEF93B33DA3C249408E88747654B7AFBFF4AA42D6A3C2494000A64A31DABAAFBFFF28118CA4C24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
668	0106000020E61000000100000001030000000100000005000000FBCC4EB9CBB2AFBF3F3E4FABADC24940F23BE9FF6FA4AFBF29EB9169AFC24940A30FECD4A299AFBF413C8349ADC24940DAD10B3607A8AFBF44C9558EABC24940FBCC4EB9CBB2AFBF3F3E4FABADC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	0106000020E610000001000000010300000001000000050000004F0E48C66795AFBF31BABDB6ACC24940620047AB9180AFBF9228DBB7A8C2494025A73130C291AFBFA510CF93A6C2494025978CE68FA6AFBF2E0C2066AAC249404F0E48C66795AFBF31BABDB6ACC24940	Whitechapel Sports Centre	E1 5BA	0	\N	Durward Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
670	0106000020E61000000100000001030000000100000005000000B19D18298810B0BF0848BDDE75C24940434B4F10D513B0BF0868284178C249402142FE44910FB0BFEFDD09CE78C24940274BB6E5580CB0BF1C43BD6876C24940B19D18298810B0BF0848BDDE75C24940	91 Durward Street	E1 5BA	0	\N	Durward Street	91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	0106000020E61000000100000001030000000100000005000000274BB6E5580CB0BF1C43BD6876C249402142FE44910FB0BFEFDD09CE78C2494078B3CA0D050BB0BF1086436479C249409747937DB907B0BFB9612F0177C24940274BB6E5580CB0BF1C43BD6876C24940	89 Durward Street	E1 5BA	0	\N	Durward Street	89	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
672	0106000020E610000001000000010300000001000000050000009747937DB907B0BFB9612F0177C2494078B3CA0D050BB0BF1086436479C24940682BE5FD0407B0BF236067E879C24940A1FD5F92CF03B0BF8755408277C249409747937DB907B0BFB9612F0177C24940	87 Durward Street	E1 5BA	0	\N	Durward Street	87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	0106000020E61000000100000001030000000100000005000000A1FD5F92CF03B0BF8755408277C24940682BE5FD0407B0BF236067E879C2494065B042F40F03B0BF2FF71E6B7AC249409A2244AE0E00B0BF933408FE77C24940A1FD5F92CF03B0BF8755408277C24940	85 Durward Street	E1 5BA	0	\N	Durward Street	85	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
674	0106000020E6100000010000000103000000010000000500000082A7C031E814B0BFAAD7744E75C24940FA187B331818B0BFB4895CB477C24940434B4F10D513B0BF0868284178C24940B19D18298810B0BF0848BDDE75C2494082A7C031E814B0BFAAD7744E75C24940	93 Durward Street	E1 5BA	0	\N	Durward Street	93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
675	0106000020E610000001000000010300000001000000050000003A6755CB3FF7AFBF934CB69578C24940B3F7FC38A7FDAFBF6760703A7BC24940E10126499BF4AFBF72C543C97BC2494002F7A52634EEAFBF7E97783079C249403A6755CB3FF7AFBF934CB69578C24940	81 Durward Street	E1 5BA	0	\N	Durward Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
676	0106000020E61000000100000001030000000100000006000000FDCC2A4156E7AFBFEDDD1D767AC2494052B6DFF3E3ECAFBFA35FAEC17CC2494028CD37D818E5AFBF5B6CE12E7DC249405100C5149EE4AFBFFF7E973F7DC249401F6D56B50EDFAFBF9EA1A0E77AC24940FDCC2A4156E7AFBFEDDD1D767AC24940	77 Durward Street	E1 5BA	0	\N	Durward Street	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
677	0106000020E610000001000000010300000001000000050000006A18A4D30BD7AFBF34C9C3587CC249404B0546115CDDAFBF53FC1ACA7EC24940C28E3F3CBED4AFBFCEA7D3507FC249405F054F0F96CEAFBF6F050ADD7CC249406A18A4D30BD7AFBF34C9C3587CC24940	75 Durward Street	E1 5BA	0	\N	Durward Street	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
678	0106000020E610000001000000010300000001000000090000008059AFCA4B25B0BF67BA2893C1C2494086FA71A6BB1BB0BFB7BFD3BBC1C249406125475F671BB0BF67E84F0FC0C24940BC3403079F18B0BFB12AFC0CC0C249407E0B40795718B0BFFC3C7F91BEC249403B802BE4F320B0BF9FAD4F66BEC24940616DCE813E21B0BF566804E8BFC2494012495807F424B0BFA1D288D9BFC249408059AFCA4B25B0BF67BA2893C1C24940	Treves House	E1 5BS	0	\N	Vallance Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
679	0106000020E610000001000000010300000001000000070000007ECDA5648D53B0BF6B0999CEEBC1494099AFC6DDD352B0BF85F00A9FE6C149405914CFD31C57B0BF0587A0A2E6C149409DB53EF18057B0BF2BF58C24ECC149401C0962F3FE55B0BF7F7A7A2FECC14940FC7C590CF155B0BFC57C09C8EBC149407ECDA5648D53B0BF6B0999CEEBC14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
680	0106000020E61000000100000001030000000100000005000000E513CFD31C57B0BF0587A0A2E6C14940A1C314D4C65BB0BFEA73CEABE6C1494016E38F33D35BB0BF37456317ECC1494011B73EF18057B0BF2BF58C24ECC14940E513CFD31C57B0BF0587A0A2E6C14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
681	0106000020E61000000100000001030000000100000006000000F6989ECFF564B0BFDDEF0861E9C14940D233BC46405FB0BF1D28E760E9C14940D69D555C1C5FB0BF6DC192A6E6C149400CA965F26165B0BFBB98D3B3E6C149401A67557D3165B0BFCB04CB67E9C14940F6989ECFF564B0BFDDEF0861E9C14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
682	0106000020E610000001000000010300000001000000090000001FED5116BC6FB0BF74C78ED7EBC149404EA909114862B0BF5D9FF4F1EBC14940A9436E796A62B0BF8284045BEAC1494082DC329E2368B0BF28F21267EAC1494056E5E0E83168B0BFFA020ABEE9C14940653C6CF8336BB0BF6F2460C4E9C149404B83AEF4476BB0BF6235FED7E8C1494097D07073336FB0BF670240E0E8C149401FED5116BC6FB0BF74C78ED7EBC14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
683	0106000020E61000000100000001030000000100000009000000EF0DDB325925B0BF73DC1ED601C24940F64D3DB0560CB0BFCAB7548F02C24940074FABF7EF09B0BFA8252F7BFAC1494049955630F31BB0BF6BF0CAF5F9C149406BACF8A6861CB0BF533CE5E5FBC1494016D79B498B1AB0BF699292F4FBC149407CEAC3A1A21BB0BFE9135BA0FFC14940209D6E37BF24B0BFD0C5E05CFFC14940EF0DDB325925B0BF73DC1ED601C24940	Madani Girls School	E1 1HL	0	\N	Myrdle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
684	0106000020E61000000100000001030000000100000011000000EE7224490813B0BFF6EC1674F7C1494035B57F464107B0BF6A406AF9F7C14940142977407B03B0BFB697C50DEFC14940E75B8377520FB0BF305CF399EEC1494094811A16B20FB0BF7C2C1097EFC14940814337778515B0BFB945616CEFC14940B0B89B5D8116B0BFBB19F7A3EFC149406870C99A0117B0BF9A059E18F0C149404F213E296B16B0BF285F2A91F0C1494015CACA3DC114B0BF61EAB5BDF0C1494080CCDCF4F615B0BF76AF102DF5C14940D7956B29D617B0BF62C8FF52F5C14940BC895F269018B0BF27F182C9F5C149405BC07B149B18B0BF433C3B4FF6C149403496C8D21417B0BF820E689BF6C14940C110B07CCA12B0BF3AA7DD9EF6C14940EE7224490813B0BFF6EC1674F7C14940	Madani Girls School	E1 1HL	0	\N	Myrdle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
685	0106000020E6100000010000000103000000010000000700000022B70B310978B0BFE66D7B6010C24940713EF4C5F06FB0BF2ED1819210C24940D21CE851C86FB0BF955CB8E30FC24940AEC84BAAE86DB0BF051586EE0FC249406BEBB67ABB6DB0BFA996492B0FC249402FEAF435AE77B0BF953C65D70EC2494022B70B310978B0BFE66D7B6010C24940	40 Settles Street	E1 1JP	0	\N	Settles Street	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
686	0106000020E610000001000000010300000001000000070000002FEAF435AE77B0BF953C65D70EC249406BEBB67ABB6DB0BFA996492B0FC2494092863A3E896DB0BF10CB3A520EC249404CD38FAB8F6FB0BFEC818D460EC24940B134DD4D696FB0BF68B6C8A00DC24940500893B65B77B0BF0200F6720DC249402FEAF435AE77B0BF953C65D70EC24940	1 Fordham Street	E1 1HL	0	\N	Fordham Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
687	0106000020E61000000100000001030000000100000007000000A73C84935678B0BF7174D3AE11C2494096AC5069656EB0BF0492A6E811C2494092EF13E4346EB0BF00D7011711C24940D9E083FA0C70B0BF8CC05F0C11C24940713EF4C5F06FB0BF2ED1819210C2494022B70B310978B0BFE66D7B6010C24940A73C84935678B0BF7174D3AE11C24940	42 Settles Street	E1 1JP	0	\N	Settles Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
688	0106000020E61000000100000001030000000100000007000000FC33FAEAAF78B0BFF69FD43013C2494003B3173D8970B0BFE5F41D7413C24940AE501A3C6370B0BF55F9E9CF12C2494016A44A4D9D6EB0BF066123DA12C2494096AC5069656EB0BF0492A6E811C24940A73C84935678B0BF7174D3AE11C24940FC33FAEAAF78B0BFF69FD43013C24940	44 Settles Street	E1 1JP	0	\N	Settles Street	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
689	0106000020E61000000100000001030000000100000007000000BA3913881179B0BFD62393D614C249405EBAF2A3316FB0BFB7B3331215C24940B04990FFF86EB0BF2ACA771D14C24940042BB227AE70B0BFEC1D9F1314C2494003B3173D8970B0BFE5F41D7413C24940FC33FAEAAF78B0BFF69FD43013C24940BA3913881179B0BFD62393D614C24940	46 Settles Street	E1 1JP	0	\N	Settles Street	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
690	0106000020E610000001000000010300000001000000070000005EBAF2A3316FB0BFB7B3331215C24940BA3913881179B0BFD62393D614C24940AE889CFE6379B0BF3328DC3A16C249405ADA74E65271B0BFFF28926B16C2494096F459E73171B0BF5CF300DD15C249401809A1FD626FB0BF8F226EE715C249405EBAF2A3316FB0BFB7B3331215C24940	48 Settles Street	E1 1JP	0	\N	Settles Street	48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
691	0106000020E610000001000000010300000001000000070000005ADA74E65271B0BFFF28926B16C24940AE889CFE6379B0BF3328DC3A16C249409FBB0FA7BC79B0BF5B2FE9B917C2494089871CBAB36FB0BFAD8B81F617C2494011471623826FB0BF773B3E2017C24940C0A9BD167A71B0BFC56AE41417C249405ADA74E65271B0BFFF28926B16C24940	50 Settles Street	E1 1JP	0	\N	Settles Street	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
692	0106000020E6100000010000000103000000010000000700000089871CBAB36FB0BFAD8B81F617C249409FBB0FA7BC79B0BF5B2FE9B917C24940D362B056117AB0BF6EFCCC2719C24940BD07EAD58D71B0BFDCD5355B19C249400A4B89DB6871B0BFFAD0A7C318C24940C737773AE56FB0BF77E862CC18C2494089871CBAB36FB0BFAD8B81F617C24940	52 Settles Street	E1 1JP	0	\N	Settles Street	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
693	0106000020E61000000100000001030000000100000007000000BD07EAD58D71B0BFDCD5355B19C24940D362B056117AB0BF6EFCCC2719C249405B784FC26C7AB0BF3861C9B21AC24940C9C9CAC20870B0BF23AA87F11AC2494043D48C8CC96FB0BF135169E019C249407FDD3649AD71B0BFE5251CDC19C24940BD07EAD58D71B0BFDCD5355B19C24940	54 Settles Street	E1 1JP	0	\N	Settles Street	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
694	0106000020E61000000100000001030000000100000007000000C9C9CAC20870B0BF23AA87F11AC249405B784FC26C7AB0BF3861C9B21AC24940B4509176C67AB0BF0E7B5B361CC2494005DE651A7072B0BFBDB6B3681CC249408B939DDC4672B0BFA63A83B61BC249401AC4A4173970B0BF59D75AC21BC24940C9C9CAC20870B0BF23AA87F11AC24940	56 Settles Street	E1 1JP	0	\N	Settles Street	56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
695	0106000020E6100000010000000103000000010000000700000005DE651A7072B0BFBDB6B3681CC24940B4509176C67AB0BF0E7B5B361CC2494056FBFE85167BB0BF72E542901DC249407CDC805EAF70B0BF0E3114CF1DC249401B806C957870B0BF24795EE21CC24940D51059818972B0BFAEAF74D61CC2494005DE651A7072B0BFBDB6B3681CC24940	58 Settles Street	E1 1JP	0	\N	Settles Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
696	0106000020E610000001000000010300000001000000070000007CDC805EAF70B0BF0E3114CF1DC2494056FBFE85167BB0BF72E542901DC24940FDA69D936E7BB0BF32F9B20C1FC24940FBA93FCB4B73B0BFCCBDD33D1FC249409E67E5C12973B0BF0B8CC4AA1EC249405CE0CD3DE570B0BF70D4D7B71EC249407CDC805EAF70B0BF0E3114CF1DC24940	60 Settles Street	E1 1JP	0	\N	Settles Street	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
697	0106000020E61000000100000001030000000100000007000000FBA93FCB4B73B0BFCCBDD33D1FC24940FDA69D936E7BB0BF32F9B20C1FC249404AFEAA63CA7BB0BF5048619920C2494091CC5D466A71B0BF1A1F08D820C24940CD6CEAA03271B0BF0D1D82D71FC249407D1E58F76B73B0BF2FE2D4C81FC24940FBA93FCB4B73B0BFCCBDD33D1FC24940	62 Settles Street	E1 1JP	0	\N	Settles Street	62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
698	0106000020E6100000010000000103000000010000000700000091CC5D466A71B0BF1A1F08D820C249404AFEAA63CA7BB0BF5048619920C24940E804CD11217CB0BFAABEE20F22C24940A72146C06673B0BF8C94964422C249402715FB6A3473B0BF16728A8421C24940D10892839271B0BFC092879121C2494091CC5D466A71B0BF1A1F08D820C24940	64 Settles Street	E1 1JP	0	\N	Settles Street	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
699	0106000020E61000000100000001030000000100000007000000A72146C06673B0BF8C94964422C24940E804CD11217CB0BFAABEE20F22C24940E4CED4A37B7CB0BFDC06339723C2494021B3C1916A72B0BF1F8CFCD323C24940EF57D3ADDA71B0BF27923CE522C249400F1DCC008873B0BF764F76C322C24940A72146C06673B0BF8C94964422C24940	66 Settles Street	E1 1JP	0	\N	Settles Street	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
700	0106000020E6100000010000000103000000010000000700000021B3C1916A72B0BF1F8CFCD323C24940E4CED4A37B7CB0BFDC06339723C2494048281F76D47CB0BF05D4F41625C24940BD829E279A74B0BFEAABA34825C24940B8A670761D74B0BFC5ED5A8124C24940EA2D65C0DE72B0BF84FCC29424C2494021B3C1916A72B0BF1F8CFCD323C24940	68 Settles Street	E1 1JP	0	\N	Settles Street	68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
701	0106000020E610000001000000010300000001000000070000008A72A63C8E77B0BF32291A1827C249406D57B8538E77B0BF88C10E1827C24940BA025190447DB0BFB3A94CFB26C24940FEEFD0963F7EB0BF35ABDD372BC2494025BF1395967AB0BFE0E5FD5B2BC24940E58EFA838E77B0BF40B3151827C249408A72A63C8E77B0BF32291A1827C24940	72 Settles Street	E1 1JP	0	\N	Settles Street	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
702	0106000020E610000001000000010300000001000000050000003C109C9F0835B0BF7814FF652CC24940F429B6E2783CB0BFB4D7CBF92BC24940CD8C7EDEFD3DB0BF76CA1A292FC24940C33DE1969436B0BFC4DBBF962FC249403C109C9F0835B0BF7814FF652CC24940	4 Myrdle Street	E1 1HL	0	\N	Myrdle Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
703	0106000020E610000001000000010300000001000000050000009524B6E2783CB0BFB6D7CBF92BC24940C10A9C9F0835B0BF7D14FF652CC24940E973DE9C8033B0BFE7D4663D29C2494084C0D2F0F63AB0BFE65BDBD028C249409524B6E2783CB0BFB6D7CBF92BC24940	8 Myrdle Street	E1 1HL	0	\N	Myrdle Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
704	0106000020E6100000010000000103000000010000000500000042BBD2F0F63AB0BFED5BDBD028C249406F6FDE9C8033B0BFE9D4663D29C2494057522DE7E931B0BF8BCC7CF625C24940406C34866639B0BF79C5958925C2494042BBD2F0F63AB0BFED5BDBD028C24940	12 Myrdle Street	E1 1HL	0	\N	Myrdle Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
705	0106000020E61000000100000001030000000100000005000000546734866639B0BF81C5958925C24940BF4C2DE7E931B0BF8DCC7CF625C2494050CAAE3B4F30B0BF769C67A722C24940DFE77735D237B0BFA921243A22C24940546734866639B0BF81C5958925C24940	16 Myrdle Street	E1 1HL	0	\N	Myrdle Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
706	0106000020E6100000010000000103000000010000000500000080E27735D237B0BFAB21243A22C24940B7C4AE3B4F30B0BF7C9C67A722C24940B7BFCA62D32EB0BF5641E6971FC24940BC1A3E3D5C36B0BFA3444D2A1FC2494080E27735D237B0BFAB21243A22C24940	22 Myrdle Street	E1 1HL	0	\N	Myrdle Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
707	0106000020E61000000100000001030000000100000005000000B3153E3D5C36B0BFA6444D2A1FC24940CBBACA62D32EB0BF5941E6971FC2494030029CD3342DB0BF9346CB401CC24940C3BF3818C434B0BF5AF4D4D21BC24940B3153E3D5C36B0BFA6444D2A1FC24940	26 Myrdle Street	E1 1HL	0	\N	Myrdle Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
708	0106000020E6100000010000000103000000010000000500000047BA3818C434B0BF5DF4D4D21BC2494097FC9BD3342DB0BF9846CB401CC24940E8B3D4A0A62BB0BFDEA76F0B19C24940C5DACC0E3C33B0BFA1B11F9D18C2494047BA3818C434B0BF5DF4D4D21BC24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
709	0106000020E610000001000000010300000001000000050000009FD5CC0E3C33B0BFA7B11F9D18C249404FAED4A0A62BB0BFE0A76F0B19C24940DF51C047252AB0BF39A695F015C24940C43F2DACC031B0BFE1F1EE8115C249409FD5CC0E3C33B0BFA7B11F9D18C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
710	0106000020E61000000100000001030000000100000005000000113B2DACC031B0BFE5F1EE8115C24940B94CC047252AB0BF40A695F015C2494065025FF58628B0BF1016F89912C249402E8D04C32830B0BF071AF42A12C24940113B2DACC031B0BFE5F1EE8115C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
711	0106000020E61000000100000001030000000100000005000000088804C32830B0BF0B1AF42A12C2494040FD5EF58628B0BF1416F89912C24940799FE4110427B0BF4F8FF07B0FC24940E1AB19DCAB2EB0BF4D7D950C0FC24940088804C32830B0BF0B1AF42A12C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
712	0106000020E61000000100000001030000000100000005000000BBA619DCAB2EB0BF517D950C0FC249401A9AE4110427B0BF558FF07B0FC249409634BFC65925B0BFAA83C61C0CC2494065610D07212DB0BF242AC3060CC24940BBA619DCAB2EB0BF517D950C0FC24940	Madani Girls School	E1 1HL	0	\N	Myrdle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
713	0106000020E610000001000000010300000001000000050000003EA75CB7CA6BB0BF6097DC7826C24940854150862D65B0BFCB01A2D626C2494068C47E2C9764B0BFEBFBDF8525C24940E067D65C346BB0BFF3991A2825C249403EA75CB7CA6BB0BF6097DC7826C24940	49 Parfett Street	E1	0	\N	Parfett Street	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
714	0106000020E61000000100000001030000000100000005000000F74150862D65B0BFCB01A2D626C249403EA75CB7CA6BB0BF6097DC7826C24940E065863D5D6CB0BFACCB0AC127C24940BA31B1D2BD65B0BF5CA9FA2228C24940F74150862D65B0BFCB01A2D626C24940	51 Parfett Street	E1	0	\N	Parfett Street	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
715	0106000020E61000000100000001030000000100000005000000E067D65C346BB0BFF3991A2825C249402FC47E2C9764B0BFEEFBDF8525C24940E9AF8229F463B0BF2F37161624C24940B8BAF6A0946AB0BF0B2356C223C24940E067D65C346BB0BFF3991A2825C24940	47 Parfett Street	E1	0	\N	Parfett Street	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
716	0106000020E61000000100000001030000000100000005000000B8BAF6A0946AB0BF0B2356C223C2494078B08229F463B0BF2F37161624C24940F7B2A9FF6163B0BF6158CFC822C2494098D2B0E9FE69B0BFECCA017322C24940B8BAF6A0946AB0BF0B2356C223C24940	45 Parfett Street	E1	0	\N	Parfett Street	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
717	0106000020E6100000010000000103000000010000000500000098D2B0E9FE69B0BFECCA017322C2494085B2A9FF6163B0BF6158CFC822C2494012BFB521D662B0BFB38DD68021C249409F38FC226A69B0BFD243C82521C2494098D2B0E9FE69B0BFECCA017322C24940	43 Parfett Street	E1	0	\N	Parfett Street	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
718	0106000020E610000001000000010300000001000000050000009F38FC226A69B0BFD243C82521C24940D9BEB521D662B0BFB58DD68021C249407348232F2F62B0BF70FFD51620C249402F83309DC968B0BF928A3FBE1FC249409F38FC226A69B0BFD243C82521C24940	41 Parfett Street	E1	0	\N	Parfett Street	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
719	0106000020E610000001000000010300000001000000050000002F83309DC968B0BF928A3FBE1FC249407348232F2F62B0BF70FFD51620C2494001EC1E92A261B0BFE2D5E7E01EC249403AC1269E4068B0BF8F6B688B1EC249402F83309DC968B0BF928A3FBE1FC24940	39 Parfett Street	E1	0	\N	Parfett Street	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
720	0106000020E610000001000000010300000001000000050000003AC1269E4068B0BF8F6B688B1EC24940C9EB1E92A261B0BFE4D5E7E01EC2494006C1B1B4DE60B0BF370176531DC24940ACAB16299167B0BF6C736C021DC249403AC1269E4068B0BF8F6B688B1EC24940	37 Parfett Street	E1	0	\N	Parfett Street	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
721	0106000020E61000000100000001030000000100000005000000ACAB16299167B0BF6C736C021DC24940B1C0B1B4DE60B0BF3A0176531DC249409FBD1F966A60B0BF48D291131CC249406161A13EF266B0BF359ADBC91BC24940ACAB16299167B0BF6C736C021DC24940	37 Parfett Street	E1	0	\N	Parfett Street	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
722	0106000020E610000001000000010300000001000000050000004636C58B6A68B0BF52D731BC1BC24940BABC1F966A60B0BF47D291131CC24940EDA2809F945CB0BF044C5A8913C24940D348AE209A64B0BFCB8F353113C249404636C58B6A68B0BF52D731BC1BC24940	27 Parfett Street	E1	0	\N	Parfett Street	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
723	0106000020E61000000100000001030000000100000005000000D348AE209A64B0BFCB8F353113C24940EDA2809F945CB0BF044C5A8913C249405DE2CA36E55BB0BF5E1F780012C24940D493C7B7EA63B0BF9E6453A811C24940D348AE209A64B0BFCB8F353113C24940	19 Parfett Street	E1	0	\N	Parfett Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
724	0106000020E61000000100000001030000000100000005000000D493C7B7EA63B0BF9E6453A811C249405DE2CA36E55BB0BF5E1F780012C249407C995943575BB0BFAD8C86C210C2494099752EC45C63B0BFA7D2616A10C24940D493C7B7EA63B0BF9E6453A811C24940	17 Parfett Street	E1	0	\N	Parfett Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
725	0106000020E6100000010000000103000000010000000500000099752EC45C63B0BFA7D2616A10C249407C995943575BB0BFAD8C86C210C249406595EE03C55AB0BF8F3CF57A0FC249403A359984CA62B0BF9780D0220FC2494099752EC45C63B0BFA7D2616A10C24940	15 Parfett Street	E1	0	\N	Parfett Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
726	0106000020E610000001000000010300000001000000050000003A359984CA62B0BF9780D0220FC249406595EE03C55AB0BF8F3CF57A0FC24940CBE7802A3D5AB0BFA548AE4A0EC24940B2AA02324262B0BF0F837AF10DC249403A359984CA62B0BF9780D0220FC24940	9 Fordham Street	E1 1HL	0	\N	Fordham Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
727	0106000020E61000000100000001030000000100000008000000DA006257D25CB0BF72184ACA0AC24940FB607157575DB0BFEB664AD90CC24940C320B88E575DB0BF493051D90CC249405759B387575DB0BFE95851D90CC24940648D8C746B5DB0BF4F32C04A0DC249404EB8E642ED59B0BF3965CC580DC24940BCB2CAB07D58B0BFD92CD0D90AC24940DA006257D25CB0BF72184ACA0AC24940	11 Fordham Street	E1 1HL	0	\N	Fordham Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
728	0106000020E61000000100000001030000000100000009000000C320B88E575DB0BF493051D90CC24940FB607157575DB0BFEB664AD90CC24940DA006257D25CB0BF72184ACA0AC24940FFCEFD129562B0BF2CC1A3B50AC2494010329D0EB562B0BF4E0A8B330DC2494002C8DC0AB562B0BFD69D92330DC24940C924B86AA061B0BF18FFF1360DC24940A8C27387B461B0BF460711C00CC24940C320B88E575DB0BF493051D90CC24940	9 Fordham Street	E1 1HL	0	\N	Fordham Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
729	0106000020E6100000010000000103000000010000000900000002C8DC0AB562B0BFD69D92330DC2494010329D0EB562B0BF4E0A8B330DC24940FFCEFD129562B0BF2CC1A3B50AC249405B6FD9F9B067B0BF107053A30AC2494064A72651AC67B0BF0E034BB00CC24940D70E2F7AAC67B0BF18FE51B00CC2494021FBE1C22364B0BFFE17AEB80CC24940A0E5569D0564B0BFEE22782F0DC2494002C8DC0AB562B0BFD69D92330DC24940	7 Fordham Street	E1 1HL	0	\N	Fordham Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
730	0106000020E61000000100000001030000000100000009000000D70E2F7AAC67B0BF18FE51B00CC2494064A72651AC67B0BF0E034BB00CC249405B6FD9F9B067B0BF107053A30AC24940E306195FB16CB0BF61B865910AC2494005F27335BA6CB0BF74E50BFC0CC2494080914332BA6CB0BF4A8013FC0CC24940E764368DBC6BB0BF95F257FF0CC249408267ED95D56BB0BFF47B7AA60CC24940D70E2F7AAC67B0BF18FE51B00CC24940	5 Fordham Street	E1 1HL	0	\N	Fordham Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
731	0106000020E610000001000000010300000001000000070000006DCE44C5D071B0BF1903AB800CC24940BFD60EB1D071B0BF6DB2A3800CC249408D0446BDF171B0BFD1AF927E0AC24940DD5B05EEF171B0BF1301927E0AC24940B4A1271F4877B0BF70BD706B0AC249405FE90B951C77B0BFE7ACDA6C0CC249406DCE44C5D071B0BF1903AB800CC24940	1 Fordham Street	E1 1HL	0	\N	Fordham Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
732	0106000020E610000001000000010300000001000000090000008D0446BDF171B0BFD1AF927E0AC24940BFD60EB1D071B0BF6DB2A3800CC249406DCE44C5D071B0BF1903AB800CC24940E3D9399F496EB0BFBFDADD8D0CC2494072FE31DE366EB0BF37282CF70CC2494080914332BA6CB0BF4A8013FC0CC2494005F27335BA6CB0BF74E50BFC0CC24940E306195FB16CB0BF61B865910AC249408D0446BDF171B0BFD1AF927E0AC24940	3 Fordham Street	E1 1HL	0	\N	Fordham Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
733	0106000020E610000001000000010300000001000000050000008EB195AD9C47B0BF92ED200E04C249401FCD0131AD48B0BF1051E21508C249400ED4A36E4444B0BF2BAE0A3308C249404A1547194043B0BFD1D16C2604C249408EB195AD9C47B0BF92ED200E04C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
734	0106000020E610000001000000010300000001000000070000005C550EAF7668B0BF655D990205C24940E472D2837668B0BF2E28A60205C24940F7D25DD2F068B0BF44A12B5807C249404C7F570E9C63B0BF6BB35F6C07C249407968EF6A0063B0BF20B340B404C24940A307236C5868B0BF2EB34B8C04C249405C550EAF7668B0BF655D990205C24940	11 Parfett Street	E1	0	\N	Parfett Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
735	0106000020E610000001000000010300000001000000080000003B1867F37A6DB0BF3D14D64607C24940340A7CE1E06CB0BFA3E5D0EB04C24940AD4DC3FD926FB0BF4E3EE3F004C2494080F392E4706FB0BF4DDBA2D103C24940B194F19B7075B0BFA4284BC303C24940308F5F99E475B0BFCE339FAC06C24940A05B4D25DB74B0BFEBE4351B07C249403B1867F37A6DB0BF3D14D64607C24940	3 Fordham Street	E1 1HL	0	\N	Fordham Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
736	0106000020E6100000010000000103000000010000000600000096C9F0187A76B0BF357F56482BC24940F1F7CE197A76B0BF3E434C482BC249402010B91E1274B0BF0F25445928C24940AC92191F3E78B0BFF28C650F28C24940FDE2A13A587AB0BF152480042BC2494096C9F0187A76B0BF357F56482BC24940	72 Settles Street	E1 1JP	0	\N	Settles Street	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
737	0106000020E61000000100000001030000000100000008000000FCB0AA436B6EB0BF1E30A1D52BC24940B9F3CFD2CB6EB0BF057CCD542CC24940C5BCB9649067B0BF13179ADD2CC249406532B1D2BD65B0BF5CA9FA2228C24940251DF2C68869B0BF03462FEA27C249401A398B694D6AB0BF1F30C89C29C2494024BDCB03C86CB0BFFDEDBF8729C24940FCB0AA436B6EB0BF1E30A1D52BC24940	53 Parfett Street	E1	0	\N	Parfett Street	53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
738	0106000020E6100000010000000103000000010000000F000000DE651DECC3EEB0BF724416A719C24940B75BA7A7C3FFB0BFF8D87F0918C24940D5FF4B0D7701B1BFE34F0AC119C249404A2155EB02FFB0BF793694041BC2494027D552015004B1BFA448AB221DC249401587B3790509B1BF0C4BA3B922C24940A70274AB5E0AB1BF5403A15425C24940967D24BC3C07B1BF75BCAA1D27C24940398D8AFA3602B1BFEE3DC7FB28C249403DF593F55BF9B0BF1BB7A5CA29C249405E90B6D849E5B0BF0E6248A029C249400B2C861020E1B0BF7F6F77C228C249406FF7BB3E92DCB0BF8A880D641BC24940BC402BF7C3EEB0BF64BF20A719C24940DE651DECC3EEB0BF724416A719C24940	The Curve, 14 Fieldgate Street	E1 1ES	0	\N	Fieldgate Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
739	0106000020E6100000010000000103000000010000000700000089924B8CEED5B0BFAAC9880319C249403BA19C5CEED5B0BFE146840319C24940D37F66152DC3B0BFEDC05CAC19C2494069B3381ABCC0B0BF7B689C2B13C249400275044BADD1B0BF53BBB87312C249402C74373D66D3B0BFD6914B5E12C2494089924B8CEED5B0BFAAC9880319C24940	Jacobs Court, 17 Plumbers Row	E1 1EE	0	\N	Plumbers Row	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
740	0106000020E6100000010000000103000000010000000500000013B2381ABCC0B0BF7B689C2B13C249400ADC1C6DA7BCB0BFF841F48909C249400F4467DE4BCDB0BFBEDEC60A09C24940A470044BADD1B0BF54BBB87312C2494013B2381ABCC0B0BF7B689C2B13C24940	Jacobs Court, 17 Plumbers Row	E1 1EE	0	\N	Plumbers Row	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
741	0106000020E61000000100000001030000000100000006000000EBDA1C6DA7BCB0BFFB41F48909C24940869F23D45ABAB0BF3779797102C24940DB6E950CB8CDB0BFCCB3958301C249403AC7361F54D1B0BF7A36D8DA08C24940E24A67DE4BCDB0BFC1DEC60A09C24940EBDA1C6DA7BCB0BFFB41F48909C24940	Colefax Building, 23 Plumbers Row	E1 1EE	0	\N	Plumbers Row	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
742	0106000020E61000000100000001030000000100000005000000450E138896CEB0BFD1658F7801C249406A9F23D45ABAB0BF3879797102C249407983789A89B8B0BF7AC1EF88FEC1494003E16765CDCCB0BF0A6FC3B1FDC14940450E138896CEB0BFD1658F7801C24940	Colefax Building, 23 Plumbers Row	E1 1EE	0	\N	Plumbers Row	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
743	0106000020E6100000010000000103000000010000000F00000002FC1CBB7FE1B0BF1CE0A7BFF6C14940DB05041690D5B0BF7F5BE6ABF6C149407378ACFDA3D5B0BF3FB2D78CF7C149408F54ADED37CFB0BF75892D7FF7C14940F974BE8D6ECFB0BF8B52C0A1F6C149406FA34A25A5CBB0BFC866869BF6C1494049CFEDA860CCB0BFF5B2A08CF0C1494001CF10C9C8D0B0BFE0DA30A3F0C1494050AEAC2E07D1B0BF34889073EFC14940086D696997B3B0BFFBC9D6DCEEC1494051AF0B21E2B4B0BF4AADB293E8C1494091593344AFFBB0BF213D33FEE9C14940DF83219B29FBB0BF10B50228F0C149405B55683613E2B0BF254B0EF3EFC1494002FC1CBB7FE1B0BF1CE0A7BFF6C14940	CASS Faculty 	E1 1LA	0	\N	Coke Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
744	0106000020E61000000100000001030000000100000009000000614663BD9EE6B0BFEDA83091F5C1494055142850EEE6B0BF357504E6F1C14940AE432DF4D8F2B0BFEED82BFFF1C14940CA82D92BEEF2B0BF06A7B904F1C14940982E3F6E2EFCB0BFD23A4018F1C149406781CE9125FFB0BF846476FCF4C1494020C5E4FC12FBB0BF3F0356E7F4C1494028E2B111D7FAB0BF6C961C07F6C14940614663BD9EE6B0BFEDA83091F5C14940	London Metropolitan University 	E1 1LF	0	\N	Coke Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
745	0106000020E610000001000000010300000001000000050000004356AA580F8FB0BFBE79751A26C249406BA123D81387B0BFF3C6575D26C2494003A7B2D0BE86B0BF0E1AB2E624C249402E179350BA8EB0BF4DCCCFA324C249404356AA580F8FB0BFBE79751A26C24940	70 Settles Street	E1 1JP	0	\N	Settles Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
746	0106000020E610000001000000010300000001000000080000006BA123D81387B0BFF3C6575D26C249404356AA580F8FB0BFBE79751A26C2494030242721868FB0BFC687D02528C2494062C7FFCCDA90B0BF021FE42E28C249404701E2B99791B0BF38A861A829C24940D5C09B11B889B0BF77DE70EC29C24940988840E5C387B0BF451C0B6529C249406BA123D81387B0BFF3C6575D26C24940	72 Settles Street	E1 1JP	0	\N	Settles Street	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
747	0106000020E610000001000000010300000001000000070000002E179350BA8EB0BF4DCCCFA324C2494003A7B2D0BE86B0BF0E1AB2E624C24940A98D5E8D7286B0BF453AAC9623C2494098E9E01E708EB0BF12B7B75D23C249400D4A6F5D708EB0BFFA57BE5D23C24940CEED224F708EB0BFD3A8BE5D23C249402E179350BA8EB0BF4DCCCFA324C24940	68 Settles Street	E1 1JP	0	\N	Settles Street	68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
748	0106000020E610000001000000010300000001000000090000000D4A6F5D708EB0BFFA57BE5D23C2494098E9E01E708EB0BF12B7B75D23C24940A98D5E8D7286B0BF453AAC9623C2494065C909272686B0BFD3200C4622C24940B9D3BE5AAC8DB0BF3C576A1022C249401B5171B7B78DB0BF96117A4222C249404CE68F367091B0BF9150702D22C249408639F81AB191B0BF2FBB594B23C249400D4A6F5D708EB0BFFA57BE5D23C24940	66 Settles Street	E1 1JP	0	\N	Settles Street	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
749	0106000020E61000000100000001030000000100000008000000B9D3BE5AAC8DB0BF3C576A1022C2494065C909272686B0BFD3200C4622C249407329A459CD85B0BF5959C6BE20C2494084BD46CA6F8DB0BFAB535B8820C249402440C0921391B0BFB1B1C67320C24940914012AF3B91B0BFD17C802421C24940A8E9A49F7B8DB0BFB202B53921C24940B9D3BE5AAC8DB0BF3C576A1022C24940	64 Settles Street	E1 1JP	0	\N	Settles Street	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
750	0106000020E6100000010000000103000000010000000600000084BD46CA6F8DB0BFAB535B8820C249407329A459CD85B0BF5959C6BE20C2494008AF0A4E7D85B0BF4B2B165E1FC24940875890F7CB8CB0BF6F31002A1FC249407466BAE71B8DB0BF68A4358A20C2494084BD46CA6F8DB0BFAB535B8820C24940	62 Settles Street	E1 1JP	0	\N	Settles Street	62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
751	0106000020E61000000100000001030000000100000007000000875890F7CB8CB0BF6F31002A1FC2494008AF0A4E7D85B0BF4B2B165E1FC24940F64863B93885B0BF8761B5421EC24940778E709A8F90B0BF10EACFFF1DC24940A061DB82BB90B0BF3BD4F19C1EC24940D5F54E23B18CB0BF928BCAB31EC24940875890F7CB8CB0BF6F31002A1FC24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
752	0106000020E61000000100000001030000000100000009000000938D709A8F90B0BF10EACFFF1DC24940104863B93885B0BF8761B5421EC2494071903E06CB84B0BFD656904C1CC24940C52F7453D18BB0BFF9447E1A1CC2494018C8C402508CB0BF52EE80281CC2494060CFA64DD58BB0BFDDC2362B1CC249409945BCA61B8CB0BF6A6B2B611DC2494011BB324B6E90B0BFA011BA481DC24940938D709A8F90B0BF10EACFFF1DC24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
753	0106000020E6100000010000000103000000010000000900000018C8C402508CB0BF52EE80281CC24940C52F7453D18BB0BFF9447E1A1CC2494071903E06CB84B0BFD656904C1CC24940B2F0FE667E84B0BFA174F5FA1AC249402B872BBA3B8BB0BF944895D91AC24940A54EA7C44E8BB0BF6F807A2D1BC249405D6B1138368EB0BFDEC60E1D1BC24940823BFB30708EB0BF98F27B1C1CC2494018C8C402508CB0BF52EE80281CC24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
754	0106000020E610000001000000010300000001000000070000002B872BBA3B8BB0BF944895D91AC24940B2F0FE667E84B0BFA174F5FA1AC24940BE61A1B52B84B0BF6BF79A8E19C24940BBB0995D7B8FB0BFFB04975619C24940EE285A11A98FB0BF4518F41F1AC24940B5FFB475178BB0BFA079C9391AC249402B872BBA3B8BB0BF944895D91AC24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
755	0106000020E61000000100000001030000000100000007000000BBB0995D7B8FB0BFFB04975619C24940BE61A1B52B84B0BF6BF79A8E19C24940156603E6D083B0BF6B7A7BFE17C24940AF99E0632B8BB0BF725DE7D417C249408BA74CA5588BB0BFE25E4D9C18C249400177DF034C8FB0BF85B8F68518C24940BBB0995D7B8FB0BFFB04975619C24940	54 Settles Street	E1 1JP	0	\N	Settles Street	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
756	0106000020E610000001000000010300000001000000080000005C347107889EB0BF3BF55ACF28C24940F5B36950789EB0BF063FB40A24C24940A195C51D4BA3B0BF7F0E7F0724C24940E758B5FB2AADB0BF9D3C847823C24940A1E9E701F8BAB0BFA6DFF7D322C24940CCBAC6ABC4BDB0BFFF1013AD28C249403774550C7BBCB0BF839F9A0E29C249405C347107889EB0BF3BF55ACF28C24940	Maedah Grill, 42 Fieldgate Street	E1 1ES	0	\N	Fieldgate Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
757	0106000020E61000000100000001030000000100000005000000C02FC7B2D9A9B0BF9155B2DD1AC2494025F8E8E1B2B7B0BFEA9231591AC249407C2EA6D1F7BAB0BFE7EDF0D322C249407157B5FB2AADB0BF9D3C847823C24940C02FC7B2D9A9B0BF9155B2DD1AC24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
758	0106000020E6100000010000000103000000010000000B000000EEE8E8E1B2B7B0BFF79231591AC249401620C7B2D9A9B0BF9D55B2DD1AC249409854B70467A9B0BF624D3FB419C249401410B2CAB6A3B0BF6068E2EA19C24940684507D4A2A2B0BF3010181F17C24940503E847FA9A7B0BF778FD1EE16C2494038FA41853AA7B0BF28E3F7CE15C2494079B858E9D3ABB0BFCCE9CAA215C249407C7210F83BACB0BF3511B1B016C2494033AE0A1C25B6B0BFF03A7F5116C24940EEE8E8E1B2B7B0BFF79231591AC24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
759	0106000020E6100000010000000103000000010000001200000068BDDBC754ADB0BF52B5DB1411C2494078803554798EB0BF787F9D4B12C249401B3BA31A9D8AB0BF286D066811C249403FD9DCB13D8AB0BF8856085210C24940FA03CCB0808DB0BF850B9A0D0FC2494054D514DAF692B0BF14BEEADD0EC249401A088691D292B0BF7C97C6680EC24940B07B3190AE90B0BF2FDE387B0DC249405545A8F4FE8CB0BF8676679B0DC249405F4BEB65798BB0BF14F7CC4309C249408ED27626158EB0BFE3DA062D09C249400D2D3506DB8DB0BFE6152A8708C24940FEA96A93C2A9B0BF053B869307C24940B0899D9F13AAB0BF7FFDC77A08C2494098765DD9D9AFB0BFE9DD5C4808C24940704615CFD8B0B0BF035FD71F0BC24940186336414FABB0BFDABD30500BC2494068BDDBC754ADB0BF52B5DB1411C24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
760	0106000020E61000000100000001030000000100000013000000013D9F1B8D7EB0BF95934E8602C249402A83D029DF7DB0BF86456A6FFFC1494074F39E6A9A7FB0BF86A49D60FFC14940D01F48D6C67DB0BF5734F860F6C14940135749A9F47BB0BF529F2D6AF6C149403344CB81487BB0BF0C9C011AF3C149406A6CD4AB118CB0BF2EF2E2E3F2C14940955F20EADE91B0BF224B3A7CF3C149409C8525217C95B0BF521ABC4BF4C1494095484777C698B0BF59083254F5C1494051AFF147FE9AB0BFC9FCEDE9F6C149404DDCB6B8CF9CB0BF821C099EF8C149408086E37A549DB0BF8D471EC1FBC1494019D5FED49B9CB0BF9935B9B5FEC14940FFFE25EAF499B0BF63CFF4D7FFC149408FD4AC438A96B0BF1F7011E300C2494065AB58EF8992B0BFABCC179D01C249404F553DB01E8EB0BF3ACD5A1D02C24940013D9F1B8D7EB0BF95934E8602C24940	London School of Commerce 	E1 1ES	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
761	0106000020E61000000100000001030000000100000005000000CACED1D8F5ADB0BFC04B474102C24940B01344BDDBA2B0BF0348F0B902C24940FA671769ED9EB0BF1BA40CB7F9C149404E82D03CE3AAB0BF11A00F35F9C14940CACED1D8F5ADB0BFC04B474102C24940	London School of Commerce 	E1 1ES	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
762	0106000020E61000000100000001030000000100000005000000758D959AC2AAB0BFD9E74ACEF8C149404B6471AECA9EB0BF342DA751F9C14940A7F2E72C609BB0BFEE078390F1C1494034C65D8885A7B0BFFE0F340BF1C14940758D959AC2AAB0BFD9E74ACEF8C14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
763	0106000020E610000001000000010300000001000000050000008FB31C5885A7B0BFBB1D2D0BF1C14940DDC369A7D193B0BF710400D3F1C1494018F543B2C493B0BFA1F92D0DEFC149401776823869A6B0BFA88A6D07EFC149408FB31C5885A7B0BFBB1D2D0BF1C14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
764	0106000020E6100000010000000103000000010000000D0000006236353C359BB0BF776F3FCCEAC14940DAC808E137A0B0BF1F699FBFEAC1494020553BC1DA9FB0BFDBFF7825E8C149407195C9F6DA9FB0BF82A46925E8C1494045507CF1DA9FB0BF34F27F25E8C14940E0AD90C0C9A4B0BF1206B742E8C14940959DD6EF89A6B0BF1B343C83EDC149406069410869A6B0BF5D986607EFC14940F2FF43B2C493B0BFA0F92D0DEFC14940CC836E11BD93B0BFFC1EB393EEC14940D7E450558493B0BF5165F6F5ECC14940020759E1729BB0BF4F849B0BEDC149406236353C359BB0BF776F3FCCEAC14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
765	0106000020E61000000100000001030000000100000005000000219FD3465B9BB0BF874A3D2EECC1494027FE620FD896B0BF45D1F523ECC149408D67D1DE7E96B0BF357F8893E6C14940A8B5543DC19AB0BF7362DC94E6C14940219FD3465B9BB0BF874A3D2EECC14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
766	0106000020E610000001000000010300000001000000070000008F6390AE7E96B0BFD48C8193E6C14940A967D1DE7E96B0BF337F8893E6C1494068F2620FD896B0BF4CD1F523ECC14940090000D7DF96B0BF586679FBECC14940BBD550558493B0BF5A65F6F5ECC14940B6861DDBA592B0BF06C4339EE6C149408F6390AE7E96B0BFD48C8193E6C14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
767	0106000020E61000000100000001030000000100000006000000AF7CDCAAA592B0BFA7D12C9EE6C14940CBCBD08AFC92B0BF26CAB517E9C1494059836E11BD93B0BFFC1EB393EEC149409724DF6F007BB0BF394435E8EEC14940EDA673ACED79B0BF835D4214E7C14940AF7CDCAAA592B0BFA7D12C9EE6C14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
768	0106000020E610000001000000010300000001000000050000002D90F162285BB0BF67D327AF2AC249400DEC1E0BF85BB0BFF7E864582DC2494063685F910457B0BFE577EEA02DC24940A137AD45DA55B0BFBA6882FE2AC249402D90F162285BB0BF67D327AF2AC24940	60 Parfett Street	E1	0	\N	Parfett Street	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
769	0106000020E610000001000000010300000001000000080000003139AD45DA55B0BFB96882FE2AC2494063685F910457B0BFE577EEA02DC24940AC9231237952B0BFE5505DE32DC24940CDB850B74051B0BF3053E83F2BC24940545262B44051B0BF31FDE23F2BC2494018DDB52E3E51B0BF3DA04B3B2BC24940B03D93E74051B0BFE144EF3F2BC249403139AD45DA55B0BFB96882FE2AC24940	60 Parfett Street	E1	0	\N	Parfett Street	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
770	0106000020E6100000010000000103000000010000000A00000018DDB52E3E51B0BF3DA04B3B2BC24940545262B44051B0BF31FDE23F2BC24940CDB850B74051B0BF3053E83F2BC24940AC9231237952B0BFE5505DE32DC24940F728093B544DB0BFCAA88F2E2EC24940E74F642FE04BB0BF2ADFFD9B2BC249405899B984414DB0BF0294468A2BC24940E6D6A7A1DD4CB0BF12770AE02AC2494065E40B0CE650B0BF16D616A52AC2494018DDB52E3E51B0BF3DA04B3B2BC24940	4 Myrdle Street	E1 1HL	0	\N	Myrdle Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	0106000020E610000001000000010300000001000000070000005C51642FE04BB0BF2ADFFD9B2BC24940F728093B544DB0BFCAA88F2E2EC2494065913762B148B0BF87CE54722EC24940A8CDDD40C546B0BFE3005A362BC24940A404329F7149B0BF3FEBBF102BC24940036FD140D649B0BF73F540BC2BC249405C51642FE04BB0BF2ADFFD9B2BC24940	4 Myrdle Street	E1 1HL	0	\N	Myrdle Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
772	0106000020E61000000100000001030000000100000007000000CD0580513160B0BF07C2AB092DC24940C5E31E0BF85BB0BFFDE864582DC249400E8FF162285BB0BF69D327AF2AC249402C60F04DB557B0BFCD4DA6E42AC24940B3CFD449CA56B0BF2F5D932E29C249401DBF6F15745DB0BFCBC202CB28C24940CD0580513160B0BF07C2AB092DC24940	60 Parfett Street	E1	0	\N	Parfett Street	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
773	0106000020E61000000100000001030000000100000005000000CCEFCD24D25CB0BFAD73AD6827C24940E8E7C943D954B0BF51CC85E727C249408634F4073754B0BF98EC567526C24940F82D8558295CB0BF41BCEFF625C24940CCEFCD24D25CB0BFAD73AD6827C24940	56 Parfett Street	E1	0	\N	Parfett Street	56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
774	0106000020E6100000010000000103000000010000000600000075E7C943D954B0BF51CC85E727C24940CCEFCD24D25CB0BFAD73AD6827C249406D572DE5735DB0BF13D1FBCA28C24940EDCFD449CA56B0BF2E5D932E29C24940F8C02F158355B0BF517B5D4229C2494075E7C943D954B0BF51CC85E727C24940	58 Parfett Street	E1	0	\N	Parfett Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
775	0106000020E61000000100000001030000000100000005000000F82D8558295CB0BF41BCEFF625C249408634F4073754B0BF98EC567526C249402783DBE3B553B0BF82C4AA4E25C249406F47C2FAA25BB0BF62A99DD024C24940F82D8558295CB0BF41BCEFF625C24940	54 Parfett Street	E1	0	\N	Parfett Street	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
776	0106000020E61000000100000001030000000100000005000000006A6F061953B0BF98E630DE23C24940F02D7787015BB0BF5222F86E23C249406F47C2FAA25BB0BF62A99DD024C249407E83DBE3B553B0BF84C4AA4E25C24940006A6F061953B0BF98E630DE23C24940	52 Parfett Street	E1	0	\N	Parfett Street	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
777	0106000020E61000000100000001030000000100000005000000F02D7787015BB0BF5222F86E23C249408E696F061953B0BF96E630DE23C24940BB774F927852B0BF58DC117022C249406806229C5A5AB0BF32E9570122C24940F02D7787015BB0BF5222F86E23C24940	50 Parfett Street	E1	0	\N	Parfett Street	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
778	0106000020E610000001000000010300000001000000050000006806229C5A5AB0BF32E9570122C24940D8774F927852B0BF58DC117022C2494073292E71E051B0BFEC4CF11421C24940DF25C852C559B0BF9B824AB320C249406806229C5A5AB0BF32E9570122C24940	48 Parfett Street	E1	0	\N	Parfett Street	48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
779	0106000020E61000000100000001030000000100000005000000C225C852C559B0BF9C824AB320C24940042A2E71E051B0BFEC4CF11421C2494060DB539A4151B0BFE694CABC1FC249400FA9DC1B2C59B0BF3C00BC6A1FC24940C225C852C559B0BF9C824AB320C24940	46 Parfett Street	E1	0	\N	Parfett Street	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
780	0106000020E610000001000000010300000001000000050000000FA9DC1B2C59B0BF3C00BC6A1FC24940F0DB539A4151B0BFE694CABC1FC249406C8BC5B3AF50B0BF5C2E975D1EC2494015424EA38458B0BFC46FE6FB1DC249400FA9DC1B2C59B0BF3C00BC6A1FC24940	44 Parfett Street	E1	0	\N	Parfett Street	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
781	0106000020E610000001000000010300000001000000050000005069A20BF457B0BF14002EBF1CC2494079F0BBAB1A50B0BF395DC4151DC249400215C05E8A4FB0BFA5D780CC1BC24940149C8AE05D57B0BF99E33E761BC249405069A20BF457B0BF14002EBF1CC24940	40 Parfett Street	E1	0	\N	Parfett Street	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
782	0106000020E6100000010000000103000000010000000500000040F0BBAB1A50B0BF365DC4151DC249405069A20BF457B0BF14002EBF1CC2494015424EA38458B0BFC46FE6FB1DC24940F588C5B3AF50B0BF5C2E975D1EC2494040F0BBAB1A50B0BF365DC4151DC24940	42 Parfett Street	E1	0	\N	Parfett Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
783	0106000020E61000000100000001030000000100000005000000149C8AE05D57B0BF99E33E761BC249400114C05E8A4FB0BFA5D780CC1BC24940EAAD1B15FC4EB0BFA038D5871AC24940594CF513BE56B0BFD54737181AC24940149C8AE05D57B0BF99E33E761BC24940	38 Parfett Street	E1	0	\N	Parfett Street	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
784	0106000020E61000000100000001030000000100000005000000594CF513BE56B0BFD54737181AC2494008AF1B15FC4EB0BFA038D5871AC24940B49A699F5C4EB0BFCC03762C19C24940CFE70B702156B0BFD8031BC118C24940594CF513BE56B0BFD54737181AC24940	36 Parfett Street	E1	0	\N	Parfett Street	36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
785	0106000020E61000000100000001030000000100000005000000CFE70B702156B0BFD8031BC118C24940B69B699F5C4EB0BFCC03762C19C24940332EAB2EB54DB0BF447373D217C249409248DCE08555B0BF2BE65C6C17C24940CFE70B702156B0BFD8031BC118C24940	34 Parfett Street	E1	0	\N	Parfett Street	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
786	0106000020E610000001000000010300000001000000050000009248DCE08555B0BF2BE65C6C17C24940C02DAB2EB54DB0BF447373D217C249405ACBC0172E4DB0BF5997266C16C249405112CB29E254B0BF0F6AC10516C249409248DCE08555B0BF2BE65C6C17C24940	32 Parfett Street	E1	0	\N	Parfett Street	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
787	0106000020E610000001000000010300000001000000050000005112CB29E254B0BF0F6AC10516C249405CCCC0172E4DB0BF5497266C16C249401E5EB73B934CB0BFFAE7021C15C24940747B5F4B4354B0BF4DE99AB114C249405112CB29E254B0BF0F6AC10516C24940	30 Parfett Street	E1	0	\N	Parfett Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
788	0106000020E61000000100000001030000000100000005000000C97A5F4B4354B0BF4DE99AB114C24940AB5DB73B934CB0BFF9E7021C15C24940FB53743E034CB0BFD39AC2BF13C24940FE76C44AA953B0BF736F6E5813C24940C97A5F4B4354B0BF4DE99AB114C24940	28 Parfett Street	E1	0	\N	Parfett Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
789	0106000020E61000000100000001030000000100000005000000FE76C44AA953B0BF736F6E5813C249406B53743E034CB0BFD49AC2BF13C249408D365522824BB0BF31A5289912C24940DB6DD6F82253B0BF2247363212C24940FE76C44AA953B0BF736F6E5813C24940	26 Parfett Street	E1	0	\N	Parfett Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
790	0106000020E6100000010000000103000000010000000500000096A1D9339252B0BF4F941AF510C24940F6862828EC4AB0BFFE8B9B5111C24940D0B80266584AB0BF75F8C9F10FC24940770E109AEF51B0BF4BFBEF900FC2494096A1D9339252B0BF4F941AF510C24940	22 Parfett Street	E1	0	\N	Parfett Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
791	0106000020E6100000010000000103000000010000000500000084862828EC4AB0BFFE8B9B5111C2494096A1D9339252B0BF4F941AF510C24940DB6DD6F82253B0BF2247363212C24940FD355522824BB0BF32A5289912C2494084862828EC4AB0BFFE8B9B5111C24940	24 Parfett Street	E1	0	\N	Parfett Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
792	0106000020E61000000100000001030000000100000005000000770E109AEF51B0BF4BFBEF900FC24940D0B80266584AB0BF75F8C9F10FC24940D649E680A349B0BF7A5C06550EC24940AE8892543351B0BF407E8AF40DC24940770E109AEF51B0BF4BFBEF900FC24940	20 Parfett Street	E1	0	\N	Parfett Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
793	0106000020E61000000100000001030000000100000005000000AE8892543351B0BF407E8AF40DC24940D649E680A349B0BF7A5C06550EC24940080EF0CA0749B0BFDEC8B9F10CC2494008BAF94DA050B0BF1C947DB20CC24940AE8892543351B0BF407E8AF40DC24940	20 Parfett Street	E1	0	\N	Parfett Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
794	0106000020E61000000100000001030000000100000005000000BBEE730DF226B0BF521920272DC24940852E8678E82EB0BF54439CB42CC24940B6E99B404D30B0BF212E62D82FC249400ED802FE6C28B0BF943B935130C24940BBEE730DF226B0BF521920272DC24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
795	0106000020E6100000010000000103000000010000000500000056248678E82EB0BF5E439CB42CC249408CE4730DF226B0BF5A1920272DC249406AD80F369024B0BF7E3CDE8E28C249407F09C30D8F2CB0BF4378A02D28C2494056248678E82EB0BF5E439CB42CC24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
796	0106000020E610000001000000010300000001000000050000002760696E9129B0BF2E2545A920C249407214EC71E520B0BF1D370B2721C24940876D7A26BD1EB0BFD5B35C721DC2494022F37CB25027B0BF3B17F9F51CC249402760696E9129B0BF2E2545A920C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
797	0106000020E6100000010000000103000000010000000500000064F6C3201826B0BFE6A3F69A1AC24940CFD0E9241F1EB0BF7D4537041BC24940988AF20E2B1CB0BF9F7EFE5916C24940EDC4435BF823B0BFC31CDDF015C2494064F6C3201826B0BFE6A3F69A1AC24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
798	0106000020E6100000010000000103000000010000000500000069BA435BF823B0BFCA1CDDF015C24940F67FF20E2B1CB0BFA97EFE5916C249405517B26D0F1AB0BF5422CECE11C24940F11912C3C921B0BFA43E826A11C2494069BA435BF823B0BFCA1CDDF015C24940	Whitechapel Hotel, 49 - 53 New Road	E1 1HL	0	\N	New Road	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
799	0106000020E610000001000000010300000001000000050000000FD5DC8D7E16B0BF5F0DAC162EC2494018857624361EB0BFAB290C9D2DC24940FF80B367CA1FB0BFE67F3CF430C24940B96F78D61018B0BF31DC366131C249400FD5DC8D7E16B0BF5F0DAC162EC24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
800	0106000020E61000000100000001030000000100000005000000D47E7624361EB0BFB2290C9D2DC2494093CFDC8D7E16B0BF630DAC162EC24940CFE8CC28E214B0BF57FDF3B62AC24940CFD841BB9D1CB0BF494F153D2AC24940D47E7624361EB0BFB2290C9D2DC24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
801	0106000020E61000000100000001030000000100000005000000C4D241BB9D1CB0BF4D4F153D2AC24940C6E3CC28E214B0BF5BFDF3B62AC24940FF673D113E13B0BF0FEB1C4727C24940AF3155BE071BB0BF169E3EE226C24940C4D241BB9D1CB0BF4D4F153D2AC24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
802	0106000020E61000000100000001030000000100000005000000162C55BE071BB0BF1A9E3EE226C2494066623D113E13B0BF16EB1C4727C249409712EC0FC811B0BFA211CC3724C24940B4AC7C159519B0BF6E0724D223C24940162C55BE071BB0BF1A9E3EE226C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
803	0106000020E61000000100000001030000000100000005000000C8A77C159519B0BF710724D223C24940730DEC0FC811B0BFA711CC3724C24940D6FB0D552510B0BFBA4CCFCA20C2494003CB3E6BF617B0BF614CF26420C24940C8A77C159519B0BF710724D223C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
804	0106000020E6100000010000000103000000010000000500000034C63E6BF617B0BF664CF26420C249405CF70D552510B0BFBC4CCFCA20C24940CA3B0E8C910EB0BF7B6C1F7D1DC24940AADEB58D6616B0BF9D4E0F171DC2494034C63E6BF617B0BF664CF26420C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
805	0106000020E6100000010000000103000000010000000500000085D9B58D6616B0BFA24E0F171DC24940DD360E8C910EB0BF7D6C1F7D1DC249407B415D8AEE0CB0BF37528E0F1AC2494085AA549DC714B0BF5E3449A919C2494085D9B58D6616B0BFA24E0F171DC24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
806	0106000020E610000001000000010300000001000000050000007BA5549DC714B0BF643449A919C249401D3C5D8AEE0CB0BF3D528E0F1AC24940ACD7ABDE680BB0BFD9256EDF16C2494062DC09BA4513B0BF06BBF77816C249407BA5549DC714B0BF643449A919C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
807	0106000020E6100000010000000103000000010000000500000076D709BA4513B0BF0ABBF77816C2494030D2ABDE680BB0BFDC256EDF16C24940407BA8F3CB09B0BFE6899D7E13C249400B4E31D1AC11B0BF1DDDF21713C2494076D709BA4513B0BF0ABBF77816C24940	Whitechapel Hotel, 49 - 53 New Road	E1 1HL	0	\N	New Road	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
808	0106000020E610000001000000010300000001000000050000003B4931D1AC11B0BF22DDF21713C24940A976A8F3CB09B0BFE8899D7E13C249408784B2097108B0BF061C9B7810C24940821312ABE60FB0BF877C432710C249403B4931D1AC11B0BF22DDF21713C24940	Whitechapel Hotel, 49 - 53 New Road	E1 1HL	0	\N	New Road	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
809	0106000020E61000000100000001030000000100000005000000640E7ED65C0DB0BFF1DE2FA230C2494084B704E20204B0BFE31C092F31C24940EC0BAF602503B0BF3CB823A52FC2494099421483A90CB0BF6DFC351E2FC24940640E7ED65C0DB0BFF1DE2FA230C24940	91 New Road	E1 1HL	0	\N	New Road	91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
810	0106000020E6100000010000000103000000010000000800000013B804E20204B0BFE71C092F31C24940640E7ED65C0DB0BFF1DE2FA230C2494010E228A1A00DB0BF0FF7EE3231C2494011A80A2F4611B0BFBE6F620831C24940DB07CB369511B0BF741869F631C24940DA2C13F3510DB0BF7F461D4532C249408884C480E404B0BF1FC226BD32C2494013B804E20204B0BFE71C092F31C24940	93 New Road	E1 1HL	0	\N	New Road	93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
811	0106000020E6100000010000000103000000010000000500000099421483A90CB0BF6DFC351E2FC24940B30BAF602503B0BF39B823A52FC24940DB7425E76C02B0BF12A038412EC24940326CDE2EF90BB0BF7616CEAA2DC2494099421483A90CB0BF6DFC351E2FC24940	89 New Road	E1 1HL	0	\N	New Road	89	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
812	0106000020E61000000100000001030000000100000005000000326CDE2EF90BB0BF7616CEAA2DC24940D97325E76C02B0BF13A038412EC249405B965E46AC01B0BF831C82A42CC24940FFDD3113390BB0BFDE529F102CC24940326CDE2EF90BB0BF7616CEAA2DC24940	87 New Road	E1 1HL	0	\N	New Road	87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
813	0106000020E61000000100000001030000000100000005000000FFDD3113390BB0BFDE529F102CC24940B3975E46AC01B0BF831C82A42CC249406421F242EA00B0BFDD249E172BC24940EF013EE17F0AB0BF663533852AC24940FFDD3113390BB0BFDE529F102CC24940	85 New Road	E1 1HL	0	\N	New Road	85	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
814	0106000020E61000000100000001030000000100000005000000EF013EE17F0AB0BF663533852AC249406622F242EA00B0BFDD249E172BC2494069AB4EBD4F00B0BF91B0EA9529C24940FFE5906ACE09B0BF4C2D490A29C24940EF013EE17F0AB0BF663533852AC24940	83 New Road	E1 1HL	0	\N	New Road	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
815	0106000020E61000000100000001030000000100000005000000FFE5906ACE09B0BF4C2D490A29C24940A5AC4EBD4F00B0BF90B0EA9529C24940A88B29F85DFFAFBF276B4C3E28C249400B0D396B3109B0BF9EFD11BB27C24940FFE5906ACE09B0BF4C2D490A29C24940	81 New Road	E1 1HL	0	\N	New Road	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
816	0106000020E610000001000000010300000001000000050000000B0D396B3109B0BF9EFD11BB27C24940748D29F85DFFAFBF276B4C3E28C249406C3FC27BE4FDAFBFAD05B93A26C24940BAAD17E44A08B0BF3BE5DACE25C249400B0D396B3109B0BF9EFD11BB27C24940	79 New Road	E1 1HL	0	\N	New Road	79	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
817	0106000020E610000001000000010300000001000000050000009BCAD4B34A08B0BF77F3D3CE25C249408F2AE8DEA5FFAFBFFCD6A03126C2494059C0F175C6FDAFBF4A88A2C323C24940E0AAFEBE0D07B0BFE258B05C23C249409BCAD4B34A08B0BF77F3D3CE25C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
818	0106000020E61000000100000001030000000100000006000000B4CFBB8E0D07B0BF1B67A95C23C249408EBEF175C6FDAFBF4888A2C323C2494083C4795F01F5AFBF582E61E71AC249407B1921F99B09B0BFFFFA472C1AC2494078F0AD84A20DB0BF7601F4F022C24940B4CFBB8E0D07B0BF1B67A95C23C24940	Empire House, 67-75 New Road	E1 1HL	0	\N	New Road	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
819	0106000020E61000000100000001030000000100000005000000E018780EE101B0BF3ED17B2719C24940C57B04B21DF3AFBF64A9FF8E19C24940E7E4F10AA7F1AFBFE385A4F517C2494099D1EDB92501B0BF0440208E17C24940E018780EE101B0BF3ED17B2719C24940	61 New Road	E1 1HL	0	\N	New Road	61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
820	0106000020E61000000100000001030000000100000005000000C57B04B21DF3AFBF64A9FF8E19C24940E018780EE101B0BF3ED17B2719C2494057B7EC6D8A02B0BF8794D3831AC24940C1A494155BF4AFBF5068C9E91AC24940C57B04B21DF3AFBF64A9FF8E19C24940	63 New Road	E1 1HL	0	\N	New Road	63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
821	0106000020E610000001000000010300000001000000050000009ED4EDB92501B0BF0240208E17C24940E7E4F10AA7F1AFBFE385A4F517C24940A7DD15FDD7EBAFBFEC6ED89C11C24940F1FEDDBB27FCAFBF6665343F11C249409ED4EDB92501B0BF0240208E17C24940	55 New Road	E1 1HL	0	\N	New Road	55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
822	0106000020E610000001000000010300000001000000070000005E3342994D0FB0BF8A0BCAE30EC249400D5FD7CDB807B0BFBF2DBC340FC249407F6AEAD82E07B0BFEF3C53F70DC249408EE0ED9ACCFFAFBF5F65B0460EC249402A5B8853CAFEAFBF1E452CD30CC24940C34EF671F80DB0BF9D07E1900CC249405E3342994D0FB0BF8A0BCAE30EC24940	Whitechapel Hotel, 49 - 53 New Road	E1 1HL	0	\N	New Road	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
823	0106000020E610000001000000010300000001000000090000001F4003F3C9FEAFBF1B5325D30CC24940B0E3ED9ACCFFAFBF6165B0460EC24940DDCD16148400B0BFCCD49F0610C2494042F0A2A229FBAFBFD4AD6D2B10C24940C9F9DDBB27FCAFBF6565343F11C24940D0326F9BD7EBAFBFA086D19C11C249405D7E909CD7EBAFBFF37CD19C11C24940F092EC821DE9AFBFF68FA70A0DC249401F4003F3C9FEAFBF1B5325D30CC24940	Whitechapel Hotel, 49 - 53 New Road	E1 1HL	0	\N	New Road	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
824	0106000020E61000000100000001030000000100000005000000DEF6BCA5C173B0BF7B3D555702C249400AB45B7D756BB0BFAB212B8402C249404CF94D28196BB0BF9365F1F300C24940F8C2D9077273B0BFB3D4D6C600C24940DEF6BCA5C173B0BF7B3D555702C24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
825	0106000020E610000001000000010300000001000000050000000AB45B7D756BB0BFAB212B8402C24940DEF6BCA5C173B0BF7B3D555702C249404B26FFDBFA73B0BFF3BEC8C603C24940BD921228996BB0BF2558FDDB03C249400AB45B7D756BB0BFAB212B8402C24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
826	0106000020E61000000100000001030000000100000005000000F8C2D9077273B0BFB3D4D6C600C249404CF94D28196BB0BF9365F1F300C24940E987292BC76AB0BF7A5C8D90FFC149404A3D36552B73B0BFD8C73563FFC14940F8C2D9077273B0BFB3D4D6C600C24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
827	0106000020E610000001000000010300000001000000050000004A3D36552B73B0BFD8C73563FFC14940E987292BC76AB0BF7A5C8D90FFC14940B70E0320776AB0BF14EF9735FEC149400730FC4FE672B0BFF4C90408FEC149404A3D36552B73B0BFD8C73563FFC14940	9 Parfett Street	E1	0	\N	Parfett Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
828	0106000020E610000001000000010300000001000000050000000730FC4FE672B0BFF4C90408FEC14940B70E0320776AB0BF14EF9735FEC14940F69A8BCE196AB0BF761518A1FCC14940E9F470D89572B0BF5F823F73FCC149400730FC4FE672B0BFF4C90408FEC14940	9 Parfett Street	E1	0	\N	Parfett Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
829	0106000020E61000000100000001030000000100000005000000E9F470D89572B0BF5F823F73FCC14940F69A8BCE196AB0BF761518A1FCC14940133D4767CC69B0BF235B9451FBC14940E81A041A5372B0BFC92A8223FBC14940E9F470D89572B0BF5F823F73FCC14940	7 Parfett Street	E1	0	\N	Parfett Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	0106000020E61000000100000001030000000100000005000000E81A041A5372B0BFC92A8223FBC14940133D4767CC69B0BF235B9451FBC149407B879CCA7969B0BF85D77CEBF9C14940CC21D2DD0B72B0BFB32B2DBDF9C14940E81A041A5372B0BFC92A8223FBC14940	7 Parfett Street	E1	0	\N	Parfett Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
831	0106000020E61000000100000001030000000100000005000000CC21D2DD0B72B0BFB32B2DBDF9C149407B879CCA7969B0BF85D77CEBF9C149405E908E452769B0BF95ADCB85F8C149404671FCB5C471B0BFD5973E57F8C14940CC21D2DD0B72B0BFB32B2DBDF9C14940	7 Parfett Street	E1	0	\N	Parfett Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
832	0106000020E610000001000000010300000001000000050000004671FCB5C471B0BFD5973E57F8C149405E908E452769B0BF95ADCB85F8C14940A4FC09F8D368B0BFC794B51CF7C149408FF14CE17C71B0BF7087EAEDF6C149404671FCB5C471B0BFD5973E57F8C14940	5 Parfett Street	E1	0	\N	Parfett Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
833	0106000020E610000001000000010300000001000000050000008FF14CE17C71B0BF7087EAEDF6C14940A4FC09F8D368B0BFC794B51CF7C149400D67B55A7268B0BF3E3C9675F5C1494011FF5E1D2871B0BF12038643F5C149408FF14CE17C71B0BF7087EAEDF6C14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
834	0106000020E6100000010000000103000000010000000C000000386E62BC5D70B0BFC53A0948F5C14940F367B55A7268B0BF3E3C9675F5C1494099A2A57E3964B0BF6EA9E460F5C14940C06079CDED63B0BF63B4C634F4C149407F2F5BB31856B0BFEB3CCCADF4C14940C431AD0A1254B0BF93956F37ECC149400CED8F33D35BB0BF2D456317ECC149409FC214D4C65BB0BFEA73CEABE6C14940639D555C1C5FB0BF6DC192A6E6C149407D12C361645FB0BF3006ED1EECC14940A44C26C40F6EB0BF0611E324ECC14940386E62BC5D70B0BFC53A0948F5C14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
835	0106000020E6100000010000000103000000010000000B0000002AD5EF24486BB0BFBF2705D8E8C14940370803933E65B0BF9E2343CBE8C14940D5A965F26165B0BFBD98D3B3E6C149403DC7614D2F6BB0BFB36816C0E6C14940EBC8614D2F6BB0BFE16816C0E6C149403DC7614D2F6BB0BFB36816C0E6C14940C7ACEA8AC46DB0BF1CF019D2E6C1494053B2D116556FB0BFF8C1D955E7C149406A1CB2A3336FB0BFC3F446E0E8C14940F818A224486BB0BFB69AFED7E8C149402AD5EF24486BB0BFBF2705D8E8C14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
836	0106000020E6100000010000000103000000010000000C000000C96D7E1D8207B1BF7470BC1F35C249406B9985937C05B1BF4AC9862735C24940EFBD2020B800B1BF302985D431C24940E5347D758EFDB0BFCD1FAEC62FC24940A92D07161BFDB0BFA6B7982D2EC24940B0700F085E05B1BF829439F92CC249406C2112805B07B1BF74C1414D2EC249406B1F340CBE0BB1BFE80295A92DC2494063EFFEE5FA11B1BFD35B5AD331C24940DDBD3B188F0DB1BFD50A348E32C24940CF2B4E075F0FB1BF940484CF33C24940C96D7E1D8207B1BF7470BC1F35C24940	Mosque Tower, 1 Fieldgate Street	E1 1DQ	0	\N	Fieldgate Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
837	0106000020E610000001000000010300000001000000050000001E118468D1C6B0BFC001381F2EC24940156F131D39CEB0BF3D3AA3A534C24940509FD65DC0C4B0BF8753EBD935C24940B085D111CFBFB0BF4D6B8F712EC249401E118468D1C6B0BFC001381F2EC24940	Fieldgate Street Great Synagogue, 41 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
838	0106000020E610000001000000010300000001000000100000003449EA6112ADB0BF0C187F323DC249405A7459441CB3B0BF41BBA11B41C2494050CD729C90A4B0BF3AF9DA0843C2494027D6729C90A4B0BF2AF9DA0843C249400CDA3C5E7498B0BF592041B744C24940E8EA50672091B0BF7A8A47943FC24940FD55F7EF258DB0BFAD5A07B040C2494007D6C762E38AB0BFD370935B42C249409F2AFC7DCF89B0BFAEEED2F643C24940272804FEF08DB0BFE678A55C43C249402CD1999ECC91B0BFD5E6C22044C24940CD70C416E294B0BF04DB00B245C2494015B8D453BA88B0BFA6B8C57A47C249400B1B52768879B0BF5CEA43123CC24940BB916E2D1AA4B0BF9512C34836C249403449EA6112ADB0BF0C187F323DC24940	Ibis Budget London Witechapel	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
839	0106000020E61000000100000001030000000100000020000000C2D8278EE982B0BF75F5E5E738C249406E948A2BD682B0BF185B30F438C24940BBFDDB6B2B79B0BF0F7E888E39C24940A14E8BC8D878B0BFF55A970D39C24940969B34DFE265B0BFDA3C503C3AC249403FECE7AA2C66B0BF46FD75AF3AC24940910491BE805AB0BFD7EECD693BC249406097D2D73F5AB0BFABB988043BC24940EDEBBE346043B0BF3893B7713CC24940B25E80092340B0BF51ABF7C73BC24940E54DACC2403FB0BF4F04C04039C249403AB12F25D14CB0BFDE21546F38C249406426F2D8814CB0BF72700CB034C24940430DD03F4550B0BF998700B834C249400F79928F4A50B0BF9002647934C249408DE0BE28874CB0BF91EB6F7134C249405D856A3C204BB0BF39613B7932C24940ADE2B71C2F4EB0BF70EE9A9131C2494019102F9D7E50B0BF2B84CC1332C249402C9457F07553B0BF25181BE931C24940314D7892C354B0BF48AF556031C249408CC87AC89B59B0BF4C42701C31C24940878212C9D05BB0BF2D56D17431C249402075311E1871B0BFA26D983C30C24940B52DFA78AC70B0BFBE9F356D2FC249404EB0259FA476B0BF83035D152FC249403C18A7BD1077B0BFDC112CDF2FC249402E9F20B8B27AB0BF9D6A79A42FC2494032028E00F67DB0BFC5A192D42EC24940F4E776176480B0BF22E7CBC72FC24940DC1CCCF7B97FB0BF4D092C3730C24940C2D8278EE982B0BF75F5E5E738C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
840	0106000020E610000001000000010300000001000000060000006C8008E82D4AB0BF3B1BF09B31C2494035424511944CB0BF149F758C35C24940286674AEB44CB0BF8137FF1637C2494060F3700F1E45B0BFBFF416A337C24940033A0C234B42B0BF7EB91C1532C249406C8008E82D4AB0BF3B1BF09B31C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
841	0106000020E610000001000000010300000001000000050000008C81C9F24A42B0BFDFC7151532C2494048F5700F1E45B0BFBFF416A337C24940AA549200CD3CB0BF8E5F720C38C24940BAB3505E143AB0BF4E2A7FB232C249408C81C9F24A42B0BFDFC7151532C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
842	0106000020E6100000010000000103000000010000000500000025EC0D2E143AB0BFB13878B232C24940147C4FD0CC3CB0BF006E6B0C38C2494085523D784C38B0BF4B78714538C249400DFF5F3C9235B0BFAFAA56E832C2494025EC0D2E143AB0BFB13878B232C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
843	0106000020E61000000100000001030000000100000009000000C0DCEA2EE526B0BF995BBD7638C24940E11AFDEA8E26B0BFB73341EC37C2494070CDAF18312DB0BFD8743C8C37C24940E8652DEE842DB0BFC5280A0C38C2494002D1AF7B4030B0BF072F7F363CC24940288188468C1BB0BFA1F08B6C3DC24940B9FD85E89A18B0BFCF653F5439C249400A5FE634E526B0BF2DF6C67638C24940C0DCEA2EE526B0BF995BBD7638C24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
844	0106000020E610000001000000010300000001000000050000005F5EE634E526B0BF30F6C67638C249400AED2A114322B0BF66CB95BE38C2494072D50283761FB0BF70BB2B5334C2494090AD358B1E24B0BFD7844A0234C249405F5EE634E526B0BF30F6C67638C24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
845	0106000020E61000000100000001030000000100000005000000E1E52A114322B0BF6FCB95BE38C249404A914CD5F71DB0BF6BC2210139C2494024772A631F1BB0BF746B859E34C24940F7DCBF52761FB0BFD6C9245334C24940E1E52A114322B0BF6FCB95BE38C24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
846	0106000020E610000001000000010300000001000000070000003D8A4CD5F71DB0BF6EC2210139C2494028FC85E89A18B0BFD2653F5439C24940FDFC7F7ACA16B0BF4600AC6E39C24940F36046597B16B0BF8602D3F038C2494009B54F59A113B0BFF8C29E2035C24940D376E7321F1BB0BFD9797E9E34C249403D8A4CD5F71DB0BF6EC2210139C24940	Shiv House, 101 New Road	E1 1HL	0	\N	New Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
847	0106000020E610000001000000010300000001000000070000009FA60C29A113B0BF5ED1972035C249406D6546597B16B0BF8302D3F038C24940B7BCA51E4A07B0BF7E8BE80B3AC249403356CA2A4B06B0BF8772C95737C24940DEC8252B2310B0BFD7CD67A036C2494060AFB8D9440FB0BFE2822C7735C249409FA60C29A113B0BF5ED1972035C24940	Shiv House, 101 New Road	E1 1HL	0	\N	New Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
848	0106000020E610000001000000010300000001000000050000000AAFE2FA2210B0BF41DC60A036C249404C54CA2A4B06B0BF8772C95737C249401790E3BEEC05B0BF9136630E36C24940EEAEB8D9440FB0BFE3822C7735C249400AAFE2FA2210B0BF41DC60A036C24940	95 New Road	E1 1HL	0	\N	New Road	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
849	0106000020E61000000100000001030000000100000009000000078762EE4907B0BFF099E10B3AC24940CFE27E5D440EB0BF3769DA8939C249402FC6E9C5AB0EB0BF803246503AC24940CCA85283C814B0BF857CEA003AC249401D189AC3D117B0BF11DF43D43FC24940C97D3A5C7011B0BF19935E6F41C24940052CEC31A50BB0BFB2E15BD541C249400715D54DCB07B0BF9EACB57C3BC24940078762EE4907B0BFF099E10B3AC24940	Shiv House, 101 New Road	E1 1HL	0	\N	New Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
850	0106000020E610000001000000010300000001000000070000002BDEA801A50BB0BF37F054D541C24940FC55892F6E11B0BFC1937A6F41C24940CAE55693D117B0BF93ED3CD43FC24940E739724EAB1DB0BF4FB49C5B3EC249405E9A614B8720B0BF8356B89E40C24940E4E27167530CB0BFB834DD1C43C249402BDEA801A50BB0BF37F054D541C24940	Shiv House, 101 New Road	E1 1HL	0	\N	New Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
851	0106000020E61000000100000001030000000100000005000000EF2CF44E3C0DB0BF9B3D81B544C249408F9A88217422B0BFA21D232A42C2494028B7D1FE4324B0BFDEB2667643C2494002CDC0BED70EB0BF20994A2046C24940EF2CF44E3C0DB0BF9B3D81B544C24940	Shiv House, 101 New Road	E1 1HL	0	\N	New Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
852	0106000020E61000000100000001030000000100000006000000468C5AE55A14B0BFCFB6F79C4AC24940CABDC0BED70EB0BF21994A2046C249406AACD1FE4324B0BFDEB2667643C2494001F8EF039529B0BF66E6F12A48C2494044FCD3A1EC22B0BF10A158E648C24940468C5AE55A14B0BFCFB6F79C4AC24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
853	0106000020E6100000010000000103000000010000000F000000439B614B8720B0BF8456B89E40C24940071AD8B92B1EB0BFE32655C13EC2494026881FA42F24B0BFB451B4FB3DC2494090C1FD321D25B0BF3B89D5AF3EC24940DB88673CAC2CB0BF20F67EB73DC249406D42ECAC742FB0BFCA3DB4D33FC249400A8175F0D032B0BF69A24C653FC249400773B535AD3AB0BF0631185B45C24940103F4DBA6A38B0BF87E127A845C249408B4EC0D40E3AB0BFA005E1C246C249402C3C5C078133B0BFE6820DAD47C24940C22D5D96D931B0BF270CEF7346C24940D8AE06436F2EB0BF28794CED46C24940BAD09A844D25B0BFCD42360440C24940439B614B8720B0BF8456B89E40C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
854	0106000020E6100000010000000103000000010000000800000041EC5B4D1723B0BF0D7A57954EC24940D7DFA808861EB0BF51FE852D4FC24940641E96E1E91EB0BFB7BE94974FC249401D7C910D781AB0BF51365F1A50C24940C2896555F518B0BFB7FF4EB84EC24940DAD66A73B51DB0BF07C7E5484EC24940A35D902C2221B0BF8201D99C4DC2494041EC5B4D1723B0BF0D7A57954EC24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
855	0106000020E61000000100000001030000000100000005000000EDB752B1E91EB0BF62CD8D974FC24940E9C578E38920B0BF369691EC50C2494029793DFC1C1CB0BF52B31D7351C249401D7C910D781AB0BF51365F1A50C24940EDB752B1E91EB0BF62CD8D974FC24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
856	0106000020E61000000100000001030000000100000005000000A65C35B38920B0BFE3A48AEC50C2494037184DF18222B0BF2311262D52C2494035093A8DA51DB0BFF81C21EC52C24940D606FACB1C1CB0BF04C2167351C24940A65C35B38920B0BFE3A48AEC50C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
857	0106000020E61000000100000001030000000100000007000000E038AB46FC23B0BFE63159AF54C2494012B6AC7CB120B0BF4AEF4C1C55C24940AEB6650FB41EB0BF0C05E6FB54C24940471966A9281DB0BF6CCB934E53C249407A57EA28EA1DB0BF31638DE152C24940A9D55AE4DE20B0BFCEE9816D52C24940E038AB46FC23B0BFE63159AF54C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
858	0106000020E610000001000000010300000001000000060000001BC66716FC23B0BFA04052AF54C249404AE05AE4DE20B0BFC9E9816D52C2494034164DF18222B0BF2511262D52C249405EB56935BD24B0BFFBBA3FF451C24940C0BB8841E027B0BFB464552454C249401BC66716FC23B0BFA04052AF54C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
859	0106000020E61000000100000001030000000100000006000000594E2605BD24B0BFAFC938F451C24940558EA2BF6E24B0BF654C2ABA51C24940F9F71AFF1429B0BF455D031E51C2494076854072582CB0BF180AB18953C24940EFB58841E027B0BFB864552454C24940594E2605BD24B0BFAFC938F451C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
860	0106000020E61000000100000001030000000100000007000000B524FD41582CB0BFCF18AA8953C249401FEE14DACD27B0BF3FE8782B50C24940EFBE468ABC27B0BF5258301F50C24940AEBA0C54FE2BB0BFFE94B8894FC2494093A35AE7CD30B0BF658F66F152C249405B864072582CB0BF180AB18953C24940B524FD41582CB0BFCF18AA8953C24940	fashion corner, 132 Whitechapel Road	E1 1JU	0	\N	Whitechapel Road	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
861	0106000020E610000001000000010300000001000000050000003F1A9223BA88B0BF42C7BE7A47C249400D5FB3798C83B0BF7832202F48C24940F216E01E0D7EB0BF851DA14044C24940A2FA8B517383B0BF2F518E8443C249403F1A9223BA88B0BF42C7BE7A47C24940	Cox orthopaedics	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
862	0106000020E6100000010000000103000000010000000800000041B670498C83B0BF1741192F48C249407E10EB9D847BB0BF76947F7049C249407104B460F973B0BF14755E2C44C249407BEB07ACF774B0BFF8D3B20444C24940E116244E0972B0BF88EB0DEC41C2494066A8A3816479B0BFE4DDCFEB40C24940DD749DEE0C7EB0BF182C9A4044C2494041B670498C83B0BF1741192F48C24940	Cox orthopaedics	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
863	0106000020E61000000100000001030000000100000007000000AD55A86D847BB0BF17A3787049C24940AFB05F7FE776B0BF6B633F2F4AC24940658BBFC17973B0BF0781761148C24940067F5DD5E76EB0BFE8DEC9F644C249406C11B460F973B0BF0B755E2C44C24940DC1C657F9778B0BFD73D3D5F47C24940AD55A86D847BB0BF17A3787049C24940	Cox orthopaedics	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
864	0106000020E6100000010000000103000000010000000500000006EC1C4FE776B0BF0C72382F4AC2494009F16FEDEE6EB0BF087F28874BC24940213180DC2267B0BF848EF59746C24940D8C1FE2B756FB0BFDD0ACB5645C2494006EC1C4FE776B0BF0C72382F4AC24940	Cox orthopaedics	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
865	0106000020E61000000100000001030000000100000008000000051A2DBDEE6EB0BFAE8D21874BC24940A0FD5E202A6BB0BFE350E1274CC249401B6E64439D66B0BF136EC17F49C249400520F15B7F67B0BF9260B65949C24940D7D93227E363B0BF844C7F1547C249406C529B6DB264B0BF895019F646C249409D3680DC2267B0BF7E8EF59746C24940051A2DBDEE6EB0BFAE8D21874BC24940	Cox orthopaedics	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
866	0106000020E6100000010000000103000000010000000A000000551E1CF0296BB0BF8A5FDA274CC2494074AA15CE225FB0BF2F8B5AD44DC24940ABFC5AD6425AB0BF5789B2FB4AC249400294E641C357B0BF1F0B768E49C2494094B4674C4258B0BF9D8E2F7949C249401855FD468A64B0BF48A5997E47C24940A529F15B7F67B0BF9160B65949C249408D6E64439D66B0BF136EC17F49C24940183DFC981B69B0BF0FDF80F44AC24940551E1CF0296BB0BF8A5FDA274CC24940	Cox orthopaedics	E1 5NB	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
867	0106000020E61000000100000001030000000100000005000000F332ED3B3B51B0BF2511C26A4FC24940D4221B470F4EB0BFA62BBAD14FC249400E6468E5714AB0BF7CBC0E934DC24940FD6A7B3ABC4DB0BF6F06110F4DC24940F332ED3B3B51B0BF2511C26A4FC24940	Prime Land Property, 124 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
868	0106000020E610000001000000010300000001000000090000005606D8160F4EB0BF553AB3D14FC249403B2B84D61249B0BFDBDF295450C2494072E495A5B244B0BFCC62EB574DC2494029E8C902DA46B0BF21E146094DC249407805A2757145B0BF47D14A134CC24940C5CF14520848B0BFAD12BFB44BC2494005D9DDBDB54AB0BF0AAC5E884DC24940744C7874704AB0BF7EA040924DC249405606D8160F4EB0BF553AB3D14FC24940	Prime Land Property, 124 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
869	0106000020E6100000010000000103000000010000000A0000004BBE9357B339B0BF3DF8C6934EC2494054D08CD5E83DB0BF0C407A9451C24940BC0C7FC64236B0BF17F1F56F52C24940DD0DA0192631B0BFAC3F0DE24EC24940F24A6E340D34B0BFBBB10C7A4EC24940C48C5682ED34B0BFBA9B01164FC249408DE8E30DB636B0BF931D1CD64EC24940BA214B84CD35B0BF51C76D344EC249407E8EA5FC9938B0BF696E27D04DC249404BBE9357B339B0BF3DF8C6934EC24940	fashion corner, 132 Whitechapel Road	E1 1JU	0	\N	Whitechapel Road	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
870	0106000020E6100000010000000103000000010000000B000000874CC0D40E3AB0BFA105E1C246C24940A17B8EFB1B3DB0BF3DD49DEC48C24940FBF857FFF833B0BF64BA70364AC24940D1B12D9BA837B0BF2D020C194DC2494040FD1A17C030B0BFA74F42034EC24940104F97094A2BB0BFA86B36244AC24940A308CDB1DE30B0BFB107186049C24940A7335CF4492FB0BF27DA2E4148C24940303E5C078133B0BFE6820DAD47C249402C3C5C078133B0BFE6820DAD47C24940874CC0D40E3AB0BFA105E1C246C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
871	0106000020E610000001000000010300000001000000090000001D56ADCF6EE4B0BF51EABC5432C249409118D3826EE4B0BFB7EFC05432C249408136291D03DEB0BFE09549A230C249404E0C3CD537DEB0BFE5D625342EC2494021C8A35A45FAB0BF88DD344D2EC249402C64E93135FAB0BFEC0E161030C249409AE0D673B5E8B0BFA7B4750030C249400773F008AFE8B0BF25B177B330C249401D56ADCF6EE4B0BF51EABC5432C24940	Mosque Terrace, 3 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
872	0106000020E6100000010000000103000000010000000A0000000A89D111CFBFB0BF4D6B8F712EC24940421A771D47C2B0BF8305D62432C24940B74974BFF7BBB0BF7373FAD235C24940500CA28864B1B0BF6D1683F735C24940492F986D7AB0B0BF0747958436C24940B4B91D6EE1A2B0BF23B9F74D34C24940BA4A23155BA2B0BFF6D10AE52DC24940FF11D9D9E5B0B0BF502E61C72DC24940276AA923D9B1B0BFDC66BE632EC249400A89D111CFBFB0BF4D6B8F712EC24940	Fieldgate Street Great Synagogue, 41 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
873	0106000020E6100000010000000103000000010000000A0000001249306C3B51B0BF7802C96A4FC24940E512D8038F4DB0BFAD1C78F04CC249402ECB5F9E3A4FB0BF931DF2AB4CC24940F8F968047548B0BF2D47CD2648C2494045A037E9EC50B0BF6D31BFEA46C249402EBB9C6A9157B0BFAD75CB594BC2494012D3BDB58B57B0BF6071A05A4BC24940E5FC5AD6425AB0BF5589B2FB4AC2494017B1D29D225FB0BFD99953D44DC249401249306C3B51B0BF7802C96A4FC24940	Prime Land Property, 124 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
874	0106000020E6100000010000000103000000010000000A00000054D08CD5E83DB0BF0C407A9451C249404BBE9357B339B0BF3DF8C6934EC24940833424F1363DB0BFB236DF154EC249404C97D4E2183EB0BF61CDF7B24EC249409752F00DD441B0BF8DFF482D4EC24940266D0DCF0641B0BF37AA949E4DC24940338B2F3B6744B0BFBF2299254DC2494071E240521844B0BF83A4BBEE4CC24940A80441A61249B0BF8BEE225450C2494054D08CD5E83DB0BF0C407A9451C24940	Jaan Sports, 128 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
875	0106000020E61000000100000001030000000100000007000000B6074B90B85CB0BF3708964B43C24940C0CF04B9EE56B0BF8575865744C24940B0D7DE479754B0BFE04639F642C249403B51A7412D55B0BF963B2DD942C24940DE5BE64CF553B0BF50F8BA3042C24940DFD7D986B258B0BFF94F0A3E41C24940B6074B90B85CB0BF3708964B43C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
876	0106000020E610000001000000010300000001000000050000006848D9456457B0BF1EABCE9C44C24940A5A80E16C54FB0BFBA60CCE445C24940CA96655CF04CB0BFC3DCA73944C24940B0D7DE479754B0BFE04639F642C249406848D9456457B0BF1EABCE9C44C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
877	0106000020E61000000100000001030000000100000005000000797F5DD5E76EB0BFEFDEC9F644C2494083B81643B66BB0BFA4DFA0E842C24940E116244E0972B0BF88EB0DEC41C249407BEB07ACF774B0BFF8D3B20444C24940797F5DD5E76EB0BFEFDEC9F644C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
878	0106000020E6100000010000000103000000010000000600000083B81643B66BB0BFA4DFA0E842C24940797F5DD5E76EB0BFEFDEC9F644C2494025BDFE2B756FB0BFE80ACB5645C249406C529B6DB264B0BF895019F646C249404FB6193FE760B0BF6841499844C2494083B81643B66BB0BFA4DFA0E842C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
879	0106000020E6100000010000000103000000010000000E000000B0D7DE479754B0BFE04639F642C24940CA96655CF04CB0BFC3DCA73944C24940A5A80E16C54FB0BFBA60CCE445C249405FC073D68A47B0BF92E52B3647C24940402C5D152740B0BF9AC139C742C24940FA8DE17DC73BB0BFD1DF2A443EC24940B6177EA5DF60B0BFB6E279FF3BC24940B70C8CD19562B0BF7095C1B83EC24940D9BF4F64C859B0BF61E24D453FC2494018EB33F4825AB0BF75EC50E440C24940DFD7D986B258B0BFF94F0A3E41C24940DE5BE64CF553B0BF50F8BA3042C249403B51A7412D55B0BF963B2DD942C24940B0D7DE479754B0BFE04639F642C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
880	0106000020E6100000010000000103000000010000000500000054459387FF36B0BFEDE9B3944CC24940D555544A8734B0BF44D4D1A54AC24940E839D22ECA3FB0BFE6C0402349C24940E2E9711F7942B0BF8656C50D4BC2494054459387FF36B0BFEDE9B3944CC24940	Oxygen	E1 1JU	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
881	0106000020E61000000100000001030000000100000006000000F8F968047548B0BF2D47CD2648C249404CC5C5770D4BB0BFE2644FE249C249404F3CA0637942B0BF1781BC0D4BC249409FD83A20FD3FB0BFC224A14749C24940B5043720FD3FB0BF0822A14749C24940F8F968047548B0BF2D47CD2648C24940	Prime Land Property, 124 Whitechapel Road	E1 1GU	0	\N	Whitechapel Road	124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
882	0106000020E61000000100000001030000000100000005000000F3D0943830A3B0BF795670D122C249401E4DC9C5339AB0BFBA0710DE22C24940DA577A8D209AB0BFE9F9E48821C2494023C0CDA112A3B0BFB2D5537C21C24940F3D0943830A3B0BF795670D122C24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
883	0106000020E61000000100000001030000000100000008000000527A5E62854EB0BF29CB538F28C24940145DFF3E854EB0BF35DF638F28C24940B3A3B2B9F345B0BF34B2B00E29C249403873B0FBF944B0BF24B0715127C24940BD5CFB7CDD4BB0BFBCC82EF126C24940B41B64BD404CB0BF742921A227C249405D18120AF34DB0BF1F4E6C8A27C24940527A5E62854EB0BF29CB538F28C24940	8 Myrdle Street	E1 1HL	0	\N	Myrdle Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1308	0106000020E61000000100000001030000000100000005000000C9879A9D0805B2BF36DEE0E869C149401261A0E9CC03B2BFBBC6A33369C14940107B2260DD17B2BFBA0BE55968C14940D7CF4553A118B2BF1492097869C14940C9879A9D0805B2BF36DEE0E869C14940	Cycle Superhighway 3	E1 8LG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
884	0106000020E61000000100000001030000000100000006000000246752712A4BB0BF89E7458B25C24940A1B71C422A4BB0BF0722418B25C2494030F6451E6244B0BFCE1F92E425C24940259133A5E343B0BF438259B424C24940790DCA1E8E4AB0BF9D237B5224C24940246752712A4BB0BF89E7458B25C24940	12 Myrdle Street	E1 1HL	0	\N	Myrdle Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
885	0106000020E61000000100000001030000000100000004000000A07D8A3AB33DB0BF7D377F8B18C249407B3A682AAF3DB0BF188CBD8B18C2494044B16E25AF3DB0BFF7F3B38B18C24940A07D8A3AB33DB0BF7D377F8B18C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
886	0106000020E610000001000000010300000001000000050000004217F8654644B0BFD20D873618C249408D414829BB3DB0BF4E5C0F8B18C249401DC93624653AB0BF9E3EC26F11C24940F837860CF440B0BF7A840F2311C249404217F8654644B0BFD20D873618C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
887	0106000020E6100000010000000103000000010000000500000003E63E9C4240B0BFD5AF04D00FC2494010FC0E0CAC39B0BF2B96741F10C24940269CB61A0739B0BFE0F2F9E30EC24940BB8AE86A9A3FB0BFDF99538E0EC2494003E63E9C4240B0BFD5AF04D00FC24940	20 Parfett Street	E1	0	\N	Parfett Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
888	0106000020E6100000010000000103000000010000000A00000033AEB71DA050B0BF1EA276B20CC2494089A4CF7E4340B0BF7B158F3E0DC24940F2A96C829A40B0BFFEE5F5520EC24940A85CA63A9A3FB0BFE3A74C8E0EC249408E6274EA0639B0BFE500F3E30EC24940C8A560AEA137B0BF92DAE3FE0BC24940F7DA5D7F8D38B0BF09579FA80BC24940094F0C296E4FB0BF11F2E0190BC24940431D6CA23350B0BF55469C3B0BC2494033AEB71DA050B0BF1EA276B20CC24940	20 Parfett Street	E1	0	\N	Parfett Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
889	0106000020E6100000010000000103000000010000000500000010FC0E0CAC39B0BF2B96741F10C2494003E63E9C4240B0BFD5AF04D00FC24940BA0144DCF340B0BF8692082311C24940F28F45135C3AB0BF4918237011C2494010FC0E0CAC39B0BF2B96741F10C24940	20 Parfett Street	E1	0	\N	Parfett Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
890	0106000020E610000001000000010300000001000000060000007B3A682AAF3DB0BF188CBD8B18C24940A07D8A3AB33DB0BF7D377F8B18C24940E1643A964644B0BFB6FF8D3618C24940C3BCD8E6FD44B0BF51C4179819C24940D8F50D7E6E3EB0BF7993BBFC19C249407B3A682AAF3DB0BF188CBD8B18C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
891	0106000020E61000000100000001030000000100000005000000D8F50D7E6E3EB0BF7993BBFC19C24940C3BCD8E6FD44B0BF51C4179819C24940073796C7A045B0BF6A6B37D21AC249401A8EA58E123FB0BFDFD025391BC24940D8F50D7E6E3EB0BF7993BBFC19C24940	28 Myrdle Street	E1 1HL	0	\N	Myrdle Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
892	0106000020E610000001000000010300000001000000050000001A8EA58E123FB0BFDFD025391BC24940073796C7A045B0BF6A6B37D21AC249402DDC33B56546B0BFE54B024E1CC249403E92E97BD73FB0BFA8B7F0B41CC249401A8EA58E123FB0BFDFD025391BC24940	26 Myrdle Street	E1 1HL	0	\N	Myrdle Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
893	0106000020E610000001000000010300000001000000050000003E92E97BD73FB0BFA8B7F0B41CC249402DDC33B56546B0BFE54B024E1CC249408FCEB39E1247B0BF62047C9B1DC24940A82C1A658440B0BF75746A021EC249403E92E97BD73FB0BFA8B7F0B41CC24940	24 Myrdle Street	E1 1HL	0	\N	Myrdle Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
894	0106000020E61000000100000001030000000100000005000000A82C1A658440B0BF75746A021EC249408FCEB39E1247B0BF62047C9B1DC24940105721DCCE47B0BF865C85061FC24940293E30A24041B0BF2DCF736D1FC24940A82C1A658440B0BF75746A021EC24940	22 Myrdle Street	E1 1HL	0	\N	Myrdle Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
895	0106000020E61000000100000001030000000100000005000000293E30A24041B0BF2DCF736D1FC24940105721DCCE47B0BF865C85061FC24940ED0D445E7A48B0BFA8044A5120C2494088790524EC41B0BFEA7D38B820C24940293E30A24041B0BF2DCF736D1FC24940	20 Myrdle Street	E1 1HL	0	\N	Myrdle Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
896	0106000020E6100000010000000103000000010000000500000088790524EC41B0BFEA7D38B820C24940ED0D445E7A48B0BFA8044A5120C249402EE184D22949B0BF73C5AAA321C24940A6D8F5979B42B0BF2A43990A22C2494088790524EC41B0BFEA7D38B820C24940	18 Myrdle Street	E1 1HL	0	\N	Myrdle Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
897	0106000020E61000000100000001030000000100000005000000A6D8F5979B42B0BF2A43990A22C249402EE184D22949B0BF73C5AAA321C2494084FF659BDE49B0BFF451530023C24940306081605043B0BF19CF416723C24940A6D8F5979B42B0BF2A43990A22C24940	16 Myrdle Street	E1 1HL	0	\N	Myrdle Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
898	0106000020E61000000100000001030000000100000005000000306081605043B0BF19CF416723C2494084FF659BDE49B0BFF451530023C24940B29987EE8D4AB0BFD931745224C24940089133A5E343B0BF408259B424C24940306081605043B0BF19CF416723C24940	14 Myrdle Street	E1 1HL	0	\N	Myrdle Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
899	0106000020E6100000010000000103000000010000000D000000E5277DDF8D62B0BFC7A2AFC1FCC149400F5F5D621B58B0BFB70B8908FDC1494062E6A79B0057B0BFD5B67971F8C14940225A1B688161B0BF7A4F4A2DF8C149400D8B4244B161B0BF9DFA69CDF8C149400CD276DD225FB0BF660413E1F8C149403AFB8073745FB0BF7CD8463DFAC149405DA01B332161B0BF89F41735FAC149403E6A8F894061B0BFAEC1B9C1FAC149407AE7D6BC995FB0BF2D3FE6CDFAC14940CD127AD50560B0BF4A24FD4CFCC149400D2CD1158062B0BF8F638143FCC14940E5277DDF8D62B0BFC7A2AFC1FCC14940	7 Parfett Street	E1	0	\N	Parfett Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
900	0106000020E61000000100000001030000000100000009000000106B0C48F758B0BFFC224E9A00C24940619F2FED5F63B0BF9837485700C2494037A01CE08163B0BFFF59110101C24940815940363061B0BF3DC9F60E01C24940074AD7009E61B0BFAE80939902C249400CB72EC00A64B0BF46FC0E9002C24940414B2BFD3464B0BFCD29812B03C2494055E53CE8A259B0BFFA627C6303C24940106B0C48F758B0BFFC224E9A00C24940	11 Parfett Street	E1	0	\N	Parfett Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
901	0106000020E6100000010000000103000000010000000B000000225A1B688161B0BF7A4F4A2DF8C1494062E6A79B0057B0BFD5B67971F8C149404B325BB31856B0BFEC3CCCADF4C1494058CC43B9B25DB0BFAD3E4A6BF4C1494051402DD5485EB0BF83944F36F6C14940B9A6BF071260B0BF97C04F2CF6C1494023658F8D4960B0BFD3D099DEF6C1494016F98A599A5EB0BF74E896F0F6C14940959C5255D95EB0BFA5E50EA4F7C14940A7BD11665361B0BF5FE05C93F7C14940225A1B688161B0BF7A4F4A2DF8C14940	5 Parfett Street	E1	0	\N	Parfett Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
902	0106000020E610000001000000010300000001000000090000000F5F5D621B58B0BFB70B8908FDC14940E5277DDF8D62B0BFC7A2AFC1FCC1494082E82C8FA162B0BF40FAD875FDC149400EB6B2DC4560B0BF5633A983FDC14940A336AD67DB60B0BF1756CABEFFC1494099D564913E63B0BF0AEF72B0FFC14940619F2FED5F63B0BF9837485700C24940106B0C48F758B0BFFC224E9A00C249400F5F5D621B58B0BFB70B8908FDC14940	9 Parfett Street	E1	0	\N	Parfett Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
903	0106000020E6100000010000000103000000010000000D00000086304C18AF4BB0BF2ADDCEF2EDC1494015807C340941B0BF24D2442BEEC14940CE1560B5E540B0BF09C5D895EDC14940D7B5167EFD42B0BF114E4E8FEDC14940C62FD502EA42B0BF1DA0D511EDC1494067A5ABFD8941B0BFCC875318EDC149406A3F6BDD6E41B0BFF3CD987EECC1494060937DEBD842B0BF501C3078ECC149406B60697BB842B0BFBEE8111DECC1494002CA633B8F40B0BFAD722A28ECC14940EB3CDF106040B0BF8654BA80EBC14940535357F6114BB0BF702CC943EBC1494086304C18AF4BB0BF2ADDCEF2EDC14940	6 Parfett Street	E1	0	\N	Parfett Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
904	0106000020E6100000010000000103000000010000000D0000007CF7D6163945B0BF66C9486B00C24940B45B99CFD74FB0BF5791012200C24940C7F550B2AD50B0BFE28A2AC903C249402DE986080946B0BFD6029D1F04C24940722246B9E245B0BFECBBE06003C2494071A88A9CED47B0BF44F4A95803C2494039D5BD919F47B0BF550FDE5002C2494084D88ADD3346B0BFA8A4CA5E02C24940825DCA811C46B0BF55A580A401C24940318239B15E47B0BF15AAA19A01C249409FDDB9D01D47B0BFEA4465E400C249404DFDB4ED5445B0BFBDCE76F500C249407CF7D6163945B0BF66C9486B00C24940	16 Parfett Street	E1	0	\N	Parfett Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
905	0106000020E6100000010000000103000000010000000D0000009A32A4006E44B0BF54B06FC1FCC14940421F74C4FD4EB0BF32A7AA68FCC14940B45B99CFD74FB0BF5791012200C249407CF7D6163945B0BF66C9486B00C24940AACAC8D21745B0BF17912BC6FFC149408B35B23D2347B0BFB5F0B1B7FFC1494031305BA2FD46B0BF892849E7FEC14940EA9EE43B8E45B0BF5BB11EF2FEC14940E05E4E9D6445B0BF389A7B16FEC149401827F8B4D446B0BF9EDF5602FEC149402D49E833B646B0BF3FE80957FDC149406E2D40B79644B0BF7A1C5965FDC149409A32A4006E44B0BF54B06FC1FCC14940	14 Parfett Street	E1	0	\N	Parfett Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
906	0106000020E6100000010000000103000000010000000D0000003DE90D3B9343B0BF7442F419F9C1494003B78D2E2D4EB0BF8603AED8F8C14940421F74C4FD4EB0BF32A7AA68FCC149409A32A4006E44B0BF54B06FC1FCC1494066C68DDC4B44B0BF2E19FC37FCC149406BD23BAD4246B0BF68E89A2FFCC14940E1FF135D0146B0BFCD441D30FBC1494077FD5DFF6344B0BF353AAE35FBC1494045C8476D3644B0BFAE9E6C6EFAC1494014D09347CC45B0BFD5363760FAC149407027CCED9D45B0BF58BC59A9F9C1494002F61F57B943B0BFF4F4B0B7F9C149403DE90D3B9343B0BF7442F419F9C14940	12 Parfett Street	E1	0	\N	Parfett Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
907	0106000020E6100000010000000103000000010000000D0000005E323702F742B0BF6761AA63F6C14940D5A65C508F4DB0BF3D507126F6C1494003B78D2E2D4EB0BF8603AED8F8C149403DE90D3B9343B0BF7442F419F9C14940BA867D046F43B0BFF2161184F8C149403359C26E7A45B0BF3D799775F8C149409B378EC36345B0BFE4E8AF1DF8C14940BC2FA39B1844B0BF0CF8F31AF8C14940724B1EA5FC43B0BFB3DBD174F7C1494090F8177F4A45B0BF5F340B6EF7C149406AA0D9663545B0BFD2DFC100F7C1494036F0BD771643B0BFE56C670BF7C149405E323702F742B0BF6761AA63F6C14940	12 Parfett Street	E1	0	\N	Parfett Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
908	0106000020E6100000010000000103000000010000000D000000E65D0075F441B0BF4C70A9C4F1C149402EF6797F7E4CB0BFA1EE9F7DF1C14940D5A65C508F4DB0BF3D507126F6C149405E323702F742B0BF6761AA63F6C149401ED32127DF42B0BFBCAE77E4F5C14940AFD8FB9C0345B0BF2C05C9D4F5C14940D8A5CB9BB944B0BF480B7098F4C149405C46FD272543B0BF572CC4A1F4C14940C6419449E642B0BF1CFCE4B6F3C14940F76E51338344B0BF6457BFAFF3C149408B652FC73444B0BF1706725EF2C1494018224AFD1142B0BF31ACF667F2C14940E65D0075F441B0BF4C70A9C4F1C14940	10 Parfett Street	E1	0	\N	Parfett Street	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
909	0106000020E6100000010000000103000000010000000D00000015807C340941B0BF24D2442BEEC1494086304C18AF4BB0BF2ADDCEF2EDC149402EF6797F7E4CB0BFA1EE9F7DF1C14940E65D0075F441B0BF4C70A9C4F1C14940B7379EF3DB41B0BF0C40283DF1C149406C2BC618D143B0BF09D6BF39F1C149407A95E376A143B0BF18AC4E4FF0C149403A2AEC844842B0BFF4F11458F0C14940337EDE481742B0BFAC5B9173EFC149406706D8F27543B0BFB7065969EFC14940E7859C484743B0BF360731C9EEC149407B5DAE433041B0BF4146B0CFEEC1494015807C340941B0BF24D2442BEEC14940	8 Parfett Street	E1	0	\N	Parfett Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
910	0106000020E61000000100000001030000000100000008000000849FA07DAF39B0BFDCD0675104C24940708BC54CAF39B0BFF3A95F5104C249402D90FBA1CE34B0BF1FD1707C04C24940C30E55CB2034B0BF5E3C9B1D03C24940C17B8DB9643AB0BFE00584C802C249406C0A406D123BB0BF8FE2484004C24940D899077DAF39B0BF0C9C665104C24940849FA07DAF39B0BFDCD0675104C24940	16 Parfett Street	E1	0	\N	Parfett Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
911	0106000020E61000000100000001030000000100000007000000690FF04B8D3CB0BF869E0250F9C14940B242432CD131B0BFA5355490F9C149404D008B846031B0BF20F3D855F8C149400D180E947639B0BFA176F620F8C14940BCF88F81A939B0BF9D6D4E90F8C1494040DEF29F323CB0BF829EBC7FF8C14940690FF04B8D3CB0BF869E0250F9C14940	12 Parfett Street	E1	0	\N	Parfett Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
912	0106000020E610000001000000010300000001000000090000004B86AD235732B0BF39444D06FBC149405DB346FB373AB0BF00FAB2CFFAC149400BC5DC98443AB0BF0CA5E621FBC14940BCC4C0CB7E3DB0BF0FCFC20CFBC14940A1C0C81CDE3DB0BFAF7E652AFCC149409030EEE9D73BB0BF82130734FCC149404D2DF06BF33DB0BF79834C9702C249407BBB9D4A3835B0BFF695171003C249404B86AD235732B0BF39444D06FBC14940	14 Parfett Street	E1	0	\N	Parfett Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
913	0106000020E61000000100000001030000000100000007000000B242432CD131B0BFA5355490F9C14940690FF04B8D3CB0BF869E0250F9C14940012616BB043DB0BF11D15962FAC149407130830B2A3AB0BFD6C6E374FAC149405DB346FB373AB0BF00FAB2CFFAC149404B86AD235732B0BF39444D06FBC14940B242432CD131B0BFA5355490F9C14940	12 Parfett Street	E1	0	\N	Parfett Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1309	0106000020E61000000100000001030000000100000005000000C4A327199418B2BF7F8E7E5A69C149408945048CDC17B2BF4405B36368C14940FF31F67DF920B2BF565D961E68C14940936D3C89E320B2BF91B3682269C14940C4A327199418B2BF7F8E7E5A69C14940	66-67	E1 8BL	0	\N	Chamber Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
914	0106000020E61000000100000001030000000100000006000000AEE3A9FA450EB0BF44F4BFC808C249408C23ECE1A504B0BF7DB54EF908C249406790F9852D04B0BF09445D3006C24940CFCEA3CEC90DB0BFFEB9941006C24940D6B79DFA450EB0BF3BE7BFC808C24940AEE3A9FA450EB0BF44F4BFC808C24940	Madani Girls School	E1 1HL	0	\N	Myrdle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
915	0106000020E610000001000000010300000001000000050000003D3322EC11F4AFBF84155B3908C2494035DC2B1145E4AFBFEA1ACB7708C24940426E508BC8E2AFBF95155BF006C249409E550C3BCEF2AFBFDC29C9A006C249403D3322EC11F4AFBF84155B3908C24940	43 New Road	E1 1HL	0	\N	New Road	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
916	0106000020E6100000010000000103000000010000000500000035DC2B1145E4AFBFEA1ACB7708C249402A5357706DFFAFBFB479790C08C24940621334A07800B0BF9FD8B18709C24940A130119BACE5AFBF1414A5E909C2494035DC2B1145E4AFBFEA1ACB7708C24940	45 New Road	E1 1HL	0	\N	New Road	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
917	0106000020E610000001000000010300000001000000050000009E550C3BCEF2AFBFDC29C9A006C24940426E508BC8E2AFBF95155BF006C249401F336DFA5EE1AFBF983B6B7C05C24940BDDA5D3B52F1AFBF03DB342D05C249409E550C3BCEF2AFBFDC29C9A006C24940	41 New Road	E1 1HL	0	\N	New Road	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
918	0106000020E61000000100000001030000000100000005000000BDDA5D3B52F1AFBF03DB342D05C249401F336DFA5EE1AFBF983B6B7C05C24940D14DBB9FB4DFAFBF07D6D5C503C24940430F532492EFAFBF78670B7703C24940BDDA5D3B52F1AFBF03DB342D05C24940	39 New Road	E1 1HL	0	\N	New Road	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
919	0106000020E61000000100000001030000000100000005000000430F532492EFAFBF78670B7703C24940D14DBB9FB4DFAFBF07D6D5C503C249402CC844D468DEAFBF9004867002C24940B8F3976E35EEAFBF1E930F2202C24940430F532492EFAFBF78670B7703C24940	39 New Road	E1 1HL	0	\N	New Road	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
920	0106000020E61000000100000001030000000100000005000000B8F3976E35EEAFBF1E930F2202C249402CC844D468DEAFBF9004867002C24940350E4C80DDDCAFBF452BDBD900C2494025AB28F395ECAFBF03C7C88B00C24940B8F3976E35EEAFBF1E930F2202C24940	37 New Road	E1 1HL	0	\N	New Road	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
921	0106000020E6100000010000000103000000010000000500000025AB28F395ECAFBF03C7C88B00C24940350E4C80DDDCAFBF452BDBD900C249400C49202B54DBAFBFB5C53D45FFC149405401A390F8EAAFBF24FF8EF7FEC1494025AB28F395ECAFBF03C7C88B00C24940	35 New Road	E1 1HL	0	\N	New Road	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
922	0106000020E610000001000000010300000001000000050000005401A390F8EAAFBF24FF8EF7FEC149400C49202B54DBAFBFB5C53D45FFC14940F20ED6103BD9AFBF3D8FBB1CFDC1494032FCA214C4E8AFBF56C894CFFCC149405401A390F8EAAFBF24FF8EF7FEC14940	33 New Road	E1 1HL	0	\N	New Road	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
923	0106000020E6100000010000000103000000010000000500000032FCA214C4E8AFBF56C894CFFCC14940F20ED6103BD9AFBF3D8FBB1CFDC1494078D41E67C3D7AFBFC95D4B9AFBC14940E543254439E7AFBF47B3834DFBC1494032FCA214C4E8AFBF56C894CFFCC14940	31 New Road	E1 1HL	0	\N	New Road	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
924	0106000020E61000000100000001030000000100000005000000E543254439E7AFBF47B3834DFBC1494078D41E67C3D7AFBFC95D4B9AFBC149407233A8C54BD6AFBF85A9E317FAC14940DAAE567CAEE5AFBF191C7BCBF9C14940E543254439E7AFBF47B3834DFBC14940	29 New Road	E1 1HL	0	\N	New Road	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
925	0106000020E61000000100000001030000000100000005000000DAAE567CAEE5AFBF191C7BCBF9C149407233A8C54BD6AFBF85A9E317FAC149409A6F4BA4BED4AFBF34305E7FF8C14940E4F3071C0DE4AFBFC42E5A33F8C14940DAAE567CAEE5AFBF191C7BCBF9C14940	27 New Road	E1 1HL	0	\N	New Road	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
926	0106000020E61000000100000001030000000100000005000000E4F3071C0DE4AFBFC42E5A33F8C149409A6F4BA4BED4AFBF34305E7FF8C149400F41A09566D3AFBF021F711DF7C14940BE661083A3E2AFBF6B37C4D1F6C14940E4F3071C0DE4AFBFC42E5A33F8C14940	25 New Road	E1 1HL	0	\N	New Road	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
927	0106000020E61000000100000001030000000100000005000000BE661083A3E2AFBF6B37C4D1F6C149400F41A09566D3AFBF021F711DF7C149409992D37C75D1AFBFEC28161EF5C14940DB4CAA1299E0AFBFCF1EE7D2F4C14940BE661083A3E2AFBF6B37C4D1F6C14940	23 New Road	E1 1HL	0	\N	New Road	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
928	0106000020E61000000100000001030000000100000005000000DB4CAA1299E0AFBFCF1EE7D2F4C149409992D37C75D1AFBFEC28161EF5C14940BC0037EF30D0AFBF285E39D0F3C14940A34C51F943DFAFBF3C815C85F3C14940DB4CAA1299E0AFBFCF1EE7D2F4C14940	21 New Road	E1 1HL	0	\N	New Road	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
929	0106000020E61000000100000001030000000100000005000000A34C51F943DFAFBF3C815C85F3C14940BC0037EF30D0AFBF285E39D0F3C149409FF4F657D2CEAFBF66BE9367F2C149402C428182D3DDAFBFFCA30F1DF2C14940A34C51F943DFAFBF3C815C85F3C14940	19 New Road	E1 1HL	0	\N	New Road	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
930	0106000020E610000001000000010300000001000000050000002C428182D3DDAFBFFCA30F1DF2C149409FF4F657D2CEAFBF66BE9367F2C14940562C15C45FCDAFBFAFB95EEAF0C1494061B4380A4EDCAFBF8B7338A0F0C149402C428182D3DDAFBFFCA30F1DF2C14940	17 New Road	E1 1HL	0	\N	New Road	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
931	0106000020E6100000010000000103000000010000000500000061B4380A4EDCAFBF8B7338A0F0C14940562C15C45FCDAFBFAFB95EEAF0C14940AA960AE9AECBAFBF3A3E192DEFC14940D8DDFC1D87DAAFBF7B9060E3EEC1494061B4380A4EDCAFBF8B7338A0F0C14940	15 New Road	E1 1HL	0	\N	New Road	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
932	0106000020E61000000100000001030000000100000005000000D8DDFC1D87DAAFBF7B9060E3EEC14940AA960AE9AECBAFBF3A3E192DEFC1494089EA4D361CCAAFBF8C82D98EEDC14940EB83A5E3DFD8AFBF75CB8645EDC14940D8DDFC1D87DAAFBF7B9060E3EEC14940	13 New Road	E1 1HL	0	\N	New Road	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
933	0106000020E61000000100000001030000000100000005000000EB83A5E3DFD8AFBF75CB8645EDC1494089EA4D361CCAAFBF8C82D98EEDC1494017D4ACF48DC8AFBF2F802BF5EBC149405CCB9F5D2DD7AFBFD869A19CEBC14940EB83A5E3DFD8AFBF75CB8645EDC14940	11 New Road	E1 1HL	0	\N	New Road	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
934	0106000020E61000000100000001030000000100000008000000286B28948DC8AFBFD28D24F5EBC14940BA4F19E57BC2AFBF14A0BA33E5C149402389F6AD86C4AFBFD47D9AC7E4C14940118D45B44EDBAFBF1BC1CB02E5C14940559D39D399DBAFBF14C2F570E7C149401341B93825D2AFBF198803AFE7C14940D16910494ED6AFBF4CF4DEA1EBC14940286B28948DC8AFBFD28D24F5EBC14940	9 New Road	E1 1HL	0	\N	New Road	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
935	0106000020E610000001000000010300000001000000050000002CFD59C5CBF3AFBF871560C6EBC149406808C393BFF4AFBFDBD78257E5C149404304F5640502B0BF7873738AE5C14940B6AA860DB801B0BFDE80B7DAEBC149402CFD59C5CBF3AFBF871560C6EBC14940	New Road	E1 1HL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
936	0106000020E610000001000000010300000001000000070000008E0EF5640502B0BF7373738AE5C14940D1BDE28BF81CB0BF6F9FD946E6C14940198E83329A1FB0BF6A0C6F71EBC149407DA5CA1D4B1AB0BFCC1DE17AEBC14940F1D593215A1AB0BFC4D4244DECC149407DBA860DB801B0BFD780B7DAEBC149408E0EF5640502B0BF7373738AE5C14940	New Road	E1 1HL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
937	0106000020E61000000100000001030000000100000005000000FD1CA4F1CA21B0BFE0FA3BB5EDC149402AF0A100761AB0BF3DE872D3EDC1494062A6CA1D4B1AB0BFCC1DE17AEBC14940BAE0CAF8BA20B0BF47436D6FEBC14940FD1CA4F1CA21B0BFE0FA3BB5EDC14940	Original Lahore Kebab House	E1 1NL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
938	0106000020E610000001000000010300000001000000060000006808C393BFF4AFBFDBD78257E5C1494099FB886757F4AFBF698B2D17E8C149409CB4C8C7D3DBAFBF2888C6F4E7C14940CFDFE6534EDBAFBF6700C502E5C149402B79C1534EDBAFBFB0CEC402E5C149406808C393BFF4AFBFDBD78257E5C14940	Eternity, 152 Commercial Road	E1 1HL	0	\N	Commercial Road	152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
939	0106000020E610000001000000010300000001000000070000006BBE51772F41B0BF7D108045E9C149409EA2CD462F41B0BFA6677745E9C14940CFB365676340B0BF28A3A878E6C149404F4357A7FF4AB0BF2644168FE6C14940646E7C5AC74AB0BF62A2C426E9C14940F9380F772F41B0BF035A7E45E9C149406BBE51772F41B0BF7D108045E9C14940	Mirch Masala	E1 1NL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
940	0106000020E6100000010000000103000000010000000700000040058DB0D331B0BF6A439462E8C14940E8048EA02431B0BF48EB6E58E6C149405E6D665FF734B0BF69CC8360E6C149404F4BCE1A4836B0BF832505B5E9C1494079E859783434B0BF4C3524B7E9C149404ED845390634B0BFB8B8754DE8C1494040058DB0D331B0BF6A439462E8C14940	Layers Paris, 132 Commercial Road	E1 1NL	0	\N	Commercial Road	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
941	0106000020E61000000100000001030000000100000009000000CFB365676340B0BF28A3A878E6C149409EA2CD462F41B0BFA6677745E9C149406BBE51772F41B0BF7D108045E9C1494023BBBEBF5D41B0BF839A9176EAC149403D22391FB83BB0BFEFE58DA0EAC1494090D9A929993BB0BF75D596AFE9C149404F4BCE1A4836B0BF832505B5E9C149405E6D665FF734B0BF69CC8360E6C14940CFB365676340B0BF28A3A878E6C14940	Mirch Masala	E1 1NL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
942	0106000020E610000001000000010300000001000000070000003401B585D22DB0BF70DD1489E8C149409EB3C953D22DB0BFB14F0A89E8C14940DF7FC5FB722CB0BF30E0824EE6C14940E8048EA02431B0BF48EB6E58E6C1494040058DB0D331B0BF6A439462E8C149409C650B84D22DB0BF11421189E8C149403401B585D22DB0BF70DD1489E8C14940	Dineshco, 134 Commercial Road	E1 1NL	0	\N	Commercial Road	134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
943	0106000020E6100000010000000103000000010000000A000000BA306D096B2EB0BF6C941D8EE9C14940C988968C4E2EB0BF865F8B96E9C14940D673F95C322AB0BF2D228CC2E9C149402E5A41F5E428B0BFEBA82CC1E6C149404D73E3AD762AB0BF246B504AE6C14940DF7FC5FB722CB0BF30E0824EE6C149409EB3C953D22DB0BFB14F0A89E8C149403401B585D22DB0BF70DD1489E8C14940739238214B2EB0BF3469BE8EE9C14940BA306D096B2EB0BF6C941D8EE9C14940	Original Lahore Kebab House	E1 1NL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
944	0106000020E61000000100000001030000000100000007000000D673F95C322AB0BF2D228CC2E9C14940C988968C4E2EB0BF865F8B96E9C14940BA306D096B2EB0BF6C941D8EE9C149407F9D67951631B0BF3915A880E9C14940220011945831B0BF58C19FD6EAC1494030EBF9D3B22AB0BFEFE3FEEAEAC14940D673F95C322AB0BF2D228CC2E9C14940	Dineshco, 134 Commercial Road	E1 1NL	0	\N	Commercial Road	134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
945	0106000020E61000000100000001030000000100000017000000D9681B46B13AB0BFE7BC5731F6C14940CD5685D5983CB0BF30BC8928F6C14940D3F78B2BFF3CB0BF1F860328F7C14940DA5B1EA14A39B0BF27F92331F7C14940A21B0E947639B0BFA576F620F8C1494084EF8A846031B0BF1CF3D855F8C1494010CB0A117430B0BF34BB1BF1F5C1494028616452FB31B0BF3ACDBBE5F5C14940BB5133BF4B2FB0BFE138FF3BEFC149404756544AC52DB0BF34493850EFC14940A453F57FD82CB0BF28666830ECC149402825BAC3C530B0BF45620B00ECC1494066ED3E928C31B0BFEC35F08DEDC14940F4198A224C35B0BF2872906FEDC1494081CB2AF46535B0BF1DCA70D3EDC14940C9858000233AB0BF452EACA5EDC1494064B801919F3AB0BF965A5C80EEC14940086D2FCD4438B0BF921B0497EEC149403A44F1F83639B0BF1F4D1001F1C1494072779B53653BB0BFF6897CEDF0C14940729E7D4AD73BB0BFDA1458B7F1C14940BC36CC936E39B0BF0C5DB6D3F1C14940D9681B46B13AB0BFE7BC5731F6C14940	8 Parfett Street	E1	0	\N	Parfett Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
946	0106000020E6100000010000000103000000010000000700000041B6674C4258B0BF9A8E2F7949C24940D20970F79855B0BFD2DB891948C24940655DC03D2563B0BF7BBC6DFE45C249406C7D583DB264B0BF225F12F646C249402A03F0F6E263B0BF205B781547C24940E849FD468A64B0BF4EA5997E47C2494041B6674C4258B0BF9A8E2F7949C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
947	0106000020E61000000100000001030000000100000005000000F6897D0D2563B0BF11CB66FE45C24940270970F79855B0BFD4DB891948C24940814D3C147054B0BF891AC57147C24940A76EA8D70762B0BF1D284F4C45C24940F6897D0D2563B0BF11CB66FE45C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
948	0106000020E610000001000000010300000001000000050000000E4D3C147054B0BF891AC57147C24940AE2842D84753B0BF636592C846C24940C9E4D60EE760B0BFFB4F429844C24940A76EA8D70762B0BF1D284F4C45C249400E4D3C147054B0BF891AC57147C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
949	0106000020E610000001000000010300000001000000050000006A4B2C164144B0BFCDE45B6947C24940ED97F3FCA440B0BF45ECD5F247C249400287CD6A413FB0BF134D7F0547C249403DEA0DA3CB42B0BF2C81DF7B46C249406A4B2C164144B0BFCDE45B6947C24940	Tower House, 81 Fieldgate Street	E1 1GU	0	\N	Fieldgate Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
950	0106000020E61000000100000001030000000100000005000000EBB69071EC22B0BFADAF51E648C249403AE684596524B0BF8598C62D4AC2494000F28989DC15B0BFC70C87CD4BC249409D2817B55A14B0BF6EC5F09C4AC24940EBB69071EC22B0BFADAF51E648C24940	121 New Road	E1 1HL	0	\N	New Road	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
951	0106000020E61000000100000001030000000100000005000000E9D5B01E3C0DB0BF294C7AB544C24940E6902E37530CB0BF4243D61C43C249403B731E1B8720B0BF0965B19E40C24940816F45F17322B0BF2D2C1C2A42C24940E9D5B01E3C0DB0BF294C7AB544C24940	Shiv House, 101 New Road	E1 1HL	0	\N	New Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
952	0106000020E6100000010000000103000000010000000B0000008ECEAF18312DB0BFD4743C8C37C24940721CFDEA8E26B0BFB53341EC37C24940E3FBB6DE1F24B0BFF6730D0434C249403D0A603C9235B0BFAEAA56E832C249403BE175DCB936B0BF8392B22D35C249405CACAD524834B0BFCE4ED15035C2494008E6F8E80A35B0BFFA51260D37C24940F4C754F92931B0BF3EC9904337C249400FE253540D30B0BF6F1F94EE34C24940A7DFE8BCA62BB0BFEEF80A3335C249408ECEAF18312DB0BFD4743C8C37C24940	Tayyabs, 83-89 Fieldgate Street	E1 1JU	0	\N	Fieldgate Street	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
953	0106000020E610000001000000010300000001000000150000004E0C3CD537DEB0BFE5D625342EC249408136291D03DEB0BFE09549A230C249409118D3826EE4B0BFB7EFC05432C249401D56ADCF6EE4B0BF51EABC5432C24940ADCF14B36EE4B0BF4CE1C75432C2494021C40F0FF7EDB0BF04171FC034C24940EFBD2020B800B1BF302985D431C24940C39A85937C05B1BF4AC9862735C249406D47F5D45B03B1BF90EDA2DD35C249403F59FF7658E2B0BFA65E95E63AC24940BFADFFFBF9E2B0BF52C3DB613BC249409015D09009D9B0BF3F3B62BC3CC24940C58605D96BD8B0BF3560A0503CC24940166858A68ECEB0BF978BDEF034C24940A9E6C598D1C6B0BF63F33E1F2EC24940C9CE1BB02FCAB0BF297FD8E52DC249407581AF0E43CBB0BF439FFA712EC2494094D53D1292D0B0BF1A7A1B6E2EC249405C7A1EF69BD1B0BF467220B82DC2494062E82DBFDBDCB0BF88EA21BF2DC249404E0C3CD537DEB0BFE5D625342EC24940	London Mosque Centre, 46 Whitechapel Road	E1 1JX	0	\N	Whitechapel Road	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
955	0106000020E6100000010000000103000000010000000B0000003EADC1AD92E3B0BF4FA5B7D10EC24940E3E734CB92E3B0BF1E3BADD10EC24940D3A77C5C16F6B0BF6AE3A0440EC24940B75BA7A7C3FFB0BFF8D87F0918C24940DE651DECC3EEB0BF724416A719C2494047E3A16A44EBB0BF7CEE125616C249406BEB795261DDB0BFD0ABFDC217C24940AC4259D46FD9B0BF4D54E50514C24940CF945DE09BE7B0BFEB2CF99112C24940761276FB92E3B0BF112DB4D10EC249403EADC1AD92E3B0BF4FA5B7D10EC24940	Jacobs Court, 17 Plumbers Row	E1 1EE	0	\N	Plumbers Row	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
956	0106000020E6100000010000000103000000010000000D0000006A12B541E1DCB0BFDD3A653A08C24940ED69BD08EBEFB0BF2332450A08C24940D3A77C5C16F6B0BF6AE3A0440EC24940E3E734CB92E3B0BF1E3BADD10EC249403EADC1AD92E3B0BF4FA5B7D10EC2494046B0F4DF36D8B0BF89AA8E530FC24940C6FF0A0540D7B0BFC11909DD0CC249407881E2CD38DAB0BF4186B4CA0CC2494077D9BA5D81D9B0BF023E7ADA0AC24940C39AEA6BC3D6B0BFFD32A0EB0AC24940F2FE162162D6B0BF65E1508408C24940E4931445E1DCB0BF569E6C3A08C249406A12B541E1DCB0BFDD3A653A08C24940	Jacobs Court, 17 Plumbers Row	E1 1EE	0	\N	Plumbers Row	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
957	0106000020E6100000010000000103000000010000000D000000ED69BD08EBEFB0BF2332450A08C249406A12B541E1DCB0BFDD3A653A08C24940B1533747ABD8B0BFDA282201FFC1494083340B2887CEB0BFAEF17974FFC14940F7CB29C88BCDB0BF9B01D74DFDC14940010B5E0F87BAB0BF7EAD2526FEC149408718174734B9B0BF29470540FBC149403718FB36A9BAB0BFF55B41B9FAC14940C35B384A82C8B0BFD1911F40FAC149409CB5570BBDC9B0BF14D8E78DFAC14940F9C4C37801DCB0BFBDF861C6F9C149402B01E93F66E3B0BFDC14FC66FBC14940ED69BD08EBEFB0BF2332450A08C24940	Colefax Building, 23 Plumbers Row	E1 1EE	0	\N	Plumbers Row	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
958	0106000020E610000001000000010300000001000000090000001A9C9096FDD2B0BF676A67981CC24940A178B762FDD2B0BFEFE656981CC24940FE4023837AC4B0BFC54A5E251DC24940D37F66152DC3B0BFEDC05CAC19C249403BA19C5CEED5B0BFE146840319C2494089924B8CEED5B0BFAAC9880319C249409649EE1D3BD7B0BF02003C6C1CC24940AAF4F892FDD2B0BFC1D85D981CC249401A9C9096FDD2B0BF676A67981CC24940	Jacobs Court, 17 Plumbers Row	E1 1EE	0	\N	Plumbers Row	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
959	0106000020E61000000100000001030000000100000006000000BA998C51E6D4B0BF6E4024BA21C24940A464EB3A65C6B0BFBF267C4022C24940AA4123837AC4B0BFC84A5E251DC24940A178B762FDD2B0BFEFE656981CC249401A9C9096FDD2B0BF676A67981CC24940BA998C51E6D4B0BF6E4024BA21C24940	The Curve, 14 Fieldgate Street	E1 1ES	0	\N	Fieldgate Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
960	0106000020E61000000100000001030000000100000007000000A464EB3A65C6B0BFBF267C4022C24940BA998C51E6D4B0BF6E4024BA21C2494059DD493136D6B0BFEDDFFD4025C24940341878CACADBB0BF6F16E91725C24940D5D1274E1FDDB0BFE719A3B429C24940888737E820C9B0BF6FBF338829C24940A464EB3A65C6B0BFBF267C4022C24940	The Curve, 14 Fieldgate Street	E1 1ES	0	\N	Fieldgate Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
961	0106000020E610000001000000010300000001000000070000007195C9F6DA9FB0BF82A46925E8C1494020553BC1DA9FB0BFDBFF7825E8C14940DAC808E137A0B0BF1F699FBFEAC149406236353C359BB0BF776F3FCCEAC14940C1C2543DC19AB0BF7462DC94E6C149401FAFA28432A0B0BF464C18B5E6C149407195C9F6DA9FB0BF82A46925E8C14940	Turner House	E1 1LA	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
962	0106000020E61000000100000001030000000100000005000000EBCCAE343C80B0BF72879BE5F1C14940A5FE0C06457BB0BFE9E170F1F1C14940FC3F07BE0C7BB0BF242D4E6AF0C14940A16EBC0BF27FB0BFAE0E535EF0C14940EBCCAE343C80B0BF72879BE5F1C14940	Duru House, 101 Commercial Road	E1 1NL	0	\N	Commercial Road	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
963	0106000020E610000001000000010300000001000000050000001E4DC9C5339AB0BFBA0710DE22C24940F3D0943830A3B0BF795670D122C24940DD97C51D4BA3B0BF7F0E7F0724C2494075AFE9DD449AB0BF84757F0D24C249401E4DC9C5339AB0BFBA0710DE22C24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
964	0106000020E6100000010000000103000000010000000500000023C0CDA112A3B0BFB2D5537C21C24940DA577A8D209AB0BFE9F9E48821C24940F85BAF950E9AB0BF5D4EF34920C2494002AA75F8F6A2B0BF41CB6F3D20C2494023C0CDA112A3B0BFB2D5537C21C24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
965	0106000020E6100000010000000103000000010000000500000002AA75F8F6A2B0BF41CB6F3D20C24940F85BAF950E9AB0BF5D4EF34920C24940B3FEAEC4FA99B0BF2AD731EA1EC24940CB4E9D76D8A2B0BF095BBDDD1EC2494002AA75F8F6A2B0BF41CB6F3D20C24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
966	0106000020E61000000100000001030000000100000005000000CB4E9D76D8A2B0BF095BBDDD1EC24940B3FEAEC4FA99B0BF2AD731EA1EC24940E64442C8E899B0BF645C8E7E1DC249403083F587B6A2B0BF018D20721DC24940CB4E9D76D8A2B0BF095BBDDD1EC24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
967	0106000020E61000000100000001030000000100000005000000BE82F587B6A2B0BF018D20721DC24940744442C8E899B0BF645C8E7E1DC24940B10A08C5D399B0BF88C0F0351CC24940CA48DC6C9CA2B0BF6FD399291CC24940BE82F587B6A2B0BF018D20721DC24940	Ebrahim College, 80 Greenfield Road	E1 1EJ	0	\N	Greenfield Road	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
968	0106000020E61000000100000001030000000100000005000000CA48DC6C9CA2B0BF6FD399291CC24940B10A08C5D399B0BF88C0F0351CC24940D2F337FBC399B0BF3EA2AF1D1BC249409B9D851E84A2B0BF44AE64111BC24940CA48DC6C9CA2B0BF6FD399291CC24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
969	0106000020E610000001000000010300000001000000050000009B9D851E84A2B0BF44AE64111BC24940D2F337FBC399B0BF3EA2AF1D1BC24940B69369F6B699B0BF0967CDF219C249403AFF2C266DA2B0BF7CBBC6E319C249409B9D851E84A2B0BF44AE64111BC24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
970	0106000020E61000000100000001030000000100000005000000C7FE2C266DA2B0BF7CBBC6E319C24940619369F6B699B0BF0967CDF219C249404CD816D2A299B0BFB2690FD118C24940E7818F1151A2B0BF1D70DDC418C24940C7FE2C266DA2B0BF7CBBC6E319C24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
971	0106000020E61000000100000001030000000100000006000000E7818F1151A2B0BF1D70DDC418C249404CD816D2A299B0BFB2690FD118C24940A4663E0D9399B0BF0E7826B917C249405FC670F61E99B0BF5D95FBAE17C24940DAFD8ADD38A2B0BF8FBAD7AD17C24940E7818F1151A2B0BF1D70DDC418C24940	Kobi Nazrul Primary School	E1 1JP	0	\N	Greenfield Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
972	0106000020E61000000100000001030000000100000009000000BA025190447DB0BFB3A94CFB26C249406D57B8538E77B0BF88C10E1827C249408A72A63C8E77B0BF32291A1827C249408688282D3B73B0BFABD0FC3627C249401D0BD18F8E72B0BFA31169D725C24940219CE3FDDC74B0BF2C7975B325C24940BD829E279A74B0BFEAABA34825C2494048281F76D47CB0BF05D4F41625C24940BA025190447DB0BFB3A94CFB26C24940	70 Settles Street	E1 1JP	0	\N	Settles Street	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
973	0106000020E610000001000000010300000001000000080000002010B91E1274B0BF0F25445928C24940F1F7CE197A76B0BF3E434C482BC2494096C9F0187A76B0BF357F56482BC24940A8B2EFBA7272B0BF271A008F2BC249405362352BE670B0BF444C4F7629C2494079ACDBE15B73B0BFD050C14A29C24940190DD1D3C072B0BFA76C987028C249402010B91E1274B0BF0F25445928C24940	72 Settles Street	E1 1JP	0	\N	Settles Street	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
974	0106000020E610000001000000010300000001000000070000005362352BE670B0BF444C4F7629C24940A8B2EFBA7272B0BF271A008F2BC24940E509ED736B6EB0BFCA21A8D52BC24940E27FD48E4C6CB0BFBEFFCED928C2494091B7B2A7C86EB0BFA405D0AD28C24940A6AC0EDA696FB0BF685B9D9029C249405362352BE670B0BF444C4F7629C24940	53 Parfett Street	E1	0	\N	Parfett Street	53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
975	0106000020E61000000100000001030000000100000006000000B3A3B2B9F345B0BF34B2B00E29C24940145DFF3E854EB0BF35DF638F28C24940527A5E62854EB0BF29CB538F28C2494090C1CE9F1B4FB0BFC1FC2C9B29C249404B68C3E38046B0BF98765C0A2AC24940B3A3B2B9F345B0BF34B2B00E29C24940	6 Myrdle Street	E1 1HL	0	\N	Myrdle Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
976	0106000020E6100000010000000103000000010000000600000030F6451E6244B0BFCE1F92E425C24940A1B71C422A4BB0BF0722418B25C24940246752712A4BB0BF89E7458B25C2494058E0B84CDD4BB0BF01D727F126C24940A1EA6DCBF944B0BF67BE6A5127C2494030F6451E6244B0BFCE1F92E425C24940	10 Myrdle Street	E1 1HL	0	\N	Myrdle Street	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
977	0106000020E610000001000000010300000001000000110000007B525BCA450EB0BF2DF5B8C808C249404E73619EC90DB0BFE8C78D1006C24940FA5F1D822C2BB0BF63914A9705C24940E820F6139E2BB0BF95AEBA3908C24940A008E330C828B0BF23273E4708C24940DF28A713D128B0BFFEFF5AB108C249404A85B01BB924B0BFEACBD0C108C2494014B8D6BFAF24B0BF6BB0475D08C249401A347979F21EB0BF9A85367808C249406EC54FA8F21EB0BFBE9976DF08C24940FBC58E58A41AB0BFE66FD8F708C249402A6ECD58891AB0BF00A95F9008C24940D990E3058815B0BFFC4711AA08C249403E54692D9815B0BF8CAA601709C2494016B766C54B11B0BFD7D2D82909C249409E77512F3A11B0BF9634DFBC08C249407B525BCA450EB0BF2DF5B8C808C24940	Madani Girls School	E1 1HL	0	\N	Myrdle Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
978	0106000020E610000001000000010300000001000000060000002D90FBA1CE34B0BF1FD1707C04C24940708BC54CAF39B0BFF3A95F5104C24940849FA07DAF39B0BFDCD0675104C24940EA9CE2E9293AB0BFCDC2784805C24940D9A734C84335B0BFFEF5DD6805C249402D90FBA1CE34B0BF1FD1707C04C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
979	0106000020E61000000100000001030000000100000005000000819E7512C63FB0BF54E3C15008C24940BCB210DB983EB0BF8925D93804C24940501847194043B0BFCDD16C2604C249400ED4A36E4444B0BF2BAE0A3308C24940819E7512C63FB0BF54E3C15008C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
980	0106000020E610000001000000010300000001000000050000001FCD0131AD48B0BF1051E21508C24940C2AE95AD9C47B0BF92ED200E04C249406A2BE9C2F14BB0BF90E52CED03C249403FC8585D4F4DB0BFD8473EF707C249401FCD0131AD48B0BF1051E21508C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
981	0106000020E610000001000000010300000001000000050000003FC8585D4F4DB0BFD8473EF707C24940BA28E9C2F14BB0BF94E52CED03C249405CF950B2AD50B0BFE08A2AC903C24940F574050B9651B0BF364AF7DA07C249403FC8585D4F4DB0BFD8473EF707C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
982	0106000020E610000001000000010300000001000000050000001B228463DD3EB0BFC9F8442705C24940819E7512C63FB0BF54E3C15008C249406E119739EB3AB0BFE3B3DC7008C2494032EB200D033AB0BFEDB6814905C249401B228463DD3EB0BFC9F8442705C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
983	0106000020E6100000010000000103000000010000000500000032EB200D033AB0BFEDB6814905C249406E119739EB3AB0BFE3B3DC7008C2494076A339794D36B0BF7B7F638F08C249406B6F0B107735B0BF0C0D936705C2494032EB200D033AB0BFEDB6814905C24940	18 Parfett Street	E1	0	\N	Parfett Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
984	0106000020E61000000100000001030000000100000007000000F7D25DD2F068B0BF44A12B5807C24940E472D2837668B0BF2E28A60205C249405C550EAF7668B0BF655D990205C249407982510B7868B0BF07DBEA0705C24940DD087CE1E06CB0BFA3E5D0EB04C249407BE0A8237B6DB0BF4A06DD4607C24940F7D25DD2F068B0BF44A12B5807C24940	5 Fordham Street	E1 1HL	0	\N	Fordham Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
985	0106000020E610000001000000010300000001000000050000009366EF6A0063B0BF20B340B404C249409F7D570E9C63B0BF68B35F6C07C2494006C8D0430E5FB0BFBDC9D97D07C2494018DFA3C46C5EB0BFCEBAB6CB04C249409366EF6A0063B0BF20B340B404C24940	11 Parfett Street	E1	0	\N	Parfett Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
986	0106000020E61000000100000001030000000100000005000000B0D901F9125EB0BF90DCFB4B03C2494006C8D0430E5FB0BFBDC9D97D07C24940B8293AE1655AB0BFD1019B8F07C249405FEB3CE8A259B0BFF7627C6303C24940B0D901F9125EB0BF90DCFB4B03C24940	11 Parfett Street	E1	0	\N	Parfett Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
987	0106000020E61000000100000001030000000100000026000000EED866070CF5B1BF6BB5E828DBC14940C4EE1E9B18F5B1BFB11A0A49DBC14940F43B9F3BFAF4B1BFCF07CF72DBC1494061180EF9B3F4B1BF96DFBBAADBC149402FDD194979F4B1BFD5E5F2CADBC1494080560ED638F4B1BF79DC6DE7DBC149405438E7B4FCF3B1BF73EA56FDDBC1494086EA9E83A3EDB1BFF1365820DDC1494075EEF8E332E4B1BFDA700FD1DEC1494078530B8609E1B1BF56BDFB61DFC14940499AFA10BDDCB1BF8A051F28E0C14940FADE40E813DCB1BFEFEAC04AE0C149409446E3C346DBB1BFBCFCC15CE0C149403AD35A1966DAB1BF4573275AE0C149404EBAE2DCA1D9B1BF0245E841E0C14940665B8AE415D9B1BF9568F21DE0C1494015E7C3DA83D8B1BFA0B372D7DFC14940F4488B1914D8B1BF3964DD24DFC14940ACBE001B0DD7B1BFEC1527A2DDC14940F935BE73E7D4B1BF74C5ED79DAC14940AF38BBCEDED3B1BFC3F60357D9C14940F4463071BBD2B1BFF8AEC747D8C149407EBD1CE76AD2B1BF2FDFF2BDD7C14940479959347FD2B1BFA141D185D7C149403E7A3BDDB5D2B1BFE934C42FD7C149405B4B526E51D3B1BF67F6EDB1D6C1494056E0F43C52D4B1BFCF37284FD6C1494027B0A133D8D5B1BF0D4330F1D5C1494097B0124B80E5B1BF3E900784D2C149408607FB6892EFB1BFE9DDCF4FD0C14940CA38E3A6FCF8B1BFDF102D5BD5C14940960985B4CCF0B1BF4A09DE22D7C149401B21C6C8BEEFB1BF6947AD5BD7C149400F928A4AE5EFB1BF4C497688D7C149407B98884005F1B1BF366F9A7DD8C1494033A456EE33F4B1BF4279ADB2DAC14940EDCFF7D9D1F4B1BFDB381409DBC14940EED866070CF5B1BF6BB5E828DBC14940	Altitude	E1 8EB	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
988	0106000020E61000000100000001030000000100000009000000BDA364BDECE6B1BF130BD635E8C14940732D693D0EDEB1BFA4DD3B20E8C149401FCADA0C5FDEB1BFC74CC041E5C149407B9E8529A1DEB1BF3BFDFE97E2C149407DC99AA1DBE4B1BF8F9FBEF5E1C149403C67104703E5B1BFC1E69355E5C14940F1B36D80F3E4B1BFE7EF2610E6C149405F459CD51AE7B1BFFC6BB014E6C14940BDA364BDECE6B1BF130BD635E8C14940	Metropolitan Tower	E1 8EB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
989	0106000020E61000000100000001030000000100000006000000F9952879B7C1B1BF2CA58E8FE7C149407E92BC36F7C1B1BF2313F09DE4C149403464888604C2B1BF65C58C00E4C14940D99366EA83D3B1BF08D0C636E4C149404A2EA0F2EFD2B1BF205397DBE7C14940F9952879B7C1B1BF2CA58E8FE7C14940	81 Alie Street	E1 8EB	0	\N	Alie Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
990	0106000020E61000000100000001030000000100000005000000F9952879B7C1B1BF2CA58E8FE7C14940A734794F66BCB1BFB563B07AE7C149405D03840BAABCB1BFADBC2891E4C14940813AC1B7F6C1B1BF1C6ACDA3E4C14940F9952879B7C1B1BF2CA58E8FE7C14940	81 Alie Street	E1 8EB	0	\N	Alie Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
991	0106000020E6100000010000000103000000010000000D000000A734794F66BCB1BFB563B07AE7C14940866C3ADECFA8B1BFB25E8F26E7C14940FDEB40DC17A9B1BF98950165E3C149400736C31A34AEB1BF14EBC66FE3C149407E904D8271AEB1BFF4F1E299E0C14940D1BB213BFDB6B1BF8C3DCEE4DEC149406EE72516D9B9B1BF4A29682BE0C1494033E9B2B7B0BBB1BF844F71F7E0C1494061BA0737BEBDB1BF3BD76BDAE1C149405AB1966E6ABAB1BF4E01B7ACE2C149409DBF745D5BBAB1BFD81D66CDE3C149401ADB0AF0B0BCB1BF2EB017D8E3C14940A734794F66BCB1BFB563B07AE7C14940	81 Alie Street	E1 8EB	0	\N	Alie Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
992	0106000020E61000000100000001030000000100000006000000173B6D09D3A8B1BF2CC23CFCE6C14940869CEF191DA3B1BF9B7015F6E6C14940B860C36475A3B1BF911D6FE2E2C14940DE90AA5E39A9B1BF9530BDD0E1C14940FDEB40DC17A9B1BF98950165E3C14940173B6D09D3A8B1BF2CC23CFCE6C14940	The Castle	E1 7QL	0	\N	Goodman's Stile		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
993	0106000020E61000000100000001030000000100000012000000869CEF191DA3B1BF9B7015F6E6C14940623E05604C9AB1BFB08B80E3E6C1494005C3A6E6C398B1BFD23945E0E6C14940C6D9AF4D0A98B1BFA8336DCFE6C14940B1DBB1736B97B1BF929567B2E6C149406B1046D30297B1BF3FA3FE8FE6C14940EE769545BD96B1BFD445826DE6C14940BE2E0E139596B1BFAE077149E6C1494018408BB07F96B1BF26091224E6C149407E1A0C478896B1BFF36BD4F5E5C1494056DC7A78AA96B1BF02D7E4C8E5C14940EE0E6A18EB96B1BF2EB47A9BE5C149401959F6D17897B1BF8E55FC52E5C14940059AC2241398B1BFC6B75E1BE5C14940A298F32CD998B1BFA2FB22ECE4C149403953A43D7DA0B1BFA344AB8CE3C1494058B8C68072A3B1BF814D9A04E3C14940869CEF191DA3B1BF9B7015F6E6C14940	The Castle	E1 7QL	0	\N	Goodman's Stile		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
994	0106000020E6100000010000000103000000010000000C000000A9D75DB186D3B1BFACFEF2B0E3C14940C6973AD631C2B1BF70C7AA79E3C1494098246A81F1C2B1BFBEB415B3DFC14940447A316A1FC6B1BFEF9FE313DFC149400614D826D5C4B1BF03D92A2DDEC14940F5959C047BCAB1BF0D22E78DDCC14940A8AEE95F95CDB1BF55D3FED4DDC14940E991FDC268D0B1BF98D41211DFC14940AF955AD38DD2B1BFE7268F0DE0C14940C6C268D78DD5B1BF5ADB738AE1C14940320997ED8FD3B1BF548FF2F3E1C14940A9D75DB186D3B1BFACFEF2B0E3C14940	81 Alie Street	E1 8EB	0	\N	Alie Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
995	0106000020E61000000100000001030000000100000005000000BCFD9C077B74B1BF78D05434DDC14940E0BC69C45268B1BFBDB6628FDDC14940D9F8A4797966B1BF6802E768D7C149401CFDE19C016AB1BF86EC689FD6C14940BCFD9C077B74B1BF78D05434DDC14940	Meranti House	E1 7QL	0	\N	Goodman's Stile		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
996	0106000020E610000001000000010300000001000000180000008B6323B7645FB1BF5EF31471E3C14940AA825DEE915FB1BF23BF5263E4C1494073C26DE7494DB1BF74116ED2E3C14940E529F6037B4DB1BFE04E0B33E3C149400FD352507C42B1BFB8179ADEE2C1494085889C935942B1BF5124DB8DE3C14940044D1DBBE636B1BF6187F232E3C14940FA07A4662737B1BF7BE9465EE2C14940F8F3939BA330B1BFB9A5E135E2C14940EC808375B131B1BF53A12F52DEC149402CBFEBAD0432B1BF8053F911DDC1494047392F1B7038B1BF6DB23447DDC14940C64D879D8939B1BF7A80C11CDAC1494030CADEDFE246B1BF0135C77CDAC149406F8079EDE146B1BFDBAE7088DAC14940A9FC1AB77346B1BF345E909BDBC1494043C75ED47250B1BF69425AF6DBC14940FAF602BADB50B1BF865CE4DDDAC14940976670BBDB50B1BF6796DEDDDAC149401FC14E02E55DB1BFC3DFC34BDBC149405E720B2C315DB1BFB34DE6FADEC1494083224B420D61B1BF1B6BD315DFC149406C2CEB5BE061B1BFA2EF6E84E3C149408B6323B7645FB1BF5EF31471E3C14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
997	0106000020E61000000100000001030000000100000009000000EC808375B131B1BF53A12F52DEC14940F8F3939BA330B1BFB9A5E135E2C149403BD553F06A0DB1BF9DA90732E1C14940FBC58633160EB1BFC5A5A62DDDC14940A3CF650FB312B1BFC752E951DDC14940D4DD4CE6A114B1BF770FD3E2D6C14940DF52BFCFBA24B1BF175DEC5DD7C14940D77AFAB29C22B1BF258A69DEDDC14940EC808375B131B1BF53A12F52DEC14940	London Metropolitan University	E1 1LF	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
998	0106000020E6100000010000000103000000010000001B000000FC6F3465F61FB1BFD9533789D3C1494098AC9F68AA19B1BF700DAF75D3C149400014B91AA219B1BFD6B129B9D4C14940F03351140E12B1BFA6CCD784D4C14940863EE04B2812B1BF0796401CD3C1494093CD0B714E12B1BFA560990FD1C149403491C97B7612B1BF2307DBE8CEC1494050D88B2AEE12B1BF1D451639CDC149400B2F17D40A14B1BFB7D6AB3DCDC14940A397786B5714B1BF35DFEF9ACBC149409EC3415F7513B1BF89551399CBC14940739C6F00DD13B1BF114C60C9C9C14940450271FD4F14B1BF068DBD24C8C149400811B3CA3616B1BFC27EF2F0C5C14940E35C8132EC16B1BFD4C3D91EC5C149408611DF2A4518B1BF4CE2D81AC4C14940272116320120B1BFDD836DDDC4C14940E734C2D08C1FB1BF0B3F1DA1C5C14940A5F91B259E25B1BF00BFD851C6C14940DFE6CF9F5624B1BFC407B768C7C149400E7B39D11123B1BF7A1498EAC8C14940DCC62EE8D222B1BFF5CFF7A6C9C14940BA34CABC9122B1BF24190202CCC1494050CA6556371FB1BF14F221F6CBC1494097D260B5A01EB1BF02D24B98CDC14940549270842722B1BF405011ACCDC14940FC6F3465F61FB1BFD9533789D3C14940	Harry Gosling Primary School	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
999	0106000020E610000001000000010300000001000000060000006CB112BD1758B1BFF5BA6E14C6C149406944EF04CF51B1BF5BA6AE18C6C1494068F759764D4EB1BFAA271F17C6C1494001763AF9564EB1BFEFF8EBECC3C14940ACADACE06457B1BF0F292FFAC3C149406CB112BD1758B1BFF5BA6E14C6C14940	Mitali Passage	E1 1LU	0	\N	Mitali Passage		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1000	0106000020E6100000010000000103000000010000000500000068F759764D4EB1BFAA271F17C6C14940934D3067624BB1BF2BC8210BC6C14940D730511C7E4BB1BF3E9DEAE6C3C1494001763AF9564EB1BFEFF8EBECC3C1494068F759764D4EB1BFAA271F17C6C14940	Mitali Passage	E1 1LU	0	\N	Mitali Passage		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1001	0106000020E6100000010000000103000000010000000600000045BE7034FE5DB1BFACD22668D8C149405E6BBD54A14FB1BF2FC139EDD8C1494075B8071B584EB1BFF919FC21D5C149401037E0487853B1BFB0A61EFED4C14940C1DBF8A2225DB1BF9EB0FCBAD4C1494045BE7034FE5DB1BFACD22668D8C14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1002	0106000020E61000000100000001030000000100000005000000EC67D9F6E223B1BF86AA6709C4C149400A29CD9B581AB1BFF4F690BFC2C14940E5A0115FD11CB1BF2BE01222C1C149403715E60E1226B1BF3ACD2AA4C2C14940EC67D9F6E223B1BF86AA6709C4C14940	Harry Gosling Primary School	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1003	0106000020E61000000100000001030000000100000005000000B8B5EC52F754B1BF1855643ABDC14940CA68122E8F4EB1BF1E59057BBDC14940BF41083E9C4EB1BF36FDE155BBC1494031F2A2EC0255B1BF51DF65A9BBC14940B8B5EC52F754B1BF1855643ABDC14940	90 Back Church Lane	E1 1LU	0	\N	Back Church Lane	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1004	0106000020E6100000010000000103000000010000000500000088E9BDB61D2FB1BF936372BEBBC14940968979CB6326B1BF9A3A1A3DBAC14940AD2F84218428B1BFE68BAC08B9C14940716BE6AD5631B1BF714A448EBAC1494088E9BDB61D2FB1BF936372BEBBC14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1005	0106000020E6100000010000000103000000040000000F000000E02F5DC6C232B1BF80890919A7C14940B30E240CDF4FB1BFDEDFFC94A6C149403F8CDB722253B1BF3E414273AEC14940F7DDF2533656B1BFE931BE56AEC149408F155C917258B1BFB8494646B1C14940A7CC7D15A453B1BFA7402119B1C149408D6E47AFCF51B1BFEEE412BAB3C149403A09A535C948B1BF70A05A55B3C14940AC6BCB42A545B1BFD15249A3B7C149400F813A971939B1BF4F3F0568B6C14940E72FE7BCEE2FB1BF7565E4D4B4C14940FBB60FD44233B1BF23D0ED93AFC14940903359ED3A34B1BF598F7EC2ACC149402CEFA5FBE832B1BF527EC7A4A7C14940E02F5DC6C232B1BF80890919A7C1494007000000E33E9A834E41B1BFDAA97986B4C149404A2A29557242B1BF80714347B2C14940AC6D7BC71D40B1BFB122D830B2C14940FBC4C8671940B1BF81839B87B1C14940805C339AE33CB1BFFA47007BB1C1494025E9BAD4D73BB1BFEF54F157B4C14940E33E9A834E41B1BFDAA97986B4C14940050000000028EF612A47B1BFF445C409B0C149409FBA9AC91F49B1BFECEEE4BFACC1494012D01481A044B1BFFBEFE35EACC14940A7F0495E5E42B1BF8BEB77BFAFC149400028EF612A47B1BFF445C409B0C1494005000000987DA3315C46B1BFDC095350ABC1494038808A1E1646B1BF33253F13A8C149404D9A1EF9C940B1BFC889A816A8C149409ADA6CAE3441B1BF342BCA5CABC14940987DA3315C46B1BFDC095350ABC14940	New Loom House	E1 1LU	0	\N	Gower's Walk		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1006	0106000020E6100000010000000103000000010000000500000035C2935EC999B1BF1E1538D0A1C14940D7403F3C0E73B1BFE5403B03A8C1494060E2EAF66270B1BFDDCFB14BA3C149406F5F1625B291B1BF1E9D4F259EC1494035C2935EC999B1BF1E1538D0A1C14940	City Quarter	E1 8BP	0	\N	Hooper Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1007	0106000020E61000000100000001030000000100000005000000F8AB76351090B1BF203921B89CC14940639592DC4982B1BF566B35EE9EC149401966FFF42475B1BF5D64730E91C1494044595D44D183B1BFCABC10B48FC14940F8AB76351090B1BF203921B89CC14940	1-54 Goodman Street	E1 8GJ	0	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1008	0106000020E6100000010000000103000000010000000500000012EDA6E7606FB1BFA22E294DA8C149405C6B6D4C5D62B1BF59067C27AAC14940DE9574579658B1BFB130A3C098C149407E5A2DAB4D66B1BF78F29C0098C1494012EDA6E7606FB1BFA22E294DA8C14940	City Quarter	E1 8BP	0	\N	Hooper Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1009	0106000020E610000001000000010300000001000000050000002779A243EF75B1BFA150AE8795C14940351D390B8157B1BFB66DA2BD97C1494074CA01207A55B1BF987BFFBE93C14940E1780F9D0F72B1BF8BA9753C91C149402779A243EF75B1BFA150AE8795C14940	113-145 Hooper Street	E1 8BP	0	\N	Hooper Street	113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1010	0106000020E61000000100000001030000000100000018000000800A13C1DD8CB1BF1500C6AC8AC14940500F0284D78CB1BF3C4D99AF8AC149404095B432CE8CB1BF7B9077B18AC149408A0BC16F0D89B1BF4E6337F38AC14940D85352CB5B89B1BFBCF68B5C8BC14940E382C57B6589B1BFCFD395698BC14940C38E6AAE6789B1BF159B9D718BC149406AC3DE246989B1BF15757C7B8BC1494095C229AD5E89B1BF220DC8818BC14940A37CED2D3789B1BF8BBD128B8BC149401705445C5578B1BF569914CF8CC1494078DA14143F78B1BFFDBACFCF8CC14940E0ED10382778B1BF395904CE8CC1494071CD37A71778B1BF5251D8C88CC14940CB9278270F78B1BF223BC0BE8CC14940C68EFE3BC774B1BFDD604E7D88C14940B1EC490A2586B1BF4D9E7E3087C14940077566A0358AB1BF6FF180DC86C149401056A6D2338BB1BF162DAC7688C149408D50DE57B08CB1BF292070658AC1494031B0B36EBE8CB1BF85D8C1778AC14940CFBC105BE18CB1BF76E190A78AC14940D96A34F7E08CB1BF6F1378AA8AC14940800A13C1DD8CB1BF1500C6AC8AC14940	Old Pump House, 19-20 Hooper Street	E1 8BP	0	\N	Hooper Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1011	0106000020E6100000010000000103000000010000000E000000C3596E047277B1BFE2D719F58BC14940C9CFBEC8DA35B1BF3D2CFCF190C14940053D3D8F3F36B1BFC65E027991C149409BC1C9FEB031B1BFE86CBFCC91C14940970DCDBF852AB1BF1547E03090C14940ECC91CAF622AB1BF694B31018FC14940FD503F4CDA2BB1BF00A768EE8EC149404B5FC49B4727B1BFEBBEE0637BC14940CAB53FB07730B1BF97333B2D7BC149406342DED66435B1BFBC955A198CC14940CD0C1D5E3A3BB1BF0BF50D728DC14940487B0C19B54FB1BFAB8754CC8BC149404D83917C2F75B1BFC98EDC0489C14940C3596E047277B1BFE2D719F58BC14940	30 Hooper Street	E1 8BP	0	\N	Hooper Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1012	0106000020E61000000100000001030000000100000014000000DB6FB7B0D26FB1BFAD721B9086C14940E9A0D36E5865B1BFBCCFB3EE86C149400A96435BD962B1BF0B6B69B97CC14940EA5816AB9966B1BF817D8DA27CC149408177B5776066B1BFDB6018D37BC149406BF6A743B865B1BF1F6DA6717BC14940D9F03B9A8964B1BF678E00097BC149401F9D3ECF9363B1BF0480C9C97AC14940A74CAEA38E62B1BF95F7F98F7AC14940A436CB7B0961B1BF62863C747AC149408213407AA25FB1BF2C2B66797AC14940774439F7715EB1BFEED0CE987AC1494019E45CFBF65DB1BFFB5195C87AC14940172DE139E15DB1BF533503057BC14940A3A7452BB55DB1BF52D6627F7BC14940762846BA8B3DB1BF8479A6857CC149406F4970485B3CB1BF2D28540F79C149404E184DAAC06BB1BF44BB96A577C149404B2264FD476DB1BFC004D7797CC14940DB6FB7B0D26FB1BFAD721B9086C14940	9-12 Bowman Mews	E1 8BP	0	\N	Bowman Mews	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1013	0106000020E61000000100000001030000000100000005000000AD67C3B45F82B1BF19230B2C7BC149406E756FB4096DB1BF29B712B57BC14940CD019D4E116CB1BFC14559A478C149406380F564CB81B1BFADC6291778C14940AD67C3B45F82B1BF19230B2C7BC14940	15 Bowman Mews	E1 8BP	0	\N	Bowman Mews	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1014	0106000020E6100000010000000103000000010000000A000000E18A9018A73EB1BFAF06CEFD78C1494091E7CE41F925B1BF679206CF79C14940C13C03C6D224B1BF6DA4D1C876C14940E1D599C14C3DB1BF9DB0D1E075C149403684B3B6DD3DB1BFDC97E65D77C149400319CC8A7E3EB1BF6C26F25777C14940788FC781B83FB1BFC92B524C77C14940803BB72F3240B1BF2D7E348C78C14940236AC0F8813EB1BF6653359C78C14940E18A9018A73EB1BFAF06CEFD78C14940	11 Back Church Lane	E1 1LU	0	\N	Back Church Lane	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1015	0106000020E61000000100000001030000000100000005000000FA978242896EB1BFABF512BBE1C149400D6B21F7C968B1BFE2498CE0E1C14940C57DE0EFC367B1BF1FF143A6DEC14940384243C9B36DB1BF9ED9687EDEC14940FA978242896EB1BFABF512BBE1C14940	Benugo, 33 Commercial Road	E1 1LB	0	\N	Commercial Road	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1016	0106000020E610000001000000010300000002000000090000005490C4A98079B1BF64764F02E4C14940F123D6C5576FB1BF4F715941E4C149402C88ADF05B6EB1BF65E5260BE1C149404E51EA92546EB1BF57BA8EEEE0C14940384243C9B36DB1BF9ED9687EDEC1494043BF2E9B4B73B1BF0ED9434ADEC14940093860FE6C73B1BFA0E405C8DEC1494073FD208F0178B1BFB152D0A4DEC149405490C4A98079B1BF64764F02E4C1494005000000682C08CFBD75B1BFDDB54D9AE0C14940396DE6506671B1BF077AC2B8E0C1494032E5CBB5E871B1BFAE8EADB7E2C14940AED94EFF1F76B1BF7335F89BE2C14940682C08CFBD75B1BFDDB54D9AE0C14940	Meranti House	E1 7QL	0	\N	Goodman's Stile		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1017	0106000020E61000000100000001030000000100000009000000F123D6C5576FB1BF4F715941E4C149400B792C4C7D69B1BFD82ED263E4C149406C44EDE7E068B1BF94DCCB32E2C149400D6B21F7C968B1BFE2498CE0E1C14940A065F0DD0A69B1BF951CE5DEE1C14940DD63460D2C69B1BF74776E32E2C149403C5E02FFC76EB1BFC63F4F0FE2C1494018D023FBFB6EB1BF808D3DEBE2C14940F123D6C5576FB1BF4F715941E4C14940	Benugo, 33 Commercial Road	E1 1LB	0	\N	Commercial Road	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1018	0106000020E610000001000000010300000001000000060000000A29CD9B581AB1BFF4F690BFC2C14940EC67D9F6E223B1BF86AA6709C4C14940BF0EF3E63E22B1BF1480CE15C5C14940272116320120B1BFDD836DDDC4C149408611DF2A4518B1BF4CE2D81AC4C149400A29CD9B581AB1BFF4F690BFC2C14940	Harry Gosling Primary School	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1019	0106000020E610000001000000010300000001000000050000003715E60E1226B1BF3ACD2AA4C2C14940E5A0115FD11CB1BF2BE01222C1C14940577EF710161FB1BF3DEC9AA6BFC14940CA1428436128B1BFA95A692AC1C149403715E60E1226B1BF3ACD2AA4C2C14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1020	0106000020E61000000100000001030000000100000005000000CA1428436128B1BFA95A692AC1C14940577EF710161FB1BF3DEC9AA6BFC149409C4A75C71821B1BF41DE4056BEC14940B970504A6D2AB1BFA9FA93DBBFC14940CA1428436128B1BFA95A692AC1C14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1021	0106000020E61000000100000001030000000100000005000000B970504A6D2AB1BFA9FA93DBBFC149409C4A75C71821B1BF41DE4056BEC14940BA55207FE422B1BF3BD2D629BDC1494003A343A9612CB1BF1820DC9BBEC14940B970504A6D2AB1BFA9FA93DBBFC14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1022	0106000020E6100000010000000103000000010000000700000038D8E5555C3EB1BF4D5C990DC3C1494079907B254339B1BFDB3BDC31C2C14940A10C2891683BB1BF2346B6EDC0C1494040BA83A05E3FB1BFB8200095C1C14940CECBE7ECF93DB1BF39CC7267C2C1494022CD9CE9223FB1BF86297198C2C1494038D8E5555C3EB1BF4D5C990DC3C14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1023	0106000020E610000001000000010300000001000000070000009012F8245C38B1BF02E2F47FC0C149402E9626EC0A33B1BF6A6A2B84C3C1494042EC3DECC42FB1BF5FD8FBF8C2C14940EAC45B5E9C34B1BF0146AE22C0C1494094598A96DD35B1BF55750858C0C149406CFC68863536B1BFCFAF8024C0C149409012F8245C38B1BF02E2F47FC0C14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1024	0106000020E6100000010000000103000000010000000700000079907B254339B1BFDB3BDC31C2C1494038D8E5555C3EB1BF4D5C990DC3C149408B4FA0EDB73DB1BF9BB3986EC3C1494000D903328A3CB1BFDFE9D13CC3C14940F2C09A31243BB1BF6BCA0810C4C14940A60D2AFE2D37B1BF7A24696CC3C1494079907B254339B1BFDB3BDC31C2C14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1025	0106000020E610000001000000010300000001000000070000002E9626EC0A33B1BF6A6A2B84C3C149409012F8245C38B1BF02E2F47FC0C14940D2ED96B35F3AB1BF783696D5C0C1494044F4DA01E039B1BFC5286A20C1C1494062542B45CF3AB1BFA0892748C1C149406A4009F14636B1BF7E8BB20DC4C149402E9626EC0A33B1BF6A6A2B84C3C14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1026	0106000020E610000001000000010300000001000000050000005B4F182E384DB1BFE66EE094C1C14940C4285D6D6E56B1BFAED44575C1C14940FD641EB9DE56B1BF7E1275B9C2C149405CC21250C04DB1BFEFA720E5C2C149405B4F182E384DB1BFE66EE094C1C14940	Mitali Passage	E1 1LU	0	\N	Mitali Passage		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1027	0106000020E61000000100000001030000000100000005000000C4285D6D6E56B1BFAED44575C1C149405B4F182E384DB1BFE66EE094C1C149409048189D9B4CB1BF244B2712C0C149402D162E5DE855B1BFB77F3FF2BFC14940C4285D6D6E56B1BFAED44575C1C14940	Mitali Passage	E1 1LU	0	\N	Mitali Passage		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1028	0106000020E610000001000000010300000001000000050000002D162E5DE855B1BFB77F3FF2BFC149409048189D9B4CB1BF244B2712C0C14940C140A265194CB1BFE1AB83D0BEC1494094AE00DD7855B1BF0DAD5BB0BEC149402D162E5DE855B1BFB77F3FF2BFC14940	Mitali Passage	E1 1LU	0	\N	Mitali Passage		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1029	0106000020E6100000010000000103000000010000000600000094AE00DD7855B1BF0DAD5BB0BEC14940C140A265194CB1BFE1AB83D0BEC14940FD7ED7339B4BB1BF393DCF98BDC14940CA68122E8F4EB1BF1E59057BBDC14940B8B5EC52F754B1BF1855643ABDC1494094AE00DD7855B1BF0DAD5BB0BEC14940	90 Back Church Lane	E1 1LU	0	\N	Back Church Lane	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1030	0106000020E610000001000000010300000001000000050000009D515AC25753B1BFCB9F75DAD3C1494093107952C05CB1BF8F26599DD3C14940C1DBF8A2225DB1BF9EB0FCBAD4C149401037E0487853B1BFB0A61EFED4C149409D515AC25753B1BFCB9F75DAD3C14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1031	0106000020E6100000010000000103000000010000000500000093107952C05CB1BF8F26599DD3C149409D515AC25753B1BFCB9F75DAD3C149402FCA89643253B1BF8F99638BD2C14940307F3CAB4D5CB1BF8C203D50D2C1494093107952C05CB1BF8F26599DD3C14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1032	0106000020E61000000100000001030000000100000005000000307F3CAB4D5CB1BF8C203D50D2C149402FCA89643253B1BF8F99638BD2C14940242951240F53B1BFF3034A4FD1C1494085ADCD81E15BB1BF211FFD15D1C14940307F3CAB4D5CB1BF8C203D50D2C14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1033	0106000020E6100000010000000103000000010000000500000085ADCD81E15BB1BF211FFD15D1C14940242951240F53B1BFF3034A4FD1C14940003D9D9BEC52B1BF3BF89D19D0C149409AB3798B775BB1BF250621E2CFC1494085ADCD81E15BB1BF211FFD15D1C14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1034	0106000020E610000001000000010300000001000000050000009AB3798B775BB1BF250621E2CFC14940003D9D9BEC52B1BF3BF89D19D0C149407C62720CC752B1BF8E0FD1C8CEC149401EA2D44C045BB1BFC9B44C93CEC149409AB3798B775BB1BF250621E2CFC14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1035	0106000020E610000001000000010300000001000000050000001EA2D44C045BB1BFC9B44C93CEC149407C62720CC752B1BF8E0FD1C8CEC149402CDD6F19A352B1BFE0EE7386CDC149407CB2D5FE955AB1BF4C8AD252CDC149401EA2D44C045BB1BFC9B44C93CEC14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036	0106000020E610000001000000010300000001000000050000007CB2D5FE955AB1BF4C8AD252CDC149402CDD6F19A352B1BFE0EE7386CDC14940DADBBD737052B1BFF3E949C0CBC14940D0C7B8DB065AB1BF821BF4B2CBC149407CB2D5FE955AB1BF4C8AD252CDC14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1037	0106000020E61000000100000001030000000100000005000000D0C7B8DB065AB1BF821BF4B2CBC14940DADBBD737052B1BFF3E949C0CBC14940C0D8189E4352B1BF2C5F3F2ECAC14940178985B37C59B1BFFF958D21CAC14940D0C7B8DB065AB1BF821BF4B2CBC14940	E1 Local	E1 1LB	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1038	0106000020E61000000100000001030000000100000005000000178985B37C59B1BFFF958D21CAC14940C0D8189E4352B1BF2C5F3F2ECAC149400EF1DA1F0652B1BFDFFCD206C8C149407D6E0B36BF58B1BF1F2A02FBC7C14940178985B37C59B1BFFF958D21CAC14940	Gower's Walk	E1 1LU	0	\N	Gower's Walk		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1039	0106000020E610000001000000010300000001000000050000007D6E0B36BF58B1BF1F2A02FBC7C149400EF1DA1F0652B1BFDFFCD206C8C149406944EF04CF51B1BF5BA6AE18C6C149406CB112BD1758B1BFF5BA6E14C6C149407D6E0B36BF58B1BF1F2A02FBC7C14940	Mitali Passage	E1 1LU	0	\N	Mitali Passage		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1040	0106000020E610000001000000010300000001000000070000005490C4A98079B1BF64764F02E4C1494073FD208F0178B1BFB152D0A4DEC14940A228265DCC7DB1BF51D7167BDEC149403523559CF87DB1BFDD371E51DFC1494070553F5BA385B1BFF063A029DFC149409AF21B97A986B1BF46A80E1EE4C149405490C4A98079B1BF64764F02E4C14940	Meranti House	E1 7QL	0	\N	Goodman's Stile		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1041	0106000020E61000000100000001030000000100000005000000968979CB6326B1BF9A3A1A3DBAC1494088E9BDB61D2FB1BF936372BEBBC149401A18F925F22CB1BF366476E7BCC14940F34F8E1D4E24B1BF48F97D6BBBC14940968979CB6326B1BF9A3A1A3DBAC14940	Berner Terrace	E1 1NT	0	\N	Fairclough Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1042	0106000020E61000000100000001030000000100000005000000716BE6AD5631B1BF714A448EBAC14940AD2F84218428B1BFE68BAC08B9C14940264C6CEBBA2AB1BF6CE285C7B7C14940BC9FFF1CA733B1BFC5128A51B9C14940716BE6AD5631B1BF714A448EBAC14940	90 Back Church Lane	E1 1LU	0	\N	Back Church Lane	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1043	0106000020E61000000100000001030000000100000005000000BC9FFF1CA733B1BFC5128A51B9C14940264C6CEBBA2AB1BF6CE285C7B7C149405B7D845E3E2DB1BF4619EF5AB6C14940755B43AD4736B1BF8CE6F8E9B7C14940BC9FFF1CA733B1BFC5128A51B9C14940	90 Back Church Lane	E1 1LU	0	\N	Back Church Lane	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1044	0106000020E61000000100000001030000000100000005000000755B43AD4736B1BF8CE6F8E9B7C149405B7D845E3E2DB1BF4619EF5AB6C14940E72FE7BCEE2FB1BF7565E4D4B4C149400F813A971939B1BF4F3F0568B6C14940755B43AD4736B1BF8CE6F8E9B7C14940	90 Back Church Lane	E1 1LU	0	\N	Back Church Lane	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1045	0106000020E61000000100000001030000000100000012000000D1BB213BFDB6B1BF8C3DCEE4DEC149406999830602C5B1BF8742855CDBC14940D93AED08C7C5B1BF17B19D29DBC1494022F18B0F9DC6B1BF3942330CDBC1494027784E4957C7B1BFB8F02FFCDAC14940EA9232D3FCC7B1BF285CDAEFDAC1494043A3D488C7C8B1BF17E165EADAC14940CC6DFF7BD1C9B1BF9281F6F0DAC1494069CAC802DECAB1BF26805810DBC14940E47B4EC9F1CBB1BF2DB59548DBC149408D87B40E95CCB1BF60134684DBC14940B7077B2F1BCDB1BFC4B5D9CCDBC149400614D826D5C4B1BF03D92A2DDEC14940447A316A1FC6B1BFEF9FE313DFC1494098246A81F1C2B1BFBEB415B3DFC1494033E9B2B7B0BBB1BF844F71F7E0C14940B71259667CBAB1BFB8A84974E0C14940D1BB213BFDB6B1BF8C3DCEE4DEC14940	81 Alie Street	E1 8EB	0	\N	Alie Street	81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1046	0106000020E61000000100000001030000000100000007000000144B6D2022D8B1BFD15C180CA3C1494038FC1A0A7CF6B1BF7BF04793B6C14940EF11BCD896CFB1BFBF78B60EBEC1494007ECD9A06BACB1BF0532265EA8C1494022D6C1897FC7B1BF72A70893A4C149407CC03DE475C8B1BF28EB303EA5C14940144B6D2022D8B1BFD15C180CA3C14940	Student Castle, 65 Leman Street	E1 8NX	0	\N	Leman Street	65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1047	0106000020E6100000010000000103000000010000000500000072D72EF6C30CB2BFDA090936C5C1494032E5137459CDB1BF8029DA17D3C14940D77A7DB28FBBB1BFBCA9E400CBC149409B3ACA05D7FEB1BF09086618BCC1494072D72EF6C30CB2BFDA090936C5C14940	Premier Inn, 66 Alie Street	E18PX	0	\N	Alie Street	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1048	0106000020E61000000100000001030000000100000005000000CCE8CA8507C2B1BF9F25CDA4D5C14940DB31F88F46A1B1BFD7267DD9DCC14940F11DEFE41D89B1BFEF286929D2C1494000C79ED6B2AAB1BF252BAD26CBC14940CCE8CA8507C2B1BF9F25CDA4D5C14940	Goodmans Fields	E1 8NX	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1049	0106000020E610000001000000010300000001000000070000001FCADA0C5FDEB1BFC74CC041E5C1494021C62E6B5DD3B1BFF7E77729E5C14940A04CDAD164D3B1BF4C91CFFAE4C14940D86B351E72D3B1BFF4E3F9A6E4C14940A9D75DB186D3B1BFACFEF2B0E3C149407B9E8529A1DEB1BF3BFDFE97E2C149401FCADA0C5FDEB1BFC74CC041E5C14940	Altitude	E1 8EB	0	\N	Alie Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1050	0106000020E610000001000000010300000001000000050000009500A433DD95B1BF6CC1CA0681C14940877166B32991B1BFBED303B881C149407378B79E858EB1BFFB12790980C14940F45079610693B1BF993B46597FC149409500A433DD95B1BF6CC1CA0681C14940	Long Shot, 127 Leman Street	E1 8EY	0	\N	Leman Street	127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1051	0106000020E610000001000000010300000001000000050000005067C695B88EB1BFAB76C7687CC1494087AA11CDB68AB1BF888132077DC149409DB98A419987B1BFFAA4060D7BC149404ED33C9BB98BB1BF1B0A77627AC149405067C695B88EB1BFAB76C7687CC14940	Red Chilli, 137 Leman Street	E1 8EY	0	\N	Leman Street	137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1052	0106000020E6100000010000000103000000010000000500000087AA11CDB68AB1BF888132077DC149405067C695B88EB1BFAB76C7687CC1494093F944007291B1BF071B15407EC14940B8F0A36A988DB1BF141455DB7EC1494087AA11CDB68AB1BF888132077DC14940	Scissor City, 131 Leman Street	E1 8EY	0	\N	Leman Street	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1053	0106000020E61000000100000001030000000100000005000000877166B32991B1BFBED303B881C149409500A433DD95B1BF6CC1CA0681C149408374F6D75198B1BFAB1C4A7A82C1494059ED7D5A8293B1BF2B9C853683C14940877166B32991B1BFBED303B881C14940	Wine Tiers, 125 Leman Street	E1 8EY	0	\N	Leman Street	125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1054	0106000020E6100000010000000103000000010000000B000000B30E240CDF4FB1BFDEDFFC94A6C14940E02F5DC6C232B1BF80890919A7C1494009AB3EC6AC2FB1BF8E88ADCF9BC14940D7F6195C162EB1BF7CEDF82098C149403EB0B7E9122DB1BFE5AA5C6E95C14940A7EBE45C343EB1BF1B89ED2294C14940718D4BB55F4BB1BF3F7A7A0993C14940F15270969B4BB1BF65EDB79694C14940FE1A8CF4E94BB1BFE0B33EBD98C14940F6A2EA9E9D4FB1BF3EE63BF7A5C14940B30E240CDF4FB1BFDEDFFC94A6C14940	New Loom House	E1 1LU	0	\N	Gower's Walk		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1055	0106000020E610000001000000010300000001000000160000009061CA734E84AEBF9701B99E52C24940287AE8869014AEBF61689CE258C24940F57523AB111BAEBFC4FF60DA5BC249407228EC46F0E7ADBFEDFC5AC55EC24940D2E291CB19DEADBFAADCE9845AC24940C73FA94B2EC8ADBF6FB942FC5AC24940993209AE15B5ADBF5232D11644C24940D516153F7FB8ADBF04B74F0544C2494065535AFC81ACADBFD68518C23EC24940C10BF85A1770ADBFA9E49F1240C24940919075D0256CADBF9D47919A3BC24940D68EE84F5187ADBFB50FF1013BC2494016FDD1F2DD83ADBF675AFEE036C24940322670CBC18AADBFC0F809B436C2494057ECB2745450AEBF87F8D16A32C24940440441AAF563AEBF6CC7CDDB3AC249406722A4560143AEBF0CBC628E3BC2494091158B70574CAEBFA6378EA53FC249407D93D0779A68AEBFB210D8FD3EC24940A006677DCC6FAEBFFDBF950148C24940338A4E6DC36BAEBF73F56E1248C249409061CA734E84AEBF9701B99E52C24940	The Royal London Hospital	E1 1AA	0	\N	Stepney Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1056	0106000020E61000000100000001030000000100000011000000F2F95E8BD057AEBF459D44B52EC249405ABDA3DF07EDADBF7687751D31C24940836AC2F867EAADBF082C8B812EC24940C7895A75EDF8ADBFF14CBE2D2EC24940DE5648A728F3ADBF53E1069B29C249403C4F4AE3D008AEBF7088E30B29C249404A99D8C7520EAEBF5DC7B8CF2DC249405542DE21CD3BAEBFE13500BF2CC24940D6F065256A34AEBF1891EF1028C24940C093D2A0282AAEBF4D0A953A28C249407497E269C129AEBF1DFCA40528C249404127A4FA1BE6ADBF6235BEB329C249404B71AD79F1E2ADBFFFF712D726C2494091BC658B9B27AEBFE9B8E32F25C249402A84C4B55927AEBF92431BFB24C24940F16E0F1BAE45AEBF56CEB37D24C24940F2F95E8BD057AEBF459D44B52EC24940	Floyer House	E1 2AG	0	\N	Newark Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1057	0106000020E61000000100000001030000000100000010000000836AC2F867EAADBF082C8B812EC249405ABDA3DF07EDADBF7687751D31C2494011ADEFCB1D6EADBF4023EB1B34C24940F6801EEF116DADBFAA6A800233C24940EA45B385E857ADBF9F24447D33C2494093EEA013E553ADBFD24B18DA29C249404BE7EC03308EADBFC4AEC08328C2494054224CD26C8EADBF42A43CC428C24940E36E1835E19CADBF8562586F28C24940B41C995FA49CADBF090AD52E28C24940A32C36B22AD3ADBF39209AEE26C24940DF0595A585D3ADBF4C1D0A4127C2494038A3AF93F3E2ADBF198704D726C249403D5C53F41BE6ADBFF37BB8B329C249404127A4FA1BE6ADBF6235BEB329C24940836AC2F867EAADBF082C8B812EC24940	Pathology and Pharmacy	E1 2AG	0	\N	Newark Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1058	0106000020E6100000010000000103000000010000002B0000009818539FC835AEBF5017FC5D20C24940A323F1E90C34AEBFE999145F20C24940E1D5E6A62F32AEBFA759385020C24940CE4615C8F830AEBF94BD444320C24940B421996BB52FAEBF04E0613120C2494099085B1E692EAEBFBE3A031A20C24940AC769EF0F42CAEBFEA7477FC1FC24940CE6BCDED692BAEBF8D5781DC1FC24940733BDFC0C32AAEBFC07CD0CD1FC249409FC20372C929AEBF52EABEAF1FC249408C33DF394A29AEBFA99D76A01FC249404E59331A8128AEBFB0DE3FA51FC249405BF7B19A241EAEBFAA41F3E01FC2494059D871B1801FAEBFB91BC82521C249400FEB61133201AEBF661B5CCE21C24940BF77EBF994F9ADBF324FE3D018C2494049F89A0F7D17AEBFCA696E3D18C249406D20FA19CB1CAEBFCAF9F9CA1DC249407EF354D30827AEBF9B7AB1A11DC249400451D5ABF628AEBF6BE6D8371DC2494002490EB2B32AAEBF776B44F21CC24940704BF219382DAEBFF539F0981CC249405A5B5C101730AEBFB94815741CC249402C3C7F2F7C32AEBFD93F12671CC2494025F9E8355A34AEBF0F6D89621CC2494097AAB3F65936AEBFAD6D836D1CC249405AB85E715938AEBF99961A891CC249405611A412053AAEBF52A1D9A71CC24940A3BFDE72573BAEBF2ABE0FC21CC2494083DC6C00143DAEBFA564DAF21CC24940F072D569633EAEBFEAE33C3C1DC24940E260A54D7B3FAEBFF63F15911DC249402FE153BD2640AEBF29C1CEE51DC2494015A627095240AEBF26DE2F3D1EC249407D0128200840AEBF4F88EDCA1EC24940077BD4294C3FAEBF8D1B532D1FC2494063530405423EAEBF561722831FC24940FF17ACF3CC3CAEBF1129E1BF1FC24940B51DE58D413CAEBF637A39D01FC249402438D4C6163BAEBF9FB612F51FC249407F5DD4017D39AEBFF775E81F20C249404D66F80DAD37AEBF7068884920C249409818539FC835AEBF5017FC5D20C24940	School of Nursing and Midwifery	E1 2AG	0	\N	Ashfield Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1059	0106000020E61000000100000001030000000100000009000000CAD330DB9CFDADBFCC0F465822C24940021F70D80797ADBF9DB53CA424C24940262C2EDA9692ADBF64A881FF1FC2494048CBED0BA3F0ADBF3A2AA4DC1DC24940750A2575BDF2ADBFC28BA46920C249402D89326998F5ADBFAD46325720C2494035AA82CF67F4ADBF9FF538231FC249409B5A7E1E61FAADBF6E2D87021FC24940CAD330DB9CFDADBFCC0F465822C24940	IM&T Clinical Psychology	E1 2AG	0	\N	Ashfield Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1060	0106000020E61000000100000001030000000100000007000000387560C335C6ADBF1DDE93681BC249403735EBA7D9A0ADBF3716B23D1CC2494003E4EE681098ADBF71EC4A7013C249402D4837C8EBAAADBF2F58620A13C249407A656CC9D1ACADBF6474E6E714C249406DFEA2B2EABFADBF41CFEB8814C24940387560C335C6ADBF1DDE93681BC24940	ICT Learning Centre, 71 Varden Street	E1 2JP	0	\N	Varden Street	71	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1061	0106000020E6100000010000000103000000010000000A000000FBAD61D9E60FAEBF027418CA16C249408D21A76EC8F8ADBF29B9045017C24940031FA0E433F4ADBF7BB9BE7912C249408199BE5A6CD9ADBF044A6F1513C249407E09EA5664D6ADBF22DE9BCD0FC249405268C8A60AF8ADBFB860E2020FC2494010700616CF09AEBF825CFE120BC24940B500B352BB1BAEBF0892A61B0DC24940EEAEF0DD240AAEBFEA22B6D910C24940FBAD61D9E60FAEBF027418CA16C24940	John Harrison House	E1 2NB	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1062	0106000020E6100000010000000103000000010000000D0000005A035B9A38C9ADBF4028B63610C24940189D5E0EE0B1ADBF07F5C7CA10C24940D829EF953CB1ADBF79CC1D1410C24940BF51C3B9CDA6ADBF5D85FC4F10C249401575903398A7ADBF6FB4090C11C249404A7D3E36D096ADBF20541A7411C2494063927BAF0794ADBFB3B7398D0EC249406E7F701677A4ADBF92DA8A260EC2494068750811CDA3ADBF2217E76A0DC249402D162CDA5FAFADBFDBE981260DC24940767A7CF117B0ADBF80BABBE20DC24940086DBB6C83C6ADBF8006F3550DC249405A035B9A38C9ADBF4028B63610C24940	ICT Learning Centre, 71 Varden Street	E1 2JP	0	\N	Varden Street	71	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1093	0106000020E6100000010000000103000000010000000600000086786DBFB4FCAEBF191E212806C24940915A81AE92E5AEBFBEA2E1A506C249405601D4C2E7E3AEBF83BE9AF004C24940B199C99B22FAAEBF3E7D446204C2494067F9375652FBAEBF6EEBF2AF04C2494086786DBFB4FCAEBF191E212806C24940	26 Turner Street	E1	0	\N	Turner Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1094	0106000020E61000000100000001030000000100000005000000915A81AE92E5AEBFBEA2E1A506C24940813E744296DBAEBFFB2705D606C24940ECD262A888D9AEBF00AE322905C249405601D4C2E7E3AEBF83BE9AF004C24940915A81AE92E5AEBFBEA2E1A506C24940	26 Turner Street	E1	0	\N	Turner Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1095	0106000020E6100000010000000103000000010000000A000000B123DE7D26DFAEBF38E6A4350AC24940364D477361D2AEBFDF7CEC7E0AC249405B8DA0B398CCAEBF5FE2896905C24940B9CC223782D9AEBF03274F2905C24940ECD262A888D9AEBF00AE322905C24940C713763B96DBAEBFBFEBFFD506C24940813E744296DBAEBFFB2705D606C24940756BC7279CDDAEBF14BAAD9408C24940A035E230D2DEAEBF974540EF09C24940B123DE7D26DFAEBF38E6A4350AC24940	Zoar Chapel	E1 2JP	0	\N	Varden Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1130	0106000020E61000000100000001030000000100000005000000CA30AD44F14EAFBFA6F7FF91F5C1494041C319472051AFBFE1DF42DEF7C14940FEB090B19A47AFBFFD969E16F8C14940F91B33646A45AFBFDE68FEC8F5C14940CA30AD44F14EAFBFA6F7FF91F5C14940	15 Nelson Street	E1 2JP	0	\N	Nelson Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1063	0106000020E6100000010000000103000000010000003F00000028957C7F1527AFBFF3A35DAC34C249403D25D0B3C928AFBF5FBEDCCC36C24940375653B90028AFBF6F4B3CD036C249400CB9B344D527AFBFED2922A036C24940DB85730EF925AFBF725FCEAC34C249401D719C083E1DAFBF14E5B7D234C2494070F5A9CC981EAFBF48A9C1DD36C24940753FACE7EA27AFBF946415B836C24940375653B90028AFBF6F4B3CD036C2494093608FBEA71EAFBFCF2850F636C249402ADC104413F1AEBFCB7F0AE437C24940095AE1308CF1AEBFC89A337238C24940A42700D8E1DFAEBFE796C9CF38C249400B1D4AC9CEDFAEBF6A77DB0238C249401120B1498BDCAEBFD15CBF0438C24940178C2EDDB4DCAEBFF564D6C339C24940FD161194E5D7AEBF427F9FC639C24940F09471AEB9D7AEBFB7418FEE37C249405C9A44E8F3D6AEBF545A45D537C24940371482CAC4D5AEBFFD3183AE37C249409D5B553984CCAEBF0BCAA67F36C24940C590653C96CBAEBF1F09688C36C24940DF1407F681CAAEBF9295369B36C24940C577505B57C8AEBFB33F949F36C2494054079E358AC6AEBF0C9235A336C2494079AA7895C8C4AEBFAEEB9F9936C249406698098D4AC3AEBFA3207B9136C24940AFE788EABDC1AEBF1BA1357136C24940F206BF8BC7C0AEBFE9FC2E4D36C24940D0BD4E6CF1BFAEBFBC897E1036C249406D1A84ED8CBFAEBFF2EE85CB35C249408DBE856EA0BFAEBF35D3CC8F35C24940D57F32DD13C0AEBF7F30E34535C249407FFA3F92CDC0AEBF6C5AEB0435C249406D2300B1FAC1AEBF454EABD434C24940F969D8C654C3AEBFB8C3369D34C24940C53E32DA21C5AEBFBAAF0F7334C24940F1494773D8C6AEBFEA9DEB5A34C24940D1FDB92094C8AEBF44F87F4234C24940EAB05F9022D1AEBFF02AC9BB32C249409F544D0689D6AEBFD8C7ABA232C249401E6022ABD0D5AEBF3B18C9AB31C24940F7FA148E91C8AEBFEF0864E931C249400929154BA7C6AEBF5F92D5582FC24940551D88F6EE1BAFBFF930EAA42DC24940A81593CCBC22AFBF6D989E352EC24940B48753D34525AFBFE5C8E7C931C24940B35118BB4E24AFBFCE3F33CE31C24940B6F8A5320022AFBF931EC4492EC24940A498AA95C11BAFBF5EC03EC22DC249404CBAD963D1DEAEBF9D4B99F82EC24940BA51449E55E0AEBF37CE75E930C249407924917F22EAAEBFCB28DCC030C2494046912C9364EAAEBF5FC1581931C24940FE3DD04C410DAFBF482E04A430C249406DEBFC12CE0BAFBFBB237C132EC2494011D1E2490F12AFBF0615B6F32DC249402504D82E8D14AFBF57EED16231C24940D261238C291AAFBFDB499C4D31C249409796DFF4941AAFBF287EDDFA31C24940752EB33B4525AFBFDC1E64CD31C249404E60FC701527AFBFF59946AC34C2494028957C7F1527AFBFF3A35DAC34C24940	St Philip's Church Library	E1 2AG	0	\N	Stepney Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1064	0106000020E610000001000000010300000001000000050000008707D0A1788DAEBFDF7D0DD42BC24940AA371F1FA482AEBFDAACA60B2CC249403359667C6480AEBF045AFAAD2AC24940FFB22B69F28BAEBFAF711E772AC249408707D0A1788DAEBFDF7D0DD42BC24940	65 Philpot Street	E1 2AG	0	\N	\N	65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1065	0106000020E61000000100000001030000000100000006000000923E1ED6B38EAEBF81DF116A2AC24940689EBD72F28BAEBF660027772AC24940741151D36480AEBF7C7901AE2AC24940AFBEE91C1B7EAEBFD2022F4A29C2494098971BBDC78CAEBF3F6530F828C24940923E1ED6B38EAEBF81DF116A2AC24940	63 Philpot Street	E1 2AG	0	\N	\N	63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1066	0106000020E6100000010000000103000000010000000800000098971BBDC78CAEBF3F6530F828C249400051126F1B7EAEBFC2372D4A29C24940503ED3E9877BAEBF392484B927C24940BE727B95C08BAEBF0484045D27C249402F3E81A19D8CAEBF8D6385FA27C24940D08EDEB6AF90AEBF6E2030E227C249404B40B98AB591AEBFD59A69D728C2494098971BBDC78CAEBF3F6530F828C24940	61 Philpot Street	E1 2AG	0	\N	\N	61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1067	0106000020E6100000010000000103000000010000000500000050C7F234C08BAEBF2D92FD5C27C24940503ED3E9877BAEBF392484B927C24940FAAA01932779AEBF55308F4726C2494031146C52AC89AEBFD90A01E225C2494050C7F234C08BAEBF2D92FD5C27C24940	59 Philpot Street	E1 2AG	0	\N	\N	59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1068	0106000020E61000000100000001030000000100000005000000FF93D645AC89AEBFDF14F8E125C2494052A656842779AEBF2B47864726C2494018515FC8A076AEBF9C52A2BE24C24940AB93DCEA8B87AEBF68A1185E24C24940FF93D645AC89AEBFDF14F8E125C24940	57 Philpot Street	E1 2AG	0	\N	\N	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1069	0106000020E6100000010000000103000000010000000E000000AB93DCEA8B87AEBF68A1185E24C2494018515FC8A076AEBF9C52A2BE24C249407C4EBC950B74AEBF1F2EEA4E23C249409C7627CD6385AEBF039AFDF822C2494061A9DA9FD985AEBFE0F738FA22C24940679730872186AEBF6476A90123C249404B35101E5A86AEBF251D940C23C24940F80BD86D7486AEBFB666B41623C249403C19C52E8586AEBFEC25132123C2494051266DAC8B86AEBF5C0C5F2F23C24940331009D17786AEBFB4295A3E23C24940927BB4FF6086AEBFA72DF74923C249405BE7A9100F86AEBFD381375423C24940AB93DCEA8B87AEBF68A1185E24C24940	57 Philpot Street	E1 2AG	0	\N	\N	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1070	0106000020E610000001000000010300000001000000050000008707D0A1788DAEBFDF7D0DD42BC24940BF266CF2C38FAEBF509A89702DC2494020A8AA99FE84AEBFC61C7A9F2DC24940AA371F1FA482AEBFDAACA60B2CC249408707D0A1788DAEBFDF7D0DD42BC24940	67 Philpot Street	E1 2AG	0	\N	\N	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1071	0106000020E6100000010000000103000000010000000D000000EDE97F04AF6FAEBFA0A2E74017C2494013FDE7CA7D5FAEBFBABE199717C249404477C118DA5CAEBF74C4B90016C2494030151325F66CAEBF5D1B14A415C24940DFD2CA65A56DAEBFCFDDACA515C24940DD84577A416EAEBF104A4EAC15C249408CED34678A6EAEBFEEBD33BD15C24940EC1E2210CC6EAEBFAB361BCE15C24940D0356443E76EAEBF27A38BEA15C24940B0C3EDAABB6EAEBF55D8B40016C2494079401E723F6EAEBFC36EC31916C249402D360A69D96DAEBF85CB862816C24940EDE97F04AF6FAEBFA0A2E74017C24940	43 Philpot Street	E1 2AG	0	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1072	0106000020E61000000100000001030000000100000005000000847B2EC90F72AEBF19BA09A218C249404DF8251EBD61AEBFC9B3F0F018C2494013FDE7CA7D5FAEBFBABE199717C24940EDE97F04AF6FAEBFA0A2E74017C24940847B2EC90F72AEBF19BA09A218C24940	43 Philpot Street	E1 2AG	0	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1073	0106000020E61000000100000001030000000100000005000000140F1C293B74AEBF4CE3B2E719C24940C38271F7E363AEBFC0EB103C1AC249404DF8251EBD61AEBFC9B3F0F018C24940847B2EC90F72AEBF19BA09A218C24940140F1C293B74AEBF4CE3B2E719C24940	45 Philpot Street	E1 2AG	0	\N	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1074	0106000020E6100000010000000103000000010000000500000047878F4C9276AEBF5FB76C471BC2494055A8959E3666AEBF4EC052A11BC24940C38271F7E363AEBFC0EB103C1AC24940140F1C293B74AEBF4CE3B2E719C2494047878F4C9276AEBF5FB76C471BC24940	47 Philpot Street	E1 2AG	0	\N	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1075	0106000020E610000001000000010300000001000000050000009A6B91EBCA78AEBF2324B2AB1CC249404C2616109468AEBF8313770D1DC2494055A8959E3666AEBF4EC052A11BC2494047878F4C9276AEBF5FB76C471BC249409A6B91EBCA78AEBF2324B2AB1CC24940	49 Philpot Street	E1 2AG	0	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1076	0106000020E610000001000000010300000001000000050000000A483738DF7BAEBFF50A91631EC249408EE8CF9A626BAEBF965D64BD1EC249404C2616109468AEBF8313770D1DC249409A6B91EBCA78AEBF2324B2AB1CC249400A483738DF7BAEBFF50A91631EC24940	51 Philpot Street	E1 2AG	0	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1077	0106000020E6100000010000000103000000010000000F000000833C0B78637EAEBFBCC953981FC24940323EF1D0A96DAEBF6721D20520C249408EE8CF9A626BAEBF965D64BD1EC249400A483738DF7BAEBFF50A91631EC249402F404373507DAEBF91C3D6121FC249402832010FE87DAEBF6B51FA141FC24940948CC545587EAEBFCE44981A1FC249409053FFD3AA7EAEBF92E01F231FC249406AD6A1E2F77EAEBF3B4F002D1FC24940D9D545FD3C7FAEBFADFC093E1FC2494066E5045C557FAEBFF289AA591FC24940BBD6CBB9427FAEBFD899876D1FC24940A8E1FBA51F7FAEBF6C4B607D1FC24940FFAD48C8CA7EAEBF5E08428F1FC24940833C0B78637EAEBFBCC953981FC24940	53 Philpot Street	E1 2AG	0	\N	\N	53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1078	0106000020E610000001000000010300000001000000050000000D928390E8C5AEBF51A26FA115C249404260F9C3C2C3AEBF45B3729713C24940266571536BCDAEBF3C42E55813C249406EBC659B8CCFAEBF1F27496515C249400D928390E8C5AEBF51A26FA115C24940	33 Walden Street	E1 2AG	0	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1079	0106000020E61000000100000001030000000100000005000000FC9B9671FDBBAEBF797951DF15C24940422D1147D9B9AEBF7888A4D713C249404260F9C3C2C3AEBF45B3729713C249400D928390E8C5AEBF51A26FA115C24940FC9B9671FDBBAEBF797951DF15C24940	35 Walden Street	E1 2AG	0	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1080	0106000020E61000000100000001030000000100000005000000422D1147D9B9AEBF7888A4D713C24940FC9B9671FDBBAEBF797951DF15C2494031C5C4595AB3AEBF28A0341516C24940AC15194B38B1AEBFB1BF860F14C24940422D1147D9B9AEBF7888A4D713C24940	37 Walden Street	E1 2AG	0	\N	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1081	0106000020E61000000100000001030000000100000005000000AC15194B38B1AEBFB1BF860F14C2494031C5C4595AB3AEBF28A0341516C2494095E0418C5CAAAEBFB5A14D4D16C24940D90694AF3CA8AEBF2AC9B34914C24940AC15194B38B1AEBFB1BF860F14C24940	39 Walden Street	E1 2AG	0	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1082	0106000020E61000000100000001030000000100000005000000D90694AF3CA8AEBF2AC9B34914C2494095E0418C5CAAAEBFB5A14D4D16C24940B0D6B58243A1AEBF5A76108616C24940F3CB4144299FAEBF83F17A8414C24940D90694AF3CA8AEBF2AC9B34914C24940	41 Walden Street	E1 2AG	0	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1083	0106000020E61000000100000001030000000100000005000000772E3F6D8C99AEBFE4E832B616C2494039A351108097AEBF223518B614C24940F3CB4144299FAEBF83F17A8414C24940B0D6B58243A1AEBF5A76108616C24940772E3F6D8C99AEBFE4E832B616C24940	43 Walden Street	E1 2AG	0	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1084	0106000020E6100000010000000103000000010000000500000039A351108097AEBF223518B614C24940772E3F6D8C99AEBFE4E832B616C24940267096C37A90AEBF4F8FC7EE16C249409FB6568D708EAEBF4FE3C5F014C2494039A351108097AEBF223518B614C24940	45 Walden Street	E1 2AG	0	\N	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1085	0106000020E610000001000000010300000001000000050000009FB6568D708EAEBF4FE3C5F014C24940267096C37A90AEBF4F8FC7EE16C24940C7A9CE307A88AEBF495AB42017C24940D81675E07186AEBFC38A8C2415C249409FB6568D708EAEBF4FE3C5F014C24940	47 Walden Street	E1 2AG	0	\N	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1086	0106000020E61000000100000001030000000100000005000000D81675E07186AEBFC38A8C2415C24940C7A9CE307A88AEBF495AB42017C249408865F8B1F080AEBFF22ABA4F17C249404B9E4F57E27EAEBF7D5E835515C24940D81675E07186AEBFC38A8C2415C24940	49 Walden Street	E1 2AG	0	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1087	0106000020E610000001000000010300000001000000050000004B9E4F57E27EAEBF7D5E835515C24940758E02E96680AEBFE8DF36CB16C24940782C4CAE9875AEBFB8303C1317C24940AC6A80140974AEBFEC35D29D15C249404B9E4F57E27EAEBF7D5E835515C24940	51 Walden Street	E1 2AG	0	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1088	0106000020E61000000100000001030000000100000011000000726C35FE6C72AEBFA1DA8AC311C24940A5CBA3C0F659AEBFED82D37012C2494039E033CE9B57AEBFC81CFC9010C24940390F7283E758AEBFC810D88610C24940DF2AB8E91758AEBF453BA1E10FC24940BEAD40695656AEBF0F2B5FEF0FC24940B13E77B11554AEBFDC0E67240EC24940812A7D459D5BAEBF633979E90DC2494004AA6153035BAEBFFF92F56E0DC2494049654DF55862AEBF72918E350DC2494022C68362FA62AEBFA52E06B60DC24940A6273509C56CAEBF362964690DC2494046E4C912316FAEBF1E2ED4560FC249405AC49D22E96DAEBFDAC1DA600FC249402E7978C6C66EAEBFAE5D3D1110C24940728589E33C70AEBFD366CD0510C24940726C35FE6C72AEBFA1DA8AC311C24940	Dawson House	E1 2AG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1089	0106000020E610000001000000010300000001000000090000007E78CFC19C5AAEBF8957823B0DC2494065B26533564CAEBF4A184ED80DC249402182D5F05B4AAEBF1F87BDCB0CC2494070B203AA164CAEBFEC8B6FB70CC249402C3E6F610D45AEBFB7DBDFFB08C24940DBA6FCBA2E54AEBFB512CA8208C249409F7ED591435CAEBFA3175F4B0CC24940C99C2EBF1E59AEBF2D6FD3720CC249407E78CFC19C5AAEBF8957823B0DC24940	Porchester House	E1 2NB	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1090	0106000020E610000001000000010300000001000000100000001B0A01BCB8D0AEBF8C97701F0BC2494074BF01F2FFCCAEBFAF62E83E0BC249408E9D57525CCDAEBF7B0DBCAF0BC24940C60C56EE7DB4AEBF7C09E8630CC24940047A010DF7B2AEBFCAA1DD130BC249405656100689ADAEBF352C343B0BC24940C87D1CB9DFADAEBF7861BD850BC249403F1BBA30B775AEBF8942971C0DC249407213595C4371AEBFE68FA34809C249401925BD1F3AABAEBF3BE0B4A407C2494012C0A1656EABAEBF2B68A5D107C24940C70EB84F52ACAEBF2B05969508C24940672AFE06BEC9AEBF43626FC007C24940D418B00231CAAEBFC50B492308C24940322579E926CDAEBF5F0FD60D08C249401B0A01BCB8D0AEBF8C97701F0BC24940	Hubert Ashton House	E1 2AG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1091	0106000020E6100000010000000103000000010000000F0000005806ED2266F4AEBFF4CCA18115C2494033FD901240DEAEBFA64FE20116C24940A547C45380D9AEBF236732E610C249401F7037F2D0D1AEBFB466B21211C249401520970802D1AEBFC85D223410C249400A35CD25BBE5AEBF6A4723BC0FC24940A8300C676AE6AEBFF93BA57810C249403B4E38F98DF2AEBFEFB95A3210C249403CAE223C3CF4AEBF93B8250112C249407B60481016F2AEBF3785970D12C24940505687ADC1F2AEBF23812EC612C2494085F0F294F6F4AEBF076567B912C24940AB88FAD2DFF6AEBFF7AAA2C714C24940BDCCEB24D6F3AEBFF8DD39D914C249405806ED2266F4AEBFF4CCA18115C24940	Clare Alexander House	E1 2AG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1092	0106000020E61000000100000001030000000100000005000000A10F589E9BFEAEBFFC43D0DC07C2494032160AC72FEDAEBF2EC1E23D08C24940A8CC1E93DAEBAEBF7D24BD8306C2494086786DBFB4FCAEBF191E212806C24940A10F589E9BFEAEBFFC43D0DC07C24940	26 Turner Street	E1	0	\N	Turner Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1096	0106000020E6100000010000000103000000010000000A000000D3473FF24D75AEBF1BE81BC20CC24940D52002A4146BAEBFC178DD0D0DC249407E8EE3E18C6BAEBF222EEF720DC24940696CDD828C6BAEBFD515F2720DC249401753FB617665AEBF499A94A20DC24940299E015FD860AEBF4F5F00F30AC24940F2CEE6847964AEBFFEC223CC0AC249409E2803F8C462AEBF927032CE09C2494017D0879F6071AEBF5903CC6109C24940D3473FF24D75AEBF1BE81BC20CC24940	Kent House	E1 2AG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1097	0106000020E61000000100000001030000000100000007000000F015F500F1CFAEBF8D81780E00C2494012BCCA5240D1AEBF8585BF3001C249407B084B03D8CAAEBFD1C8D15A01C24940B4B246B5C7C7AEBFA4B7D272FEC149401D71734F20D3AEBFCA175328FEC1494068F7452F05D5AEBFF67DABE8FFC14940F015F500F1CFAEBF8D81780E00C24940	20 Varden Street	E1 2JP	0	\N	Varden Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1098	0106000020E61000000100000001030000000100000007000000B4B246B5C7C7AEBFA4B7D272FEC149407B084B03D8CAAEBFD1C8D15A01C249409B6910E80EC4AEBFA78E5F8701C249408B86A11616C3AEBF3594428000C2494061FC83103EBDAEBFF515FDA500C24940314F110A43BBAEBF366904C5FEC14940B4B246B5C7C7AEBFA4B7D272FEC14940	22 Varden Street	E1 2JP	0	\N	Varden Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1099	0106000020E61000000100000001030000000100000007000000314F110A43BBAEBF366904C5FEC1494061FC83103EBDAEBFF515FDA500C24940D47E04D4F2B8AEBF57DCB5C100C249409742B4B8F3B9AEBF40912EAD01C2494039C2847164B3AEBFCD8440D801C24940E936B17371B0AEBF6E3D0D0CFFC14940314F110A43BBAEBF366904C5FEC14940	24 Varden Street	E1 2JP	0	\N	Varden Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1100	0106000020E61000000100000001030000000100000007000000E936B17371B0AEBF6E3D0D0CFFC1494039C2847164B3AEBFCD8440D801C24940519D0763FBACAEBF2477570202C24940B7D3DA81F7ABAEBF8E5AD00B01C2494033854D86B9A6AEBFBE963B2E01C249401C25D56ACAA4AEBFDF648F58FFC14940E936B17371B0AEBF6E3D0D0CFFC14940	26 Varden Street	E1 2JP	0	\N	Varden Street	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1101	0106000020E610000001000000010300000001000000070000001C25D56ACAA4AEBFDF648F58FFC1494033854D86B9A6AEBFBE963B2E01C24940EE4E4DF952A2AEBF704F204B01C24940F108732E43A3AEBF857DFE2E02C24940FE8B06D9109CAEBF56DC3E5E02C24940E8FBFA347299AEBF60DA0BA3FFC149401C25D56ACAA4AEBFDF648F58FFC14940	28 Varden Street	E1 2JP	0	\N	Varden Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1102	0106000020E61000000100000001030000000100000007000000E8FBFA347299AEBF60DA0BA3FFC14940FE8B06D9109CAEBF56DC3E5E02C24940B3725FBFCE95AEBF9ADC558702C2494025A97848B794AEBF649B397E01C24940D0B85961A390AEBF9C98FF9801C2494077F6D889DB8EAEBF9C6C91E8FFC14940E8FBFA347299AEBF60DA0BA3FFC14940	32 Varden Street	E1 2JP	0	\N	Varden Street	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1103	0106000020E61000000100000001030000000100000009000000034181D223F1AEBF6631BACF00C2494077684FE366E2AEBFB859652001C24940AFB1FA3FEAE0AEBFCBE73F6FFFC14940BAF63A0143DBAEBFD456318EFFC149400156DED849DAAEBFF59BA972FEC14940A6F75F12AFDFAEBF2B892155FEC14940C00594C4C9DCAEBF1ACA8F09FBC149401E4FAF5D18ECAEBFCB54C7B5FAC14940034181D223F1AEBF6631BACF00C24940	12 Turner Street	E1	0	\N	Turner Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1104	0106000020E6100000010000000103000000010000000500000091D398092BF0AEBFC77208C6F8C149405D3F19EB92CEAEBFCD656876F9C149403CDC09DDAACCAEBF5E088F6FF7C14940022D002330EEAEBFDD7029ABF6C1494091D398092BF0AEBFC77208C6F8C14940	33 Nelson Street	E1 2JP	0	\N	Nelson Street	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1105	0106000020E61000000100000001030000000100000005000000B119994364C6AEBFDC6F9899F9C1494050CD3FF98CC4AEBF9DFBB7ABF7C149403CDC09DDAACCAEBF5E088F6FF7C14940D924B9EA92CEAEBF94306876F9C14940B119994364C6AEBFDC6F9899F9C14940	35 Nelson Street	E1 2JP	0	\N	Nelson Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1106	0106000020E6100000010000000103000000010000000700000050CD3FF98CC4AEBF9DFBB7ABF7C14940B119994364C6AEBFDC6F9899F9C1494028E8601BF2C5AEBFC160839BF9C14940EB032B5495BCAEBFAF8A27CEF9C14940BBD3D10CC0BAAEBFAFE661E2F7C14940257A7FA4B9C3AEBFB453D6B1F7C1494050CD3FF98CC4AEBF9DFBB7ABF7C14940	37 Nelson Street	E1 2JP	0	\N	Nelson Street	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1107	0106000020E61000000100000001030000000100000005000000BBD3D10CC0BAAEBFAFE661E2F7C14940EB032B5495BCAEBFAF8A27CEF9C14940E82E1B58B9B3AEBFEAF812FEF9C1494083F56711E4B1AEBFF5394D12F8C14940BBD3D10CC0BAAEBFAFE661E2F7C14940	39 Nelson Street	E1 2JP	0	\N	Nelson Street	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1108	0106000020E6100000010000000103000000010000000500000083F56711E4B1AEBFF5394D12F8C14940E82E1B58B9B3AEBFEAF812FEF9C149401C1D6C30D3ABAEBFDFA5CC28FAC14940A5DC4CEAFDA9AEBFE3CE063DF8C1494083F56711E4B1AEBFF5394D12F8C14940	41 Nelson Street	E1 2JP	0	\N	Nelson Street	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1109	0106000020E61000000100000001030000000100000006000000A5DC4CEAFDA9AEBFE3CE063DF8C149401C1D6C30D3ABAEBFDFA5CC28FAC14940C12E01A439A3AEBFEE915057FAC14940F806835E64A1AEBFCDA08A6BF8C14940CF135AF4DBA4AEBFBDD3C958F8C14940A5DC4CEAFDA9AEBFE3CE063DF8C14940	43 Nelson Street	E1 2JP	0	\N	Nelson Street	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1110	0106000020E61000000100000001030000000100000005000000F806835E64A1AEBFCDA08A6BF8C14940C12E01A439A3AEBFEE915057FAC14940D066CAFAD29AAEBF1B2BC184FAC14940B8A0E9B5FD98AEBF6820FB98F8C14940F806835E64A1AEBFCDA08A6BF8C14940	45 Nelson Street	E1 2JP	0	\N	Nelson Street	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1111	0106000020E61000000100000001030000000100000005000000B8A0E9B5FD98AEBF6820FB98F8C14940D066CAFAD29AAEBF1B2BC184FAC149401B19189E6D93AEBFEB02C2ACFAC149401C4AE9CEC191AEBFBEA51BC0F8C14940B8A0E9B5FD98AEBF6820FB98F8C14940	47 Nelson Street	E1 2JP	0	\N	Nelson Street	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1112	0106000020E610000001000000010300000001000000050000001B19189E6D93AEBFEB02C2ACFAC149401CB4AE1CE47BAEBFC6779BA4FAC1494052E326D3C87AAEBFF97FC8B2F7C149401C4AE9CEC191AEBFBEA51BC0F8C149401B19189E6D93AEBFEB02C2ACFAC14940	49 Nelson Street	E1 2JP	0	\N	Nelson Street	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1113	0106000020E61000000100000001030000000100000007000000E1856183FF8AAFBFDF684F12FDC1494015E6BC034D88AFBF68172131FAC14940E5275A7C8693AFBFFAD410F1F9C14940CB71AFF01095AFBFD644889FFBC14940B078FF6FA58FAFBF064127C1FBC14940857C2F16D490AFBF079B08F1FCC14940E1856183FF8AAFBFDF684F12FDC14940	2 Varden Street	E1 2JP	0	\N	Varden Street	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1114	0106000020E6100000010000000103000000010000000700000015E6BC034D88AFBF68172131FAC14940E1856183FF8AAFBFDF684F12FDC14940F361667B7684AFBFC91F9C37FDC14940BDB84CEC7D83AFBF973F9F13FCC14940C8B7D4288F7EAFBFCE8E3A2EFCC149404BB2772E2E7DAFBF402D9970FAC1494015E6BC034D88AFBF68172131FAC14940	4 Varden Street	E1 2JP	0	\N	Varden Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1115	0106000020E610000001000000010300000001000000070000004BB2772E2E7DAFBF402D9970FAC14940C8B7D4288F7EAFBFCE8E3A2EFCC14940D29F18F4397AAFBF628F9945FCC1494019891726237BAFBF2B51475CFDC14940C73763044774AFBF42336E83FDC14940019AAE250A72AFBF49CF2EB0FAC149404BB2772E2E7DAFBF402D9970FAC14940	6 Varden Street	E1 2JP	0	\N	Varden Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1116	0106000020E61000000100000001030000000100000007000000019AAE250A72AFBF49CF2EB0FAC14940C73763044774AFBF42336E83FDC1494084FE3272226EAFBF46647DA6FDC149406305A0682D6DAFBF4311B590FCC149402D32CAF77167AFBFF4FE98AFFCC1494092A06E6FF765AFBF7C8216F5FAC14940019AAE250A72AFBF49CF2EB0FAC14940	8 Varden Street	E1 2JP	0	\N	Varden Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1117	0106000020E61000000100000001030000000100000007000000AA40FFCF595DAFBF61750109FEC149401D7DB6CCD15AAFBF7DFEB434FBC1494092A06E6FF765AFBF7C8216F5FAC149402D32CAF77167AFBFF4FE98AFFCC1494092642C2A8162AFBF7FE538CAFCC14940D439B5D78A63AFBF3F46ABE5FDC14940AA40FFCF595DAFBF61750109FEC14940	10 Varden Street	E1 2JP	0	\N	Varden Street	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1118	0106000020E610000001000000010300000001000000070000001D7DB6CCD15AAFBF7DFEB434FBC14940AA40FFCF595DAFBF61750109FEC14940B00A295C4756AFBF9E225E31FEC149401697BA323B55AFBFC5EBB50CFDC14940A2D835CA0F50AFBF3CE3362AFDC14940A04DE8BC8D4EAFBF1008B67AFBC149401D7DB6CCD15AAFBF7DFEB434FBC14940	12 Varden Street	E1 2JP	0	\N	Varden Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1119	0106000020E61000000100000001030000000100000007000000A04DE8BC8D4EAFBF1008B67AFBC14940A2D835CA0F50AFBF3CE3362AFDC14940C31C8145144CAFBF9B78F140FDC149408DABA43A194DAFBF4E6ABD5DFEC1494081FCB76A4846AFBF7158A384FEC1494098A2717A2A44AFBF72E4FEB5FBC14940A04DE8BC8D4EAFBF1008B67AFBC14940	14 Varden Street	E1 2JP	0	\N	Varden Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1120	0106000020E6100000010000000103000000010000000700000098A2717A2A44AFBF72E4FEB5FBC1494081FCB76A4846AFBF7158A384FEC149406B7B6675B73FAFBF4FCD1CAAFEC149402121154DAB3EAFBFCD907485FDC14940963F59B60D35AFBFD11955BCFDC14940552881B98933AFBF98AEE414FCC1494098A2717A2A44AFBF72E4FEB5FBC14940	16 Varden Street	E1 2JP	0	\N	Varden Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1121	0106000020E61000000100000001030000000100000006000000552881B98933AFBF98AEE414FCC14940519786330C35AFBFF4B75DBCFDC14940445069EBA336AFBFAB502254FFC149406B83C86AD02EAFBF76BDDF84FFC14940DE4E7C27922BAFBFF8BB8246FCC14940552881B98933AFBF98AEE414FCC14940	31 Turner Street	E1	0	\N	Turner Street	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1122	0106000020E610000001000000010300000001000000050000006B83C86AD02EAFBF76BDDF84FFC1494018992345810EAFBF1D067C4F00C24940FD4469FFBD0CAFBF52EE258CFEC14940EEEFF97F0E2DAFBFA51CE7C2FDC149406B83C86AD02EAFBF76BDDF84FFC14940	25 Turner Street	E1	0	\N	Turner Street	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1123	0106000020E6100000010000000103000000010000000500000032D1940A3622AFBFF1DE979DFDC14940814F387CF713AFBFB1E80A09FEC14940A56104012B0BAFBF327B23C5F6C149404B88B7F2BD1AAFBF86C6A84FF6C1494032D1940A3622AFBFF1DE979DFDC14940	21 Turner Street	E1	0	\N	Turner Street	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1124	0106000020E6100000010000000103000000010000000600000036D6CAD1A285AFBF5E8E74A7F6C14940F2603F561D84AFBFC3F175B0F6C14940C2291040F581AFBF785D816BF4C14940C4A510C9EA8BAFBF16790332F4C14940234D8030048EAFBF27D7D975F6C1494036D6CAD1A285AFBF5E8E74A7F6C14940	3 Nelson Street	E1 2JP	0	\N	Nelson Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1125	0106000020E61000000100000001030000000100000006000000C2291040F581AFBF785D816BF4C14940F2603F561D84AFBFC3F175B0F6C1494036D6CAD1A285AFBF5E8E74A7F6C14940C931C995A57AAFBFB65380E8F6C14940B6A483367C78AFBFE97430A2F4C14940C2291040F581AFBF785D816BF4C14940	5 Nelson Street	E1 2JP	0	\N	Nelson Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1126	0106000020E61000000100000001030000000100000005000000B6A483367C78AFBFE97430A2F4C14940C931C995A57AAFBFB65380E8F6C14940261FD6CBF76EAFBFADFDA02DF7C14940511AA1D6CC6CAFBF5CB9A4E5F4C14940B6A483367C78AFBFE97430A2F4C14940	7 Nelson Street	E1 2JP	0	\N	Nelson Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1127	0106000020E61000000100000001030000000100000005000000511AA1D6CC6CAFBF5CB9A4E5F4C14940261FD6CBF76EAFBFADFDA02DF7C149406531F0E6C064AFBFE383166AF7C1494068C2B38E9462AFBFB191A320F5C14940511AA1D6CC6CAFBF5CB9A4E5F4C14940	9 Nelson Street	E1 2JP	0	\N	Nelson Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1128	0106000020E6100000010000000103000000010000000500000068C2B38E9462AFBFB191A320F5C149406531F0E6C064AFBFE383166AF7C14940A3978632085CAFBFF4C5B59DF7C1494072C327ABDA59AFBF21E90253F5C1494068C2B38E9462AFBFB191A320F5C14940	11 Nelson Street	E1 2JP	0	\N	Nelson Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1129	0106000020E6100000010000000103000000010000000500000072C327ABDA59AFBF21E90253F5C14940A3978632085CAFBFF4C5B59DF7C1494041C319472051AFBFE1DF42DEF7C14940CA30AD44F14EAFBFA6F7FF91F5C1494072C327ABDA59AFBF21E90253F5C14940	13 Nelson Street	E1 2JP	0	\N	Nelson Street	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1131	0106000020E61000000100000001030000000100000005000000F91B33646A45AFBFDE68FEC8F5C14940FEB090B19A47AFBFFD969E16F8C149409F238D270A3DAFBF67412655F8C14940A4D9F105E63AAFBF0F04B405F6C14940F91B33646A45AFBFDE68FEC8F5C14940	17 Nelson Street	E1 2JP	0	\N	Nelson Street	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1132	0106000020E61000000100000001030000000100000005000000AE1F140AC0B8AFBFA37AA8B7FAC14940300009DB5AA5AFBFF795181DFBC14940AF3A7B7557A4AFBF701532D5F9C149400469E2F8ACB7AFBF49EE1370F9C14940AE1F140AC0B8AFBFA37AA8B7FAC14940	16 New Road	E1 1HL	0	\N	New Road	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1133	0106000020E61000000100000001030000000100000005000000300009DB5AA5AFBFF795181DFBC14940AE1F140AC0B8AFBFA37AA8B7FAC14940B71757F137BAAFBF920A5377FCC149401072F1BFB8A6AFBF0D7664D7FCC14940300009DB5AA5AFBFF795181DFBC14940	20 New Road	E1 1HL	0	\N	New Road	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1134	0106000020E610000001000000010300000001000000070000000469E2F8ACB7AFBF49EE1370F9C14940AF3A7B7557A4AFBF701532D5F9C14940FEA38DD43DA4AFBF6B7BCCB4F9C14940FAE6B645F5A8AFBF78038F9DF9C14940CA4EE74FE6A7AFBF03AD0A47F8C149409A6E4FA573B6AFBFADFDEEFAF7C149400469E2F8ACB7AFBF49EE1370F9C14940	14 New Road	E1 1HL	0	\N	New Road	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1135	0106000020E610000001000000010300000001000000080000009A6E4FA573B6AFBFADFDEEFAF7C14940CA4EE74FE6A7AFBF03AD0A47F8C149406033A7D66FA7AFBF91C5C5B9F7C1494024CD4B8448A0AFBF411636DDF7C14940BCF01606B39FAFBFD5909A1BF7C149404949A5F3DBA6AFBFD9B856F6F6C149403484003259B5AFBFB42F8FAAF6C149409A6E4FA573B6AFBFADFDEEFAF7C14940	12 New Road	E1 1HL	0	\N	New Road	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1136	0106000020E610000001000000010300000001000000050000003484003259B5AFBFB42F8FAAF6C149404949A5F3DBA6AFBFD9B856F6F6C14940FF879CA2C7A5AFBF6EBD0C99F5C149408E2EF42F34B4AFBFB37F9C4DF5C149403484003259B5AFBFB42F8FAAF6C14940	10 New Road	E1 1HL	0	\N	New Road	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1137	0106000020E610000001000000010300000001000000080000008E2EF42F34B4AFBFB37F9C4DF5C14940FF879CA2C7A5AFBF6EBD0C99F5C149405DC3FC2A76A5AFBF801A162EF5C1494055A2AAD28D9CAFBFD4581258F5C14940B49D7432C59BAFBF7745116FF4C14940D703287DBBA4AFBF258E1646F4C14940B3C9D4D717B3AFBF0C07FBFAF3C149408E2EF42F34B4AFBFB37F9C4DF5C14940	8 New Road	E1 1HL	0	\N	New Road	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1138	0106000020E61000000100000001030000000100000005000000B3C9D4D717B3AFBF0C07FBFAF3C14940D703287DBBA4AFBF258E1646F4C1494046D2EA4E6AA3AFBFFE22DC9BF2C14940310FC5DDB5B1AFBFD21D6C55F2C14940B3C9D4D717B3AFBF0C07FBFAF3C14940	8 New Road	E1 1HL	0	\N	New Road	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1139	0106000020E61000000100000001030000000100000007000000D0A720D1C2A5AFBF1E0883A0FBC14940CBD550A3B7A6AFBF4DF469D7FCC14940BA4676427E96AFBF53A7402AFDC149405AC0099F6B94AFBF18DA1EEBFAC149409EC6854B4D9DAFBF59C57FBEFAC14940DC1F5F15369EAFBF46F49CC5FBC14940D0A720D1C2A5AFBF1E0883A0FBC14940	20 New Road	E1 1HL	0	\N	New Road	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1140	0106000020E6100000010000000103000000010000000900000086406E401621AFBF74CBB91F05C24940318BBB261113AFBF5160167D05C249401DDECFBBA311AFBFC18F592004C2494042D1D22A7412AFBFC3C8FAE203C2494097103C5BC51FAFBF5824EF8903C249407E7678F7D526AFBFB89DE65603C24940CC97EC83C627AFBF6B07D63A04C24940CBF347376E20AFBFDA414D6E04C2494086406E401621AFBF74CBB91F05C24940	33 Turner Street	E1	0	\N	Turner Street	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1141	0106000020E61000000100000001030000000100000009000000AE563BB68818AFBF6AFB2D140BC24940B85147B68818AFBF75FB2D140BC24940A18C5D84B925AFBFFBEEC8B50AC249401F106684B925AFBFC0EEC8B50AC24940480CCC43FA2AAFBFE724709B0AC249403F13F187302CAFBFAB14A5E50BC2494087A90B60CB26AFBF2C19A5FF0BC24940C6B990C5BC19AFBFBFBA2D4F0CC24940AE563BB68818AFBF6AFB2D140BC24940	41 Turner Street	E1	0	\N	Turner Street	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1142	0106000020E6100000010000000103000000010000000B000000294D33222917AFBF446FAEAC09C24940BA0C34222917AFBF426FAEAC09C249402A321DE59424AFBFBEAA525509C24940829258A02B25AFBF7FDCA5EE09C24940454DE78D492AAFBF496134CB09C24940480CCC43FA2AAFBFE724709B0AC249401F106684B925AFBFC0EEC8B50AC24940A18C5D84B925AFBFFBEEC8B50AC24940B85147B68818AFBF75FB2D140BC24940AE563BB68818AFBF6AFB2D140BC24940294D33222917AFBF446FAEAC09C24940	39 Turner Street	E1	0	\N	Turner Street	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1143	0106000020E6100000010000000103000000010000000A000000348604DEDA15AFBF116BE25608C249409A720ADEDA15AFBFED6AE25608C24940C476E8857C23AFBF15A59D0308C24940A6B2E1950124AFBFFB9D979408C24940FD7771E44829AFBF40969A7F08C249403BCB392BF829AFBF01287B3809C249402A321DE59424AFBFBEAA525509C24940BA0C34222917AFBF426FAEAC09C24940294D33222917AFBF446FAEAC09C24940348604DEDA15AFBF116BE25608C24940	37 Turner Street	E1	0	\N	Turner Street	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1144	0106000020E6100000010000000103000000010000000A000000AC95584A8A14AFBFA36FB9FE06C2494001A95D4A8A14AFBF856FB9FE06C24940982A34095F22AFBF0C30BFAB06C249409DFD69161223AFBF254B7C4007C24940B83FC710E227AFBF4BA1222607C24940BAC270EB9A28AFBF0F9B24E207C24940C476E8857C23AFBF15A59D0308C249409A720ADEDA15AFBFED6AE25608C24940348604DEDA15AFBF116BE25608C24940AC95584A8A14AFBFA36FB9FE06C24940	35 Turner Street	E1	0	\N	Turner Street	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1145	0106000020E61000000100000001030000000100000009000000318BBB261113AFBF5160167D05C2494086406E401621AFBF74CBB91F05C249408DC417DBD521AFBF616A92CE05C249400B11C8D38C26AFBFC05C76B905C24940F139DFA13C27AFBF430B989006C24940CE810FE98422AFBFF773FCA806C2494001A95D4A8A14AFBF856FB9FE06C24940AC95584A8A14AFBFA36FB9FE06C24940318BBB261113AFBF5160167D05C24940	33 Turner Street	E1	0	\N	Turner Street	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1146	0106000020E61000000100000001030000000100000007000000C6B990C5BC19AFBFBFBA2D4F0CC249403F13F187302CAFBFAB14A5E50BC24940A76F734C5E2EAFBFBC48C9D90BC24940EB6982900C30AFBF69D60E890DC24940F0EE29A7841CAFBF68E13DFD0DC24940911DED92241BAFBFC46EBED10DC24940C6B990C5BC19AFBFBFBA2D4F0CC24940	43 Turner Street	E1	0	\N	Turner Street	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1147	0106000020E61000000100000001030000000100000005000000EB6982900C30AFBF69D60E890DC24940A76F734C5E2EAFBFBC48C9D90BC249401B80775D503AAFBFDE9931990BC24940C30AD0C8C73BAFBF4BAA9F490DC24940EB6982900C30AFBF69D60E890DC24940	24 Walden Street	E1 2AG	0	\N	Walden Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1148	0106000020E6100000010000000103000000010000000900000053BAAD4C4C46AFBF33FD2DE304C24940387411F08844AFBFD3577AA402C24940B62F12F08844AFBFDA567AA402C2494034762C74204EAFBFEC57F47102C24940302D9AA3BC4FAFBF86B4874D05C24940CED211FEF84FAFBFFB3371AC05C24940B455CBDCCC4AAFBFF2A752C005C2494023EAE0DB124AAFBF1F4056D104C2494053BAAD4C4C46AFBF33FD2DE304C24940	21 Varden Street	E1 2JP	0	\N	Varden Street	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1149	0106000020E61000000100000001030000000100000009000000F2B671D7863DAFBFE8E41D1005C2494005DC5A3E6B3BAFBFDE907ED402C24940B62F12F08844AFBFDA567AA402C24940387411F08844AFBFD3577AA402C249401D2E414A4D46AFBFF66659DD04C24940303DE788F046AFBF99BF5ABD05C2494007D8C6765942AFBF49D84ED505C249400022F60F6741AFBFD97A77FB04C24940F2B671D7863DAFBFE8E41D1005C24940	23 Varden Street	E1 2JP	0	\N	Varden Street	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1150	0106000020E6100000010000000103000000010000000800000005DC5A3E6B3BAFBFDE907ED402C2494079C9E06F7F3DAFBFA8898E0505C249404B115FAB493EAFBFFE4F3DD605C24940FC35B1C3E539AFBF02DA96EB05C249404D366B302639AFBF24AE6B2305C24940A9E08C02C934AFBF574E8E3905C249403296E260DC32AFBF4463920103C2494005DC5A3E6B3BAFBFDE907ED402C24940	25 Varden Street	E1 2JP	0	\N	Varden Street	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	0106000020E6100000010000000103000000010000000700000028B34C6F7259AFBF61DD58F105C249403AE467482854AFBF2F83920306C2494005DC52BCA153AFBFA2106D3A05C2494050E81FCAB34FAFBF1886934A05C2494034762C74204EAFBFEC57F47102C24940EB6167AA0D57AFBF19C8CF3B02C2494028B34C6F7259AFBF61DD58F105C24940	16 Varden Street	E1 2JP	0	\N	Varden Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1152	0106000020E610000001000000010300000001000000070000006649797031A0AFBF87FF75D607C24940D40F03C0DEA0AFBF5446209608C24940FB5762C07BA1AFBFAB2CC14309C249403F5E62C07BA1AFBFB22CC14309C24940185D18C07BA1AFBF4B2EC14309C249406F6B6C7031A0AFBFCFFF75D607C249406649797031A0AFBF87FF75D607C24940	3 Varden Street	E1 2JP	0	\N	Varden Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1153	0106000020E6100000010000000103000000010000000500000029BA54038DB5AFBF3F4CD0890AC2494058D081EBCBB3AFBFE72A71DE08C249405013041E35C5AFBF44991E7E08C24940B0380406B4C6AFBF130091250AC2494029BA54038DB5AFBF3F4CD0890AC24940	34 New Road	E1 1HL	0	\N	New Road	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1154	0106000020E610000001000000010300000001000000050000003F5E62C07BA1AFBFB22CC14309C2494085B362C07BA1AFBF112DC14309C249408CCF1DC07BA1AFBF8D2EC14309C24940185D18C07BA1AFBF4B2EC14309C249403F5E62C07BA1AFBFB22CC14309C24940	4 Walden Street	E1 2AG	0	\N	Walden Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1155	0106000020E61000000100000001030000000100000004000000CC0D18F0EB9FAFBF364E998907C249406649797031A0AFBF87FF75D607C249406F6B6C7031A0AFBFCFFF75D607C24940CC0D18F0EB9FAFBF364E998907C24940	3 Varden Street	E1 2JP	0	\N	Varden Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1156	0106000020E61000000100000001030000000100000005000000CFC7089492C2AFBFAB29299405C24940D54C9B3AD99EAFBF31A8CB5906C249400A643A11CB9DAFBF084B052F05C249400B2EDB6884C1AFBF85D5626904C24940CFC7089492C2AFBFAB29299405C24940	1 Varden Street	E1 2JP	0	\N	Varden Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1157	0106000020E610000001000000010300000001000000050000000B2EDB6884C1AFBF85D5626904C249400A643A11CB9DAFBF084B052F05C2494079C207536A9CAFBF01E2EAA803C2494057084FA823C0AFBF457848E302C249400B2EDB6884C1AFBF85D5626904C24940	1 Varden Street	E1 2JP	0	\N	Varden Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1158	0106000020E6100000010000000103000000010000000500000057084FA823C0AFBF457848E302C2494079C207536A9CAFBF01E2EAA803C24940C1CD11AE569BAFBF3203147802C249403D09830110BFAFBFA8A271B201C2494057084FA823C0AFBF457848E302C24940	1 Varden Street	E1 2JP	0	\N	Varden Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1159	0106000020E61000000100000001030000000100000005000000C1CD11AE569BAFBF3203147802C249403E0FC1FFC399AFBFB610BFBA00C24940DAD451277ABDAFBF72DC9DF1FFC149403D09830110BFAFBFA8A271B201C24940C1CD11AE569BAFBF3203147802C24940	1 Varden Street	E1 2JP	0	\N	Varden Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1160	0106000020E61000000100000001030000000100000005000000C18D7D8B5396AFBFB990708106C24940CF9D14660C92AFBFCDBDE4F300C249403E0FC1FFC399AFBFB610BFBA00C24940D54C9B3AD99EAFBF31A8CB5906C24940C18D7D8B5396AFBFB990708106C24940	3 Varden Street	E1 2JP	0	\N	Varden Street	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	0106000020E61000000100000001030000000100000007000000CF9D14660C92AFBFCDBDE4F300C24940C18D7D8B5396AFBFB990708106C2494076F149E2028DAFBFB69AC5AC06C2494063186F76528BAFBF88C014E604C24940ABF2FB145A8BAFBF653E17EE04C249408FC217527E88AFBFCF4BA63A01C24940CF9D14660C92AFBFCDBDE4F300C24940	5 Varden Street	E1 2JP	0	\N	Varden Street	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1162	0106000020E6100000010000000103000000010000000500000084085ACF2059AFBFCD1A39A609C24940289951E9A45BAFBF166B9EA20CC24940682BAD7F7A51AFBF6D57E6D70CC249402EB05776F64EAFBF9E2F93DB09C2494084085ACF2059AFBFCD1A39A609C24940	20 Walden Street	E1 2AG	0	\N	Walden Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1163	0106000020E6100000010000000103000000010000000D0000005671B5E9B138AFBF03EA661F29C24940D68A9D37FE23AFBF08CFCDB811C249403581CE79094DAFBF990C4EB610C24940A990829E405CAFBF497D3DC21FC249400868F3A6D27AAFBF212CB3011FC24940CE5447FE3E6CAFBFE2B0DFCC0FC249405D1880DD7C79AFBF5811C07A0FC249408A54AD05EA90AFBFB589080A27C24940A817583F2683AFBFBA7BBA6027C2494088D1B914917BAFBF86E429E11FC2494098ACDEB3375DAFBF97614FA020C24940B14F19E0B664AFBFC6092A0A28C249405671B5E9B138AFBF03EA661F29C24940	Blizard Building	E1 2AG	0	\N	Walden Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1192	0106000020E61000000100000001030000000100000005000000663003614B18AFBF732BA30224C24940E53348C3CABEAEBFF396F2FD25C2494024D8F1BB05BBAEBF3207F2C121C24940ED48CA1D3314AFBFED0440BB1FC24940663003614B18AFBF732BA30224C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1164	0106000020E6100000010000000103000000010000000B0000003D26F64FFDDFAFBF38600F5025C2494089AFA61C10AFAFBFF950736026C249408986C92820ACAFBFC7C2C2C322C24940AAB1118AF9B5AFBFAA89E09122C2494060480222A9B3AFBFE11863B91FC249408304B9C1A0A9AFBFEB5E33EC1FC24940DC4E6E64F6A5AFBF967DE2F41BC24940CD6CD523AEABAFBF43F3ECD71BC24940CDCEA2A5A8AEAFBFDE61BA2E1CC24940998CDEE627D6AFBF40EB793E1BC249403D26F64FFDDFAFBF38600F5025C24940	Clinical Sciences Research Centre	E1 2AG	0	\N	Newark Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1165	0106000020E6100000010000000103000000010000000900000093B77C6FD0AEAFBFD485251226C249401D741069A190AFBF966D02C126C249408B938BEA6B87AFBF169D7DDA1CC24940D75D8D7320A6AFBFCA219B281CC249408304B9C1A0A9AFBFEB5E33EC1FC24940CB5BD888A5AFAFBFDCACB7CD1FC24940348DD61CF4B1AFBF665C3EA622C249400A4ABD2820ACAFBFBCB3C2C322C2494093B77C6FD0AEAFBFD485251226C24940	Centre of the Cell	E1 2AG	0	\N	Walden Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1166	0106000020E61000000100000001030000000100000005000000B450B23088ECAFBFD395B43833C2494090E3F171C961AFBFB774F55A36C2494001E126189858AFBFA8E899062CC24940576BB29373E3AFBF2F65E90429C24940B450B23088ECAFBFD395B43833C24940	Dental Hospital and Institute of Dentistry	E1 2AG	0	\N	Stepney Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1167	0106000020E6100000010000000103000000010000001200000044AF9F70F455AFBFF5D25B7833C24940FD68736EC945AFBF1DDF89D933C24940AF67014E7644AFBFC7FD237A32C249406FEBB6CBF43CAFBFB23141A732C249400D65EA3DCE3BAFBFCE04E99A32C249405C57D897E13AAFBF9320C77B32C24940DB1C3CB0813AAFBF3084B25532C2494050F11811683AAFBFCE4DA62E32C249408E400AEB863AAFBF3072950832C24940B0DB711BC83AAFBF6761B0EA31C249403C6D20C51F3BAFBF3B4A01CF31C249406F73DD06F63BAFBF842E68B631C249405D060114A83CAFBF042BF7A131C24940BB56A5D2583EAFBF95ECEC9131C249404BAE45E53E43AFBF9049716331C24940A5DF230C473FAFBF00C2DFED2CC24940F2A4AD63E84FAFBF99B4B4912CC2494044AF9F70F455AFBFF5D25B7833C24940	Gwynne House	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1168	0106000020E6100000010000000103000000010000000C0000003FA3D2597B5EAFBF5006FB6A36C24940C51B1BE92757AFBFC804AC9736C2494030305E053057AFBF870732A036C24940E9A9B7D53A57AFBF83608FAB36C2494013BBC54F6F57AFBFC7A7B5E236C2494003F7C4957842AFBFE7DEF15E37C24940ABEF46BB423FAFBF19DA37FF33C24940C85EF17DC845AFBFC89790D833C249402E355FFE9351AFBFF46FAA9233C24940BA6AC4F84552AFBFCD66B54D34C2494008670E08405CAFBFB5FD941234C249403FA3D2597B5EAFBF5006FB6A36C24940	Gwynne House	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1169	0106000020E6100000010000000103000000010000000D0000003342AA284BFAAFBFA9AC2BC041C2494049A4A70C01DDAFBFF1B82F6142C24940FDB11440B1DAAFBFBF07E00842C24940F5C22427C2D6AFBF53E7DC743DC24940FFFD6E7233CCAFBFA79AD1AE3DC2494011A9BDB479CBAFBF3F91B6E33CC24940CB721B7CDED5AFBF543014A73CC249402CDE051684D1AFBFD36F16BD37C24940E5B28E1AE3D2AFBFF6A0656F37C249404E815D5812F0AFBFA109C3D036C24940C718898458F2AFBFCE69B20B37C24940DB6E810FC4FBAFBF2E1C1D5741C249403342AA284BFAAFBFA9AC2BC041C24940	Outpatients Annexe	E1 1HL	0	\N	New Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1170	0106000020E6100000010000000103000000010000000700000089D60E273BEFAFBF98C35AB44EC249408B5ED77295EAAFBF58E1B8A54CC24940BEFC39B31DF3AFBF2EDD9E2E4CC249407441D9D69AF9AFBF682A39464FC24940FE02205E7AF5AFBF69F62F7B4FC249406EAB21CF5EF3AFBF7E69777A4EC2494089D60E273BEFAFBF98C35AB44EC24940	34 Mount Terrace	E1	0	\N	Mount Terrace	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	0106000020E610000001000000010300000001000000060000008B5ED77295EAAFBF58E1B8A54CC2494089D60E273BEFAFBF98C35AB44EC24940FAEC8C30E0EAAFBF680323ED4EC24940350CC35D2CE7AFBFFB75EE1C4FC2494014166A2E7DE2AFBFD69DB7164DC249408B5ED77295EAAFBF58E1B8A54CC24940	33 Mount Terrace	E1	0	\N	Mount Terrace	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	0106000020E6100000010000000103000000010000000500000014166A2E7DE2AFBFD69DB7164DC24940350CC35D2CE7AFBFFB75EE1C4FC24940D471EA225DDEAFBFF724E49B4FC2494001262BC2A5D9AFBFD79622924DC2494014166A2E7DE2AFBFD69DB7164DC24940	32 Mount Terrace	E1	0	\N	Mount Terrace	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	0106000020E6100000010000000103000000010000000500000001262BC2A5D9AFBFD79622924DC24940D471EA225DDEAFBFF724E49B4FC249406E76B63651D6AFBF5207DB0F50C2494081C9365A92D1AFBF1049DD024EC2494001262BC2A5D9AFBFD79622924DC24940	31 Mount Terrace	E1	0	\N	Mount Terrace	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1174	0106000020E6100000010000000103000000010000000500000081C9365A92D1AFBF1049DD024EC249406E76B63651D6AFBF5207DB0F50C2494063AA86AAD9CDAFBF05DFE08950C24940A77331EE12C9AFBF6DAB7B794EC2494081C9365A92D1AFBF1049DD024EC24940	30 Mount Terrace	E1	0	\N	Mount Terrace	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1175	0106000020E61000000100000001030000000100000005000000A77331EE12C9AFBF6DAB7B794EC2494063AA86AAD9CDAFBF05DFE08950C24940C53F01CA95C6AFBF009C94F250C249403648FB4BC8C1AFBFDAA543DF4EC24940A77331EE12C9AFBF6DAB7B794EC24940	29 Mount Terrace	E1	0	\N	Mount Terrace	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1176	0106000020E610000001000000010300000001000000050000003648FB4BC8C1AFBFDAA543DF4EC24940C53F01CA95C6AFBF009C94F250C249402442CC3EBBBDAFBF87F42C7251C24940AB99E484E5B8AFBFF0BB4C5B4FC249403648FB4BC8C1AFBFDAA543DF4EC24940	28 Mount Terrace	E1	0	\N	Mount Terrace	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1177	0106000020E61000000100000001030000000100000005000000AB99E484E5B8AFBFF0BB4C5B4FC249402442CC3EBBBDAFBF87F42C7251C249400368C7A16BB5AFBF7601F3E951C249405418352D8EB0AFBFBE61BBCF4FC24940AB99E484E5B8AFBFF0BB4C5B4FC24940	27 Mount Terrace	E1	0	\N	Mount Terrace	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1178	0106000020E610000001000000010300000001000000080000005418352D8EB0AFBFBE61BBCF4FC249400368C7A16BB5AFBF7601F3E951C249403A9E7EC2F1B1AFBF204A931C52C24940A5E9EB1EFAB3AFBF9E6E5C2153C249407994193F69AEAFBF2A5E536D53C24940AB4B95ED1AACAFBFDEFF317052C249409E9143CF34A7AFBF2A9C3B5250C249405418352D8EB0AFBFBE61BBCF4FC24940	26 Mount Terrace	E1	0	\N	Mount Terrace	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1179	0106000020E610000001000000010300000001000000060000009E9143CF34A7AFBF2A9C3B5250C24940AB4B95ED1AACAFBFDEFF317052C2494006236D4D57A9AFBF228A2B9852C2494019FB4DB3E6A4AFBF92E003D852C249404AFEE1E1F99FAFBF040528B750C249409E9143CF34A7AFBF2A9C3B5250C24940	25 Mount Terrace	E1	0	\N	Mount Terrace	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1180	0106000020E610000001000000010300000001000000050000004AFEE1E1F99FAFBF040528B750C2494019FB4DB3E6A4AFBF92E003D852C24940907D94023E9CAFBFA15DCD5453C249400D48AE234997AFBFCA4A763051C249404AFEE1E1F99FAFBF040528B750C24940	24 Mount Terrace	E1	0	\N	Mount Terrace	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1181	0106000020E610000001000000010300000001000000060000000D48AE234997AFBFCA4A763051C24940907D94023E9CAFBFA15DCD5453C24940A4525DD04C99AFBF53C3E38053C2494027A0BE713E94AFBFA87311C853C249404BDFA822428FAFBF8C2883A051C249400D48AE234997AFBFCA4A763051C24940	23 Mount Terrace	E1	0	\N	Mount Terrace	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1182	0106000020E610000001000000010300000001000000070000004BDFA822428FAFBF8C2883A051C2494027A0BE713E94AFBFA87311C853C24940C5B0AC6AA996AFBF7C358FFB54C249400B313C90728EAFBF84F2B86C55C2494051E7340ECB8BAFBFD39ADA4154C24940AA790475B686AFBFD2DECB1752C249404BDFA822428FAFBF8C2883A051C24940	23 Mount Terrace	E1	0	\N	Mount Terrace	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1183	0106000020E610000001000000010300000001000000170000006D52DE59B5D7AFBF977304F34AC24940A22364A0EED6AFBF0061C8004BC24940EDAF94FAD0D5AFBF04D13F034BC249403EC2449FDED4AFBFFAFD99FE4AC2494027A4049325D4AFBF18BBE5F24AC24940F308027B77D3AFBFD6E5C1DD4AC24940FD58B059F9D2AFBFDABE85C14AC24940D32B4E83BCD2AFBF165949A64AC24940CDE1B8C3C5D2AFBFCD12578B4AC24940E3DD2E09D0D2AFBF677A6C6D4AC24940F444FA0215D3AFBFA9C3B2554AC249408E571146A5D3AFBF6A163A3E4AC24940F1D214FD46D4AFBF1CE91E2E4AC249405DB29F8B08D5AFBF655640234AC24940A2E04E85FBD5AFBF684B41244AC249400434BE58D1D6AFBF39C3B32B4AC249402A5BCCD18ED7AFBF2A1CE2384AC24940656E146B3CD8AFBFD93BF0504AC249406A178161B5D8AFBF4DBC11704AC24940C8D95848CFD8AFBFF7DC49984AC249404544E5A4A7D8AFBF6162F7C04AC2494047DE5C5240D8AFBF9AB22BDF4AC249406D52DE59B5D7AFBF977304F34AC24940	Royal London Hospital	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1184	0106000020E61000000100000001030000000100000007000000055FFED227F8AFBF9D0C6F1249C24940D9792ED7F7EDAFBFD3B4DCB049C249407084BB8196EAAFBF1652515648C24940CEC8FA85C4C8AFBF579143644AC24940948E360461BFAFBF9B1CB5A146C24940AC16B23592EBAFBFEED176F243C24940055FFED227F8AFBF9D0C6F1249C24940	Ambrose King Centre and Grahame Hayton Unit	E1	0	\N	Mount Terrace		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1185	0106000020E6100000010000000103000000010000000500000034BD35F031C3AFBF681DF22848C249405D8AE480E0A9AFBF6C37DDAE49C24940325308A8FAA5AFBF3EDC571B48C24940E417796E76BFAFBF481568A046C2494034BD35F031C3AFBF681DF22848C24940	Royal London Hospital	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1186	0106000020E61000000100000001030000000100000006000000CEC8FA85C4C8AFBF579143644AC2494024D197CF89CBAFBFEF867CA04BC24940A13C382F05B1AFBFA09BEB124DC24940CDA57E7CDCAAAFBF520CF9534AC249402E4FF2A50AC5AFBF88AC41E648C24940CEC8FA85C4C8AFBF579143644AC24940	Royal London Hospital	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1187	0106000020E61000000100000001030000000100000009000000D155FFDE46ABAFBFD9757D4D4CC24940E2AD57CA3164AFBFFC3C824850C24940B932C5036962AFBF0B72DC834FC2494054199562BB5EAFBF502F12B94FC24940F68479CBFD59AFBF0B8C9AAE4DC249402831FD9BF15DAFBF36816D754DC2494021EF1357915CAFBF4B5AC5DD4CC249403A0FBBD4F9A3AFBFE4B8C1D448C24940D155FFDE46ABAFBFD9757D4D4CC24940	Royal London Hospital	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1188	0106000020E610000001000000010300000001000000150000003F0C7D243AD0AFBFEE5DDE1542C24940F57C33FCC7A9AFBF7B326C0343C24940F6D013C7A8AAAFBF6C623CF943C24940CB3A1B279A83AFBF6F72ADD744C2494066E69A10CA84AFBF6F9D042446C2494072221B57FD75AFBF8E0D4E7846C249400D5BC2A15376AFBFDC55ABD646C249405FAD6B547F53AFBF073F069D47C24940AAE3AC102152AFBFCC54E73A46C249406874A71E1951AFBF6E2DEB0646C24940E0BF38174F50AFBF0D9EAE2845C24940A54B33192651AFBF3C7449E044C24940D97B2B22934AAFBFA316E6453DC249403E8DA7158E49AFBF73E06A213DC24940FD6956B59148AFBFBB1E8A143CC24940C5700055E248AFBF3FAFABE83BC24940E14AFBDDBF47AFBF6E6AA1973AC2494025237706D2A7AFBF9EB6847638C24940929E8F1041A8AFBFC83BF1EF38C2494016A7F5183BC7AFBF8CE6833F38C249403F0C7D243AD0AFBFEE5DDE1542C24940	Outpatients Department	E1 2AG	0	\N	Stepney Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1189	0106000020E610000001000000010300000001000000200000004A8B1432CC35AFBF5DEE00FD47C24940749E08229FFEAEBF79AE72164BC24940EAD3B225DFEFAEBF08A1C38C44C24940C9188F99D0EFAEBF23ACD28644C24940E05157E194E9AEBFC61D04D544C249402CC9FB2678E6AEBFA945996943C24940B5111857A4ECAEBF6E0CBB0E43C24940D844BB4A68EAAEBF33CAFFEB41C24940B717428265E8AEBF5C862EEB41C24940BFE9BCB4A9E6AEBF428EB2D041C24940181C18C9EAE4AEBFFBFFA0A941C24940BBF7ACE8C2E3AEBFA928506541C2494094F6A4F966E3AEBF1BADEC3941C24940AB3E39302EE3AEBFB6987E1741C24940F8B4630B3BE3AEBFA06137EC40C24940FD2532F072E3AEBF642B97C840C24940B34AE13BBCE3AEBF3396F8A540C24940E8221A6EFFE3AEBFFFF8398440C24940B563EFCED0E4AEBF33F3C83740C24940B6043AEE5CE5AEBF5773AA0140C2494090F038F6B1E1AEBFA89BD5283EC24940B5DB9EBBC2E4AEBF8D0749513DC24940DD5B849EB6ECAEBFE07999F33CC24940A82148F2FA26AFBFC7FC02703BC2494032D496780D2BAFBFFBD813403FC249409F03D6A4952DAFBF1A6C36913FC24940DFAD4AA0F82EAFBF4223890140C24940A8F3860A432FAFBF03CB0E6440C249402BE0D0B1222FAFBF42993FC240C249405996DCDAE12DAFBFBD08484141C249408058B28B042DAFBF2303E89841C249404A8B1432CC35AFBF5DEE00FD47C24940	Garrod Building 	E1 2AG	0	\N	Stepney Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1190	0106000020E610000001000000010300000001000000070000000045F17E3A1BAFBF252E7AF326C2494043B786FB900DAFBFC8B6C94427C24940CA0CEABCFB0CAFBF6C914F9226C24940B07D45851306AFBF8F9348B626C2494012C00C886905AFBF404BFFEA25C249400453D99B031AAFBFC458B37F25C249400045F17E3A1BAFBF252E7AF326C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1191	0106000020E61000000100000001030000000100000006000000B07D45851306AFBF8F9348B626C24940F33D12E4D806AFBF20FB435E27C24940282C1180FAFAAEBFE0461EB527C2494050ED601D45F9AEBF8F3ADB4026C24940D46CDD156705AFBF614A12E825C24940B07D45851306AFBF8F9348B626C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1285	0106000020E61000000100000001030000000100000005000000F9DBB4DCDA8AB1BFD1F332C467C1494074C6FA45D283B1BF504D2FFA67C149402EBF8D1BAA83B1BF7D0C4BA667C14940DE370C1FA28AB1BF0D6A007A67C14940F9DBB4DCDA8AB1BFD1F332C467C14940	Free Bike Pump	E1 0AY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1193	0106000020E61000000100000001030000000100000005000000E3AA159CBABDAEBFC9213ECC24C24940375EC44CCAB5AEBFBD6C45FE24C24940FB1AF03ABCB2AEBF69C255F921C24940D708FD7D08BBAEBF511B0BC521C24940E3AA159CBABDAEBFC9213ECC24C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1194	0106000020E6100000010000000103000000010000000600000070957F55C1AEAEBF94F7BA2926C2494071414DC939AAAEBF7455EE2922C24940FB1AF03ABCB2AEBF69C255F921C24940F9CCF4D81DB6AEBF2EE936FC24C24940135F4133E8B6AEBF315B920226C2494070957F55C1AEAEBF94F7BA2926C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1196	0106000020E61000000100000001030000000100000007000000D83038B463A1AEBF5D76645C22C249403AFA435BE2A5AEBF75E7575426C24940E59D6E6811A1AEBF5A7F7A6B26C24940BA9F5921C59FAEBFC5F1A7BC24C249408AC61CEC0A9BAEBFEA465DD324C249406C8B11E63897AEBF1042749622C24940D83038B463A1AEBF5D76645C22C24940	Yvonne Carter Building, 58 Turner Street	E1	0	\N	Turner Street	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1197	0106000020E6100000010000000103000000010000000500000055D919E4529BAEBF17E88BF11EC24940DE4E29AFB298AEBFB8DA3BD81CC24940F1BF5EAE39A1AEBFE4B3469B1CC249406BD35CB4A4A3AEBFB6929CB61EC2494055D919E4529BAEBF17E88BF11EC24940	46 Ashfield Street	E1 2AG	0	\N	Ashfield Street	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1198	0106000020E61000000100000001030000000100000005000000DE4E29AFB298AEBFB8DA3BD81CC2494055D919E4529BAEBF17E88BF11EC249402008F46D2192AEBF7571AB321FC2494058D0AEF1818FAEBFA552EE191DC24940DE4E29AFB298AEBFB8DA3BD81CC24940	Postgraduate Centre, 48 Ashfield Street	E1 2AG	0	\N	Ashfield Street	48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1199	0106000020E6100000010000000103000000010000000500000058D0AEF1818FAEBFA552EE191DC249402008F46D2192AEBF7571AB321FC24940228A3B186385AEBF8621F18C1FC2494073A69D41FA82AEBFF13180731DC2494058D0AEF1818FAEBFA552EE191DC24940	Postgraduate Centre, 48 Ashfield Street	E1 2AG	0	\N	Ashfield Street	48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1200	0106000020E6100000010000000103000000010000001100000005B6C9DCE6C7AEBF17394E831DC2494057340F3D76BAAEBF9A4994D91DC24940A073900439BAAEBF053A6FA41DC249407C50836476B7AEBF02113DB81DC249403DB1B337B7B7AEBF922083F01DC24940923E8F6C30ABAEBF40DF624A1EC249407A87C1BD3AA9AEBF37E5E0961CC2494046392A669DA5AEBF8EE7CFB01CC24940AA143C653AA4AEBF496CA27C1BC24940A917DC1FB9A7AEBF6D0D8F631BC24940797AF85454A6AEBF1D0ED42D1AC24940111D815766B2AEBF62323AD719C2494038B9C091B7B2AEBF6580BD1D1AC249405AE477072FB7AEBFDA7DB1FD19C2494000F9ACACDCB6AEBF72C033B619C2494025EC308220C3AEBF4030345E19C2494005B6C9DCE6C7AEBF17394E831DC24940	James Hora Home	E1 2AG	0	\N	Ashfield Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1201	0106000020E6100000010000000103000000010000000C0000005A84CE64990DAFBFFA45A5CB1BC249405A65D334A80DAFBF8FA2AA1E1CC24940C77F798B36CFAEBF32E9C64C1DC249406E8C87DF96CEAEBF4438387F1CC2494059F9A33736CAAEBF54E865941CC24940D96A23531BC7AEBF9ADC109518C24940A16613CEF0D4AEBFAF3E235218C24940F3FE966C69D5AEBF5A5E6BED18C24940B49AC51CAE02AFBFB609681218C249407681BD7E4A03AFBFBA93B8DB18C24940D52BA98E330BAFBF3BE072B518C249405A84CE64990DAFBFFA45A5CB1BC24940	Wingate Building	E1 2AG	0	\N	Ashfield Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1202	0106000020E6100000010000000103000000010000000600000053490933CA99AEBF33237C222BC24940F643103C249FAEBF09C625FE2AC24940B9F2E99B43A1AEBFB39091F02CC24940639B2F5A0896AEBF9D26D43C2DC24940A88245FBE893AEBF1C56684A2BC2494053490933CA99AEBF33237C222BC24940	42 Newark Street	E1 2AG	0	\N	Newark Street	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1203	0106000020E61000000100000001030000000100000005000000CEB8FABE13ADAEBF37F35BA02CC249406B42257754A8AEBF09C4198E28C249401C024C8ACAB1AEBF18BE245328C24940EF1A5773E1B5AEBFFB1D80692CC24940CEB8FABE13ADAEBF37F35BA02CC24940	John Garnett House, 38 Newark Street	E1 2AG	0	\N	Newark Street	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1204	0106000020E6100000010000000103000000010000000A0000000279165B9CB5AEBF094271242CC2494089BDE1C637B2AEBF24B052C028C24940F0DDE6D6F3BAAEBF0934F68028C24940771C0638F2BBAEBF6E295D5B29C249402516F068E2BEAEBFAF932BE12BC2494024725DA725C4AEBF3EA083C12BC249400F85FF30CEC4AEBF220312192CC24940110C80991ABBAEBF68C38A512CC24940C9315306CEBAAEBF1FB0C3FE2BC249400279165B9CB5AEBF094271242CC24940	John Garnett House, 38 Newark Street	E1 2AG	0	\N	Newark Street	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1205	0106000020E6100000010000000103000000010000000C0000002A330ED126EEAEBFA703D8C42AC249402516F068E2BEAEBFAF932BE12BC24940E8A67760E2BEAEBFE0FA23E12BC24940AE62A93707BCAEBF2133615129C24940DCCDD5BB1BC5AEBF8512531229C249403157283FD4C3AEBF63059CEC27C24940249968FADFC7AEBFCC9083D027C249401A21295EDDC6AEBFF0AB92E826C24940FE7C9B5BC1E0AEBF2334D73F26C24940D485D914A4E2AEBFC15B7B0428C24940F3E07C773EEBAEBFA436B0D527C249402A330ED126EEAEBFA703D8C42AC24940	Elan Court, 36 Newark Street	E1 2AG	0	\N	Newark Street	36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1206	0106000020E6100000010000000103000000010000000B000000D98A78507BAFAFBFAE0B25B6EEC14940409D1769DD80AFBF1F90E39CEFC14940B5AD1E62987DAFBF8F46947FEBC14940AA6E036ADD8EAFBF794C192AEBC14940881808AB858DAFBF73FD0389E9C14940877226E1E288AFBF0D06D787E9C1494060B567BE7E89AFBF8897A53BE5C149408F313EBA5AA7AFBFA5E5C352E5C14940BCA105AC9AA8AFBF10FED2BCE5C1494053B8E0C241A9AFBFEF6E3432E6C14940D98A78507BAFAFBFAE0B25B6EEC14940	153-157 Commercial Road	E1 1HL	0	\N	Commercial Road	153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1207	0106000020E6100000010000000103000000010000000900000060B567BE7E89AFBF8897A53BE5C1494095B99095E388AFBFC7A1DD82E9C14940EC36F2285189AFBFBE3F8F45EBC14940139A62A08B7DAFBF5466D37FEBC14940ED5350A38B7DAFBFD457D37FEBC149404DA590919E7DAFBF76366310EBC1494085FFB6B3A778AFBF7EB4220BEBC1494038BE2D33A779AFBF5826E32AE5C1494060B567BE7E89AFBF8897A53BE5C14940	153-157 Commercial Road	E1 1HL	0	\N	Commercial Road	153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1208	0106000020E6100000010000000103000000010000000500000085FFB6B3A778AFBF7EB4220BEBC14940CC1C94E9FC66AFBF63A071F8EAC1494084BD0C70FB67AFBF6DB0061EE5C149401598A335A679AFBF57D7B730E5C1494085FFB6B3A778AFBF7EB4220BEBC14940	HBL	E1 1HL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1209	0106000020E61000000100000001030000000100000005000000CC1C94E9FC66AFBF63A071F8EAC14940407E57E19C55AFBFE5500FE6EAC1494091FDCF699C56AFBF44D2CF05E5C14940947F946DFC67AFBF78213218E5C14940CC1C94E9FC66AFBF63A071F8EAC14940	HBL	E1 1HL	0	\N	Commercial Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1210	0106000020E61000000100000001030000000100000009000000D08AA8F9D256AFBF8A1D79ABF0C1494003F147655D40AFBF27376D33F1C1494034F727F3C43FAFBF27A7A896F0C14940BC6EC3F1293CAFBF651C18A9F0C1494032651B738139AFBF4A148B6EEDC14940666CF32FF542AFBF143DCA39EDC14940EB2EC5EB1C42AFBF0C21234CECC14940B4003BC08352AFBFF4502BEFEBC14940D08AA8F9D256AFBF8A1D79ABF0C14940	Peter Best House, 18 Nelson Street	E1 2JP	0	\N	Nelson Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1211	0106000020E61000000100000001030000000100000007000000265F3DC44616AFBF674E2ABAECC14940E171BBFA421BAFBF53BAD50DF2C149408F9EE5A5F804AFBFCA1DA290F2C14940F6736664DA00AFBF27303DDDF1C1494018272BCA5CFBAEBF452B997BEBC14940EB665DF79D14AFBF228640F4EAC14940265F3DC44616AFBF674E2ABAECC14940	Comfort House, 9 Turner Street	E1	0	\N	Turner Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1212	0106000020E61000000100000001030000000100000005000000EB665DF79D14AFBF228640F4EAC14940F3B3FCBE89FBAEBF043CA87AEBC149409092C0FB26FAAEBF4ABEDD0FEAC14940605E2687A613AFBFFE78F390E9C14940EB665DF79D14AFBF228640F4EAC14940	Comfort House, 9 Turner Street	E1	0	\N	Turner Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1213	0106000020E6100000010000000103000000010000000600000091FDCF699C56AFBF44D2CF05E5C1494044A17792AF55AFBFDB1623E6EAC149406138D75E9055AFBF2E96CB9DEBC1494096DA758E884DAFBF984A4C95EBC14940B6C72A4CA74EAFBF105164FDE4C1494091FDCF699C56AFBF44D2CF05E5C14940	Peter Best House, 18 Nelson Street	E1 2JP	0	\N	Nelson Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1214	0106000020E6100000010000000103000000010000000600000096DA758E884DAFBF984A4C95EBC149404790D678A044AFBF609CDF8BEBC149403B1577B5C045AFBFD1C538EBE4C14940BCB48AC8A84EAFBFE67FA5F4E4C14940FC8CAF0E244EAFBF381CEC01E8C1494096DA758E884DAFBF984A4C95EBC14940	Peter Best House, 18 Nelson Street	E1 2JP	0	\N	Nelson Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1215	0106000020E610000001000000010300000001000000050000004790D678A044AFBF609CDF8BEBC1494001286002933BAFBFA84A4B82EBC149408C3C7946B13CAFBF2DA54DEDE4C1494034795EBABE45AFBFC3DDE1F6E4C149404790D678A044AFBF609CDF8BEBC14940	22-26 Nelson Street	E1 2JP	0	\N	Nelson Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1216	0106000020E610000001000000010300000001000000050000008C3C7946B13CAFBF2DA54DEDE4C14940A99623CDA83BAFBFA5500602EBC149409D5A05FDA033AFBF92DC86F9EAC14940193D8178A934AFBFAC24CEE4E4C149408C3C7946B13CAFBF2DA54DEDE4C14940	22-26 Nelson Street	E1 2JP	0	\N	Nelson Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1217	0106000020E610000001000000010300000001000000070000009092C0FB26FAAEBF4ABEDD0FEAC149405534D928EEF3AEBF39A8497DE4C14940318F695D4109AFBF69C53088E4C149409066E57A0009AFBF51C7788DE8C149408BC5E6892602AFBF00957587E8C1494014B235FCB903AFBF3B2F36E0E9C149409092C0FB26FAAEBF4ABEDD0FEAC14940	Comfort House, 9 Turner Street	E1	0	\N	Turner Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1218	0106000020E61000000100000001030000000100000006000000318F695D4109AFBF69C53088E4C1494062777AAEDE11AFBF07E34E91E4C14940D8ED8B040311AFBF29CB159EE9C1494045F300040311AFBFDECD159EE9C14940BA41D8C1EC08AFBF866356C6E9C14940318F695D4109AFBF69C53088E4C14940	Comfort House, 9 Turner Street	E1	0	\N	Turner Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1219	0106000020E61000000100000001030000000100000005000000913ACB0A7219AFBF420E63FFE8C14940D504E27A1F11AFBFE41894F6E8C14940076E57B0DE11AFBF00E54E91E4C14940A9E093FF7B1AAFBF80F56C9AE4C14940913ACB0A7219AFBF420E63FFE8C14940	Comfort House, 9 Turner Street	E1	0	\N	Turner Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1220	0106000020E6100000010000000103000000010000000800000027478478A934AFBFFC0FCEE4E4C14940C8123817A833AFBFF05D8EF9EAC1494099B68E217A33AFBF49CCA6A9EBC1494025296C3BD21CAFBFA433D284EBC149402C21E644C21DAFBFC8BC23EDE7C14940A62E542CB419AFBFD170A9E7E7C14940A9E093FF7B1AAFBF80F56C9AE4C1494027478478A934AFBFFC0FCEE4E4C14940	Comfort House, 9 Turner Street	E1	0	\N	Turner Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1221	0106000020E610000001000000010300000001000000090000004EC08E94E1E5AEBFDD7D0C6FEDC14940ACB5BA4551A4AEBF574E6DF9EEC1494005AB0450A7A4AEBFD39F5B10ECC149401E5E6C45A2A8AEBF5F893813ECC14940C25E7544DCA8AEBFAC5CFC1CEAC149401CBE5DA684C0AEBFB937002EEAC14940341E3BAD5BC0AEBFC364DE90EBC149405D83709C90E2AEBFFA030F98EAC149404EC08E94E1E5AEBFDD7D0C6FEDC14940	28 Nelson Street	E1 2JP	0	\N	Nelson Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1222	0106000020E61000000100000001030000000100000008000000D8E6DA8A01CAAEBF74A4AE00E4C149401BF38FCFD0C9AEBF9DA67969E6C14940547FCCF9BEC9AEBFE08C6DD2E6C1494015A8B88418C6AEBF143F90CEE6C14940C099B423D4C5AEBF14B2DC60E8C149404E739C7F32AFAEBF32AFE648E8C149404082B787F1AFAEBF9BB716E5E3C14940D8E6DA8A01CAAEBF74A4AE00E4C14940	28 Nelson Street	E1 2JP	0	\N	Nelson Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1223	0106000020E61000000100000001030000000100000013000000C5CC59A12BB9AEBF8C0DA000EFC149403E2441ED21BAAEBFED55A324F0C149403F872314B8BDAEBF6A44BB0EF0C1494079EE42BE36BEAEBF8DE63098F0C14940A0B360D962BEAEBFE6BA89C5F0C149403C60AE53A8C0AEBF5B69601BF3C149401F5DD49B59BDAEBFA0EB8736F3C149409252E3A453BEAEBF9E9E4E13F4C149400051812350BAAEBF6B11F02FF4C149404A428CC86FBAAEBFD9BC674FF4C1494090E578EF2EB6AEBFF9C48069F4C14940E7B300CE10B6AEBFC745B84AF4C149407F1B2573BF9EAEBF2FA5DBD8F4C14940945859EA779DAEBFE1CBD872F3C149403A15F74A0999AEBF295EB28DF3C14940DA40508DD896AEBF29A4294DF1C14940B3EF03A4459BAEBF825C5932F1C149409D34DB58129AAEBF3D6065BEEFC14940C5CC59A12BB9AEBF8C0DA000EFC14940	East London Central Synagogue, 30-40 Nelson Street	E1 2JP	0	\N	Nelson Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1224	0106000020E61000000100000001030000000100000012000000AAA4D4403B41ADBFF64B1E6E40C24940F51BBCC56134ADBF31617E6040C2494087B44EAD6E34ADBF91CDB21440C249402C3B1688B10BADBF8E5C7FE93FC249400F0AA7F8FE0BADBF17ECB9223EC24940CAF10271B633ADBF32E3D74C3EC249405731C5CD9334ADBF48E9A93839C24940107396F5D812ADBFA853E51439C24940F392371B3B12ADBF25F7EDB33CC249402B22A7DF1605ADBF761FFEA53CC2494005D5F6160E06ADBF2B1139FA36C24940E1259A412131ADBF39E7E62737C24940591147183731ADBF7F14A2A736C24940263C4EEB4641ADBF41FCA9B836C249401E309C61FC3FADBF4F1B304E3EC249403C908D3A9D42ADBF8486F9503EC2494077A2BBE84142ADBF7B275F6940C24940AAA4D4403B41ADBFF64B1E6E40C24940	59-61	E1 3BG	0	\N	Newark Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1225	0106000020E6100000010000000103000000010000001600000068FD5D58E767ADBF60D7E97D66C24940E435E1EC3850ADBFC0AF3C4368C24940A92BA76F6945ADBF64EE6B6161C249409DE7CD089239ADBFA20B4B4156C249409A3A7A53D92FADBF546A041F4DC249409106F461632AADBF7ECF8FFD47C249409082E76ED925ADBFD9CAA51B48C24940CC9206734C21ADBFA0FD0FD543C24940F71AB8570621ADBFE92B319343C249405112296BB828ADBFB4BB0CA543C24940CD9F67D44D30ADBF4DB7A5B643C24940FDC6BE1ABF37ADBF23C9EAC743C2494067035FC5E33BADBFC1C782E943C24940FF72C8E8AA3EADBFCBB50C1E44C249400C4FA92C9441ADBF75131C5544C24940094D1627FC43ADBF44020CA444C24940A69B8E23C646ADBF9C328BFF44C24940251184EF8E48ADBF05991A7545C24940C915837D894AADBF643478F745C24940A3A708C5464BADBFC545697146C249406E71CA885C4EADBF817F7DFE49C2494068FD5D58E767ADBF60D7E97D66C24940	118 Cavell Street	E1 1AA	0	\N	Cavell Street	118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1226	0106000020E610000001000000010300000001000000090000007462D7AD8C95ADBFDACE5F0E79C24940FCF9DFFA957BADBF5D93997F7AC24940B6310612965AADBF4E424F156CC2494061A6D4315164ADBF32652F856BC24940ABF05CE3C765ADBFDD5469186CC2494008EF2DCBF96BADBF516CA0C16BC24940B71D10C2CC6AADBF885F39276BC2494011A11D88A574ADBF91866C9B6AC249407462D7AD8C95ADBFDACE5F0E79C24940	East London Mail Centre 	E1 1AA	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1227	0106000020E610000001000000010300000001000000100000009CEB6965961AAEBF1DDE39A072C249409F02CB0DAAA4ADBFB8FE675978C24940571DA05BD09BADBF4DA7FDDB73C24940C31AB903CC83ADBFF140D3AC67C2494010AEE95C638EADBFD0E9CF2A67C24940848700A80986ADBFD4844EEE62C24940EA5144DEA6B2ADBF001AA3CA60C249409D49F802E4B9ADBFAF6FC37664C2494060D9D40237CAADBF86A35EAE63C24940BA65B2EF70CBADBFA08BA04D64C24940307050251AD0ADBFA7D0681464C249401A580FA2CAE3ADBFCA147A116EC24940F49FC47123E9ADBFFCA3D6CF6DC249405515C77837EDADBFB25B79E16FC24940CB307E9BFA10AEBF078F742A6EC249409CEB6965961AAEBF1DDE39A072C24940	East London Mail Centre 	E1 1AA	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1228	0106000020E6100000010000000103000000010000000900000025E05D21FE31AEBF95D4CFC16BC2494013F93B65F122AEBFDF5067A86CC24940B0241B65F122AEBFD75267A86CC24940840EBDBF6F25AEBF2C9F539C6DC2494092A7EFC72E1EAEBF42415B076EC249409944E591A818AEBF059FB9CB6BC24940F0A8C43FA11FAEBFAC17E5606BC2494073459424FA2EAEBF527FEB6C6AC2494025E05D21FE31AEBF95D4CFC16BC24940	Urban Bar	E1 1BY	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1229	0106000020E61000000100000001030000000100000006000000B0241B65F122AEBFD75267A86CC2494013F93B65F122AEBFDF5067A86CC2494025E05D21FE31AEBF95D4CFC16BC249407FEA95B03A35AEBFC217AF2F6DC24940A2D2ED5CB726AEBF8A0D83196EC24940B0241B65F122AEBFD75267A86CC24940	Whitechapel	E1 1AA	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1230	0106000020E6100000010000000103000000010000001D000000FF60A8228F16AFBF742F46865DC24940F9AB2CE8C019AFBF1C1311305FC24940BC47FC9BC9E7AEBFE8CD361362C249405C1E59B846EDAEBF6E04AA6264C249409EDB63461BE7AEBF4919D5C064C2494081907C04A6ECAEBF2A52E51267C2494071BD03F6E2BDAEBF792ABDC669C2494002793DBD2DB9AEBFC3FF6BCB67C2494032A8CAAA9CB4AEBFB143FC0E68C249401423E5165AAEAEBFA2BE676C65C249404A584B4B3F84AEBF193855DB67C249404631A4441488AEBFCA8B437869C24940D9D03656F446AEBFDAAEBF3B6DC249409BE0C0E75C39AEBF3624168367C24940803BF44B243FAEBFCB97972D67C24940ACA9D5B8CB53AEBF708107FC65C24940F00E19909057AEBF0D0E2D9267C2494083C521D7A270AEBF06958F2A66C24940E9678ED9A06EAEBFA9FC3C5965C24940DECF170A1378AEBF02618BCB64C249408CA802522E73AEBFF41098B362C24940A2755EDA62AAAEBFC4F64F605FC249407D70423DDAAAAEBFCA50B7935FC24940215475A68FEDAEBF651ED4CE5BC24940C8D6F5FB3CEBAEBF8B4CCACE5AC24940BB2A12AB03D6AEBF60266AAB51C2494047D7D2D5A1F8AEBF0F7652BE4FC24940B234270AEFF9AEBF0F4C576750C24940FF60A8228F16AFBF742F46865DC24940	Royal London Hospital 	E1 1BY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1231	0106000020E610000001000000010300000001000000100000007FEA95B03A35AEBFC217AF2F6DC24940860AFEF89D3BAEBFDE6635CB6FC249409163D3D9C03AAEBF6493959370C249405726147A8423AEBF6E41511772C2494048180D87F11DAEBFF29B95806FC24940542248FC4E1BAEBFB113A0666EC2494000E43F30820FAEBF5CBAEC7769C24940C6B11F01A317AEBF7C355EFB68C24940F633DF91CD1DAEBFFBD7E37C6BC24940ACD3DAE5E118AEBFE6204BC86BC2494038800EBDE118AEBF18924DC86BC2494097721FC52E1EAEBFEF0D5A076EC24940C9DBBFDC2D1EAEBFC195F7066EC24940C4B35C1C8C25AEBF9122B19A6DC24940A2D2ED5CB726AEBF8A0D83196EC249407FEA95B03A35AEBFC217AF2F6DC24940	Whitechapel	E1 1BY	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1232	0106000020E6100000010000000103000000010000000B00000048180D87F11DAEBFF29B95806FC249405726147A8423AEBF6E41511772C249409CEB6965961AAEBF1DDE39A072C24940AAB127B4AC14AEBF723F670A70C24940D7CCAB4F4710AEBFA89F0D336EC24940FE1AFB211D0BAEBF900748096CC24940ECCBE559E901AEBFDE645E816AC24940037FFEBB6F0CAEBF1C5BB7E767C2494000E43F30820FAEBF5CBAEC7769C2494026E35934820FAEBF7660EE7769C2494048180D87F11DAEBFF29B95806FC24940	East London Mail Centre 	E1 1AA	0	\N	Whitechapel Road		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1233	0106000020E61000000100000001030000000100000017000000FF60A8228F16AFBF742F46865DC24940B234270AEFF9AEBF0F4C576750C24940D3E23B4C1F11AFBF7CDC8E244FC249400B3FA4704C10AFBFCE7A06A84EC24940A92D72F8BC27AFBFDEF258714DC24940D760A6D7DF22AFBF955CA2364BC24940C2EC29208F30AFBFB5B1B17C4AC24940E12530B65F32AFBF90C3A3514BC24940F95B4163C83CAFBF7A7535C44AC24940338308C4EF41AFBF7F25F3204DC24940C01CF63D664DAFBF8BC232854CC249405B6286741351AFBF6D7D9A344EC2494022DB0E2EF446AFBF1B9F23BE4EC24940BF09705B3A4AAFBFC2EA2B5150C24940E940A271694DAFBFB250832C50C24940BA3DB292EA5FAFBF58932B3A58C249404E5967CA4066AFBF4EDF7DDF57C249404B7CEB34D36AAFBF7CE3DDDC59C24940EA1B3D9F6962AFBFD05E3F555AC2494076C9544DBF65AFBF9BC8EFBF5BC2494066B4CA0CD329AFBF907C39435FC249404E3B64EFE223AFBF855760C35CC24940FF60A8228F16AFBF742F46865DC24940	Royal London Hospital	E1 2AG	0	\N	Turner Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1234	0106000020E6100000010000000103000000010000000A000000D9792ED7F7EDAFBFD3B4DCB049C24940A5CEF9FDF9EEAFBF036AE92D4AC24940D332A7D7F5C9AFBFEEAF202E4CC2494009987A9817C9AFBFD73CA8C24BC2494024D197CF89CBAFBFEF867CA04BC24940FC8561493BCCAFBF0CD26EED4BC249403A2F60E4E4DEAFBF82B1EFE74AC24940E40553D55FDDAFBF12F80C3D4AC2494091617F0EFBECAFBFCAEAA04B49C24940D9792ED7F7EDAFBFD3B4DCB049C24940	Ambrose King Centre and Grahame Hayton Unit	E1	0	\N	Mount Terrace		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1235	0106000020E6100000010000000103000000010000000E0000007500C1BA5EDAAEBFDF04B45B46C24940F92D75B62FD0AEBF73F849F446C24940DC5185D73DCEAEBFF17C582546C2494011B4B9B83FC8AEBF93BE227F46C24940ECDF00B962C0AEBFEF6A6A3A43C249400FC13B112AC5AEBFBFA0D0F242C249403DBD0D5E52BDAEBF98774BB03FC249401FEB4EC97EC8AEBF58B8E0083FC24940923F688AFCCCAEBF0A8FC8E640C24940190C60C0D1D2AEBF4C24638F40C249409462837643DEAEBFFFEB235145C249408811F0820FD9AEBFE620199F45C24940DE855A7E98D8AEBF3BDB1E9F45C249407500C1BA5EDAAEBFDF04B45B46C24940	St Philip's House	E1 2AG	0	\N	Stepney Way		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1236	0106000020E6100000010000000103000000010000000700000005A3B243A00DAFBF2D70EB7A2AC2494041C0FEDB720BAFBF6418AD6828C24940FE0813B3950EAFBFB5C6BD5428C2494043B786FB900DAFBFC8B6C94427C2494018E76CC47613AFBF3C38B02127C249407822A891A416AFBF7F8112442AC2494005A3B243A00DAFBF2D70EB7A2AC24940	64 Turner Street	E1	0	\N	Turner Street	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1237	0106000020E610000001000000010300000001000000050000007822A891A416AFBF7F8112442AC2494018E76CC47613AFBF3C38B02127C249400045F17E3A1BAFBF252E7AF326C2494007373CDFFD1DAFBFE7DD5E172AC249407822A891A416AFBF7F8112442AC24940	64 Turner Street	E1	0	\N	Turner Street	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1238	0106000020E61000000100000001030000000100000005000000FD0F12D92904AFBF59647AB42AC249403705C95F2402AFBF067ED5A328C2494041C0FEDB720BAFBF6418AD6828C2494005A3B243A00DAFBF2D70EB7A2AC24940FD0F12D92904AFBF59647AB42AC24940	30 Newark Street	E1 2AG	0	\N	Newark Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1239	0106000020E610000001000000010300000001000000070000003705C95F2402AFBF067ED5A328C24940FD0F12D92904AFBF59647AB42AC24940A330C5FB26FAAEBFE68B5FF12AC249402163972324F8AEBF4DA767E328C249401AD4F72DBBF7AEBF006F2D7828C24940BFC8FE432AF8AEBFE8B640E328C249403705C95F2402AFBF067ED5A328C24940	32 Newark Street	E1 2AG	0	\N	Newark Street	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1240	0106000020E610000001000000010300000001000000080000001AD4F72DBBF7AEBF006F2D7828C249402163972324F8AEBF4DA767E328C24940A330C5FB26FAAEBFE68B5FF12AC2494086A135AA9AEEAEBFFFD39D372BC249402B9966AB23EEAEBF29F2EAC42AC24940F4853A2119EBAEBF904B7BD627C24940DF10092FC5F6AEBF9823108B27C249401AD4F72DBBF7AEBF006F2D7828C24940	34 Newark Street	E1 2AG	0	\N	Newark Street	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1241	0106000020E61000000100000001030000000100000005000000B9F2E99B43A1AEBFB39091F02CC24940F643103C249FAEBF09C625FE2AC24940C89FE3B6DEAAAEBF0A3583AE2AC24940CEB8FABE13ADAEBF37F35BA02CC24940B9F2E99B43A1AEBFB39091F02CC24940	40 Newark Street	E1 2AG	0	\N	Newark Street	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1242	0106000020E61000000100000001030000000100000008000000A10F589E9BFEAEBFFC43D0DC07C24940E6F6120BAC04AFBF890193330EC24940126D60533A03AFBF2CCD1A880EC24940B4A7B07A8CE3AEBFBF1223380FC249409D46839611DFAEBFEBDC1C360AC24940756BC7279CDDAEBF14BAAD9408C24940E08626A5EAEDAEBF7987D13908C24940A10F589E9BFEAEBFFC43D0DC07C24940	28 Turner Street	E1	0	\N	Turner Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1243	0106000020E61000000100000001030000000100000007000000289951E9A45BAFBF166B9EA20CC2494084085ACF2059AFBFCD1A39A609C249404CD68591405CAFBF6DA7D39509C24940138484699463AFBF04705E6F09C249408D5BD0D32564AFBF72F8F50A0AC2494066BD53097C66AFBF8423CD690CC24940289951E9A45BAFBF166B9EA20CC24940	18 Walden Street	E1 2AG	0	\N	Walden Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1244	0106000020E610000001000000010300000001000000050000002EB05776F64EAFBF9E2F93DB09C24940682BAD7F7A51AFBF6D57E6D70CC249403AFF4EA5A945AFBFB83DD4150DC2494063B84EAF2543AFBFF83096190AC249402EB05776F64EAFBF9E2F93DB09C24940	22 Walden Street	E1 2AG	0	\N	Walden Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1245	0106000020E6100000010000000103000000010000000600000063B84EAF2543AFBFF83096190AC249403AFF4EA5A945AFBFB83DD4150DC24940C30AD0C8C73BAFBF4BAA9F490DC24940F68193B35B3AAFBF564BF4980BC249404834B1BB4439AFBF0FD36E4D0AC2494063B84EAF2543AFBFF83096190AC24940	24 Walden Street	E1 2AG	0	\N	Walden Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1246	0106000020E6100000010000000103000000010000000500000069471EB51E98AFBFF45EDACB08C249405B94119E769AAFBFEE4D652C0BC24940945C1EE25391AFBFD0DC2E640BC249408CF49F45FC8EAFBFD084F00309C2494069471EB51E98AFBFF45EDACB08C24940	6 Walden Street	E1 2AG	0	\N	Walden Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1247	0106000020E6100000010000000103000000010000000500000029BA54038DB5AFBF3F4CD0890AC249408604A94F42ACAFBF7C8AB9BF0AC24940F5F731E8B0AAAFBF5EE9D01009C2494058D081EBCBB3AFBFE72A71DE08C2494029BA54038DB5AFBF3F4CD0890AC24940	34 New Road	E1 1HL	0	\N	New Road	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1248	0106000020E61000000100000001030000000100000005000000BBE1665306A3AFBFD37A1DF80AC2494085B362C07BA1AFBF112DC14309C24940F5F731E8B0AAAFBF5EE9D01009C249408604A94F42ACAFBF7C8AB9BF0AC24940BBE1665306A3AFBFD37A1DF80AC24940	34 New Road	E1 1HL	0	\N	New Road	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1249	0106000020E610000001000000010300000001000000070000003F5E62C07BA1AFBFB22CC14309C24940FB5762C07BA1AFBFAB2CC14309C24940D40F03C0DEA0AFBF5446209608C249406649797031A0AFBF87FF75D607C249402EDE24CCEAC3AFBFCE75D31007C249405013041E35C5AFBF44991E7E08C249403F5E62C07BA1AFBFB22CC14309C24940	34 New Road	E1 1HL	0	\N	New Road	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1250	0106000020E6100000010000000103000000010000000400000085B362C07BA1AFBF112DC14309C249403F5E62C07BA1AFBFB22CC14309C249405013041E35C5AFBF44991E7E08C2494085B362C07BA1AFBF112DC14309C24940	34 New Road	E1 1HL	0	\N	New Road	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1251	0106000020E610000001000000010300000001000000060000006649797031A0AFBF87FF75D607C24940CC0D18F0EB9FAFBF364E998907C24940D54C9B3AD99EAFBF31A8CB5906C24940CFC7089492C2AFBFAB29299405C249402EDE24CCEAC3AFBFCE75D31007C249406649797031A0AFBF87FF75D607C24940	1 Varden Street	E1 2JP	0	\N	Varden Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1252	0106000020E610000001000000010300000001000000070000005B94119E769AAFBFEE4D652C0BC2494069471EB51E98AFBFF45EDACB08C24940D40F03C0DEA0AFBF5446209608C249408CCF1DC07BA1AFBF8D2EC14309C2494085B362C07BA1AFBF112DC14309C24940BBE1665306A3AFBFD37A1DF80AC249405B94119E769AAFBFEE4D652C0BC24940	4 Walden Street	E1 2AG	0	\N	Walden Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1253	0106000020E610000001000000010300000001000000050000008CF49F45FC8EAFBFD084F00309C24940945C1EE25391AFBFD0DC2E640BC249407EDB7486BE89AFBF5EC27D920BC2494004846D296787AFBFE7FD7E3209C249408CF49F45FC8EAFBFD084F00309C24940	8 Walden Street	E1 2AG	0	\N	Walden Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1254	0106000020E6100000010000000103000000010000000500000004846D296787AFBFE7FD7E3209C249407EDB7486BE89AFBF5EC27D920BC2494071C0BB2DAB81AFBF04EFCDC30BC24940C9AC4914547FAFBF54DE126409C2494004846D296787AFBFE7FD7E3209C24940	10 Walden Street	E1 2AG	0	\N	Walden Street	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1255	0106000020E61000000100000001030000000100000005000000C9AC4914547FAFBF54DE126409C2494071C0BB2DAB81AFBF04EFCDC30BC249409C3F20223879AFBF326966F70BC24940E420644FE176AFBF942EF29709C24940C9AC4914547FAFBF54DE126409C24940	12 Walden Street	E1 2AG	0	\N	Walden Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1256	0106000020E61000000100000001030000000100000005000000E420644FE176AFBF942EF29709C249409C3F20223879AFBF326966F70BC24940156C606B6F6FAFBF7D2925330CC24940945585EA186DAFBF5CF502D409C24940E420644FE176AFBF942EF29709C24940	14 Walden Street	E1 2AG	0	\N	Walden Street	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1257	0106000020E61000000100000001030000000100000005000000945585EA186DAFBF5CF502D409C24940156C606B6F6FAFBF7D2925330CC2494066BD53097C66AFBF8423CD690CC24940926706D32564AFBF8AFBF50A0AC24940945585EA186DAFBF5CF502D409C24940	16 Walden Street	E1 2AG	0	\N	Walden Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1258	0106000020E61000000100000001030000000100000009000000E171BBFA421BAFBF53BAD50DF2C14940265F3DC44616AFBF674E2ABAECC14940919D39E15227AFBF7FE9F55AECC149407E49ECF2BA27AFBFFDDAE8D3ECC149402E1C23382632AFBF02D3119CECC14940EFA017CEA431AFBF6571AA05ECC14940FA696B803C38AFBFC74C55E2EBC14940FD2E9424AB3CAFBF1E24CD49F1C14940E171BBFA421BAFBF53BAD50DF2C14940	22-26 Nelson Street	E1 2JP	0	\N	Nelson Street	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1259	0106000020E6100000010000000103000000010000000B000000AB8B28E79CCDAEBF83F4376DE6C14940046F78EE9FC9AEBFCC704969E6C14940D8E6DA8A01CAAEBF74A4AE00E4C1494026E3D54B15DEAEBFC7667A14E4C149407A424B2F66DEAEBFF8C2C522E6C149405D83709C90E2AEBFFA030F98EAC149403C1DC6A2E7CAAEBFBBD22744EBC14940BE15D2A96DC8AEBF596998A1E9C14940C69A257247CFAEBF23A6F660E9C14940E2A6176DDDCDAEBF75538ADFE6C14940AB8B28E79CCDAEBF83F4376DE6C14940	28 Nelson Street	E1 2JP	0	\N	Nelson Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1260	0106000020E610000001000000010300000001000000080000001B7DBBDBB0C1AEBFC90536FCF3C149403C60AE53A8C0AEBF5B69601BF3C1494079EE42BE36BEAEBF8DE63098F0C1494028760C742DC5AEBF29CF2F72F0C1494064BE963C76C6AEBF9E62C0BAF1C14940F6E79A4A12C9AEBF3A29F1AAF1C149407B28B38934CBAEBFC6A34EBAF3C149401B7DBBDBB0C1AEBFC90536FCF3C14940	28 Nelson Street	E1 2JP	0	\N	Nelson Street	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1261	0106000020E6100000010000000103000000020000000C000000AE4C221D7AD5AFBF36C332141AC24940A7EEAB07008BAFBF3CD9838C1BC249402B74B16B7F88AFBF6CA3D87618C24940C5FAB66B7F88AFBF3BAAD87618C2494083CC37739082AFBF782F949B18C24940E2D5B182187AAFBFF2A0741610C2494059826580A28DAFBFFF9D7E9D0FC24940057A4A81A28DAFBF3BB87F9D0FC249408E2C4A85A38DAFBFC433C09E0FC249401681B3E1398DAFBF8AE6871C0FC24940DE886497C5C9AFBF8D8F9AEA0DC24940AE4C221D7AD5AFBF36C332141AC2494004000000F1BB6F08AE82AFBF2FD8E34A11C249405B2ADF4EAB82AFBF49F5874711C24940F852D74EAB82AFBF72F5874711C24940F1BB6F08AE82AFBF2FD8E34A11C24940	Bio Enterprises Queen Mary Innovation Centre, 42 New Road	E1 1HL	0	\N	New Road	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1263	0106000020E610000001000000010300000001000000050000009D5144E3D2D8B1BFD384B4C4A2C149404EE2D1EAEEC7B1BFD842A68CA4C14940D049F96F93AEB1BFF100CD8E94C149402A9CBD55BDBFB1BF2AC2E1E992C149409D5144E3D2D8B1BFD384B4C4A2C14940	Goodman's Fields	E1 8GH	0	\N	Leman Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1264	0106000020E6100000010000000103000000010000000C0000002A9CBD55BDBFB1BF2AC2E1E992C14940D01BD30A97B1B1BF8865E24494C1494076E13A42E2A6B1BFA710A38B8CC149406BD4CC975F9BB1BF653EA64B8DC14940B8C147A3AC9AB1BFAD2735D48CC14940566329924C9BB1BFE65308B88CC14940A4A3F401B59BB1BF8C9FEC428CC14940614924F91599B1BFDB313CC889C149403FED31F6809AB1BFE0489C0689C14940D2EC3754C3ABB1BF0AD0743F87C14940184B8351B5ADB1BF71005F8887C149402A9CBD55BDBFB1BF2AC2E1E992C14940	Sugar House, 99 Leman Street	E1 8GH	0	\N	Leman Street	99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1265	0106000020E610000001000000010300000001000000050000003B253EE9D78CB1BF36CCE0BC7AC14940CFFA68B4FF95B1BFDCA32A3779C149400FDC06F9FE97B1BF99211B747AC1494014DAE8E3958EB1BFE2FE28DA7BC149403B253EE9D78CB1BF36CCE0BC7AC14940	Bon Appetit, 133 Leman Street	E1 8EY	0	\N	Leman Street	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1266	0106000020E61000000100000001030000000100000005000000F8DB5CB7FC94B1BF6DCC021A83C14940C1F4F8947699B1BF7D49C31586C149404A02258A0E95B1BFFD3C227C86C149409B109DCCFE90B1BF973D459283C14940F8DB5CB7FC94B1BF6DCC021A83C14940	East Central Lock and Safe, 13 Hooper Street	E1 8BP	0	\N	Hooper Street	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1267	0106000020E610000001000000010300000001000000050000002BCEF0993299B1BF95C8F6A382C14940B725AF95929DB1BF13D14AB685C14940C1F4F8947699B1BF7D49C31586C14940F8DB5CB7FC94B1BF6DCC021A83C149402BCEF0993299B1BF95C8F6A382C14940	Mr	E1 8BP	0	\N	Hooper Street	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1268	0106000020E61000000100000001030000000100000006000000DE27D1AC7F9FB1BFE5BC0F1C84C14940B47BD6643BA6B1BF2A014C4783C149401DC6D16010A8B1BF541B056A84C14940A6B3804F4AA7B1BF22D386D484C14940C9C23EBB3FA1B1BFF3B7E16085C14940DE27D1AC7F9FB1BFE5BC0F1C84C14940	Taxi Loans, 119 Leman Street	E1 8EY	0	\N	Leman Street	119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1269	0106000020E61000000100000001030000000100000006000000CCAB2553BC9DB1BFEE4ADAD482C149402BCEF0993299B1BF95C8F6A382C149407CF0FF822998B1BFAAF564FA81C1494074182756F1A1B1BFE0259C9E80C14940FD563D6920A4B1BFA2632EF981C14940CCAB2553BC9DB1BFEE4ADAD482C14940	Maya City, 123 Leman Street	E1 8EY	0	\N	Leman Street	123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1270	0106000020E61000000100000001030000000100000005000000E611BA123C96B1BF13ADC1BE80C14940B5142FC0E39FB1BF043CCC587FC1494074182756F1A1B1BFE0259C9E80C149407CF0FF822998B1BFAAF564FA81C14940E611BA123C96B1BF13ADC1BE80C14940	Wine Tiers, 125 Leman Street	E1 8EY	0	\N	Leman Street	125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1271	0106000020E610000001000000010300000001000000050000005E5B01803B94B1BFC5D8E0767FC1494070E026C8DD9DB1BF35F0B4177EC14940B5142FC0E39FB1BF043CCC587FC14940E611BA123C96B1BF13ADC1BE80C149405E5B01803B94B1BFC5D8E0767FC14940	Long Shot, 127 Leman Street	E1 8EY	0	\N	Leman Street	127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1272	0106000020E610000001000000010300000001000000050000002BCEF0993299B1BF95C8F6A382C14940CCAB2553BC9DB1BFEE4ADAD482C14940C9C23EBB3FA1B1BFF3B7E16085C14940B725AF95929DB1BF13D14AB685C149402BCEF0993299B1BF95C8F6A382C14940	Taxi Loans, 119 Leman Street	E1 8EY	0	\N	Leman Street	119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1273	0106000020E61000000100000001030000000100000005000000042C722F5B92B1BFC061A2437EC1494015967FCDC29BB1BF2A4097C97CC1494070E026C8DD9DB1BF35F0B4177EC149405E5B01803B94B1BFC5D8E0767FC14940042C722F5B92B1BFC061A2437EC14940	Perfect Fried Chicken, 129 Leman Street	E1 8EY	0	\N	Leman Street	129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1274	0106000020E6100000010000000103000000010000000500000028E97E928F90B1BFCACCA11D7DC14940625C2920E799B1BF8F2FB7A27BC1494015967FCDC29BB1BF2A4097C97CC14940042C722F5B92B1BFC061A2437EC1494028E97E928F90B1BFCACCA11D7DC14940	Scissor City, 131 Leman Street	E1 8EY	0	\N	Leman Street	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1275	0106000020E6100000010000000103000000010000000600000014DAE8E3958EB1BFE2FE28DA7BC1494014DAE8E3958EB1BFE2FE28DA7BC149400FDC06F9FE97B1BF99211B747AC14940625C2920E799B1BF8F2FB7A27BC1494028E97E928F90B1BFCACCA11D7DC1494014DAE8E3958EB1BFE2FE28DA7BC14940	Bon Appetit, 133 Leman Street	E1 8EY	0	\N	Leman Street	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1276	0106000020E61000000100000001030000000100000005000000B47BD6643BA6B1BF2A014C4783C14940DE27D1AC7F9FB1BFE5BC0F1C84C14940CCAB2553BC9DB1BFEE4ADAD482C14940FD563D6920A4B1BFA2632EF981C14940B47BD6643BA6B1BF2A014C4783C14940	Leman's, 121 Leman Street	E1 8EY	0	\N	Leman Street	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1277	0106000020E61000000100000001030000000100000005000000CFFA68B4FF95B1BFDCA32A3779C149403B253EE9D78CB1BF36CCE0BC7AC149403F94FE1B9A8AB1BF9095D44D79C14940FD9AACF39893B1BFC54213BA77C14940CFFA68B4FF95B1BFDCA32A3779C14940	Atkins Mcleod, 135 Leman Street	E1 8EY	0	\N	Leman Street	135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1278	0106000020E61000000100000001030000000100000009000000FD9AACF39893B1BFC54213BA77C14940D707F26FC28BB1BFDC29E01979C149407E709EEB1B86B1BF2EF2707C79C14940D485166D2785B1BFCE4A070B78C14940B7C63A375982B1BF0AA12FEE77C14940415FA1B3D981B1BF48333B8B76C149407E0CA7527E8BB1BFED96C7AB75C14940A4D833013D90B1BFDD74D43D75C14940FD9AACF39893B1BFC54213BA77C14940	Red Chilli, 137 Leman Street	E1 8EY	0	\N	Leman Street	137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1279	0106000020E61000000100000001030000000100000009000000A4D833013D90B1BFDD74D43D75C1494000459635B582B1BF53B95C7776C149402F504F4CF181B1BF0D1718B175C14940E28B0F759180B1BF9DCAB3CD75C14940E2EF8144017EB1BFB682C1FC73C14940688549811E87B1BF4E04533073C149407BB4B674D586B1BFF45E806E72C14940BFE369DA558BB1BF5047351772C14940A4D833013D90B1BFDD74D43D75C14940	The Brown Bear, 139 Leman Street	E1 8EY	0	\N	Leman Street	139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1280	0106000020E61000000100000001030000000100000005000000BFE369DA558BB1BF5047351772C1494079D98478467DB1BFEF91DB2773C1494032120204447BB1BF3B04127371C149409BDB064C4688B1BFE3A5687170C14940BFE369DA558BB1BF5047351772C14940	The Empress, 141 Leman Street	E1 8EY	0	\N	Leman Street	141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1281	0106000020E610000001000000010300000001000000050000009BDB064C4688B1BFE3A5687170C14940E2FD78446B7CB1BF85213A5C71C14940FEACDCB4267BB1BF54B0AFE46FC1494090E2614A2986B1BF84B9333C6FC149409BDB064C4688B1BFE3A5687170C14940	Atkins Mcleado, 143 Leman Street	E1 8EY	0	\N	Leman Street	143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1282	0106000020E61000000100000001030000000100000007000000FEACDCB4267BB1BF54B0AFE46FC14940E2FD78446B7CB1BF85213A5C71C1494032120204447BB1BF3B04127371C1494079D98478467DB1BFEF91DB2773C14940DA298D4C976CB1BF1B4B87F573C14940D8DEA3C39F6BB1BF4D3C34D770C14940FEACDCB4267BB1BF54B0AFE46FC14940	Atkins Mcleado, 143 Leman Street	E1 8EY	0	\N	Leman Street	143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1283	0106000020E610000001000000010300000001000000070000002CF859579822B1BFC770FBC572C14940728CF0ED0E22B1BFCA50211E71C14940CE443089D066B1BF3C83D17E6FC14940AFC6494B7566B1BFC15E4FCC70C149406D28AC990C4DB1BFAED4FE6E71C149405C7D8758814CB1BFCE95230B72C149402CF859579822B1BFC770FBC572C14940	Highway Motors	E1 0AY	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1284	0106000020E61000000100000001030000000100000005000000FFDDFCEC3B89B1BF230E8CE86AC14940FA49C24A1387B1BF6AED23406AC14940FEA64C99458BB1BF6CF0BF1C6AC1494075C3961A588BB1BF23E0B8E76AC14940FFDDFCEC3B89B1BF230E8CE86AC14940	Atkins Mcleado, 143 Leman Street	E1 8EY	0	\N	Leman Street	143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1286	0106000020E61000000100000001030000000200000008000000F4111573FCDDB1BFDC6E1F5C71C149402CAF115149E9B1BFCE8058BD7EC1494076A71FD3EAB9B1BF9FFFCE9882C149409DA268A247B6B1BF6D48993C82C14940F91F48F001A5B1BF61E1C91277C149405198CD173AB1B1BF84C82D3775C14940FC66DDA33CB2B1BFC376A9EA74C14940F4111573FCDDB1BFDC6E1F5C71C149400500000053D2BD1BA9DCB1BFC7CE3FC279C1494037242533D9D9B1BF5B010AA076C149406346C2AB04BAB1BFB43DD26779C14940B248AD07D6BEB1BF3DAAB4647CC1494053D2BD1BA9DCB1BFC7CE3FC279C14940	1 Prescot Street	E1 8AZ	0	\N	Prescot Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1287	0106000020E610000001000000010300000001000000050000002163C82BDAEBB1BFE71C1BDA7BC14940B83AFB6CB6EDB1BFD81B68D27DC149403FFE7432DFE8B1BF38DFB23F7EC149407410DB502AE7B1BF53B36C3A7CC149402163C82BDAEBB1BFE71C1BDA7BC14940	7 Prescot Street	E1 8AZ	0	\N	Prescot Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1288	0106000020E61000000100000001030000000100000009000000F61B8E45E503B2BFAAAE1E2C6FC14940ABD375C8C606B2BF952315E072C149404DF2B2474B0DB2BF096D90837BC149402588F128ECEDB1BFE638C63E7EC14940B83AFB6CB6EDB1BFD81B68D27DC149402163C82BDAEBB1BFE71C1BDA7BC1494049E151E3ECE2B1BFC0FE593371C1494053EC9A6F3D03B2BF092F74356EC14940F61B8E45E503B2BFAAAE1E2C6FC14940	9 Prescot Street	E1 8AZ	0	\N	Prescot Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1289	0106000020E61000000100000001030000000100000005000000ABD375C8C606B2BF952315E072C1494018F8D35A0604B2BF8FECC4186FC14940074371CF5516B2BF1A7DA18F6DC14940E7FDE2867419B2BF020BB85771C14940ABD375C8C606B2BF952315E072C14940	Princess Of Prussia, 15 Prescot Street	E1 8AZ	0	\N	Prescot Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1290	0106000020E6100000010000000103000000010000000B0000004DF2B2474B0DB2BF096D90837BC149404AD1B4109209B2BFD502259476C1494066342267590CB2BFEDCB7C5776C14940E0C13444A20BB2BF963DCA5B75C14940811B23004D0DB2BF05D4DD4175C149400C6586C1C611B2BF3EDFE32A7BC14940634E746A8810B2BFA3B69C447BC149407CC4DF975810B2BF9A1C4B607BC14940AAB4814BEC0EB2BF7BE6A27F7BC14940C02B4F9A930EB2BF7FAB486B7BC149404DF2B2474B0DB2BF096D90837BC14940	Princess Of Prussia, 15 Prescot Street	E1 8AZ	0	\N	Prescot Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1291	0106000020E61000000100000001030000000100000005000000BBE87C1E8E22B2BF2BDD1FF979C14940221829B2E311B2BF84FA8F487BC14940811B23004D0DB2BF05D4DD4175C14940F130CB5B4A1DB2BF358975F373C14940BBE87C1E8E22B2BF2BDD1FF979C14940	Cafe Spice Namaste, 16 Prescot Street	E1 8AZ	0	\N	Prescot Street	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1292	0106000020E6100000010000000103000000010000000A000000D26C16A9681DB2BF293DC21871C149400D4252C0042DB2BFD61FED896FC14940780E06654530B2BF1AA3DB3473C1494039AFFEF46A45B2BF80746E8A71C14940FE202882A346B2BF2F32751573C14940D7674F28D64BB2BFE7FBD9A072C14940A0FD8A83BD4EB2BFFAC82D1076C14940549D0905C227B2BF9280D07579C149409DF35614BE23B2BF10136F0179C14940D26C16A9681DB2BF293DC21871C14940	Royal College of Psychiatrists, 21 Prescot Street	E1 8AZ	0	\N	Prescot Street	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1293	0106000020E61000000100000001030000000100000007000000A0FD8A83BD4EB2BFFAC82D1076C14940D13053E1534CB2BFE930923573C149406E15CD01FC4FB2BF91F212F872C149409A862141A74FB2BFCEC58B8672C1494011CB11A5E051B2BF7C95135F72C14940FF06CAD27E54B2BFC619078E75C14940A0FD8A83BD4EB2BFFAC82D1076C14940	23 Prescot Street	E1 8AZ	0	\N	Prescot Street	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1294	0106000020E61000000100000001030000000100000009000000D9B93FD68D27B2BF865117B36BC14940E85468342339B2BF7F2EFA0A6AC14940E75511959C3BB2BF4906FCBE6CC14940D73BD563793CB2BFC82CFDB66CC1494081AC015B873DB2BFD0DAB30B6EC14940F5B7244B032AB2BF0E0FB9D66FC149407815C66A6628B2BF37415E0B6EC1494008B82EC45329B2BF2296B2F96DC14940D9B93FD68D27B2BF865117B36BC14940	66-67	E1 8BL	0	\N	Chamber Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1295	0106000020E61000000100000001030000000100000013000000D1D13750535BB2BF5567476967C14940DEEF2A52E85EB2BFE475A38A6BC149406CEDB17C925AB2BF5F2540F76BC149406E89BAE5785CB2BF6FBADB316EC14940FD36D97DFF5CB2BF785EB3266EC14940E406733A6C5DB2BF692585936EC1494005EA8F48ED5CB2BF488931A16EC149405A9A244C405EB2BF132A4E6770C14940FBB19BBFC666B2BF484874D26FC1494000FBC9E85F6AB2BFCB49CAC273C14940FF06CAD27E54B2BFC619078E75C149409707EC268F4FB2BF2FD3A4D26FC14940E6238AE5E14EB2BFA2FB1FD66FC14940BE856BDB9C4EB2BFCEE1B9646FC14940F7B657A43B4FB2BF77AF68526FC14940A0EF9519574DB2BF9D8EBD016DC149407D479D7B2841B2BF619CD0FA6DC149400DDDCC8E4B3DB2BF8AEC5E8A69C14940D1D13750535BB2BF5567476967C14940	Premier Inn, 24 Prescot Street	E1 8BB	0	\N	Prescot Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1296	0106000020E61000000100000001030000000100000009000000D1D13750535BB2BF5567476967C149405A3AA7742C64B2BF78130DA466C149408A4512917364B2BFB936F0FC66C1494044B56CA38F65B2BF95808EF066C1494007D0587D3766B2BFACBF38E767C14940D2E76BB72A65B2BF5F85A2F867C14940F890B5429067B2BFABBD88DD6AC14940DEEF2A52E85EB2BFE475A38A6BC14940D1D13750535BB2BF5567476967C14940	Premier Inn, 24 Prescot Street	E1 8BB	0	\N	Prescot Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1297	0106000020E6100000010000000103000000010000001200000000FBC9E85F6AB2BFCB49CAC273C149401FD35DDC6166B2BF8366C1726FC1494021F9E0F98A62B2BFA479A3C46FC149400CA6DA54F35FB2BFE9C6EA306FC149408A3195FCFE5EB2BFEE3718216EC14940430E51BDF15FB2BFB3DD46156DC149403DFF98EAB863B2BFBB6A35B66CC14940F82DCA138E62B2BF0E18B2416BC14940284526A88D73B2BF246B93FC69C149405BA8B5813E7BB2BF432CE48E72C14940535A182C8678B2BF1F3409C472C149400F72840A3F78B2BF7AB6902573C1494053BB4482EB77B2BFE23FBF5F73C1494077C5F46BA16FB2BF8FF2871274C1494019C57A35566EB2BF4F80861E74C149403BCCDD3D6E6DB2BF2A9877F073C14940388EAAFDF76CB2BFA043319773C1494000FBC9E85F6AB2BFCB49CAC273C14940	English Martyrs	E1 8AZ	0	\N	Prescot Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1298	0106000020E610000001000000010300000001000000070000000E8330352F7BB2BFD81EDC8972C1494034C59534A878B2BF5D9EBFAC6FC14940B5AAEF2CC779B2BF2F6693976FC1494020A8FD7B9D78B2BFBF5B48126EC14940FDEFB0B0047CB2BFCE7330C16DC1494012DA3517DF7FB2BF3F82F92972C149400E8330352F7BB2BFD81EDC8972C14940	30 Prescot Street	E1 8AZ	0	\N	Prescot Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1299	0106000020E6100000010000000103000000010000000500000012DA3517DF7FB2BF3F82F92972C14940FCC48DBB8478B2BF8ED061A969C14940E652472DA87BB2BF7A5B4E4E69C14940A84376BD2286B2BFDFCFFE9771C1494012DA3517DF7FB2BF3F82F92972C14940	30 Prescot Street	E1 8AZ	0	\N	Prescot Street	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1300	0106000020E610000001000000010300000001000000230000007D45381DC96FB2BFEE4C040E78C149405EE1D22F0172B2BF9342EBDE7AC14940D051612A3A74B2BFBEBC59BC7AC149405276D0803A75B2BF632C6CF87BC14940364F49C7F576B2BF6E19D2D47BC149407BD339DFA781B2BFFB0EC51880C149405B6613936676B2BF08D02E0081C14940ACF591259D76B2BF11D7BE6281C14940D90DFAA78075B2BF199D077481C14940E02DBA9AB075B2BF4A74072582C1494053D4F34F1C67B2BFAAD3E02283C14940EE6A7DAFAC66B2BFD6AC2A7B82C1494063AD2E219364B2BF7E34FE9D82C1494051A5AC5A2165B2BFFB79C44F83C14940371EED6BBA44B2BFE3C79BE185C14940EE8446C60C44B2BFDB47932F85C1494045CEEDD43541B2BF8E85A75A85C149406A7F63D2E141B2BFEDFA4B2086C149402E9B2A11AD32B2BF992C0F4487C149402AFEDDC3FD31B2BF2193A2A586C149409FD7E005B42AB2BF8244A61F87C149403593FB18EF26B2BF1096494D82C14940F035D0ADA32AB2BF6DE8681082C14940AAD49D796929B2BFECFBFD9880C14940A03447B6C22BB2BF8559E16C80C149406AB2BB70A829B2BFC7E4D7AF7DC14940E6551A68363BB2BF3775F85F7CC149400A20F6A1173DB2BF8C9EDBD77EC149400710EA14D23EB2BF2BF00FBE7EC1494010039555493DB2BF6119958B7CC14940832D4AB0D45BB2BF3878E4267AC149406AC172C2605DB2BF7D3827327CC149406F39337C795FB2BF67BA21197CC14940A91DCE4D7B5DB2BFFABF928379C149407D45381DC96FB2BFEE4C040E78C14940	Grange Tower Bridge Hotel	E1 8BB	0	\N	South Tenter Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1301	0106000020E610000001000000010300000001000000300000001C0B2BFD7A13B2BF68A742EB7FC14940AEC5462EE114B2BF12F434C87FC14940089E15D18E15B2BF0C5F3AE97FC1494050512E203316B2BF7C4D92B87FC14940A783A8EF4317B2BFAA8083857FC1494018F2DE680819B2BF76871AA17FC149408E2511287D1AB2BF8A59E33480C14940B1E00B17881AB2BF6B189ACA80C149406F5C4B2D6519B2BFCBBBDE2781C14940700DC658281AB2BFF350313881C1494028A28866631FB2BF30BC030288C149409CD304E56720B2BFBE07A65288C149404680D73F5F20B2BFF49033F288C149405E4BF9DAA81EB2BF3DF2C85C89C149406D69A0C1231DB2BFF0D76E2D89C14940E0C048086D1BB2BFE7621B1B89C14940FD418F079CF3B1BFF22876308CC1494049FDB9F048F3B1BF34EB52AB8BC149401AF64C754BF2B1BF9040C4C18BC149403EA3C99CF9F1B1BF960CEC2D8BC149405394EE6F9DF0B1BFBCC27D488BC1494073A011CB48EFB1BF1A83FC9589C14940284EE0B537EDB1BF4A0985B189C1494009F143688FECB1BF1B5D61D789C14940A5E13FCFA0EBB1BF87BEC1F789C14940E5E3C47A95EAB1BFE78002F889C149402A6D8DC4FDE8B1BF86DED7EA89C14940D6D0B84B6EE8B1BFD894FBA489C14940EE157842CFE7B1BF7EBBE54489C14940831516A4FCE6B1BF8EE5004C89C14940D58CA5F511E0B1BFB7CAC57684C14940440EECCA0DE1B1BFF312027984C1494057015A59B6E1B1BFB001E66784C14940E5BA24305CE1B1BFDFD4421384C149409713C160B7E1B1BF1C1E8BD283C14940F27884274DE2B1BF25B20CB583C149401EA2A1DE6EE3B1BFC075BEC983C14940E4F46B09D9E3B1BF8BF9CD1584C14940FC7D376C4CE5B1BF34615AF383C14940B4DC5843FCE5B1BF618574B183C1494071AF3F5A1BE7B1BF4954C84C83C149400E7B6C62D6E8B1BF7AC1D01483C14940D5760E1B8DEBB1BFB50AF0E282C149403D1658C6C2EDB1BF1DB297E782C14940C5F58872B5EFB1BF3BCBC01C83C1494078F80C7950F1B1BF6C7CB30283C149408A8CEA4FFBF0B1BFCD2C139682C149401C0B2BFD7A13B2BF68A742EB7FC14940	9 Prescot Street	E1 8AZ	0	\N	Prescot Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1302	0106000020E61000000100000001030000000200000013000000B5F7B44AADA9B2BF14AD05DB7FC1494074B39845148CB2BFADE6D53881C14940A2FF2E15DE87B2BFF6C7E07377C14940C53B4DC8EB86B2BF330FF60577C1494063101AD5BB86B2BF523AF65476C14940558792F1DE87B2BF678D3DF575C149401F7245B39C89B2BFEC6739B475C14940AE8B512B958BB2BF195FBFA475C149405D0CFF866A8CB2BF2706FEF475C14940965357C0EA9EB2BF4AC3011375C1494069E8722ECE9FB2BF4ABA92BC74C149406795207489A1B2BFB155F89874C14940408D85BD1BA4B2BF168B00B274C14940B94969C730A5B2BF4958F5F874C14940A3D8260640A6B2BF76FC8B8475C149409278BEF7B2A6B2BF901E0A0576C14940701D99DF66A6B2BFB38D65A176C14940B6716AB2A3A5B2BFE3BD48EE76C14940B5F7B44AADA9B2BF14AD05DB7FC1494007000000E5BF604B3F96B2BF456AA9C080C1494074FB0EB1ED92B2BF7BCCBCD878C149402A4FB6B07690B2BF3E67FCF078C14940702A2126E790B2BFE181E48E79C149406AC2F43BAB8FB2BF654AEB9F79C14940D03EC9F47E92B2BFA178FFEC80C14940E5BF604B3F96B2BF456AA9C080C14940	Goodman's Field, 87-91 Mansell Street	E1 8AN	0	\N	Mansell Street	87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1303	0106000020E6100000010000000103000000010000000C000000E73F386E3D8FB2BFB85904E270C149407150F078888CB2BF5B3147066EC14940D4381A04C686B2BF8C180FF36AC14940A58008B09D8BB2BFA02D74566AC149407CF47708D28EB2BFAC9AC8AA6BC1494093F1ED84EE8FB2BF49B47F996BC14940F97B0E5CC690B2BF906854CC6BC1494049C4EBAF6492B2BF2E130E8B6BC149408C9035169298B2BF5E3A4B9B6CC14940DC2CAB210198B2BF78579E776DC149402A982466D392B2BFD5E8119B70C14940E73F386E3D8FB2BFB85904E270C14940	99 Mansell Street	E1 8AN	0	\N	Mansell Street	99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1304	0106000020E61000000100000001030000000100000016000000A9CE6AF9F6E2B1BFFC5D78589CC14940E8B3F14F2FCBB1BFAD2FEB338DC149407108034951C9B1BFB1A5797E8DC149400F213B8656C0B1BFD56A16D387C1494043504EAFD7C9B1BF42E94CD585C14940D9AEF57D88CCB1BF25DD3C6D87C149408C8B0D7B61D0B1BF4501CCF586C149406F6C71E5A7CEB1BF624D5E4B86C14940C8B7DAA84BCFB1BF089D39FE85C14940D58CA5F511E0B1BFB7CAC57684C14940831516A4FCE6B1BF8EE5004C89C14940FE666856D6D8B1BF36555C8D8BC14940CBD1B91A0BDBB1BFFA52A7108DC149401860ACB94ADDB1BF8276A79F8CC14940587F1CFE17EDB1BF8A0B0FE095C14940F14D5578CCF4B1BF284CC2D394C149409CADBD6AB0F9B1BF5E6F980298C149400AFCCD8CB7F6B1BF417BD34A98C149409D99E3DF61F7B1BFD215142499C14940FD39153E2FF0B1BFD1D963009AC149406BFA8500A3F0B1BF185614779AC14940A9CE6AF9F6E2B1BFFC5D78589CC14940	Carter Backer Winter LLP, 66 Prescot Street	E1 8NN	0	\N	Prescot Street	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1305	0106000020E6100000010000000103000000010000000C0000005FB8CA105CC4B1BF563D7E1C71C14940DC00813C6CA4B1BFF11FB8FD73C14940D944EEA871A3B1BF4B3AD8F173C14940C405CC4BD8A1B1BF0D1049F873C14940EFC934C8C0A0B1BF2EFFBCCE73C1494038F34E136C9FB1BF0B7F109173C1494083225E12959EB1BF63F66C5473C14940D40DC2E5639AB1BF7EF4F4276FC1494037D84501DD9BB1BF75E50F2B6FC149402893B798679BB1BFB632FBC76EC1494010D3B29C24C1B1BF8F9EB4056DC149405FB8CA105CC4B1BF563D7E1C71C14940	1 Prescot Street	E1 8AZ	0	\N	Prescot Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1306	0106000020E6100000010000000103000000010000000A00000052E4F087C8C6B1BFBFDA36256DC149409DF9C95888D2B1BF496610356CC1494005089A05B2D3B1BF3605BEFB6CC14940CD612B244CD7B1BFC796C8836CC1494067B5666274D6B1BF4E071EDC6AC149408895F32716ECB1BF79CD54FE69C14940213603EA2FEDB1BF95B154C76AC149409A90F26827EFB1BF1D5B54AB6DC1494004637E364EC9B1BF116EFDBA70C1494052E4F087C8C6B1BFBFDA36256DC14940	1 Prescot Street	E1 8AZ	0	\N	Prescot Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1307	0106000020E61000000100000001030000000100000009000000BF83F99E2208B2BF5221B3B06BC149409A90F26827EFB1BF1D5B54AB6DC14940372F422318EDB1BF1B8996C96AC14940DFD0ADDB56EDB1BF4C99D7266BC149403EE23AB8F1ECB1BF1B79F69A6AC149403E29636178EDB1BF35874B6B6AC1494085EFE61EEEECB1BF8A0D05F269C149401261A0E9CC03B2BFBBC6A33369C14940BF83F99E2208B2BF5221B3B06BC14940	9 Prescot Street	E1 8AZ	0	\N	Prescot Street	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1310	0106000020E6100000010000000103000000010000000F0000008C9035169298B2BF5E3A4B9B6CC1494049C4EBAF6492B2BF2E130E8B6BC14940A58008B09D8BB2BFA02D74566AC1494011D2DA488B7CB2BF97EAF6F268C14940467ECE282861B2BFFF69E8F665C1494016C5BA8B457BB2BFA08E251B65C149403F000F06C881B2BFC24E8BAB65C149401AA1B8B88C82B2BFC87A5E3366C149407D1D7594A08AB2BF2BF85D4867C14940B6C01BFFD78AB2BFF95FB5E666C14940D330416BD28CB2BFC9EEE20C67C149404F9A9345238DB2BFBC1D293567C14940DAA7E07E9D8EB2BF83CFA95567C14940004C6D3FD798B2BF9763D8586BC149408C9035169298B2BF5E3A4B9B6CC14940	Prescot House, 32-33 Prescot Street	E1 8AZ	0	\N	Prescot Street	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1311	0106000020E6100000010000000103000000010000000A00000011D2DA488B7CB2BF97EAF6F268C14940E652472DA87BB2BF7A5B4E4E69C14940F890B5429067B2BFABBD88DD6AC14940D2E76BB72A65B2BF5F85A2F867C1494007D0587D3766B2BFACBF38E767C1494044B56CA38F65B2BF95808EF066C149408A4512917364B2BFB936F0FC66C149405A3AA7742C64B2BF78130DA466C149401F0ED2ECF564B2BFDB0F076166C1494011D2DA488B7CB2BF97EAF6F268C14940	English Martyrs	E1 8AZ	0	\N	Prescot Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1312	0106000020E610000001000000010300000001000000060000003987943CD31DB2BFA210DF3043C14940003558F60020B2BF0F651FA245C149403640FB367C20B2BF6EEA651646C149406FD9CB38301CB2BF73CA7E8046C1494085A934335719B2BF677813A743C149403987943CD31DB2BFA210DF3043C14940	Cartwright Street	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1313	0106000020E6100000010000000103000000010000002F0000009767C7603EEEB1BFAAE4DE7744C1494022A51FE369F0B1BF5C3A126046C14940179F938F2DF5B1BF5EB244154BC149402B12DA9CF506B2BF4350E94349C149409FB3EAD4BD07B2BFF12FDF034AC149409F412CD5960BB2BF09AADC9F49C149402117D92D3408B2BF7CD6F46046C14940F39BFA964D0DB2BF9EEC6DDD45C1494041D3AF897410B2BFABB6627F48C149405F6D07A48215B2BFC76846BB4DC14940809FDDFADB25B2BFC0C4F34B4CC14940ABA6E76ECE25B2BF4A60E2344CC14940ED5A1B75132BB2BF863EDAA94BC149403E46E2030E2EB2BF16EA1E444EC14940E5989AD1EC2DB2BF18DF33394EC149407F3C33CF7529B2BFCD69EBB24EC149404AEDDD62D929B2BFF4A648244FC1494003C46DAB6C26B2BF554468734FC14940B40E493CA427B2BFD41714C350C14940F8070E0B4425B2BFC3AEB2F350C14940F102AC760F24B2BF2AC38ED34FC14940BF0741CAF21DB2BFAA7F7D7150C149409C74D6CB2D1FB2BFB595D09251C14940B7C486C6E11CB2BFB6D8BCC351C14940799CE194B51BB2BF4F4675AD50C14940093F9E823018B2BF9C8AA9EC50C149405C7149775718B2BF0940124A51C149407E98C3410314B2BFB8ADB5A951C149404AE4D697CB0DB2BF4AD6E5DC4BC14940C86A81A31E06B2BF7ED894A64CC14940639DC7D35607B2BFC6D7C0034EC149402B51087EA304B2BF3524C23F4EC1494054CE0EF85203B2BF9D7077054DC14940AC5DE87F30FDB1BFDD87CA9E4DC14940CAB43BE13DFEB1BFB317B2C64EC1494034862BA6C7FBB1BF4D3BA20D4FC1494092F703E788FAB1BFAD8FECC14DC14940651A2FE28EF7B1BF1E124A0B4EC1494002DAA807C7F7B1BF60AA75464EC1494049CE221BEFF2B1BF93210BB34EC149402809583E06F0B1BF8C38E0D84BC14940E0FD55B2EFEEB1BF5E3FF9FA4BC14940F3C9F23E33EEB1BF1E46FB494BC14940E8DFF6D645EFB1BF4E958B364BC149406DE5005EF6EBB1BFD835DAE147C1494041E4ADF302E9B1BF778BBBE644C149409767C7603EEEB1BFAAE4DE7744C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1314	0106000020E610000001000000010300000001000000070000006C8081CD8211B2BF703DCE5545C14940B1428BE6E713B2BF5DA4B19A47C14940D04C018D7414B2BFC1F6151848C1494041D3AF897410B2BFABB6627F48C14940F39BFA964D0DB2BF9EEC6DDD45C14940E9796808300DB2BF55862DC345C149406C8081CD8211B2BF703DCE5545C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1315	0106000020E610000001000000010300000001000000070000005014E3524215B2BFA74BC2B444C1494021302EF6BE17B2BF1EC42FEE46C14940D1F122C32318B2BFFF07154647C14940B1428BE6E713B2BF5DA4B19A47C149406C8081CD8211B2BF703DCE5545C149407434155C2E11B2BF04E8F71245C149405014E3524215B2BFA74BC2B444C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1316	0106000020E6100000010000000103000000010000000700000085A934335719B2BF677813A743C149406FD9CB38301CB2BF73CA7E8046C1494040C9C191D117B2BF284F64EC46C1494021302EF6BE17B2BF1EC42FEE46C14940A307BCF15115B2BF2731E3B444C14940E8FE33A9DA14B2BFD7180C2044C1494085A934335719B2BF677813A743C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1317	0106000020E61000000100000001030000000100000005000000DE05F9A3F921B2BF6A2BC23442C14940D7441F9A4B1DB2BF741D54AA42C14940FBF75405371AB2BFCDE5179C3FC14940DBC9910EE51EB2BFF2F785263FC14940DE05F9A3F921B2BF6A2BC23442C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1318	0106000020E61000000100000001030000000100000005000000E96906C9AAF6B1BF9DDC985E43C14940C9B0C1DFEBF8B1BFAE03087045C1494057C86CC456F4B1BFEF5D10C445C149408CBC3A2E00F2B1BFFF1D98B343C14940E96906C9AAF6B1BF9DDC985E43C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1319	0106000020E61000000100000001030000000100000007000000E60C5B320DF2B1BF30EE15BF43C1494057C86CC456F4B1BFEF5D10C445C149404DEA247C9EF4B1BF50DB890346C1494022A51FE369F0B1BF5C3A126046C149409767C7603EEEB1BFAAE4DE7744C1494043E674C8D1EDB1BF15B4441844C14940E60C5B320DF2B1BF30EE15BF43C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1320	0106000020E610000001000000010300000001000000090000002025437792FAB1BFDF86A87A42C14940610A9F21A5FCB1BFD15BFB6044C149409440604D00FDB1BFF1C409CC44C14940ABAC10AC9EF8B1BF2E62342945C1494011BFE53339F9B1BFC1695E1C45C14940ABAC10AC9EF8B1BF2E62342945C14940E96906C9AAF6B1BF9DDC985E43C149405E6E9A3E3BF6B1BFE242A0E342C149402025437792FAB1BFDF86A87A42C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1321	0106000020E61000000100000001030000000100000006000000610A9F21A5FCB1BFD15BFB6044C149402025437792FAB1BFDF86A87A42C14940DC88857200F9B1BF4EC69FAD40C14940854B5AB7CAFDB1BF4A4B884540C1494049299A4C5001B2BFF6C7D5FB43C14940610A9F21A5FCB1BFD15BFB6044C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1322	0106000020E61000000100000001030000000100000006000000D7441F9A4B1DB2BF741D54AA42C14940DE05F9A3F921B2BF6A2BC23442C1494037745E0BEC24B2BF6605162145C14940003558F60020B2BF0F651FA245C149403987943CD31DB2BFA210DF3043C14940D7441F9A4B1DB2BF741D54AA42C14940	Cartwright Street	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1324	0106000020E6100000010000000103000000010000000A00000047EF89A1ACDEB1BF616DDA7233C149407DA9F14BD4E0B1BFDC91846635C14940ED4FB3BA36E6B1BF7AB6B1283BC14940A69831F537F3B1BF80A3A0D039C1494057264183DCF5B1BF6E7358833CC149408CD173E813E8B1BF2964ACE33DC14940C648C499B4E7B1BFA448A5743DC149406477161838E2B1BF5D7A01F73DC14940308E982FA0D8B1BF726CFF0434C1494047EF89A1ACDEB1BF616DDA7233C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1326	0106000020E61000000100000001030000000100000014000000281FD04C76F0B1BF74B14BAE32C1494087F0DB4C37EEB1BF29A19D8530C149406C7DE9F78FE9B1BF464BF13B2CC14940801C1E41CFD3B1BF78FFF8382EC149403FEFBDA779D1B1BF98DD29482BC1494021CD4B1F65E8B1BFA50ABC8229C14940EDD218A3FDE8B1BFA884DB422AC149405F9BABB139EEB1BF956C4CDB29C1494000B0C1E4CEEFB1BF66A8B9D92BC1494095EF9A9CAEF2B1BFAC7ADEA02BC14940EA64D04272F1B1BFAC975D122AC14940DC28BB8C38F7B1BF868C1FA029C1494097B60C6FC2F8B1BFC6BF4A902BC149405C4853A7D80AB2BF41C3762A2AC14940D3223A97EE0FB2BF10EF749230C149409F5A83E2FC09B2BF25710E0831C149404D037CED0907B2BFD02B11512DC14940A30E117EA8F2B1BF9BE445E42EC14940DD02C08159F5B1BFA048364832C14940281FD04C76F0B1BF74B14BAE32C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1327	0106000020E6100000010000000103000000010000000700000009CC243108EBB1BF07CB6D6631C14940EF7D36E126EDB1BF72AA236E33C1494059961A596EEDB1BF95106CCF33C149402B68E9A602E9B1BF1B840A2434C14940FFE57A49CCE6B1BF3587432232C149402AC342596EE6B1BF514628CE31C1494009CC243108EBB1BF07CB6D6631C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1328	0106000020E6100000010000000103000000010000000700000087F0DB4C37EEB1BF29A19D8530C14940281FD04C76F0B1BF74B14BAE32C14940C7A3BBECDFF0B1BF5981AC2233C14940EF7D36E126EDB1BF72AA236E33C1494009CC243108EBB1BF07CB6D6631C149401345D31B82EAB1BFE82EFAD930C1494087F0DB4C37EEB1BF29A19D8530C14940	Royal Mint Green	E1 8LG	0	\N	Cartwright Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1329	0106000020E61000000100000001030000000100000008000000F88563BB96A6B1BF3FF7FF5834C14940576A209769A9B1BF46F200AF36C149405A1598E728AEB1BF6CC27BC93BC14940BDF4966282BAB1BF1E3B0DAC3AC1494004CA1C3BEEBCB1BF2B039B263DC149409E3ABFD3DFA9B1BF892F1EDF3EC14940DA521A0494A0B1BF4264CCF034C14940F88563BB96A6B1BF3FF7FF5834C14940	John Fisher Street	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1330	0106000020E610000001000000010300000001000000060000009C86BFB857AAB1BF70F4645F33C149407DCBABB876ADB1BFA5AC295036C14940576A209769A9B1BF46F200AF36C14940F88563BB96A6B1BF3FF7FF5834C149408B2D0452FBA5B1BF7950BED233C149409C86BFB857AAB1BF70F4645F33C14940	Royal Pharmaceutical Society, 66-68 East Smithfield	E1W 1AW	0	\N	East Smithfield	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1331	0106000020E61000000100000001030000000100000008000000C44DBDA6CDB3B1BF29E0B13F31C14940EC5DEEBD22B8B1BF428F8A1835C149404AA3B16685B6B1BF2C5C904435C149403C694B789DB5B1BFFBB3D37934C14940F3CB493C0EB2B1BF3BAF50D234C1494062FA8551F3AEB1BFCA61994332C14940F352628F67AEB1BFF9E589D131C14940C44DBDA6CDB3B1BF29E0B13F31C14940	John Fisher Street	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1332	0106000020E6100000010000000103000000010000000A00000062FA8551F3AEB1BFCA61994332C14940F3CB493C0EB2B1BF3BAF50D234C14940327F1F3691B2B1BFF84AD24335C14940039AEEDE7CAFB1BF9F16D09535C149405EF7326EC9B0B1BF390F3CE636C1494029D0A0BC8EAEB1BFA08B741537C1494082418F7A84ADB1BF6F54174C36C149409C86BFB857AAB1BF70F4645F33C14940D4C3E3D2BFA9B1BF631C5BD632C1494062FA8551F3AEB1BFCA61994332C14940	John Fisher Street	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1333	0106000020E61000000100000001030000000100000009000000CDC59FF9D5BFB1BFF55DB9302EC14940BBB977D7F4C2B1BF42EC483131C1494016B7B17C67C1B1BFE488285431C149409A00D32C93C2B1BF01BEB3B632C14940637D45663BBFB1BF7758C30333C1494066851C9CB4BEB1BF688E597732C14940BEC1FD3073BBB1BF986265552FC149409405292DD8BAB1BF379696B12EC14940CDC59FF9D5BFB1BFF55DB9302EC14940	Secrets	E1	0	\N	East Smithfield		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1334	0106000020E61000000100000001030000000100000017000000BBB977D7F4C2B1BF42EC483131C14940CDC59FF9D5BFB1BFF55DB9302EC1494063CC76C36CBCB1BF323D83A129C14940A44D3892DF9CB1BFBCE6DA472CC14940CCB8C01DF293B1BF53F1B33C22C14940A817FC49C799B1BFAC3909BB21C149409F631EAAED99B1BF5A30A8FD21C1494053227AEB52A2B1BFA0CBAE3C21C14940D501ABEAC0A1B1BF7FFBCA6220C14940BC6B5771B7A8B1BF71B09BC81FC149405DC0AE2206ACB1BF14458C7F1FC14940CB08594296ADB1BF5343669221C149406B1C65D083A9B1BF14CF85DB21C149400A477BFBEDA9B1BFFA05E58D22C14940AD0350C57BA6B1BF3DE31ECD22C1494034865059C7A6B1BF48BE290D23C14940EF567DCD9CA0B1BF23056F9023C14940D01F784C03A1B1BFC9B5121624C14940443D1681D89CB1BFBCD1037424C149400782AFC929A1B1BF69EF3F7229C149400F27461C75BFB1BF72E722CD26C14940CE4DB29985C8B1BF1EE33DB430C14940BBB977D7F4C2B1BF42EC483131C14940	Royal Pharmaceutical Society, 66-68 East Smithfield	E1W 1AW	0	\N	East Smithfield	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1335	0106000020E6100000010000000103000000010000000600000055AA051EADBAB1BF6C738AD732C1494080EA074DD6B7B1BFE4B8D54230C14940F900D33D47B7B1BF5717DBB82FC14940BEC1FD3073BBB1BF986265552FC1494066851C9CB4BEB1BF688E597732C1494055AA051EADBAB1BF6C738AD732C14940	Secrets	E1	0	\N	East Smithfield		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1336	0106000020E61000000100000001030000000100000009000000EC5DEEBD22B8B1BF428F8A1835C14940C44DBDA6CDB3B1BF29E0B13F31C14940383ADDB851B3B1BF6165A2B930C1494080EA074DD6B7B1BFE4B8D54230C1494055AA051EADBAB1BF6C738AD732C149403B48BEB31BBBB1BF444E562233C149400B684FD84DB8B1BFFDB9436E33C149403D7BA018B0B9B1BF2F0C1AF034C14940EC5DEEBD22B8B1BF428F8A1835C14940	Crofts Street	E1 8LG	0	\N	Crofts Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1337	0106000020E61000000100000001030000000100000007000000DDA04049BD12B2BF9078086953C1494043D2004E830AB2BF797A475554C1494068EC4FE0AD07B2BF6FDA37F051C14940392BF77DAB0AB2BF6777FF9B51C1494013BE7803DA09B2BFA888DBE050C14940F4D8C0BC310FB2BF37EC105050C14940DDA04049BD12B2BF9078086953C14940	Cycle Superhighway 3	E1 8LG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1338	0106000020E6100000010000000103000000010000000500000043D2004E830AB2BF797A475554C14940F439F8C15803B2BF7D1A4E3B55C149405EE5AC010B00B2BF45789D8E52C14940FF020CCC5907B2BF0D2B9BA451C1494043D2004E830AB2BF797A475554C14940	Cycle Superhighway 3	E1 8LP	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1339	0106000020E6100000010000000103000000010000000B000000F439F8C15803B2BF7D1A4E3B55C149403DDE2AF498FBB1BFE905542456C14940B597B43A01FBB1BF743C4BA455C14940A96341EFD1F9B1BF32BF1BCD55C149407DDBD18197F7B1BFC57D111454C1494003C15FFCF4F8B1BF939811E853C14940C718C69480F8B1BF8F48118E53C149402B991014F0FCB1BFB07F1BFF52C149407BD9C0D66CFDB1BFDCA4915F53C149403FFFE4338F00B2BF9FF7A2F952C14940F439F8C15803B2BF7D1A4E3B55C14940	Cycle Superhighway 3	E1 8LG	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1340	0106000020E6100000010000000103000000010000000E000000A96341EFD1F9B1BF32BF1BCD55C14940472988071BFAB1BF6440DD2D56C14940CF42105AAFF2B1BF565DE60A57C14940CF895E0782EFB1BF1C45824C54C14940EF6853654FF0B1BFA04B5C3554C14940885DD3BFD3EEB1BF249F7EED52C14940EC8B080AE3EFB1BF3667EACE52C14940BB4F2C0415EFB1BF5C0DFE1C52C14940C46BE192D9F5B1BF3E03B45951C14940E382EFC540F7B1BF2FE5E88F52C14940FC236906F0F5B1BF039DF5C052C14940BAA4D5C7CBF6B1BF9CB63F7A53C149407DDBD18197F7B1BFC57D111454C14940A96341EFD1F9B1BF32BF1BCD55C14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1341	0106000020E61000000100000001030000000100000009000000B596D07138D6B1BFC8849F245AC1494032622DB8D2C8B1BF1137C0845BC149400FAA89D2F9C5B1BF9E0AADEA58C149401B68ECDE00C7B1BF740098CC58C149402C0DA31E3EC6B1BFD190C03E58C14940A9EC89EEAACDB1BFA90E2F6A57C14940684E3C84C6D2B1BF67CB87F558C14940BB97AC7B08D5B1BF550874D558C14940B596D07138D6B1BFC8849F245AC14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1342	0106000020E61000000100000001030000000100000005000000250B29C178CCB1BF03B2ACFC55C14940F705EC7C8BC3B1BF58321AFC56C1494008ECEDF997C0B1BFB0DC9E2F54C1494080740A1979C9B1BF73224B4653C14940250B29C178CCB1BF03B2ACFC55C14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1343	0106000020E61000000100000001030000000100000009000000250B29C178CCB1BF03B2ACFC55C1494080740A1979C9B1BF73224B4653C149405BC5D5830CCFB1BFD117DAAE52C1494083134B24D2CEB1BF93C5A88952C149400EABBD6915D8B1BFBDC4978D51C14940D70D337F4ED8B1BFFF70A8BD51C14940B82B476E1EDEB1BFB3B4FC3551C14940E6C0BB7716E1B1BFB45B44A553C14940250B29C178CCB1BF03B2ACFC55C14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1344	0106000020E61000000100000001030000000100000009000000031CAADEA8DEB1BFDD38591351C14940BB7098C363DCB1BF82BA11224FC149404458430B83DBB1BF695D803A4FC14940CDC6C0E220D8B1BFB8B8C03E4CC14940315C43DDCDD8B1BFDE68F3294CC14940BBB6CA4DABD6B1BF1016E9494AC1494057683211FFDFB1BF91918D3F49C149401F019E9978E7B1BFE36BA11D50C14940031CAADEA8DEB1BFDD38591351C14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1345	0106000020E61000000100000001030000000100000009000000635E2EE099C8B1BF8CD9345D53C1494008ECEDF997C0B1BFB0DC9E2F54C14940DF42599A1FB9B1BF97A360A54DC149403FFFB911BEC1B1BF6CC01FD24CC14940DAFE604EC1C3B1BFAB4240BB4EC149405E9AA358E3C4B1BFD545069C4EC149405A22DA9EABC7B1BF1BBD6F5F51C1494091C51DB99EC6B1BF1A22C97751C14940635E2EE099C8B1BF8CD9345D53C14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1346	0106000020E610000001000000010300000001000000070000005C1FC52060AEB1BFEDF7925443C14940054EF734F4B0B1BFDF0BCAFB42C149403798F117D2B7B1BF54E046EA44C14940AC006B5C19B9B1BF94E939C544C1494046D34C81C1BFB1BFA451048A4AC14940EA4AB4E887B7B1BF19C28F764BC149405C1FC52060AEB1BFEDF7925443C14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1347	0106000020E61000000100000001030000000100000009000000958946D4B1DFB1BF875D840547C149401010B6C9C9D7B1BFC369FAE947C14940242F5374C1D5B1BFD72B202646C149405242FCD5F7D4B1BFDBAB303946C14940187DA1F3CDD1B1BFEBEEC89643C14940895B87239CD2B1BF6DCC9E7C43C1494058FD0F1259D0B1BF6BE3BC7541C14940DC63A9ECB4D8B1BFA293828540C14940958946D4B1DFB1BF875D840547C14940	Royal Mint Place	e1 8	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1348	0106000020E610000001000000010300000001000000090000006B75658AFFCEB1BF37F65B5C42C1494007B6FF4C8DC9B1BF9E787AF142C14940EF9BC2AAD6C9B1BF0C87F02E43C149409995B5ACA0C0B1BFD2771E2C44C14940B58DB65C50C0B1BF12B7B6F043C149404AB25D95D0BAB1BF2D5AB88544C149402944D4A0CCB7B1BF7CCCEB1242C14940B193849440CCB1BF85AE7EC23FC149406B75658AFFCEB1BF37F65B5C42C14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1349	0106000020E61000000100000001030000000100000009000000DDADC5EE5AD5B1BFC84FE9C23AC14940CC3CC0E95FCFB1BF2060CF673BC1494060B934D4A2CFB1BFA8C25EA13BC149403B59D4F4D3C7B1BFE77994833CC149407EC1A6C28DC7B1BF83DBC83F3CC149406EDD822702C1B1BFBF930DFF3CC1494072D69167FEBDB1BF4BD79C753AC14940CA1FCAEFC3D2B1BFC826972638C14940DDADC5EE5AD5B1BFC84FE9C23AC14940	Blue Anchor Yard	E1 8BL	0	\N	Blue Anchor Yard		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1350	0106000020E61000000100000001030000000100000009000000BD474E2A33B9B1BFB3F7FAE456C149409D7AE94F1DACB1BF0642AA4158C14940FEDFB45804AAB1BF391CD14A56C149409B6786E13AADB1BFE1BFF8EA55C14940D0B49FFB7EA8B1BFABF6EED951C149402D74606777A5B1BF953B2A3A52C14940C613387D2FA3B1BF4B0EEE4250C1494055D84D4B9DAFB1BFB489FFB34EC14940BD474E2A33B9B1BFB3F7FAE456C14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1351	0106000020E6100000010000000103000000010000000D000000F87ED8DE80ACB1BFDC46D46C4CC14940C7CF83A306A6B1BFB674170F4DC1494063ECC8856BA6B1BF01268A764DC1494003F360CBA19FB1BF8273CE264EC149407D5CE58F4C9FB1BF52BD7CBF4DC14940193B0627E198B1BFF7B5A46B4EC14940804D4C8D1896B1BF979F57064CC14940D3402891629FB1BF94788D114BC1494040BDE9B2769FB1BFBFD4BD234BC14940869FEFD06BA0B1BF14489B0A4BC14940508E77BE50A0B1BF35CCF0FA4AC1494049BEDFA8C5A9B1BFA33C5EFF49C14940F87ED8DE80ACB1BFDC46D46C4CC14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1352	0106000020E6100000010000000103000000010000001D00000096C5989DB0A8B1BF22F6449A47C14940A8BE9CC9639EB1BFF9DC517448C14940BF3B7512379CB1BF3CA95E1646C14940D0F677EF3E9AB1BFEA914F3946C14940C4EF9BDE3F9BB1BF25799E6047C14940FBFF0530FB93B1BF187970F747C14940E6597941BB90B1BF11F6766D44C1494017F0CE0DE297B1BF1334BDC743C14940599896C9D098B1BF354801C944C14940E6C034BBEF9AB1BF3934A39144C14940F062DD7EFE96B1BFC7250A8C40C1494083C84AA5E694B1BF5E1C9BB340C149409116962BAF95B1BF64CD269141C1494077373202598EB1BFD1975F3B42C14940A947669ADA8AB1BFFA66DDB03EC14940051BB5E23292B1BF2E4C3FEE3DC149405CCE7D2F4793B1BF5979BCE93EC14940517FAE297F95B1BF3258A9B83EC14940EC05BD60E092B1BFA89FA36D3CC14940FD887963429CB1BFC90ABC6F3BC149401567C67FAC9EB1BF96BDC5FE3DC149400438BA4F5A9FB1BF8F4FA8EC3DC14940B847435EB3A0B1BF4F511A593FC14940A058353954A0B1BF7E9FFA663FC14940224DCE82AFA4B1BF422DFC9643C149402DBCB0C46CA5B1BF2CC3708743C149408C4B0501A9A6B1BF814054D644C1494055771A6A3AA6B1BFDF88A2E144C1494096C5989DB0A8B1BF22F6449A47C14940	Sir Symon Smith	E1 8LL	0	\N	Dock Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1355	0106000020E6100000010000000103000000010000000700000010B5961C6BABB1BF04436CAA5DC1494062993D522CA4B1BF4131B5235EC1494060C4163A8BA1B1BF1DAD1CA45AC1494083D6836DBCA4B1BF32C73E5F5AC149405ED5CED92DA5B1BFF34DBCE85AC149403042829720A8B1BF8CF76CB45AC1494010B5961C6BABB1BF04436CAA5DC14940	Simmons	E1 8HA	0	\N	Royal Mint Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1356	0106000020E6100000010000000103000000010000000600000010A1AA27B7A0B1BF3085EF8959C1494062993D522CA4B1BF4131B5235EC14940DE2907FD4795B1BF318465C75EC1494045D2F33C1C93B1BFC9ABC9745EC14940395D87210A90B1BF8B006AF45AC1494010A1AA27B7A0B1BF3085EF8959C14940	Simmons	E1 8HA	0	\N	Royal Mint Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1357	0106000020E6100000010000000103000000010000000500000089A61E17358BB1BF55FE8FAC55C149408BE375BB9487B1BFCACCED0D52C14940A8F1D624088FB1BFE578CD5051C149404F127C507492B1BF029924E354C1494089A61E17358BB1BF55FE8FAC55C14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1358	0106000020E610000001000000010300000001000000090000005B1917E0BF9CB1BF2E7824E059C14940A94FDFFFFE99B1BF4B9FD9AE56C14940B289CAFAAF9BB1BF163215BC54C149401F5F299D8FA4B1BFB7C46DC753C14940DC8E9DAFF5A8B1BFE7E9261558C149407863153CC7A4B1BF4DECE06D58C149402ED18669E19FB1BF5EC6A64D59C149404FF333A40FA0B1BFA7BC289859C149405B1917E0BF9CB1BF2E7824E059C14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1359	0106000020E61000000100000001030000000100000009000000A94FDFFFFE99B1BF4B9FD9AE56C149405B1917E0BF9CB1BF2E7824E059C14940F52279F09190B1BF62FFE1E85AC14940BC711991E28BB1BF0CAA7B9A55C149404F127C507492B1BF029924E354C14940604E4E8A3093B1BF33FC439455C149402E015234C795B1BF2EB4B04B55C14940208F294C3A97B1BFF4DD4AED56C14940A94FDFFFFE99B1BF4B9FD9AE56C14940	Peabody Buildings	E1 8HA	0	\N	John Fisher Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1360	0106000020E610000001000000010300000001000000070000009179229D8D79B1BFEB152C4043C14940134E32B9CD81B1BF73BE397142C14940B867EF17EA82B1BF606C34BF43C14940692A34DC5F85B1BFBD07DE8943C14940717B22A71286B1BF6969AF5644C1494022712E96747BB1BF3023064E45C149409179229D8D79B1BFEB152C4043C14940	Sir Symon Smith	E1 8LL	0	\N	Dock Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1361	0106000020E61000000100000001030000000100000007000000717B22A71286B1BF6969AF5644C14940692A34DC5F85B1BFBD07DE8943C14940B867EF17EA82B1BF606C34BF43C14940134E32B9CD81B1BF73BE397142C1494046C8583B0A8BB1BFCF25188741C149409F6AEDC4FE8CB1BFA63B71AD43C14940717B22A71286B1BF6969AF5644C14940	Sir Symon Smith	E1 8LL	0	\N	Dock Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1362	0106000020E610000001000000010300000001000000070000009179229D8D79B1BFEB152C4043C149409B59843F1E74B1BF8833637C3DC149407DC3D456D17FB1BF91802C533CC14940D62688831183B1BF828303C33FC149409AA8E7D1CB88B1BF2900262E3FC1494046C8583B0A8BB1BFCF25188741C149409179229D8D79B1BFEB152C4043C14940	Sir Symon Smith	E1 8LL	0	\N	Dock Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1363	0106000020E61000000100000001030000000100000005000000F44D94139B71B1BFF6B33F6D3BC149407BBE9162926EB1BFD836C65038C149408460C550E989B1BF693B5C9B35C1494066306AF60D8DB1BF606D14DF38C14940F44D94139B71B1BFF6B33F6D3BC14940	Sir Symon Smith	E1 8LL	0	\N	Dock Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1364	0106000020E610000001000000010300000001000000050000009ED8D375C06FB1BF4CC1D83238C1494001A1C438A365B1BF45447E002DC14940B1B910517C80B1BF1E11CD532AC149405D54B33BA78AB1BF0A8AA97F35C149409ED8D375C06FB1BF4CC1D83238C14940	Royal Pharmaceutical Society, 66-68 East Smithfield	E1W 1AW	0	\N	East Smithfield	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1365	0106000020E610000001000000010300000001000000050000001824D5E74678B1BF6790905A5BC149401A336402127EB1BF1AA48DE95AC149400712CB68007FB1BFDFB2B7575CC14940F121894F4779B1BFE5FCF5DD5CC149401824D5E74678B1BF6790905A5BC14940	Ludlow Thompson, 1 Dock Street	E1 8JN	0	\N	Dock Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1366	0106000020E610000001000000010300000001000000060000001A336402127EB1BF1AA48DE95AC149401824D5E74678B1BF6790905A5BC14940AEC8F09B0076B1BF2F26FA885BC14940C7852CD0B574B1BF623313D959C14940F27D8F640E7DB1BF041FCD5A59C149401A336402127EB1BF1AA48DE95AC14940	Wombat's, 7 Dock Street	E1 8LL	0	\N	Dock Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1367	0106000020E61000000100000001030000000100000005000000CA12AAD3D67AB1BF4C74F28B5DC14940243EE5FC6C7CB1BF3B1352C65FC14940DB715A768C78B1BFBA39A31460C14940EBF6DBBC7677B1BF48A75ABF5DC14940CA12AAD3D67AB1BF4C74F28B5DC14940	Ludlow Thompson, 1 Dock Street	E1 8JN	0	\N	Dock Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1368	0106000020E6100000010000000103000000010000000D000000243EE5FC6C7CB1BF3B1352C65FC14940CA12AAD3D67AB1BF4C74F28B5DC1494044F5A4B2617AB1BFCD2516C45CC149400712CB68007FB1BFDFB2B7575CC1494012CA95AC1180B1BF6D179FCC5DC149400D1D617F4780B1BFE3697B335EC1494095FC50743080B1BF1D1E148B5EC14940A130FF11CA7FB1BF3C15A7F05EC14940E68C12CB5F7FB1BFC4EFDC275FC14940D61A0200A77EB1BF89C14D635FC1494079284D0CF77DB1BFBAEC9F925FC14940AEFD2792587DB1BF1443CEB45FC14940243EE5FC6C7CB1BF3B1352C65FC14940	Ludlow Thompson, 1 Dock Street	E1 8JN	0	\N	Dock Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1369	0106000020E61000000100000001030000000100000005000000DABA37FD3C72B1BFAE6B664E4CC1494075D223ADCD74B1BFA2975C2F4FC14940B557B84DE06CB1BFC65F33E94FC14940CCF584571D6AB1BF2922FB0E4DC14940DABA37FD3C72B1BFAE6B664E4CC14940	11 Dock Street	E1 8LL	0	\N	Dock Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1370	0106000020E61000000100000001030000000100000008000000B6B085E4445AB1BF2BA75D6C4DC1494041B8EEDAA54CB1BF64A6FBB84EC1494094709420854BB1BF3B1933D54EC149402C57C1647C45B1BFBC554AA448C14940453F1A76FF52B1BFB0F2987047C14940DEF284085656B1BF05256D3D4BC149401F2B006E3458B1BF2A1CC51E4BC14940B6B085E4445AB1BF2BA75D6C4DC14940	18 Ensign Street	E1 8JG	0	\N	Ensign Street	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1371	0106000020E610000001000000010300000001000000090000003AF0BD7C326CB1BF833A26F245C149407F42BC96D870B1BFEE0F39E64AC1494099DE9251875DB1BF54AB6E9B4CC14940A52178DBE75BB1BFD37433DC4AC14940B2457B36CC5AB1BF595320F74AC14940D9C5E5644559B1BFB953218649C14940FE54D209615AB1BFF576346B49C14940CB2AE6C1DE58B1BF7F5A99C447C149403AF0BD7C326CB1BF833A26F245C14940	St	E1 8JH	0	\N	Dock Street		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1372	0106000020E610000001000000010300000001000000050000003AF0BD7C326CB1BF833A26F245C14940A6E0D7748557B1BF0F2243D547C14940894B33EC7F4CB1BFB35197A73CC149408AFF87076660B1BF8917BFD839C149403AF0BD7C326CB1BF833A26F245C14940	11c Dock Street	E1 8LL	0	\N	Dock Street	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1373	0106000020E610000001000000010300000001000000070000008AFF87076660B1BF8917BFD839C14940AA1125673C57B1BFFDF8BE233BC14940F7443E752851B1BF378A47AC36C149407B2E7D78A352B1BF92CEA17E36C1494089B9CA4A1552B1BF0E5CA4D735C149403A0AFD6F535BB1BF550906DA34C149408AFF87076660B1BF8917BFD839C14940	15 Dock Street	E1 8LL	0	\N	Dock Street	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1374	0106000020E610000001000000010300000001000000050000006169BEC38855B1BFCAD670F92EC149402CFB68727A58B1BFFBD02FB431C14940894FA2B7B351B1BFE296F96832C14940ED78DDA0DF4EB1BF3C03FBC12FC149406169BEC38855B1BFCAD670F92EC14940	19 Dock Street	E1 8LL	0	\N	Dock Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1375	0106000020E6100000010000000103000000010000000F00000035E5C32AE354B1BF72CDFD1332C149406E66BB9F8C56B1BF0D65F19233C14940B71335010654B1BF174CC5D633C1494092FAE37BBE55B1BF5A26307335C1494089B9CA4A1552B1BF0E5CA4D735C149407B2E7D78A352B1BF92CEA17E36C14940F7443E752851B1BF378A47AC36C149402AC08694C551B1BF71C8BF1F37C149405545CE1F9B4DB1BFA93F218537C149405641F4102C48B1BFBF2B037732C14940A4F16A743645B1BFEED96ECD32C14940806702142A43B1BF402C6D0831C14940ED78DDA0DF4EB1BF3C03FBC12FC14940894FA2B7B351B1BFE296F96832C1494035E5C32AE354B1BF72CDFD1332C14940	19 Dock Street	E1 8LL	0	\N	Dock Street	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1376	0106000020E61000000100000001030000000100000006000000351C7CF99064B1BFD17768755EC1494096F65C879265B1BFAA00D96360C1494096F65C879265B1BFAA00D96360C1494092DECFBB1961B1BF2A0A107360C149401876E4654760B1BF22E5229D5EC14940351C7CF99064B1BFD17768755EC14940	10 Cable Street	E1 8JG	0	\N	Cable Street	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1377	0106000020E610000001000000010300000001000000050000001A2A93F8C273B1BFAEC39E2860C14940DB2ED6029272B1BFCD2AF37C5DC149407FBE2D654477B1BFFB14BB8B5DC14940DB715A768C78B1BFBA39A31460C149401A2A93F8C273B1BFAEC39E2860C14940	Cirilo Noodle Bar and Grill, 4 Cable Street	E1 8JG	0	\N	Cable Street	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1378	0106000020E61000000100000001030000000100000005000000F09B9A48AA6EB1BF08C8E43D60C149401FEB996D7F6DB1BF0565A38A5DC14940DB2ED6029272B1BFCD2AF37C5DC149401A2A93F8C273B1BFAEC39E2860C14940F09B9A48AA6EB1BF08C8E43D60C14940	Papa John's, 6 Cable Street	E1 8JG	0	\N	Cable Street	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1379	0106000020E61000000100000001030000000100000005000000C8EED1D57969B1BFE6DD8D5360C149409BCDDDF6FF67B1BFB8C439D95CC149407CD09307516DB1BFDF6B0DCC5CC14940F09B9A48AA6EB1BF08C8E43D60C14940C8EED1D57969B1BFE6DD8D5360C14940	Mapa Cafe, 8 Cable Street	E1 8JG	0	\N	Cable Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1380	0106000020E6100000010000000103000000010000000900000096F65C879265B1BFAA00D96360C1494096F65C879265B1BFAA00D96360C14940351C7CF99064B1BFD17768755EC14940F0E90FB26B64B1BF7A849D035EC1494010CD1D8D8365B1BFD42B45F35DC14940ACA071D52C65B1BF3BC1D7ED5CC149409BCDDDF6FF67B1BFB8C439D95CC14940C8EED1D57969B1BFE6DD8D5360C1494096F65C879265B1BFAA00D96360C14940	Mapa Cafe, 8 Cable Street	E1 8JG	0	\N	Cable Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1381	0106000020E610000001000000010300000001000000050000001CBF8ADB407CB1BFF3D79AD657C14940F27D8F640E7DB1BF041FCD5A59C14940C7852CD0B574B1BF623313D959C14940BCB7DE30C073B1BF154E117858C149401CBF8ADB407CB1BFF3D79AD657C14940	Wombat's, 7 Dock Street	E1 8LL	0	\N	Dock Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1382	0106000020E6100000010000000103000000010000000B00000092DECFBB1961B1BF2A0A107360C149400A89812AAB5CB1BFCCCE198260C1494050F36803485BB1BFDB9B674E60C1494039A9322F305AB1BF64A6D0CA5EC14940AA8C2D02BE5AB1BF66385ABD5EC149405FA360EEA458B1BF21C1C61C5CC1494091FF75A1B660B1BF042793485BC149400F80B030BD61B1BFC8B987DF5CC149408964B18D365FB1BFD5B85B235DC149401876E4654760B1BF22E5229D5EC1494092DECFBB1961B1BF2A0A107360C14940	Sapphire Court, 1-7 Ensign Street	E1 8JG	0	\N	Ensign Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1383	0106000020E610000001000000010300000001000000090000007271C177E358B1BF2109F7635BC14940A39AB4210C58B1BFE91ED9815AC149407939D61A0057B1BFD7E9E69C5AC14940201E80487955B1BFAFE4E72B59C14940D0324F4F8556B1BF671BDA1059C14940C58629C26255B1BF65EDF90B58C14940D655D326A860B1BF26E4BDE656C14940F3F52D900764B1BFA62FD7565AC149407271C177E358B1BF2109F7635BC14940	8 Ensign Street	E1 8JG	0	\N	Ensign Street	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1384	0106000020E61000000100000001030000000100000006000000836BE5271364B1BFD82915EF54C14940E117BA2B9967B1BF29BE119B54C149401283E723086AB1BF5F04049957C149401EEC988B5D65B1BF4D11F6E657C14940CF91C8F5FA62B1BF6D5D1F0855C14940836BE5271364B1BFD82915EF54C14940	Wombat's, 7 Dock Street	E1 8LL	0	\N	Dock Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1385	0106000020E6100000010000000103000000010000001800000041B8EEDAA54CB1BF64A6FBB84EC14940B6B085E4445AB1BF2BA75D6C4DC149401F64DEDD385DB1BFC74F70294DC1494043F28589DE60B1BFEBA7C7F650C149406FE815BDD669B1BF4B8AF23C50C1494020363770396AB1BFE914FCCF50C14940C27EB6A9506CB1BF4B9B9FA350C1494002139623736BB1BF41749C0A50C149400C7BF5669E74B1BF766CD9334FC149401CBF8ADB407CB1BFF3D79AD657C14940609557788B72B1BFB5D2F78E58C149404A6E22EDC271B1BF253ABAB657C14940375907B7CD72B1BFCD404BAA57C149407DF7B954F66EB1BF735F5B4553C14940E2997B9FA06CB1BFA81B347153C149401CA5B216146CB1BF8922B8B652C14940563D905E0F66B1BF6C62131F53C149407DEECA57EF65B1BFD6C714CB52C149401E9D22C98562B1BF4F0FBD1253C14940836BE5271364B1BFD82915EF54C149404BC9ABF81753B1BF0E90917356C149406A0757092550B1BFA97771C753C14940478F2BDAAE51B1BF0CFEABA353C1494041B8EEDAA54CB1BF64A6FBB84EC14940	Wombat's, 7 Dock Street	E1 8LL	0	\N	Dock Street	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1386	0106000020E6100000010000000103000000010000000D0000002C57C1647C45B1BFBC554AA448C149405EF30031963BB1BFBEB027E93DC149405EE8C8453943B1BFC74FAD223DC149401409391E2347B1BF9E4DA16541C149401AE959F0454EB1BF69231CC540C149404B35BDF0274FB1BFC5CAD6E141C14940EABC770EED4DB1BFEDB481FC41C14940575E53692C50B1BFBC08DE7044C149406AAFBA65E952B1BF24116F3C44C14940A81AB54C7A53B1BF1CF785ED44C14940BD2156ABD550B1BF2FFD782245C14940453F1A76FF52B1BFB0F2987047C149402C57C1647C45B1BFBC554AA448C14940	20-22 Ensign Street	E1 8JG	0	\N	Ensign Street	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1387	0106000020E610000001000000010300000001000000090000005EF30031963BB1BFBEB027E93DC149403B82DA0FE537B1BF6160F2EA39C149401A958A5BE648B1BF23235D1D38C149402A2175EFD84DB1BFFDD5E7763CC14940894B33EC7F4CB1BFB35197A73CC14940A2FF0AB4884EB1BF4087C8B73EC149400BA253346F45B1BFFE0DF28A3FC149405EE8C8453943B1BFC74FAD223DC149405EF30031963BB1BFBEB027E93DC14940	Liberty House, 24-26 Ensign Street	E1 8JG	0	\N	Ensign Street	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1388	0106000020E61000000100000001030000000100000019000000ED1C6FDB031FB1BF28FB9C5B63C14940568CFCCCE61DB1BF282CBAA460C149405C177ED6D123B1BFC269FD5660C149406A5AE8BCAF23B1BF49442F1C60C149407CA414B2C026B1BF539952F45FC14940B5503DFCDA26B1BFA943102F60C149401F9BEED12232B1BFFA1EECA55FC149404DB28CC40932B1BFCD858F5C5FC1494023B5600AE033B1BF879CED4C5FC14940F82B6981F933B1BF37906A915FC14940118AF050D639B1BF0E490E515FC14940110579EC9E39B1BF67FC75825EC14940B2CA27E1653EB1BF553EE4565EC149401017696D8A3EB1BFD23F1ED15EC14940084F787C2C44B1BF69147AA25EC14940DD9F65D30A44B1BF0D8E22065EC14940E6F22069B145B1BFFAF0DCFF5DC14940BE4E5E618845B1BFD88BEB015DC14940D3AACD2CD243B1BF2F3510085DC14940E34D166DDA43B1BFC94997A65CC14940262CAEF1802EB1BF15CA63F35AC1494070403940F72FB1BF750EEC1A58C1494029CFDED3B04DB1BF4E9258685AC14940BF726F56FF52B1BF568E7AF760C14940ED1C6FDB031FB1BF28FB9C5B63C14940	Sapphire Court, 1 Ensign Street	E1 8JG	0	\N	Ensign Street	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1389	0106000020E61000000100000001030000000100000005000000489B51CC1529B1BFAD05478059C14940A46D888A9C29B1BF61ED96B757C1494070403940F72FB1BF750EEC1A58C14940745EB1621A2FB1BF3309C4C859C14940489B51CC1529B1BFAD05478059C14940	Shapla Primary School	E1 8NT	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1390	0106000020E61000000100000001030000000100000006000000548F31B59224B1BF88DEC2AE59C149408C9260140325B1BF0971B06F57C14940A46D888A9C29B1BF61ED96B757C14940489B51CC1529B1BFAD05478059C149400554B3ECFD28B1BF58FA9EE159C14940548F31B59224B1BF88DEC2AE59C14940	Wilton's Music Hall, 1 Graces Alley	E1 8JB	0	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1391	0106000020E610000001000000010300000001000000050000008C9260140325B1BF0971B06F57C14940548F31B59224B1BF88DEC2AE59C14940D1E4D2F02B20B1BFF8E3197C59C149400B9349D62F20B1BF6B99422457C149408C9260140325B1BF0971B06F57C14940	Wilton's Music Hall, 1 Graces Alley	E1 8JB	0	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1392	0106000020E610000001000000010300000001000000100000000B9349D62F20B1BF6B99422457C14940D1E4D2F02B20B1BFF8E3197C59C14940548F31B59224B1BF88DEC2AE59C149400554B3ECFD28B1BF58FA9EE159C14940489B51CC1529B1BFAD05478059C14940745EB1621A2FB1BF3309C4C859C14940C8A636D0C02EB1BF45CB16775AC149400D47C8F6442DB1BFB3ED76905AC149402E8D34A41E2BB1BF820E94515EC1494090489620B21AB1BF253683055FC149406721336F621AB1BFF87D095F5EC14940C75873D29516B1BF0044CA875EC14940543E26924C15B1BFC32E4C8759C14940A617490BF319B1BF2630186A59C149401C56E284291AB1BF15FAC6E656C149400B9349D62F20B1BF6B99422457C14940	Wilton's Music Hall, 1 Graces Alley	E1 8JB	0	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1393	0106000020E610000001000000010300000001000000050000001C56E284291AB1BF15FAC6E656C14940A617490BF319B1BF2630186A59C14940543E26924C15B1BFC32E4C8759C1494035BEAB515C14B1BF2E722AE956C149401C56E284291AB1BF15FAC6E656C14940	Wilton's Music Hall, 1 Graces Alley	E1 8JB	0	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1394	0106000020E6100000010000000103000000010000001100000035BEAB515C14B1BF2E722AE956C149406E19601CD315B1BFEEDD89925BC149408F6A2BC59C0FB1BF97826AC95BC14940B06D60CAC30FB1BFD0AA66265CC1494024EA90040706B1BF0541257D5CC1494076905A28D005B1BFEA6064315CC14940BB8986E0AEFFB0BF84EAE06A5CC149401545057BB7FFB0BF92DADBBD5CC14940325DD799C6F6B0BF371C870C5DC14940409CABC19EF6B0BFB23A4AB95CC149407970470B50F0B0BF841F41F05CC14940754C624183EEB0BFE767B53C58C149403177D219A3F4B0BF54A35B0558C149408F9AEB768AF4B0BF535F1FB757C149405B7A101C350EB1BF0F2CEBBE56C149409F18A6554D0EB1BF1213071257C1494035BEAB515C14B1BF2E722AE956C14940	George Leybourne House	E1 8NT	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1395	0106000020E6100000010000000103000000010000000F000000F17AD951603DB1BF4EA76B4B4CC14940557049721321B1BFD8AF00CE4EC149407D22158A8A19B1BFD4ED0C2947C1494062693DAC3D1DB1BFCF1FCFBB46C149406148CFE8021CB1BFB6C7D26345C149401D8540D9E213B1BFBB26442946C14940B69114E58C0CB1BF41EC490D3FC14940AA2BE8DA7A29B1BF3F1785513CC14940128190739F2CB1BF10813E953FC1494050649D30782EB1BFF2BE5E683FC149408F1381BA9A30B1BFBFB7DA9841C149407FC22466A42EB1BFD2FEF9B141C1494048FA8C851930B1BF2688363B43C14940D4BC9729A834B1BF797106C642C14940F17AD951603DB1BF4EA76B4B4CC14940	Shapla Primary School	E1 8NT	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1396	0106000020E61000000100000001030000000100000005000000EE7C63397D43B1BFB5B1E9FB51C149405D851605013EB1BF1A6FD5DC51C14940B92058CEEF3DB1BFAB90DF3651C14940CECBFB7DAA43B1BF89A1775651C14940EE7C63397D43B1BFB5B1E9FB51C14940	Shapla Primary School	E1 8NT	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1397	0106000020E610000001000000010300000001000000070000009C36FC3E7B20B1BF8D9EA10E50C14940CA805E4E9D1EB1BF65FC4A5B53C149401DAB2618551BB1BF79E9592D53C14940BD38C54A781CB1BFA3BC0C4851C14940013847A1C815B1BF678FE8EB50C1494061CFAA91A716B1BF5199524A4FC149409C36FC3E7B20B1BF8D9EA10E50C14940	Shapla Primary School	E1 8NT	0	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1398	0106000020E6100000010000000103000000010000000500000000F3A3D009F1B0BF49D7205F54C14940F3ADC1BDA1DFB0BF73E77A2455C1494021862156E9DDB0BF64C28E6252C149400D35AF320BF0B0BFC4113FB251C1494000F3A3D009F1B0BF49D7205F54C14940	St	E1 8HY	0	\N	Wellclose Square		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1399	0106000020E610000001000000010300000001000000270000004A38F4064FF5B0BF34CAF4ED4DC1494059593EA176EAB0BFE4A49E5F4EC149403ADD39BAEEE9B0BFFE24F9424DC1494066FCBA41F2ECB0BF458DD4214DC14940517A9F2791ECB0BFA6017D7F4CC14940976FB28339D9B0BF282D1D2A4DC14940A936FF14AED9B0BF5FDF44FF4EC1494078B45827A9D0B0BF6981B8554FC14940A8816A97F4CEB0BF2B51A6694AC149408DFD0359BCBAB0BFBB178F3C4BC1494003AFF93F6DB9B0BF0C92F2F247C14940136672B263CDB0BF821F834647C14940DC2D9E147CCCB0BFDF125CFB44C149400AFE831C38D3B0BFA3F84CC544C14940C0B3849ED0D2B0BF7098D7C643C149403BF01107F1DEB0BF8155E35743C14940868C13C6E7E0B0BF505CFA8C47C14940F1BA531DE3E7B0BFD548AF4D47C14940B7602DDAE2E6B0BF3F0D4CB444C149400F90AA114BE5B0BFDF4571C444C14940C315CA6815E4B0BF22EF51BF41C149407553475C62FAB0BFABF247DD40C149409229D71500FBB0BF290DBA3D42C14940288A4402F5F6B0BF2A75F66542C149407A5DCD9BBFF6B0BFA6603AFA41C149402CB891CD70F3B0BF5915431A42C1494065F5B0EEBFF4B0BF7054DF6345C149408FC6139C22F1B0BFA6C9228845C149409F7A08CBCAF1B0BFD072A12547C1494002EE24FF57F2B0BF2BBB7A1F47C149404022C0F4D8F2B0BF35096D6248C14940989824336BF2B0BF4DE0656648C14940542389E416F3B0BF728C77DA49C149402593C1408CF3B0BF1304FFD849C149403DFFF87EEAF3B0BF139D72E84AC149401A10C9B46CF3B0BFF2202AF14AC14940166247F7D2F3B0BFBB633EFE4BC14940E6A797A68FF4B0BF8E1D2BF14BC149404A38F4064FF5B0BF34CAF4ED4DC14940	St	E1 8HY	0	\N	Wellclose Square		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: map_feature_categories; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_feature_categories (id, feature_id, category_id) FROM stdin;
\.


--
-- Name: map_feature_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_feature_categories_id_seq', 1, false);


--
-- Name: map_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_feature_id_seq', 1399, true);


--
-- Data for Name: map_image; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_image (id, title, file, author_id, feature_id, pending, published, description, last_edited) FROM stdin;
1	Whitechapel Bell Foundry Yard	uploads/features/None/DP130590.jpg	1	155	f	t	<p><br></p>	2016-04-28
2	The Mosque from Whitechapel Road	uploads/features/None/elm.png	2	954	f	t		2016-04-28
\.


--
-- Name: map_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_image_id_seq', 2, true);


--
-- Data for Name: map_media; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY map_media (id, title, description, url, published, pending, author_id, feature_id, last_edited) FROM stdin;
1	A Tour of Whitechapel Bell Foundry	Meet Alan Hughes whose family has been casting bells in East London since 1884.	https://www.youtube.com/watch?v=sERVra9wfXI	t	f	2	155	2016-04-28
\.


--
-- Name: map_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('map_media_id_seq', 2, true);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
3	instagram	1398479841	2016-05-06 09:11:26.602932+01	2016-05-05 11:47:50.615185+01	{"username": "walled_city", "bio": "", "website": "", "profile_picture": "https://scontent.cdninstagram.com/t51.2885-19/11906329_960233084022564_1448528159_a.jpg", "full_name": "", "counts": {"media": 36, "followed_by": 23, "follows": 32}, "id": "1398479841"}	5
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 3, true);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	twitter	Twitter	cAkD3u9lYNAlzQdUjO5M1Smvx	 icvhNP9dFGgrJueS0vJbt6RHwgzPgIaLHmBu9HmMaGlzV3c449	
2	google	Google	 433475857212-1c76qnt7tbu54h4rrg8rno6vqa75qsvp.apps.googleusercontent.com 	 gt58YFJLOzB_6ZkG8Ez8mRs2 	
3	pinterest	Pinterest	4832813337259557683	37faa498aea4c88a6e9264d5f2cc1e0e7427e93dab3e193fed6948ec6f7530fd	
4	instagram	Instagram	611ea2a7c7bd4321b21a2bc057e19d18	9ef89d0b19e34bdeaea871c62225d63f	
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 4, true);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 4, true);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
2	1398479841.611ea2a.2ff7b1f24c654ab79b1100e903c680fb		\N	3	4
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 2, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys  FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	art	art
2	gallery	gallery
3	foundry	foundry
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 3, true);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	396	9	1
2	396	9	2
3	155	9	3
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 3, true);


--
-- Data for Name: whitechapel_pages_page; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY whitechapel_pages_page (id, title, body, is_front_page, banner_image, slug) FROM stdin;
4	About this Project	<p>The Survey of London provides essential reading for anyone wishing to find out about the capital&rsquo;s built environment. The Survey of London has explored a wide variety of London districts in its 120-year history, from Soho, Mayfair and Covent Garden in the West End to Woolwich, Highgate and Norwood in the inner suburbs. In 2013, we became a part of The Bartlett, continuing our research to produce the detailed architectural and topographical studies we have been publishing for more than 100 years.</p>\r\n	f		about-this-project
1	Telling the Histories of Whitechapel	<p>This website about the history of Whitechapel&#39;s buildings and places is being built collaboratively by the Survey of London and you, the reading public. We welcome information, images, photographs, drawings and reminiscences.</p>\r\n\r\n<p>To start contributing, click <a href="/accounts/login/">here</a>.</p>\r\n	t	./26617_002.jpg	telling-the-histories-of-whitechapel
\.


--
-- Data for Name: whitechapel_pages_page_documents; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY whitechapel_pages_page_documents (id, page_id, document_id) FROM stdin;
7	1	1
\.


--
-- Name: whitechapel_pages_page_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('whitechapel_pages_page_documents_id_seq', 7, true);


--
-- Data for Name: whitechapel_pages_page_features; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY whitechapel_pages_page_features (id, page_id, feature_id) FROM stdin;
\.


--
-- Name: whitechapel_pages_page_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('whitechapel_pages_page_features_id_seq', 1, false);


--
-- Name: whitechapel_pages_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('whitechapel_pages_page_id_seq', 4, true);


--
-- Data for Name: whitechapel_pages_page_images; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY whitechapel_pages_page_images (id, page_id, image_id) FROM stdin;
\.


--
-- Name: whitechapel_pages_page_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('whitechapel_pages_page_images_id_seq', 1, false);


--
-- Data for Name: whitechapel_pages_page_media; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY whitechapel_pages_page_media (id, page_id, media_id) FROM stdin;
12	1	1
\.


--
-- Name: whitechapel_pages_page_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('whitechapel_pages_page_media_id_seq', 12, true);


--
-- Data for Name: whitechapel_users_userprofile; Type: TABLE DATA; Schema: public; Owner: whitechapel_geodjango
--

COPY whitechapel_users_userprofile (id, display_name, user_id) FROM stdin;
2	Survey of London	2
1	Duncan Hay	1
3	Shlomit Flint	6
\.


--
-- Name: whitechapel_users_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whitechapel_geodjango
--

SELECT pg_catalog.setval('whitechapel_users_userprofile_id_seq', 3, true);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_40116450c1e4f2ed_uniq; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_40116450c1e4f2ed_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_66cc758d07ef9fce_uniq; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_66cc758d07ef9fce_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: map_category_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_category
    ADD CONSTRAINT map_category_pkey PRIMARY KEY (id);


--
-- Name: map_document_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_document
    ADD CONSTRAINT map_document_pkey PRIMARY KEY (id);


--
-- Name: map_documenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_documenttype
    ADD CONSTRAINT map_documenttype_pkey PRIMARY KEY (id);


--
-- Name: map_feature_categories_feature_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_feature_categories
    ADD CONSTRAINT map_feature_categories_feature_id_category_id_key UNIQUE (feature_id, category_id);


--
-- Name: map_feature_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_feature_categories
    ADD CONSTRAINT map_feature_categories_pkey PRIMARY KEY (id);


--
-- Name: map_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_feature
    ADD CONSTRAINT map_feature_pkey PRIMARY KEY (id);


--
-- Name: map_image_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_image
    ADD CONSTRAINT map_image_pkey PRIMARY KEY (id);


--
-- Name: map_media_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY map_media
    ADD CONSTRAINT map_media_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_provider_36eec1734f431f56_uniq; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_36eec1734f431f56_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_site_id_key UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken_app_id_697928748c2e1968_uniq; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_697928748c2e1968_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_pages_page_documents_page_id_document_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_documents
    ADD CONSTRAINT whitechapel_pages_page_documents_page_id_document_id_key UNIQUE (page_id, document_id);


--
-- Name: whitechapel_pages_page_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_documents
    ADD CONSTRAINT whitechapel_pages_page_documents_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_pages_page_features_page_id_feature_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_features
    ADD CONSTRAINT whitechapel_pages_page_features_page_id_feature_id_key UNIQUE (page_id, feature_id);


--
-- Name: whitechapel_pages_page_features_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_features
    ADD CONSTRAINT whitechapel_pages_page_features_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_pages_page_images_page_id_image_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_images
    ADD CONSTRAINT whitechapel_pages_page_images_page_id_image_id_key UNIQUE (page_id, image_id);


--
-- Name: whitechapel_pages_page_images_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_images
    ADD CONSTRAINT whitechapel_pages_page_images_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_pages_page_media_page_id_media_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_media
    ADD CONSTRAINT whitechapel_pages_page_media_page_id_media_id_key UNIQUE (page_id, media_id);


--
-- Name: whitechapel_pages_page_media_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page_media
    ADD CONSTRAINT whitechapel_pages_page_media_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_pages_page_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_pages_page
    ADD CONSTRAINT whitechapel_pages_page_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_users_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_users_userprofile
    ADD CONSTRAINT whitechapel_users_userprofile_pkey PRIMARY KEY (id);


--
-- Name: whitechapel_users_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

ALTER TABLE ONLY whitechapel_users_userprofile
    ADD CONSTRAINT whitechapel_users_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX account_emailaddress_e8701ad4 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_206527469d8e1918_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX account_emailaddress_email_206527469d8e1918_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX account_emailconfirmation_6f1edeac ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_7033a271201d424f_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX account_emailconfirmation_key_7033a271201d424f_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_30f1630fdb723040_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_30f1630fdb723040_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_67630ca484c5f723_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_67630ca484c5f723_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_6faf8e189302c6aa_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_6faf8e189302c6aa_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_31873c4cca5ed053_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_31873c4cca5ed053_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: map_document_4f331e2f; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_document_4f331e2f ON map_document USING btree (author_id);


--
-- Name: map_document_966f1d8b; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_document_966f1d8b ON map_document USING btree (feature_id);


--
-- Name: map_document_bd49ca7f; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_document_bd49ca7f ON map_document USING btree (document_type_id);


--
-- Name: map_feature_categories_86d175dd; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_feature_categories_86d175dd ON map_feature_categories USING btree (feature_id);


--
-- Name: map_feature_categories_b583a629; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_feature_categories_b583a629 ON map_feature_categories USING btree (category_id);


--
-- Name: map_image_4f331e2f; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_image_4f331e2f ON map_image USING btree (author_id);


--
-- Name: map_image_86d175dd; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_image_86d175dd ON map_image USING btree (feature_id);


--
-- Name: map_media_4f331e2f; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_media_4f331e2f ON map_media USING btree (author_id);


--
-- Name: map_media_86d175dd; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX map_media_86d175dd ON map_media USING btree (feature_id);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: taggit_tag_name_4ed9aad194b72af1_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX taggit_tag_name_4ed9aad194b72af1_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_703438030cd922a7_like; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX taggit_tag_slug_703438030cd922a7_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: whitechapel_pages_page_2dbcba41; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_2dbcba41 ON whitechapel_pages_page USING btree (slug);


--
-- Name: whitechapel_pages_page_documents_1a63c800; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_documents_1a63c800 ON whitechapel_pages_page_documents USING btree (page_id);


--
-- Name: whitechapel_pages_page_documents_e7fafc10; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_documents_e7fafc10 ON whitechapel_pages_page_documents USING btree (document_id);


--
-- Name: whitechapel_pages_page_features_1a63c800; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_features_1a63c800 ON whitechapel_pages_page_features USING btree (page_id);


--
-- Name: whitechapel_pages_page_features_86d175dd; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_features_86d175dd ON whitechapel_pages_page_features USING btree (feature_id);


--
-- Name: whitechapel_pages_page_images_1a63c800; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_images_1a63c800 ON whitechapel_pages_page_images USING btree (page_id);


--
-- Name: whitechapel_pages_page_images_f33175e6; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_images_f33175e6 ON whitechapel_pages_page_images USING btree (image_id);


--
-- Name: whitechapel_pages_page_media_1a63c800; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_media_1a63c800 ON whitechapel_pages_page_media USING btree (page_id);


--
-- Name: whitechapel_pages_page_media_35bf24f6; Type: INDEX; Schema: public; Owner: whitechapel_geodjango; Tablespace: 
--

CREATE INDEX whitechapel_pages_page_media_35bf24f6 ON whitechapel_pages_page_media USING btree (media_id);


--
-- Name: ac_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT ac_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress_user_id_5c85949e40d9a61d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_5c85949e40d9a61d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e_thumbnail_id_29ad34faceb3c17c_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT e_thumbnail_id_29ad34faceb3c17c_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_th_source_id_50b260de7106e1b7_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_th_source_id_50b260de7106e1b7_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_do_document_type_id_3af995a4b750641f_fk_map_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_document
    ADD CONSTRAINT map_do_document_type_id_3af995a4b750641f_fk_map_documenttype_id FOREIGN KEY (document_type_id) REFERENCES map_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_document_author_id_e901852b2f9bdc5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_document
    ADD CONSTRAINT map_document_author_id_e901852b2f9bdc5_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_document_feature_id_40e365b7c66ae21d_fk; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_document
    ADD CONSTRAINT map_document_feature_id_40e365b7c66ae21d_fk FOREIGN KEY (feature_id) REFERENCES map_feature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_feature_cat_category_id_43999b5f07db73dc_fk_map_category_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_feature_categories
    ADD CONSTRAINT map_feature_cat_category_id_43999b5f07db73dc_fk_map_category_id FOREIGN KEY (category_id) REFERENCES map_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_feature_categ_feature_id_782bd935402e575f_fk_map_feature_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_feature_categories
    ADD CONSTRAINT map_feature_categ_feature_id_782bd935402e575f_fk_map_feature_id FOREIGN KEY (feature_id) REFERENCES map_feature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_image_author_id_28d1acb4e34f8010_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_image
    ADD CONSTRAINT map_image_author_id_28d1acb4e34f8010_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_image_feature_id_2a49f778a1f421de_fk_map_feature_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_image
    ADD CONSTRAINT map_image_feature_id_2a49f778a1f421de_fk_map_feature_id FOREIGN KEY (feature_id) REFERENCES map_feature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_media_author_id_554cabe75c742cb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_media
    ADD CONSTRAINT map_media_author_id_554cabe75c742cb_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_media_feature_id_11576490c131d12d_fk_map_feature_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY map_media
    ADD CONSTRAINT map_media_feature_id_11576490c131d12d_fk_map_feature_id FOREIGN KEY (feature_id) REFERENCES map_feature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: s_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT s_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: soc_socialapp_id_7b02380b6127b1b8_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT soc_socialapp_id_7b02380b6127b1b8_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialacco_app_id_2125549785bd662_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialacco_app_id_2125549785bd662_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_sociala_site_id_a859406a22be3fe_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_sociala_site_id_a859406a22be3fe_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialac_user_id_3fd78aac97693583_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialac_user_id_3fd78aac97693583_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechap_page_id_140a236106107a32_fk_whitechapel_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_images
    ADD CONSTRAINT whitechap_page_id_140a236106107a32_fk_whitechapel_pages_page_id FOREIGN KEY (page_id) REFERENCES whitechapel_pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechap_page_id_1a27c21e135ab3b9_fk_whitechapel_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_features
    ADD CONSTRAINT whitechap_page_id_1a27c21e135ab3b9_fk_whitechapel_pages_page_id FOREIGN KEY (page_id) REFERENCES whitechapel_pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechap_page_id_2e19275f7adfb24d_fk_whitechapel_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_media
    ADD CONSTRAINT whitechap_page_id_2e19275f7adfb24d_fk_whitechapel_pages_page_id FOREIGN KEY (page_id) REFERENCES whitechapel_pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechap_page_id_52cb2dc375bd12c5_fk_whitechapel_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_documents
    ADD CONSTRAINT whitechap_page_id_52cb2dc375bd12c5_fk_whitechapel_pages_page_id FOREIGN KEY (page_id) REFERENCES whitechapel_pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechapel_pag_document_id_20648fd2c6b1142b_fk_map_document_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_documents
    ADD CONSTRAINT whitechapel_pag_document_id_20648fd2c6b1142b_fk_map_document_id FOREIGN KEY (document_id) REFERENCES map_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechapel_pages__feature_id_f2535f456da966b_fk_map_feature_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_features
    ADD CONSTRAINT whitechapel_pages__feature_id_f2535f456da966b_fk_map_feature_id FOREIGN KEY (feature_id) REFERENCES map_feature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechapel_pages_pag_image_id_218d84f0548f430b_fk_map_image_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_images
    ADD CONSTRAINT whitechapel_pages_pag_image_id_218d84f0548f430b_fk_map_image_id FOREIGN KEY (image_id) REFERENCES map_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechapel_pages_pag_media_id_7da515ef2834fd4b_fk_map_media_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_pages_page_media
    ADD CONSTRAINT whitechapel_pages_pag_media_id_7da515ef2834fd4b_fk_map_media_id FOREIGN KEY (media_id) REFERENCES map_media(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: whitechapel_users_user_user_id_290f9fabb080dc28_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: whitechapel_geodjango
--

ALTER TABLE ONLY whitechapel_users_userprofile
    ADD CONSTRAINT whitechapel_users_user_user_id_290f9fabb080dc28_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

