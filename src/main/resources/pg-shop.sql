--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-30 04:04:12 UTC

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16468)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    userid bigint,
    sessionid character varying(100) NOT NULL,
    token character varying(100) NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    firstname character varying(50),
    middlename character varying(50),
    lastname character varying(50),
    mobile character varying(15),
    email character varying(50),
    line1 character varying(50),
    line2 character varying(50),
    city character varying(50),
    province character varying(50),
    country character varying(50),
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone,
    content text
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16467)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 219
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 236 (class 1259 OID 16642)
-- Name: cart_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_item (
    id integer NOT NULL,
    productid bigint NOT NULL,
    cartid bigint NOT NULL,
    sku character varying(100) NOT NULL,
    price double precision DEFAULT 0 NOT NULL,
    discount double precision DEFAULT 0 NOT NULL,
    quantity smallint DEFAULT 0 NOT NULL,
    active boolean DEFAULT false NOT NULL,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone,
    content text
);


ALTER TABLE public.cart_item OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16641)
-- Name: cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_item_id_seq OWNER TO postgres;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 235
-- Name: cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_item_id_seq OWNED BY public.cart_item.id;


--
-- TOC entry 222 (class 1259 OID 16502)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    parentid bigint,
    title character varying(75) NOT NULL,
    metatitle character varying(100),
    slug character varying(100) NOT NULL,
    content text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16501)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 224 (class 1259 OID 16516)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    userid bigint,
    sessionid character varying(100) NOT NULL,
    token character varying(100) NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    subtotal double precision DEFAULT 0 NOT NULL,
    itemdiscount double precision DEFAULT 0 NOT NULL,
    tax double precision DEFAULT 0 NOT NULL,
    shipping double precision DEFAULT 0 NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    promo character varying(50),
    discount double precision DEFAULT 0 NOT NULL,
    grandtotal double precision DEFAULT 0 NOT NULL,
    firstname character varying(50),
    middlename character varying(50),
    lastname character varying(50),
    mobile character varying(15),
    email character varying(50),
    line1 character varying(50),
    line2 character varying(50),
    city character varying(50),
    province character varying(50),
    country character varying(50),
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone,
    content text
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16515)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO postgres;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- TOC entry 238 (class 1259 OID 16665)
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    productid bigint NOT NULL,
    orderid bigint NOT NULL,
    sku character varying(100) NOT NULL,
    price double precision DEFAULT 0 NOT NULL,
    discount double precision DEFAULT 0 NOT NULL,
    quantity smallint DEFAULT 0 NOT NULL,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone,
    content text
);


ALTER TABLE public.order_item OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16664)
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_item_id_seq OWNER TO postgres;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 237
-- Name: order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;


--
-- TOC entry 226 (class 1259 OID 16538)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    userid bigint NOT NULL,
    title character varying(75) NOT NULL,
    metatitle character varying(100),
    slug character varying(100) NOT NULL,
    summary text,
    type smallint DEFAULT 0 NOT NULL,
    sku character varying(100) NOT NULL,
    price double precision DEFAULT 0 NOT NULL,
    discount double precision DEFAULT 0 NOT NULL,
    quantity smallint DEFAULT 0 NOT NULL,
    shop boolean DEFAULT false NOT NULL,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone,
    publishedat timestamp without time zone,
    startsat timestamp without time zone,
    endsat timestamp without time zone,
    content text
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16556)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    productid bigint NOT NULL,
    categoryid bigint NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16537)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 229 (class 1259 OID 16572)
-- Name: product_meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_meta (
    id integer NOT NULL,
    productid bigint NOT NULL,
    key character varying(50) NOT NULL,
    content text
);


ALTER TABLE public.product_meta OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16571)
-- Name: product_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_meta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_meta_id_seq OWNER TO postgres;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 228
-- Name: product_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_meta_id_seq OWNED BY public.product_meta.id;


--
-- TOC entry 231 (class 1259 OID 16586)
-- Name: product_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_review (
    id integer NOT NULL,
    productid bigint NOT NULL,
    parentid bigint,
    title character varying(100) NOT NULL,
    rating smallint DEFAULT 0 NOT NULL,
    published boolean DEFAULT false NOT NULL,
    createdat timestamp without time zone NOT NULL,
    publishedat timestamp without time zone,
    content text
);


ALTER TABLE public.product_review OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16585)
-- Name: product_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_review_id_seq OWNER TO postgres;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 230
-- Name: product_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_review_id_seq OWNED BY public.product_review.id;


--
-- TOC entry 234 (class 1259 OID 16625)
-- Name: product_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag (
    productid bigint NOT NULL,
    tagid bigint NOT NULL
);


ALTER TABLE public.product_tag OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16617)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    title character varying(75) NOT NULL,
    metatitle character varying(100),
    slug character varying(100) NOT NULL,
    content text
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16616)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_seq OWNER TO postgres;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 232
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- TOC entry 240 (class 1259 OID 16687)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    userid bigint NOT NULL,
    orderid bigint NOT NULL,
    code character varying(100) NOT NULL,
    type smallint DEFAULT 0 NOT NULL,
    mode smallint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone,
    content text
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16686)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_seq OWNER TO postgres;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 239
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 218 (class 1259 OID 16420)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    firstname character varying(50),
    middlename character varying(50),
    lastname character varying(50),
    mobile character varying(15),
    email character varying(50),
    passwordhash character varying(32) NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    vendor boolean DEFAULT false NOT NULL,
    registeredat timestamp without time zone NOT NULL,
    lastlogin timestamp without time zone,
    intro text,
    profile text
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16419)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3314 (class 2604 OID 16471)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 16645)
-- Name: cart_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item ALTER COLUMN id SET DEFAULT nextval('public.cart_item_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 16505)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 16519)
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 16668)
-- Name: order_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 16541)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 16575)
-- Name: product_meta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_meta ALTER COLUMN id SET DEFAULT nextval('public.product_meta_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 16589)
-- Name: product_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review ALTER COLUMN id SET DEFAULT nextval('public.product_review_id_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 16620)
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 16690)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 16423)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3375 (class 2606 OID 16653)
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3357 (class 2606 OID 16476)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 16509)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 16675)
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3361 (class 2606 OID 16531)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 16560)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (productid, categoryid);


--
-- TOC entry 3367 (class 2606 OID 16579)
-- Name: product_meta product_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_meta
    ADD CONSTRAINT product_meta_pkey PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 16550)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3369 (class 2606 OID 16595)
-- Name: product_review product_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT product_review_pkey PRIMARY KEY (id);


--
-- TOC entry 3373 (class 2606 OID 16629)
-- Name: product_tag product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_pkey PRIMARY KEY (productid, tagid);


--
-- TOC entry 3371 (class 2606 OID 16624)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 16697)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 16433)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 3353 (class 2606 OID 16431)
-- Name: user user_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_mobile_key UNIQUE (mobile);


--
-- TOC entry 3355 (class 2606 OID 16429)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 16654)
-- Name: cart_item fk_cart_item_cart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT fk_cart_item_cart FOREIGN KEY (cartid) REFERENCES public.cart(id);


--
-- TOC entry 3392 (class 2606 OID 16659)
-- Name: cart_item fk_cart_item_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT fk_cart_item_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3380 (class 2606 OID 16477)
-- Name: cart fk_cart_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_user FOREIGN KEY (userid) REFERENCES public."user"(id);


--
-- TOC entry 3381 (class 2606 OID 16510)
-- Name: category fk_category_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fk_category_parent FOREIGN KEY (parentid) REFERENCES public.category(id);


--
-- TOC entry 3386 (class 2606 OID 16580)
-- Name: product_meta fk_meta_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_meta
    ADD CONSTRAINT fk_meta_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3393 (class 2606 OID 16676)
-- Name: order_item fk_order_item_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_order_item_order FOREIGN KEY (orderid) REFERENCES public."order"(id);


--
-- TOC entry 3394 (class 2606 OID 16681)
-- Name: order_item fk_order_item_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_order_item_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3382 (class 2606 OID 16532)
-- Name: order fk_order_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_order_user FOREIGN KEY (userid) REFERENCES public."user"(id);


--
-- TOC entry 3384 (class 2606 OID 16561)
-- Name: product_category fk_pc_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT fk_pc_category FOREIGN KEY (categoryid) REFERENCES public.category(id);


--
-- TOC entry 3385 (class 2606 OID 16566)
-- Name: product_category fk_pc_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT fk_pc_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3383 (class 2606 OID 16551)
-- Name: product fk_product_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_user FOREIGN KEY (userid) REFERENCES public."user"(id);


--
-- TOC entry 3389 (class 2606 OID 16630)
-- Name: product_tag fk_pt_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT fk_pt_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3390 (class 2606 OID 16635)
-- Name: product_tag fk_pt_tag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT fk_pt_tag FOREIGN KEY (tagid) REFERENCES public.tag(id);


--
-- TOC entry 3387 (class 2606 OID 16596)
-- Name: product_review fk_review_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT fk_review_parent FOREIGN KEY (parentid) REFERENCES public.product_review(id);


--
-- TOC entry 3388 (class 2606 OID 16601)
-- Name: product_review fk_review_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT fk_review_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3395 (class 2606 OID 16698)
-- Name: transaction fk_transaction_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_transaction_order FOREIGN KEY (orderid) REFERENCES public."order"(id);


--
-- TOC entry 3396 (class 2606 OID 16703)
-- Name: transaction fk_transaction_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_transaction_user FOREIGN KEY (userid) REFERENCES public."user"(id);


-- Completed on 2025-03-30 04:04:12 UTC

--
-- PostgreSQL database dump complete
--
