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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bills; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE bills (
    id integer NOT NULL,
    subscription_id integer,
    amount numeric(15,2),
    status character varying,
    payer_email character varying,
    transaction_id character varying,
    plan_name character varying,
    branches text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    client_id integer
);


ALTER TABLE public.bills OWNER TO appsource;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_id_seq OWNER TO appsource;

--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE bills_id_seq OWNED BY bills.id;


--
-- Name: branch_subscriptions; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE branch_subscriptions (
    id integer NOT NULL,
    branch_id integer,
    subscription_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.branch_subscriptions OWNER TO appsource;

--
-- Name: branch_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE branch_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_subscriptions_id_seq OWNER TO appsource;

--
-- Name: branch_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE branch_subscriptions_id_seq OWNED BY branch_subscriptions.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE branches (
    id integer NOT NULL,
    brand_id integer,
    name character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zip integer,
    province_state character varying,
    country character varying,
    status character varying,
    landline_no character varying,
    mobile_no character varying,
    fax_no character varying,
    is_franchise boolean,
    email_address character varying,
    breadcrumbs boolean,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color character varying
);


ALTER TABLE public.branches OWNER TO appsource;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO appsource;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE branches_id_seq OWNED BY branches.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE brands (
    id integer NOT NULL,
    client_id integer,
    name character varying,
    description character varying,
    landline_no character varying,
    mobile_no character varying,
    fax_no character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_update_at timestamp without time zone,
    website character varying,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO appsource;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO appsource;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    brand_id integer,
    name character varying,
    description character varying,
    is_active boolean DEFAULT true,
    track_as_sales boolean,
    is_deleted boolean DEFAULT false,
    parent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO appsource;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO appsource;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: client_user_accesses; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE client_user_accesses (
    id integer NOT NULL,
    user_id integer,
    client_id integer,
    role_id integer,
    brand_id integer,
    branch_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.client_user_accesses OWNER TO appsource;

--
-- Name: client_user_accesses_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE client_user_accesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_user_accesses_id_seq OWNER TO appsource;

--
-- Name: client_user_accesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE client_user_accesses_id_seq OWNED BY client_user_accesses.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    name character varying,
    landline character varying,
    mobile character varying,
    fax character varying,
    website character varying,
    email character varying,
    address1 character varying,
    address2 character varying,
    contact character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_uploaded_at timestamp without time zone,
    flag integer DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.clients OWNER TO appsource;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO appsource;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: conversions; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE conversions (
    id integer NOT NULL,
    brand_id integer,
    from_unit_id integer,
    to_unit_id integer,
    factor numeric,
    is_active boolean DEFAULT true,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.conversions OWNER TO appsource;

--
-- Name: conversions_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE conversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversions_id_seq OWNER TO appsource;

--
-- Name: conversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE conversions_id_seq OWNED BY conversions.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE dashboards (
    id integer NOT NULL,
    client_id integer,
    brand_id integer,
    branch_id integer,
    customer_count integer,
    previous_date_entry date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    purchase_total_amount numeric,
    sales_total_amount numeric
);


ALTER TABLE public.dashboards OWNER TO appsource;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO appsource;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE dashboards_id_seq OWNED BY dashboards.id;


--
-- Name: employee_types; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE employee_types (
    id integer NOT NULL,
    name character varying,
    description text,
    dividend_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.employee_types OWNER TO appsource;

--
-- Name: employee_types_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE employee_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_types_id_seq OWNER TO appsource;

--
-- Name: employee_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE employee_types_id_seq OWNED BY employee_types.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    branch_id integer,
    employee_type_id integer,
    first_name character varying,
    last_name character varying,
    date_employed date,
    job_id integer,
    birthdate date,
    contact_no character varying,
    sss character varying,
    tin character varying,
    address text,
    hdmf character varying,
    age integer,
    philhealth character varying,
    "position" character varying,
    position_type character varying,
    end_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.employees OWNER TO appsource;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO appsource;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: inventories; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE inventories (
    id integer NOT NULL,
    branch_id integer,
    user_id integer,
    entry_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inventories OWNER TO appsource;

--
-- Name: inventories_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE inventories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventories_id_seq OWNER TO appsource;

--
-- Name: inventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE inventories_id_seq OWNED BY inventories.id;


--
-- Name: inventory_items; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE inventory_items (
    id integer NOT NULL,
    inventory_id integer,
    item_id integer,
    stock_count numeric(15,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inventory_items OWNER TO appsource;

--
-- Name: inventory_items_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE inventory_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_items_id_seq OWNER TO appsource;

--
-- Name: inventory_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE inventory_items_id_seq OWNED BY inventory_items.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    brand_id integer,
    unit_id integer,
    category_id integer,
    name character varying,
    item_type character varying,
    is_active boolean DEFAULT true,
    track_as_sales boolean,
    is_deleted boolean DEFAULT false,
    item_value numeric,
    item_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.items OWNER TO appsource;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO appsource;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: labor_hours; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE labor_hours (
    id integer NOT NULL,
    employee_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.labor_hours OWNER TO appsource;

--
-- Name: labor_hours_entries; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE labor_hours_entries (
    id integer NOT NULL,
    labor_hour_id integer,
    working_date date,
    branch_id integer,
    regular numeric,
    overtime numeric,
    night_differential numeric,
    legal_holiday numeric,
    special_holiday numeric,
    absent numeric,
    late numeric,
    rest_day numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.labor_hours_entries OWNER TO appsource;

--
-- Name: labor_hours_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE labor_hours_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_hours_entries_id_seq OWNER TO appsource;

--
-- Name: labor_hours_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE labor_hours_entries_id_seq OWNED BY labor_hours_entries.id;


--
-- Name: labor_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE labor_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_hours_id_seq OWNER TO appsource;

--
-- Name: labor_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE labor_hours_id_seq OWNED BY labor_hours.id;


--
-- Name: manifolds; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE manifolds (
    id integer NOT NULL,
    client_id integer,
    name character varying,
    description character varying,
    is_active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.manifolds OWNER TO appsource;

--
-- Name: manifolds_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE manifolds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manifolds_id_seq OWNER TO appsource;

--
-- Name: manifolds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE manifolds_id_seq OWNED BY manifolds.id;


--
-- Name: order_lists; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE order_lists (
    id integer NOT NULL,
    po_date timestamp without time zone,
    po_number character varying,
    terms text,
    remarks text,
    supplier_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    pr_number character varying,
    pr_date timestamp without time zone
);


ALTER TABLE public.order_lists OWNER TO appsource;

--
-- Name: order_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE order_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_lists_id_seq OWNER TO appsource;

--
-- Name: order_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE order_lists_id_seq OWNED BY order_lists.id;


--
-- Name: order_per_suppliers; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE order_per_suppliers (
    id integer NOT NULL,
    supplier_id integer,
    item_id integer,
    price_selected numeric(16,2),
    branch_id integer,
    quantity integer,
    unit character varying,
    remarks text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_list_id integer
);


ALTER TABLE public.order_per_suppliers OWNER TO appsource;

--
-- Name: order_per_suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE order_per_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_per_suppliers_id_seq OWNER TO appsource;

--
-- Name: order_per_suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE order_per_suppliers_id_seq OWNED BY order_per_suppliers.id;


--
-- Name: payment_notifications; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE payment_notifications (
    id integer NOT NULL,
    params text,
    transaction_type character varying,
    status character varying,
    transaction_id character varying,
    subscription_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payment_notifications OWNER TO appsource;

--
-- Name: payment_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE payment_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_notifications_id_seq OWNER TO appsource;

--
-- Name: payment_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE payment_notifications_id_seq OWNED BY payment_notifications.id;


--
-- Name: per_brand_orders; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE per_brand_orders (
    id integer NOT NULL,
    branch_id integer,
    order_list_id integer,
    order_per_supplier_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.per_brand_orders OWNER TO appsource;

--
-- Name: per_brand_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE per_brand_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.per_brand_orders_id_seq OWNER TO appsource;

--
-- Name: per_brand_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE per_brand_orders_id_seq OWNED BY per_brand_orders.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    role_id integer,
    section_id integer,
    client_id integer,
    is_create boolean,
    is_read boolean,
    is_update boolean,
    is_destroy boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO appsource;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO appsource;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE plans (
    id integer NOT NULL,
    name character varying,
    description text,
    amount numeric(15,2),
    period character varying,
    plan_type character varying,
    brand_limit integer,
    branch_limit integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    duration_in_days integer
);


ALTER TABLE public.plans OWNER TO appsource;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO appsource;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE plans_id_seq OWNED BY plans.id;


--
-- Name: purchase_items; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE purchase_items (
    id integer NOT NULL,
    item_id integer,
    unit_id integer,
    purchase_id integer,
    quantity numeric,
    purchase_item_amount numeric(16,2),
    remarks character varying,
    vat_type character varying,
    purchase_item_total_amount numeric,
    borrowed_from_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_items OWNER TO appsource;

--
-- Name: purchase_items_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE purchase_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_items_id_seq OWNER TO appsource;

--
-- Name: purchase_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE purchase_items_id_seq OWNED BY purchase_items.id;


--
-- Name: purchase_order_items; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE purchase_order_items (
    id integer NOT NULL,
    item_id integer,
    unit_id integer,
    purchase_order_id integer,
    quantity numeric,
    price_selected numeric(16,2),
    remarks character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_order_items OWNER TO appsource;

--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE purchase_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_items_id_seq OWNER TO appsource;

--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE purchase_order_items_id_seq OWNED BY purchase_order_items.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE purchase_orders (
    id integer NOT NULL,
    client_id integer,
    brand_id integer,
    branch_id integer,
    po_date date,
    pr_date date,
    po_number character varying,
    pr_number character varying,
    remarks text,
    terms text,
    status character varying,
    supplier_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_orders OWNER TO appsource;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_orders_id_seq OWNER TO appsource;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE purchase_orders_id_seq OWNED BY purchase_orders.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE purchases (
    id integer NOT NULL,
    client_id integer,
    brand_id integer,
    branch_id integer,
    supplier_id integer,
    purchase_date date,
    invoice_number character varying,
    user_created_by_id integer,
    user_modified_by_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchases OWNER TO appsource;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchases_id_seq OWNER TO appsource;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE purchases_id_seq OWNED BY purchases.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    client_id integer,
    name character varying,
    description text,
    role_level character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO appsource;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO appsource;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: sale_by_category_entries; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE sale_by_category_entries (
    id integer NOT NULL,
    sale_id integer,
    category_id integer,
    amount numeric(16,2) DEFAULT 0.0,
    date_created timestamp without time zone,
    client_id integer,
    brand_id integer,
    branch_id integer,
    subcategory_category_id integer,
    subcategory_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sale_by_category_entries OWNER TO appsource;

--
-- Name: sale_by_category_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE sale_by_category_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_by_category_entries_id_seq OWNER TO appsource;

--
-- Name: sale_by_category_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE sale_by_category_entries_id_seq OWNED BY sale_by_category_entries.id;


--
-- Name: sale_by_settlement_entries; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE sale_by_settlement_entries (
    id integer NOT NULL,
    settlement_id integer,
    sale_id integer,
    brand_id integer,
    branch_id integer,
    date_created date,
    client_id integer,
    amount numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sale_by_settlement_entries OWNER TO appsource;

--
-- Name: sale_by_settlement_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE sale_by_settlement_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_by_settlement_entries_id_seq OWNER TO appsource;

--
-- Name: sale_by_settlement_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE sale_by_settlement_entries_id_seq OWNED BY sale_by_settlement_entries.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE sales (
    id integer NOT NULL,
    customer_count integer,
    transaction_count integer,
    branch_id integer,
    created_by_id integer,
    first_time_guest integer,
    repeat_guest integer,
    brand_id integer,
    delivery_transaction_count integer,
    credit_card_transaction_count integer,
    client_id integer,
    sale_date date,
    delivery_sales integer,
    credit_card_sales integer,
    service_charge integer,
    gc_redeemed integer,
    cash_in_drawer integer,
    gc_sales integer,
    other_income integer,
    vat integer,
    shift_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sales OWNER TO appsource;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_id_seq OWNER TO appsource;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE sales_id_seq OWNED BY sales.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO appsource;

--
-- Name: sections; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    page character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.sections OWNER TO appsource;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO appsource;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    theme character varying DEFAULT 'Default'::character varying,
    currency character varying DEFAULT 'Philippine Peso'::character varying,
    language character varying DEFAULT 'English'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    client_id integer
);


ALTER TABLE public.settings OWNER TO appsource;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO appsource;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: settlements; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE settlements (
    id integer NOT NULL,
    name character varying,
    is_complimentary boolean,
    client_id integer,
    description character varying,
    is_active boolean,
    breadcrumbs boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.settlements OWNER TO appsource;

--
-- Name: settlements_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE settlements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settlements_id_seq OWNER TO appsource;

--
-- Name: settlements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE settlements_id_seq OWNED BY settlements.id;


--
-- Name: shifts; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE shifts (
    id integer NOT NULL,
    name character varying,
    brand_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shifts OWNER TO appsource;

--
-- Name: shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shifts_id_seq OWNER TO appsource;

--
-- Name: shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE shifts_id_seq OWNED BY shifts.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    client_id integer,
    plan_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status character varying,
    paypal_customer_token character varying,
    paypal_recurring_profile_token character varying,
    paypal_email character varying,
    paypal_payment_token character varying,
    previous_payment timestamp without time zone,
    next_payment timestamp without time zone,
    branch_count integer,
    period character varying,
    amount numeric(15,2),
    outstanding_balance numeric(15,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO appsource;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO appsource;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: supplier_item_prices; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE supplier_item_prices (
    id integer NOT NULL,
    supplier_id integer,
    item_id integer,
    supplier_amount numeric(16,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    supplier_item_unit character varying,
    packaging character varying
);


ALTER TABLE public.supplier_item_prices OWNER TO appsource;

--
-- Name: supplier_item_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE supplier_item_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_item_prices_id_seq OWNER TO appsource;

--
-- Name: supplier_item_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE supplier_item_prices_id_seq OWNED BY supplier_item_prices.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE suppliers (
    id integer NOT NULL,
    brand_id integer,
    client_id integer,
    branch_id integer,
    name character varying,
    address text,
    email character varying,
    contact_person character varying,
    contact_title character varying,
    tin character varying,
    mobile_no character varying,
    fax_no character varying,
    landline_no character varying,
    is_active boolean,
    assigned_to integer DEFAULT 1,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.suppliers OWNER TO appsource;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_id_seq OWNER TO appsource;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE suppliers_id_seq OWNED BY suppliers.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE units (
    id integer NOT NULL,
    brand_id integer,
    name character varying,
    symbol character varying,
    remarks character varying,
    is_active boolean DEFAULT true,
    track_as_sales boolean,
    is_deleted boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.units OWNER TO appsource;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_id_seq OWNER TO appsource;

--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE units_id_seq OWNED BY units.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: appsource; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    mobile character varying,
    username character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    daily_sales_recipient boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    flag integer DEFAULT 6
);


ALTER TABLE public.users OWNER TO appsource;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: appsource
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO appsource;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appsource
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY bills ALTER COLUMN id SET DEFAULT nextval('bills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY branch_subscriptions ALTER COLUMN id SET DEFAULT nextval('branch_subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY client_user_accesses ALTER COLUMN id SET DEFAULT nextval('client_user_accesses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY conversions ALTER COLUMN id SET DEFAULT nextval('conversions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY dashboards ALTER COLUMN id SET DEFAULT nextval('dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY employee_types ALTER COLUMN id SET DEFAULT nextval('employee_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY inventories ALTER COLUMN id SET DEFAULT nextval('inventories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY inventory_items ALTER COLUMN id SET DEFAULT nextval('inventory_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY labor_hours ALTER COLUMN id SET DEFAULT nextval('labor_hours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY labor_hours_entries ALTER COLUMN id SET DEFAULT nextval('labor_hours_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY manifolds ALTER COLUMN id SET DEFAULT nextval('manifolds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY order_lists ALTER COLUMN id SET DEFAULT nextval('order_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY order_per_suppliers ALTER COLUMN id SET DEFAULT nextval('order_per_suppliers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY payment_notifications ALTER COLUMN id SET DEFAULT nextval('payment_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY per_brand_orders ALTER COLUMN id SET DEFAULT nextval('per_brand_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchase_items ALTER COLUMN id SET DEFAULT nextval('purchase_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchase_order_items ALTER COLUMN id SET DEFAULT nextval('purchase_order_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchase_orders ALTER COLUMN id SET DEFAULT nextval('purchase_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchases ALTER COLUMN id SET DEFAULT nextval('purchases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sale_by_category_entries ALTER COLUMN id SET DEFAULT nextval('sale_by_category_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sale_by_settlement_entries ALTER COLUMN id SET DEFAULT nextval('sale_by_settlement_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sales ALTER COLUMN id SET DEFAULT nextval('sales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY settlements ALTER COLUMN id SET DEFAULT nextval('settlements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY shifts ALTER COLUMN id SET DEFAULT nextval('shifts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY supplier_item_prices ALTER COLUMN id SET DEFAULT nextval('supplier_item_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY suppliers ALTER COLUMN id SET DEFAULT nextval('suppliers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY units ALTER COLUMN id SET DEFAULT nextval('units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY bills (id, subscription_id, amount, status, payer_email, transaction_id, plan_name, branches, start_date, end_date, created_at, updated_at, client_id) FROM stdin;
1	10	119.97	Completed	chezca1228@yahoo.com	4XX51094HW774854R	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-07 10:22:52.179603	2017-04-07 10:22:52.179654	2017-03-07 10:22:52.203606	2017-03-07 10:22:52.203606	1
2	10	119.97	Completed	chezca1228@yahoo.com	4EE585609G7048743	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-09 15:55:13.868169	2017-04-09 15:55:13.868384	2017-03-09 15:55:13.958286	2017-03-09 15:55:13.958286	1
3	11	799.98	Completed	chezca1228@yahoo.com	5YB494474N941852L	\N	Ortigas, Brixton	2017-03-09 15:55:14.752089	2018-03-09 15:55:14.752148	2017-03-09 15:55:14.816805	2017-03-09 15:55:14.816805	2
4	10	119.97	Completed	chezca1228@yahoo.com	70B93961V7753332K	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-09 16:35:30.559311	2017-04-09 16:35:30.559361	2017-03-09 16:35:30.56223	2017-03-09 16:35:30.56223	1
5	11	799.98	Completed	chezca1228@yahoo.com	65T14400L9089101H	\N	Ortigas, Brixton	2017-03-09 17:08:22.337555	2018-03-09 17:08:22.337613	2017-03-09 17:08:22.368171	2017-03-09 17:08:22.368171	2
6	10	119.97	Completed	chezca1228@yahoo.com	27A94040RE802672G	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-09 18:36:40.053786	2017-04-09 18:36:40.053835	2017-03-09 18:36:40.056474	2017-03-09 18:36:40.056474	1
7	11	799.98	Completed	chezca1228@yahoo.com	5634885357120592C	\N	Ortigas, Brixton	2017-03-09 20:49:03.428845	2018-03-09 20:49:03.428893	2017-03-09 20:49:03.435279	2017-03-09 20:49:03.435279	2
8	10	119.97	Completed	chezca1228@yahoo.com	315262499G8450012	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-10 17:59:13.979267	2017-04-10 17:59:13.979307	2017-03-10 17:59:13.982232	2017-03-10 17:59:13.982232	1
9	11	799.98	Completed	chezca1228@yahoo.com	0F217921YC711543B	\N	Ortigas, Brixton	2017-03-10 18:52:33.58683	2018-03-10 18:52:33.586878	2017-03-10 18:52:33.594678	2017-03-10 18:52:33.594678	2
10	11	799.98	Completed	chezca1228@yahoo.com	3VS38502TD920774A	\N	Ortigas, Brixton	2017-03-11 15:03:39.728385	2018-03-11 15:03:39.728443	2017-03-11 15:03:39.787098	2017-03-11 15:03:39.787098	2
11	10	119.97	Completed	chezca1228@yahoo.com	4HN57160L58308314	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-11 15:03:39.854437	2017-04-11 15:03:39.854496	2017-03-11 15:03:39.904707	2017-03-11 15:03:39.904707	1
12	11	799.98	Completed	chezca1228@yahoo.com	2MB54892P47769704	\N	Ortigas, Brixton	2017-03-12 11:41:04.121679	2018-03-12 11:41:04.121728	2017-03-12 11:41:04.124418	2017-03-12 11:41:04.124418	2
13	10	119.97	Completed	chezca1228@yahoo.com	0BS511978D737183V	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-12 11:41:33.137675	2017-04-12 11:41:33.137795	2017-03-12 11:41:33.14092	2017-03-12 11:41:33.14092	1
14	11	799.98	Completed	chezca1228@yahoo.com	5FS82240W49415408	\N	Ortigas, Brixton	2017-03-13 14:11:04.670267	2018-03-13 14:11:04.670307	2017-03-13 14:11:04.676616	2017-03-13 14:11:04.676616	2
15	10	119.97	Completed	chezca1228@yahoo.com	2S001553NW3055430	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-13 14:16:50.265751	2017-04-13 14:16:50.265802	2017-03-13 14:16:50.272366	2017-03-13 14:16:50.272366	1
16	11	799.98	Completed	chezca1228@yahoo.com	8YR70370TV741392H	\N	Ortigas, Brixton	2017-03-14 12:31:49.70037	2018-03-14 12:31:49.700429	2017-03-14 12:31:49.734915	2017-03-14 12:31:49.734915	2
17	10	119.97	Completed	chezca1228@yahoo.com	41472457867844017	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-14 12:34:05.868264	2017-04-14 12:34:05.868315	2017-03-14 12:34:05.874908	2017-03-14 12:34:05.874908	1
18	11	799.98	Completed	chezca1228@yahoo.com	21D818576C9157032	\N	Ortigas, Brixton	2017-03-15 18:18:29.360816	2018-03-15 18:18:29.360876	2017-03-15 18:18:29.391138	2017-03-15 18:18:29.391138	2
19	10	119.97	Completed	chezca1228@yahoo.com	60971981M76901826	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-15 18:19:30.996098	2017-04-15 18:19:30.996161	2017-03-15 18:19:31.025705	2017-03-15 18:19:31.025705	1
20	11	799.98	Completed	chezca1228@yahoo.com	0KJ2602797380661H	\N	Ortigas, Brixton	2017-03-16 10:08:14.577297	2018-03-16 10:08:14.57735	2017-03-16 10:08:14.580386	2017-03-16 10:08:14.580386	2
21	10	119.97	Completed	chezca1228@yahoo.com	3XH34851LR2250815	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-16 18:42:10.027297	2017-04-16 18:42:10.027356	2017-03-16 18:42:10.036825	2017-03-16 18:42:10.036825	1
22	11	799.98	Completed	chezca1228@yahoo.com	5RS42308YU773714A	\N	Ortigas, Brixton	2017-03-18 11:57:13.268889	2018-03-18 11:57:13.26894	2017-03-18 11:57:13.275416	2017-03-18 11:57:13.275416	2
23	11	799.98	Completed	chezca1228@yahoo.com	0L4181412H807124K	\N	Ortigas, Brixton	2017-03-20 05:46:59.54652	2018-03-20 05:46:59.546576	2017-03-20 05:46:59.549783	2017-03-20 05:46:59.549783	2
24	11	799.98	Completed	chezca1228@yahoo.com	2P797260DL550340F	\N	Ortigas, Brixton	2017-03-20 05:49:24.603421	2018-03-20 05:49:24.603476	2017-03-20 05:49:24.606247	2017-03-20 05:49:24.606247	2
25	10	119.97	Completed	chezca1228@yahoo.com	67J96093H15275150	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-20 05:50:47.900452	2017-04-20 05:50:47.900505	2017-03-20 05:50:47.903642	2017-03-20 05:50:47.903642	1
26	10	119.97	Completed	chezca1228@yahoo.com	22T61140N7281412X	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-20 06:04:20.648976	2017-04-20 06:04:20.649028	2017-03-20 06:04:20.677438	2017-03-20 06:04:20.677438	1
27	10	119.97	Completed	chezca1228@yahoo.com	46E86760MG082671F	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-20 07:40:31.522121	2017-04-20 07:40:31.522166	2017-03-20 07:40:31.525243	2017-03-20 07:40:31.525243	1
28	10	119.97	Completed	chezca1228@yahoo.com	95E35009P59814608	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-20 14:45:13.902382	2017-04-20 14:45:13.902433	2017-03-20 14:45:13.905121	2017-03-20 14:45:13.905121	1
29	11	799.98	Completed	chezca1228@yahoo.com	1KT61747GB655805B	\N	Ortigas, Brixton	2017-03-20 15:45:47.450124	2018-03-20 15:45:47.450174	2017-03-20 15:45:47.45712	2017-03-20 15:45:47.45712	2
30	11	799.98	Completed	chezca1228@yahoo.com	4YJ014872J954300R	\N	Ortigas, Brixton	2017-03-21 10:06:17.266447	2018-03-21 10:06:17.266492	2017-03-21 10:06:17.269184	2017-03-21 10:06:17.269184	2
31	10	119.97	Completed	chezca1228@yahoo.com	7CN13642BF7653408	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-21 13:19:16.53465	2017-04-21 13:19:16.534692	2017-03-21 13:19:16.54118	2017-03-21 13:19:16.54118	1
32	10	119.97	Completed	chezca1228@yahoo.com	94A46840NC2079439	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-22 12:12:38.003628	2017-04-22 12:12:38.003671	2017-03-22 12:12:38.006456	2017-03-22 12:12:38.006456	1
33	11	799.98	Completed	chezca1228@yahoo.com	7KE52659V90912307	\N	Ortigas, Brixton	2017-03-22 12:32:42.160862	2018-03-22 12:32:42.160901	2017-03-22 12:32:42.163522	2017-03-22 12:32:42.163522	2
34	10	119.97	Completed	chezca1228@yahoo.com	47T77703L09009335	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-23 10:08:31.470232	2017-04-23 10:08:31.470274	2017-03-23 10:08:31.476973	2017-03-23 10:08:31.476973	1
35	11	799.98	Completed	chezca1228@yahoo.com	5VH9850585007351N	\N	Ortigas, Brixton	2017-03-23 12:52:11.788335	2018-03-23 12:52:11.788402	2017-03-23 12:52:11.817415	2017-03-23 12:52:11.817415	2
36	10	119.97	Completed	chezca1228@yahoo.com	9XF54752LE677664S	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-24 10:19:32.375428	2017-04-24 10:19:32.37547	2017-03-24 10:19:32.379115	2017-03-24 10:19:32.379115	1
37	11	799.98	Completed	chezca1228@yahoo.com	3HV94072E0551973N	\N	Ortigas, Brixton	2017-03-24 13:10:01.682621	2018-03-24 13:10:01.682661	2017-03-24 13:10:01.689326	2017-03-24 13:10:01.689326	2
38	10	119.97	Completed	chezca1228@yahoo.com	9UE789726X948411F	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-25 15:57:57.485678	2017-04-25 15:57:57.485731	2017-03-25 15:57:57.488526	2017-03-25 15:57:57.488526	1
39	11	799.98	Completed	chezca1228@yahoo.com	9A8086207T475142A	\N	Ortigas, Brixton	2017-03-25 16:00:33.563621	2018-03-25 16:00:33.563662	2017-03-25 16:00:33.566385	2017-03-25 16:00:33.566385	2
40	11	799.98	Completed	chezca1228@yahoo.com	0LN54449BC319632X	\N	Ortigas, Brixton	2017-03-26 11:47:21.393089	2018-03-26 11:47:21.393134	2017-03-26 11:47:21.396072	2017-03-26 11:47:21.396072	2
41	10	119.97	Completed	chezca1228@yahoo.com	1YJ8859786736870C	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-26 11:53:22.735794	2017-04-26 11:53:22.73586	2017-03-26 11:53:22.760069	2017-03-26 11:53:22.760069	1
42	11	799.98	Completed	chezca1228@yahoo.com	6BG78208GL2240024	\N	Ortigas, Brixton	2017-03-27 18:37:45.722548	2018-03-27 18:37:45.722592	2017-03-27 18:37:45.727241	2017-03-27 18:37:45.727241	2
43	10	119.97	Completed	chezca1228@yahoo.com	4PH32258D50814520	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-27 18:53:58.302755	2017-04-27 18:53:58.302795	2017-03-27 18:53:58.309187	2017-03-27 18:53:58.309187	1
44	10	119.97	Completed	chezca1228@yahoo.com	45T68324WK587430F	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-28 10:26:51.605136	2017-04-28 10:26:51.605187	2017-03-28 10:26:51.612622	2017-03-28 10:26:51.612622	1
45	11	799.98	Completed	chezca1228@yahoo.com	98099090CG688813H	\N	Ortigas, Brixton	2017-03-28 14:50:22.403943	2018-03-28 14:50:22.403994	2017-03-28 14:50:22.410541	2017-03-28 14:50:22.410541	2
46	11	799.98	Completed	chezca1228@yahoo.com	12E73656L1092324N	\N	Ortigas, Brixton	2017-03-29 11:30:28.198753	2018-03-29 11:30:28.198793	2017-03-29 11:30:28.201451	2017-03-29 11:30:28.201451	2
47	10	119.97	Completed	chezca1228@yahoo.com	4MB53739JL761391J	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-29 12:17:22.727858	2017-04-29 12:17:22.727915	2017-03-29 12:17:22.73183	2017-03-29 12:17:22.73183	1
48	11	799.98	Completed	chezca1228@yahoo.com	7CA07684NM8640815	\N	Ortigas, Brixton	2017-03-30 12:58:27.859929	2018-03-30 12:58:27.859987	2017-03-30 12:58:27.867428	2017-03-30 12:58:27.867428	2
49	10	119.97	Completed	chezca1228@yahoo.com	3JP57080T9110690H	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-03-30 13:05:26.813568	2017-04-30 13:05:26.813609	2017-03-30 13:05:26.816498	2017-03-30 13:05:26.816498	1
51	10	119.97	Completed	chezca1228@yahoo.com	4P8439886H550323Y	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-04 07:45:56.887264	2017-05-04 07:45:56.887315	2017-04-04 07:45:56.890183	2017-04-04 07:45:56.890183	1
50	10	119.97	Completed	chezca1228@yahoo.com	56L83832FN2405458	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-04 07:10:42.457579	2017-05-04 07:10:42.45763	2017-04-04 07:10:42.460285	2017-04-04 07:10:42.460285	1
52	11	799.98	Completed	chezca1228@yahoo.com	4RJ697058L5583813	\N	Ortigas, Brixton	2017-04-04 08:07:57.614044	2018-04-04 08:07:57.614113	2017-04-04 08:07:57.622233	2017-04-04 08:07:57.622233	2
53	11	799.98	Completed	chezca1228@yahoo.com	5P6378765A0442301	\N	Ortigas, Brixton	2017-04-04 08:13:49.86474	2018-04-04 08:13:49.864783	2017-04-04 08:13:49.867684	2017-04-04 08:13:49.867684	2
54	10	119.97	Completed	chezca1228@yahoo.com	7K356859HY0765218	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-04 08:44:39.698292	2017-05-04 08:44:39.698335	2017-04-04 08:44:39.701127	2017-04-04 08:44:39.701127	1
55	11	799.98	Completed	chezca1228@yahoo.com	42612856R0937703U	\N	Ortigas, Brixton	2017-04-04 08:55:49.264032	2018-04-04 08:55:49.264075	2017-04-04 08:55:49.267293	2017-04-04 08:55:49.267293	2
56	11	799.98	Completed	chezca1228@yahoo.com	6G285248E8671452A	\N	Ortigas, Brixton	2017-04-04 09:32:06.928345	2018-04-04 09:32:06.928386	2017-04-04 09:32:06.93119	2017-04-04 09:32:06.93119	2
57	12	799.98	Completed	chezca1228@yahoo.com	71B97096V00754109	\N	Ortigas, Solaris One	2017-04-04 15:00:32.991767	2018-04-04 15:00:32.991827	2017-04-04 15:00:32.998962	2017-04-04 15:00:32.998962	2
58	10	119.97	Completed	chezca1228@yahoo.com	32J21426PY409131A	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-04 16:27:19.291441	2017-05-04 16:27:19.291489	2017-04-04 16:27:19.294148	2017-04-04 16:27:19.294148	1
59	11	799.98	Completed	chezca1228@yahoo.com	567674389U0870006	\N	Ortigas, Brixton	2017-04-04 17:10:24.239438	2018-04-04 17:10:24.239483	2017-04-04 17:10:24.24223	2017-04-04 17:10:24.24223	2
60	12	799.98	Completed	chezca1228@yahoo.com	03937632VS583142U	\N	Ortigas, Solaris One	2017-04-05 15:06:56.554971	2018-04-05 15:06:56.555037	2017-04-05 15:06:56.558128	2017-04-05 15:06:56.558128	2
61	10	119.97	Completed	chezca1228@yahoo.com	76U64875RU080701F	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-05 15:51:12.531753	2017-05-05 15:51:12.531804	2017-04-05 15:51:12.534508	2017-04-05 15:51:12.534508	1
62	11	799.98	Completed	chezca1228@yahoo.com	82L99979NF9158010	\N	Ortigas, Brixton	2017-04-05 16:11:37.755864	2018-04-05 16:11:37.755915	2017-04-05 16:11:37.758808	2017-04-05 16:11:37.758808	2
63	12	799.98	Completed	chezca1228@yahoo.com	1SA712202C144752J	\N	Ortigas, Solaris One	2017-04-06 10:24:49.03088	2018-04-06 10:24:49.030932	2017-04-06 10:24:49.033799	2017-04-06 10:24:49.033799	2
64	12	799.98	Completed	chezca1228@yahoo.com	81F94769YL277090C	\N	Ortigas, Solaris One	2017-04-07 16:43:25.530734	2018-04-07 16:43:25.530786	2017-04-07 16:43:25.53894	2017-04-07 16:43:25.53894	2
65	11	799.98	Completed	chezca1228@yahoo.com	84T04696EF450560Y	\N	Ortigas, Brixton	2017-04-08 10:26:42.831141	2018-04-08 10:26:42.831202	2017-04-08 10:26:42.834416	2017-04-08 10:26:42.834416	2
66	10	119.97	Completed	chezca1228@yahoo.com	7TV924352N186905L	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-08 14:02:16.990962	2017-05-08 14:02:16.991015	2017-04-08 14:02:16.993912	2017-04-08 14:02:16.993912	1
67	12	799.98	Completed	chezca1228@yahoo.com	03Y959742H739502Y	\N	Ortigas, Solaris One	2017-04-08 14:05:37.538563	2018-04-08 14:05:37.538615	2017-04-08 14:05:37.541546	2017-04-08 14:05:37.541546	2
68	11	799.98	Completed	chezca1228@yahoo.com	2X3171644X816220L	\N	Ortigas, Brixton	2017-04-09 10:33:15.830593	2018-04-09 10:33:15.830636	2017-04-09 10:33:15.833355	2017-04-09 10:33:15.833355	2
69	12	799.98	Completed	chezca1228@yahoo.com	36V821959S942603E	\N	Ortigas, Solaris One	2017-04-09 13:59:11.801628	2018-04-09 13:59:11.801678	2017-04-09 13:59:11.804407	2017-04-09 13:59:11.804407	2
70	10	119.97	Completed	chezca1228@yahoo.com	39H65818G67864221	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-09 14:01:41.021492	2017-05-09 14:01:41.021535	2017-04-09 14:01:41.024341	2017-04-09 14:01:41.024341	1
71	10	119.97	Completed	chezca1228@yahoo.com	5JM16829UB2998333	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-10 10:51:48.118676	2017-05-10 10:51:48.118726	2017-04-10 10:51:48.121801	2017-04-10 10:51:48.121801	1
72	11	799.98	Completed	chezca1228@yahoo.com	2GC07826WE570535T	\N	Ortigas, Brixton	2017-04-10 17:29:26.586698	2018-04-10 17:29:26.586754	2017-04-10 17:29:26.589826	2017-04-10 17:29:26.589826	2
73	12	799.98	Completed	chezca1228@yahoo.com	3RY76589TX538800D	\N	Ortigas, Solaris One	2017-04-10 17:32:39.556375	2018-04-10 17:32:39.556418	2017-04-10 17:32:39.559489	2017-04-10 17:32:39.559489	2
74	11	799.98	Completed	chezca1228@yahoo.com	3TS59659D4392410X	\N	Ortigas, Brixton	2017-04-12 11:29:24.328583	2018-04-12 11:29:24.328637	2017-04-12 11:29:24.331524	2017-04-12 11:29:24.331524	2
75	10	119.97	Completed	chezca1228@yahoo.com	9YS20449WD2401719	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-12 11:29:25.031593	2017-05-12 11:29:25.031652	2017-04-12 11:29:25.034592	2017-04-12 11:29:25.034592	1
76	12	799.98	Completed	chezca1228@yahoo.com	62G594064V425843G	\N	Ortigas, Solaris One	2017-04-12 11:29:25.315346	2018-04-12 11:29:25.315387	2017-04-12 11:29:25.318219	2017-04-12 11:29:25.318219	2
77	10	119.97	Completed	chezca1228@yahoo.com	9YS20449WD2401719	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-12 11:35:22.878157	2017-05-12 11:35:22.8782	2017-04-12 11:35:22.881311	2017-04-12 11:35:22.881311	1
78	12	799.98	Completed	chezca1228@yahoo.com	62G594064V425843G	\N	Ortigas, Solaris One	2017-04-12 11:35:25.767577	2018-04-12 11:35:25.767632	2017-04-12 11:35:25.77367	2017-04-12 11:35:25.77367	2
79	11	799.98	Completed	chezca1228@yahoo.com	3TS59659D4392410X	\N	Ortigas, Brixton	2017-04-12 11:43:18.850099	2018-04-12 11:43:18.850146	2017-04-12 11:43:18.853016	2017-04-12 11:43:18.853016	2
80	12	799.98	Completed	chezca1228@yahoo.com	62G594064V425843G	\N	Ortigas, Solaris One	2017-04-12 11:59:28.930852	2018-04-12 11:59:28.930894	2017-04-12 11:59:28.935102	2017-04-12 11:59:28.935102	2
81	10	119.97	Completed	chezca1228@yahoo.com	9YA991581M147534R	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-12 20:14:46.672891	2017-05-12 20:14:46.672942	2017-04-12 20:14:46.675905	2017-04-12 20:14:46.675905	1
82	11	799.98	Completed	chezca1228@yahoo.com	7FN66719NC5607353	\N	Ortigas, Brixton	2017-04-12 20:14:47.374137	2018-04-12 20:14:47.374186	2017-04-12 20:14:47.376881	2017-04-12 20:14:47.376881	2
83	12	799.98	Completed	chezca1228@yahoo.com	9DE727454R2908521	\N	Ortigas, Solaris One	2017-04-12 20:14:48.265702	2018-04-12 20:14:48.265745	2017-04-12 20:14:48.269832	2017-04-12 20:14:48.269832	2
84	10	119.97	Completed	chezca1228@yahoo.com	1K586958C48496154	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-16 10:12:58.028891	2017-05-16 10:12:58.02894	2017-04-16 10:12:58.03174	2017-04-16 10:12:58.03174	1
85	12	799.98	Completed	chezca1228@yahoo.com	99S15943CP1909510	\N	Ortigas, Solaris One	2017-04-16 17:47:50.338997	2018-04-16 17:47:50.339048	2017-04-16 17:47:50.34228	2017-04-16 17:47:50.34228	2
86	11	799.98	Completed	chezca1228@yahoo.com	98B46793YF073664Y	\N	Ortigas, Brixton	2017-04-16 17:47:50.446421	2018-04-16 17:47:50.446476	2017-04-16 17:47:50.471719	2017-04-16 17:47:50.471719	2
87	10	119.97	Completed	chezca1228@yahoo.com	2U509975A4524151M	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-17 13:35:46.932406	2017-05-17 13:35:46.932458	2017-04-17 13:35:46.935459	2017-04-17 13:35:46.935459	1
88	11	799.98	Completed	chezca1228@yahoo.com	8FB35184AP1548617	\N	Ortigas, Brixton	2017-04-17 13:36:50.682637	2018-04-17 13:36:50.682681	2017-04-17 13:36:50.685431	2017-04-17 13:36:50.685431	2
89	12	799.98	Completed	chezca1228@yahoo.com	68M240237D205960D	\N	Ortigas, Solaris One	2017-04-17 13:37:56.903176	2018-04-17 13:37:56.903218	2017-04-17 13:37:56.905975	2017-04-17 13:37:56.905975	2
90	11	799.98	Completed	chezca1228@yahoo.com	5EW50688WB734374R	\N	Ortigas, Brixton	2017-04-18 10:47:05.967388	2018-04-18 10:47:05.967428	2017-04-18 10:47:05.973797	2017-04-18 10:47:05.973797	2
91	12	799.98	Completed	chezca1228@yahoo.com	6YS159494G2535903	\N	Ortigas, Solaris One	2017-04-19 10:27:56.553623	2018-04-19 10:27:56.553672	2017-04-19 10:27:56.556533	2017-04-19 10:27:56.556533	2
92	11	799.98	Completed	chezca1228@yahoo.com	0M414360E5283852W	\N	Ortigas, Brixton	2017-04-19 18:36:49.575508	2018-04-19 18:36:49.575559	2017-04-19 18:36:49.578245	2017-04-19 18:36:49.578245	2
93	10	119.97	Completed	chezca1228@yahoo.com	94M64516BJ215290J	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-19 18:38:49.49741	2017-05-19 18:38:49.497463	2017-04-19 18:38:49.500242	2017-04-19 18:38:49.500242	1
94	10	119.97	Completed	chezca1228@yahoo.com	4DL94355WJ150421M	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-20 10:23:51.09604	2017-05-20 10:23:51.09609	2017-04-20 10:23:51.09958	2017-04-20 10:23:51.09958	1
95	12	799.98	Completed	chezca1228@yahoo.com	1H6832848A1676511	\N	Ortigas, Solaris One	2017-04-21 10:08:57.32549	2018-04-21 10:08:57.325544	2017-04-21 10:08:57.328576	2017-04-21 10:08:57.328576	2
96	11	799.98	Completed	chezca1228@yahoo.com	98936220GL217542F	\N	Ortigas, Brixton	2017-04-21 10:22:54.673803	2018-04-21 10:22:54.673855	2017-04-21 10:22:54.677064	2017-04-21 10:22:54.677064	2
97	11	799.98	Completed	chezca1228@yahoo.com	5UX888387K8203413	\N	Ortigas, Brixton	2017-04-23 10:31:46.044659	2018-04-23 10:31:46.044709	2017-04-23 10:31:46.047572	2017-04-23 10:31:46.047572	2
98	12	799.98	Completed	chezca1228@yahoo.com	1UJ380213F190244F	\N	Ortigas, Solaris One	2017-04-23 10:40:52.327292	2018-04-23 10:40:52.327346	2017-04-23 10:40:52.337347	2017-04-23 10:40:52.337347	2
102	11	799.98	Completed	chezca1228@yahoo.com	7WN29943GU861230E	\N	Ortigas, Brixton	2017-04-25 06:56:38.000713	2018-04-25 06:56:38.000755	2017-04-25 06:56:38.003574	2017-04-25 06:56:38.003574	2
105	12	799.98	Completed	chezca1228@yahoo.com	1XL36445MT495340P	\N	Ortigas, Solaris One	2017-05-17 19:06:09.317955	2018-05-17 19:06:09.318023	2017-05-17 19:06:09.321713	2017-05-17 19:06:09.321713	2
99	10	119.97	Completed	chezca1228@yahoo.com	2J849542BJ0899343	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-23 19:10:58.228896	2017-05-23 19:10:58.228946	2017-04-23 19:10:58.231748	2017-04-23 19:10:58.231748	1
100	10	119.97	Completed	chezca1228@yahoo.com	4UY94629GE940841P	\N	Fort Bonifacio, Las Pinas, Shangri La Shaw	2017-04-24 10:53:44.687977	2017-05-24 10:53:44.688019	2017-04-24 10:53:44.692207	2017-04-24 10:53:44.692207	1
103	12	799.98	Completed	chezca1228@yahoo.com	4CP86845SD162932L	\N	Ortigas, Solaris One	2017-04-25 10:43:56.367241	2018-04-25 10:43:56.367282	2017-04-25 10:43:56.369905	2017-04-25 10:43:56.369905	2
107	12	799.98	Completed	chezca1228@yahoo.com	9ST93618R4093620S	\N	Ortigas, Solaris One	2017-05-17 19:16:58.492556	2018-05-17 19:16:58.492613	2017-05-17 19:16:58.495629	2017-05-17 19:16:58.495629	2
101	12	799.98	Completed	chezca1228@yahoo.com	54Y51050PB558025H	\N	Ortigas, Solaris One	2017-04-25 06:44:31.888542	2018-04-25 06:44:31.888583	2017-04-25 06:44:31.891356	2017-04-25 06:44:31.891356	2
104	12	799.98	Completed	chezca1228@yahoo.com	7GE04061GB3676238	\N	Ortigas, Solaris One	2017-04-26 16:26:55.088173	2018-04-26 16:26:55.088224	2017-04-26 16:26:55.093312	2017-04-26 16:26:55.093312	2
106	12	799.98	Completed	chezca1228@yahoo.com	1YG06688S0816400C	\N	Ortigas, Solaris One	2017-05-17 19:14:24.272118	2018-05-17 19:14:24.272171	2017-05-17 19:14:24.275099	2017-05-17 19:14:24.275099	2
108	12	799.98	Completed	chezca1228@yahoo.com	1AJ07747WR560863A	\N	Ortigas, Solaris One	2017-05-17 20:00:23.485911	2018-05-17 20:00:23.485952	2017-05-17 20:00:23.488645	2017-05-17 20:00:23.488645	2
109	12	799.98	Completed	chezca1228@yahoo.com	21434985K0849823Y	\N	Ortigas, Solaris One	2017-05-17 22:49:14.887212	2018-05-17 22:49:14.887255	2017-05-17 22:49:14.890623	2017-05-17 22:49:14.890623	2
110	12	799.98	Completed	chezca1228@yahoo.com	5PX14880CW1108949	\N	Ortigas, Solaris One	2017-05-18 06:29:46.840789	2018-05-18 06:29:46.840835	2017-05-18 06:29:46.843774	2017-05-18 06:29:46.843774	2
111	12	799.98	Completed	chezca1228@yahoo.com	26G02041FS3562356	\N	Ortigas, Solaris One	2017-05-18 10:32:31.195136	2018-05-18 10:32:31.195186	2017-05-18 10:32:31.201844	2017-05-18 10:32:31.201844	2
112	12	799.98	Completed	chezca1228@yahoo.com	76E77136E5566792C	\N	Ortigas, Solaris One	2017-05-18 10:49:07.339878	2018-05-18 10:49:07.339917	2017-05-18 10:49:07.346662	2017-05-18 10:49:07.346662	2
113	12	799.98	Completed	chezca1228@yahoo.com	32L27600UY147580W	\N	Ortigas, Solaris One	2017-05-18 14:23:17.234344	2018-05-18 14:23:17.234386	2017-05-18 14:23:17.241107	2017-05-18 14:23:17.241107	2
114	12	799.98	Completed	chezca1228@yahoo.com	2AN57847G1045515H	\N	Ortigas, Solaris One	2017-05-18 16:52:00.874419	2018-05-18 16:52:00.874461	2017-05-18 16:52:00.883379	2017-05-18 16:52:00.883379	2
115	12	799.98	Completed	chezca1228@yahoo.com	5DF93997LV013081H	\N	Ortigas, Solaris One	2017-05-23 06:30:55.284541	2018-05-23 06:30:55.284595	2017-05-23 06:30:55.287329	2017-05-23 06:30:55.287329	2
116	12	799.98	Completed	chezca1228@yahoo.com	88453102Y6509904X	\N	Ortigas, Solaris One	2017-05-26 18:10:42.596787	2018-05-26 18:10:42.596839	2017-05-26 18:10:42.603648	2017-05-26 18:10:42.603648	2
117	12	799.98	Completed	chezca1228@yahoo.com	0FD89442TG854182V	\N	Ortigas, Solaris One	2017-05-30 10:39:48.613182	2018-05-30 10:39:48.613234	2017-05-30 10:39:48.616008	2017-05-30 10:39:48.616008	2
118	12	799.98	Completed	chezca1228@yahoo.com	2K644498T1217860R	\N	Ortigas, Solaris One	2017-06-04 19:20:48.363016	2018-06-04 19:20:48.363074	2017-06-04 19:20:48.371847	2017-06-04 19:20:48.371847	2
119	12	799.98	Completed	chezca1228@yahoo.com	7G3746182D8427635	\N	Ortigas, Solaris One	2017-06-22 12:22:59.617584	2018-06-22 12:22:59.617637	2017-06-22 12:22:59.622503	2017-06-22 12:22:59.622503	2
120	12	799.98	Completed	chezca1228@yahoo.com	77R710263H0544946	\N	Ortigas, Solaris One	2017-06-22 13:03:58.643038	2018-06-22 13:03:58.64309	2017-06-22 13:03:58.64573	2017-06-22 13:03:58.64573	2
121	12	799.98	Completed	chezca1228@yahoo.com	6KU767870A064412X	\N	Ortigas, Solaris One	2017-06-22 15:09:00.313965	2018-06-22 15:09:00.314013	2017-06-22 15:09:00.320833	2017-06-22 15:09:00.320833	2
122	12	799.98	Completed	chezca1228@yahoo.com	1UD74171PX752153J	\N	Ortigas, Solaris One	2017-06-23 13:35:25.992558	2018-06-23 13:35:25.99261	2017-06-23 13:35:25.995304	2017-06-23 13:35:25.995304	2
123	12	799.98	Completed	chezca1228@yahoo.com	8W7437310S407051X	\N	Ortigas, Solaris One	2017-06-24 12:53:01.033118	2018-06-24 12:53:01.03317	2017-06-24 12:53:01.035847	2017-06-24 12:53:01.035847	2
124	12	799.98	Completed	chezca1228@yahoo.com	3S277505WY975321T	\N	Ortigas, Solaris One	2017-06-25 11:25:21.013462	2018-06-25 11:25:21.013514	2017-06-25 11:25:21.016306	2017-06-25 11:25:21.016306	2
125	12	799.98	Completed	chezca1228@yahoo.com	54A53831CM062390S	\N	Ortigas, Solaris One	2017-06-26 10:47:26.101298	2018-06-26 10:47:26.10134	2017-06-26 10:47:26.103953	2017-06-26 10:47:26.103953	2
126	12	799.98	Completed	chezca1228@yahoo.com	8XE6546222100420N	\N	Ortigas, Solaris One	2017-06-27 13:33:06.119806	2018-06-27 13:33:06.11986	2017-06-27 13:33:06.122773	2017-06-27 13:33:06.122773	2
127	12	799.98	Completed	chezca1228@yahoo.com	4K861442FF1570227	\N	Ortigas, Solaris One	2017-06-28 13:30:26.686405	2018-06-28 13:30:26.686473	2017-06-28 13:30:26.689922	2017-06-28 13:30:26.689922	2
128	12	799.98	Completed	chezca1228@yahoo.com	2T38903995993560P	\N	Ortigas, Solaris One	2017-06-29 13:08:31.246696	2018-06-29 13:08:31.24675	2017-06-29 13:08:31.249705	2017-06-29 13:08:31.249705	2
129	12	799.98	Completed	chezca1228@yahoo.com	59J02363VY238261P	\N	Ortigas, Solaris One	2017-06-30 12:23:00.769969	2018-06-30 12:23:00.770013	2017-06-30 12:23:00.772675	2017-06-30 12:23:00.772675	2
130	12	799.98	Completed	chezca1228@yahoo.com	08M2178415231872U	\N	Ortigas, Solaris One	2017-07-01 21:24:40.233108	2018-07-01 21:24:40.233162	2017-07-01 21:24:40.236013	2017-07-01 21:24:40.236013	2
131	12	799.98	Completed	chezca1228@yahoo.com	5UG01101V9319334M	\N	Ortigas, Solaris One	2017-07-02 14:04:32.533737	2018-07-02 14:04:32.53379	2017-07-02 14:04:32.537302	2017-07-02 14:04:32.537302	2
132	12	799.98	Completed	chezca1228@yahoo.com	9VJ85211A7780450W	\N	Ortigas, Solaris One	2017-07-03 12:17:32.189344	2018-07-03 12:17:32.189439	2017-07-03 12:17:32.192995	2017-07-03 12:17:32.192995	2
133	12	799.98	Completed	chezca1228@yahoo.com	47M516632B009324K	\N	Ortigas, Solaris One	2017-07-04 10:43:30.514624	2018-07-04 10:43:30.514665	2017-07-04 10:43:30.517209	2017-07-04 10:43:30.517209	2
134	12	799.98	Completed	chezca1228@yahoo.com	0EJ33454UJ121043S	\N	Ortigas, Solaris One	2017-07-05 12:24:32.857349	2018-07-05 12:24:32.857424	2017-07-05 12:24:32.860144	2017-07-05 12:24:32.860144	2
135	12	799.98	Completed	chezca1228@yahoo.com	0W3878470Y226953R	\N	Ortigas, Solaris One	2017-07-06 10:15:07.387203	2018-07-06 10:15:07.387259	2017-07-06 10:15:07.390254	2017-07-06 10:15:07.390254	2
136	12	799.98	Completed	chezca1228@yahoo.com	4C092732BB644134B	\N	Ortigas, Solaris One	2017-07-07 11:40:36.307419	2018-07-07 11:40:36.307474	2017-07-07 11:40:36.311996	2017-07-07 11:40:36.311996	2
137	12	799.98	Completed	chezca1228@yahoo.com	8V974234YY035745D	\N	Ortigas, Solaris One	2017-07-08 11:01:43.392095	2018-07-08 11:01:43.39214	2017-07-08 11:01:43.39474	2017-07-08 11:01:43.39474	2
138	12	799.98	Completed	chezca1228@yahoo.com	1A602188E1123905S	\N	Ortigas, Solaris One	2017-07-09 11:57:34.581197	2018-07-09 11:57:34.581247	2017-07-09 11:57:34.587891	2017-07-09 11:57:34.587891	2
139	12	799.98	Completed	chezca1228@yahoo.com	1G242732SL981174E	\N	Ortigas, Solaris One	2017-07-10 11:48:38.660213	2018-07-10 11:48:38.660263	2017-07-10 11:48:38.663019	2017-07-10 11:48:38.663019	2
140	13	799.98	Completed	chezca1228@yahoo.com	3WG58573E55143700	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-10 11:57:47.943804	2018-07-10 11:57:47.943857	2017-07-10 11:57:47.9508	2017-07-10 11:57:47.9508	2
141	12	799.98	Completed	chezca1228@yahoo.com	8MF269451A707371C	\N	Ortigas, Solaris One	2017-07-11 11:03:33.546317	2018-07-11 11:03:33.546371	2017-07-11 11:03:33.552619	2017-07-11 11:03:33.552619	2
142	13	799.98	Completed	chezca1228@yahoo.com	3KE70500R8625430A	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-11 12:34:41.833049	2018-07-11 12:34:41.833106	2017-07-11 12:34:41.83587	2017-07-11 12:34:41.83587	2
143	13	799.98	Completed	chezca1228@yahoo.com	3NU46628DM252173M	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-12 10:44:51.318718	2018-07-12 10:44:51.318773	2017-07-12 10:44:51.321546	2017-07-12 10:44:51.321546	2
144	12	799.98	Completed	chezca1228@yahoo.com	8RA41941HL384564U	\N	Ortigas, Solaris One	2017-07-12 13:05:20.320411	2018-07-12 13:05:20.320464	2017-07-12 13:05:20.32327	2017-07-12 13:05:20.32327	2
145	13	799.98	Completed	chezca1228@yahoo.com	5MS33967UY5790940	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-13 11:11:58.95479	2018-07-13 11:11:58.954834	2017-07-13 11:11:58.957942	2017-07-13 11:11:58.957942	2
146	12	799.98	Completed	chezca1228@yahoo.com	258214816L7137306	\N	Ortigas, Solaris One	2017-07-13 14:30:44.408464	2018-07-13 14:30:44.408556	2017-07-13 14:30:44.411455	2017-07-13 14:30:44.411455	2
147	13	799.98	Completed	chezca1228@yahoo.com	7N465458TR911021U	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-14 10:12:05.884045	2018-07-14 10:12:05.884091	2017-07-14 10:12:05.887193	2017-07-14 10:12:05.887193	2
148	12	799.98	Completed	chezca1228@yahoo.com	6D44567027019372X	\N	Ortigas, Solaris One	2017-07-14 14:06:41.685748	2018-07-14 14:06:41.685799	2017-07-14 14:06:41.688498	2017-07-14 14:06:41.688498	2
149	13	799.98	Completed	chezca1228@yahoo.com	81Y48951038043225	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-15 12:32:15.139863	2018-07-15 12:32:15.139909	2017-07-15 12:32:15.142751	2017-07-15 12:32:15.142751	2
150	12	799.98	Completed	chezca1228@yahoo.com	63879442Y35584155	\N	Ortigas, Solaris One	2017-07-15 13:09:39.914502	2018-07-15 13:09:39.914544	2017-07-15 13:09:39.917331	2017-07-15 13:09:39.917331	2
151	13	799.98	Completed	chezca1228@yahoo.com	8F9227289W8667733	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-19 07:49:36.066538	2018-07-19 07:49:36.06658	2017-07-19 07:49:36.073116	2017-07-19 07:49:36.073116	2
152	12	799.98	Completed	chezca1228@yahoo.com	02N68908E0366941T	\N	Ortigas, Solaris One	2017-07-19 08:46:05.767301	2018-07-19 08:46:05.767353	2017-07-19 08:46:05.773843	2017-07-19 08:46:05.773843	2
153	13	799.98	Completed	chezca1228@yahoo.com	1K5198533A9560020	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-19 09:23:45.964014	2018-07-19 09:23:45.964067	2017-07-19 09:23:45.967306	2017-07-19 09:23:45.967306	2
154	12	799.98	Completed	chezca1228@yahoo.com	04544189SU793302D	\N	Ortigas, Solaris One	2017-07-19 09:30:19.761719	2018-07-19 09:30:19.761761	2017-07-19 09:30:19.764778	2017-07-19 09:30:19.764778	2
163	12	799.98	Completed	chezca1228@yahoo.com	5T253718TA514410L	\N	Ortigas, Solaris One	2017-07-22 10:34:24.112601	2018-07-22 10:34:24.112655	2017-07-22 10:34:24.119604	2017-07-22 10:34:24.119604	2
164	13	799.98	Completed	chezca1228@yahoo.com	17P390156P832121J	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-22 13:28:01.140224	2018-07-22 13:28:01.140269	2017-07-22 13:28:01.142976	2017-07-22 13:28:01.142976	2
165	13	799.98	Completed	chezca1228@yahoo.com	8T930056L6926684S	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-23 10:27:02.302544	2018-07-23 10:27:02.302589	2017-07-23 10:27:02.305189	2017-07-23 10:27:02.305189	2
155	13	799.98	Completed	chezca1228@yahoo.com	4HL028481T755701F	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-19 12:12:04.550606	2018-07-19 12:12:04.550659	2017-07-19 12:12:04.553741	2017-07-19 12:12:04.553741	2
158	12	799.98	Completed	chezca1228@yahoo.com	0P976802C0104650J	\N	Ortigas, Solaris One	2017-07-19 15:07:48.794288	2018-07-19 15:07:48.794328	2017-07-19 15:07:48.802247	2017-07-19 15:07:48.802247	2
162	12	799.98	Completed	chezca1228@yahoo.com	4SC32967F4002215L	\N	Ortigas, Solaris One	2017-07-21 10:36:09.875594	2018-07-21 10:36:09.875642	2017-07-21 10:36:09.878361	2017-07-21 10:36:09.878361	2
156	12	799.98	Completed	chezca1228@yahoo.com	9U427429DP1724322	\N	Ortigas, Solaris One	2017-07-19 12:18:49.068289	2018-07-19 12:18:49.068343	2017-07-19 12:18:49.074771	2017-07-19 12:18:49.074771	2
157	13	799.98	Completed	chezca1228@yahoo.com	5Y633473LR930444M	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-19 14:14:25.4233	2018-07-19 14:14:25.423342	2017-07-19 14:14:25.42626	2017-07-19 14:14:25.42626	2
159	13	799.98	Completed	chezca1228@yahoo.com	0KR60546YT592505U	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-20 13:26:25.109698	2018-07-20 13:26:25.109768	2017-07-20 13:26:25.113472	2017-07-20 13:26:25.113472	2
161	13	799.98	Completed	chezca1228@yahoo.com	85M987927X608672C	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-21 10:27:54.482856	2018-07-21 10:27:54.482913	2017-07-21 10:27:54.485918	2017-07-21 10:27:54.485918	2
167	12	799.98	Completed	chezca1228@yahoo.com	1PV97374RW628354N	\N	Ortigas, Solaris One	2017-07-24 10:34:47.540419	2018-07-24 10:34:47.54047	2017-07-24 10:34:47.543447	2017-07-24 10:34:47.543447	2
160	12	799.98	Completed	chezca1228@yahoo.com	79E36524P56529423	\N	Ortigas, Solaris One	2017-07-20 14:42:35.61197	2018-07-20 14:42:35.612024	2017-07-20 14:42:35.614829	2017-07-20 14:42:35.614829	2
166	12	799.98	Completed	chezca1228@yahoo.com	2C792827YY890825H	\N	Ortigas, Solaris One	2017-07-23 10:33:20.837633	2018-07-23 10:33:20.837741	2017-07-23 10:33:20.845614	2017-07-23 10:33:20.845614	2
168	13	799.98	Completed	chezca1228@yahoo.com	4V864090EW283813W	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-24 11:08:44.235533	2018-07-24 11:08:44.235583	2017-07-24 11:08:44.238295	2017-07-24 11:08:44.238295	2
169	12	799.98	Completed	chezca1228@yahoo.com	6R398128K9503660D	\N	Ortigas, Solaris One	2017-07-28 02:57:10.81975	2018-07-28 02:57:10.819791	2017-07-28 02:57:10.822455	2017-07-28 02:57:10.822455	2
170	13	799.98	Completed	chezca1228@yahoo.com	7FF1514764574993M	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-28 03:20:46.098073	2018-07-28 03:20:46.098127	2017-07-28 03:20:46.104755	2017-07-28 03:20:46.104755	2
171	13	799.98	Completed	chezca1228@yahoo.com	42P20553RE458392R	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-28 03:38:27.783625	2018-07-28 03:38:27.783673	2017-07-28 03:38:27.787001	2017-07-28 03:38:27.787001	2
172	13	799.98	Completed	chezca1228@yahoo.com	7EA56867X1636340S	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-28 04:50:01.652315	2018-07-28 04:50:01.65236	2017-07-28 04:50:01.659212	2017-07-28 04:50:01.659212	2
173	12	799.98	Completed	chezca1228@yahoo.com	7UY96657AY155423B	\N	Ortigas, Solaris One	2017-07-28 05:09:03.273055	2018-07-28 05:09:03.273106	2017-07-28 05:09:03.275887	2017-07-28 05:09:03.275887	2
174	12	799.98	Completed	chezca1228@yahoo.com	8XS236290E3065524	\N	Ortigas, Solaris One	2017-07-28 05:22:14.244959	2018-07-28 05:22:14.245002	2017-07-28 05:22:14.247732	2017-07-28 05:22:14.247732	2
175	13	799.98	Completed	chezca1228@yahoo.com	43R52644VM7380825	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-28 15:40:48.001404	2018-07-28 15:40:48.001452	2017-07-28 15:40:48.004438	2017-07-28 15:40:48.004438	2
176	12	799.98	Completed	chezca1228@yahoo.com	7GS594629G179245N	\N	Ortigas, Solaris One	2017-07-28 15:40:48.377263	2018-07-28 15:40:48.377314	2017-07-28 15:40:48.384062	2017-07-28 15:40:48.384062	2
177	13	799.98	Completed	chezca1228@yahoo.com	69D50784NL393503C	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-29 11:00:02.770952	2018-07-29 11:00:02.771001	2017-07-29 11:00:02.773705	2017-07-29 11:00:02.773705	2
178	12	799.98	Completed	chezca1228@yahoo.com	73892786GP6847828	\N	Ortigas, Solaris One	2017-07-29 11:06:14.694373	2018-07-29 11:06:14.694421	2017-07-29 11:06:14.697632	2017-07-29 11:06:14.697632	2
179	13	799.98	Completed	chezca1228@yahoo.com	3HU25929DH586645F	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-30 12:06:58.756979	2018-07-30 12:06:58.75703	2017-07-30 12:06:58.759822	2017-07-30 12:06:58.759822	2
180	12	799.98	Completed	chezca1228@yahoo.com	98V10789DF500602N	\N	Ortigas, Solaris One	2017-07-30 13:28:02.775805	2018-07-30 13:28:02.775863	2017-07-30 13:28:02.779021	2017-07-30 13:28:02.779021	2
181	13	799.98	Completed	chezca1228@yahoo.com	3VX139913U957823X	\N	Megamall Buffalo's, Megamall Chubby's	2017-07-31 13:33:00.892015	2018-07-31 13:33:00.892077	2017-07-31 13:33:00.895403	2017-07-31 13:33:00.895403	2
182	12	799.98	Completed	chezca1228@yahoo.com	2H598924E90895947	\N	Ortigas, Solaris One	2017-07-31 14:15:08.947673	2018-07-31 14:15:08.947724	2017-07-31 14:15:08.951605	2017-07-31 14:15:08.951605	2
183	13	799.98	Completed	chezca1228@yahoo.com	1FG05199UJ986805A	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-01 11:12:06.876899	2018-08-01 11:12:06.876939	2017-08-01 11:12:06.883558	2017-08-01 11:12:06.883558	2
184	12	799.98	Completed	chezca1228@yahoo.com	4CB60425WC1606646	\N	Ortigas, Solaris One	2017-08-01 11:14:16.111966	2018-08-01 11:14:16.112021	2017-08-01 11:14:16.118676	2017-08-01 11:14:16.118676	2
185	12	799.98	Completed	chezca1228@yahoo.com	2MT01795Y2861151Y	\N	Ortigas, Solaris One	2017-08-02 10:56:11.911701	2018-08-02 10:56:11.911756	2017-08-02 10:56:11.915366	2017-08-02 10:56:11.915366	2
186	13	799.98	Completed	chezca1228@yahoo.com	7LM37541VH927403F	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-02 15:29:17.465239	2018-08-02 15:29:17.465291	2017-08-02 15:29:17.468301	2017-08-02 15:29:17.468301	2
187	12	799.98	Completed	chezca1228@yahoo.com	6HL38571LW079901E	\N	Ortigas, Solaris One	2017-08-03 10:57:35.624786	2018-08-03 10:57:35.624835	2017-08-03 10:57:35.627567	2017-08-03 10:57:35.627567	2
188	13	799.98	Completed	chezca1228@yahoo.com	4M031568FC2114741	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-03 15:04:08.697526	2018-08-03 15:04:08.697568	2017-08-03 15:04:08.700237	2017-08-03 15:04:08.700237	2
189	13	799.98	Completed	chezca1228@yahoo.com	31V23541SG251823H	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-04 10:51:27.060824	2018-08-04 10:51:27.060872	2017-08-04 10:51:27.063958	2017-08-04 10:51:27.063958	2
190	12	799.98	Completed	chezca1228@yahoo.com	01A82448XD219024A	\N	Ortigas, Solaris One	2017-08-04 13:46:06.80458	2018-08-04 13:46:06.804621	2017-08-04 13:46:06.807232	2017-08-04 13:46:06.807232	2
191	12	799.98	Completed	chezca1228@yahoo.com	46G34192W79753425	\N	Ortigas, Solaris One	2017-08-05 11:18:44.772896	2018-08-05 11:18:44.772945	2017-08-05 11:18:44.77612	2017-08-05 11:18:44.77612	2
192	13	799.98	Completed	chezca1228@yahoo.com	9M7443084G744861U	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-05 12:39:18.18353	2018-08-05 12:39:18.183577	2017-08-05 12:39:18.190762	2017-08-05 12:39:18.190762	2
193	13	799.98	Completed	chezca1228@yahoo.com	0WW97400WC899081E	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-06 18:25:52.050983	2018-08-06 18:25:52.051036	2017-08-06 18:25:52.057877	2017-08-06 18:25:52.057877	2
194	12	799.98	Completed	chezca1228@yahoo.com	676472415X879711V	\N	Ortigas, Solaris One	2017-08-06 18:25:52.072117	2018-08-06 18:25:52.072167	2017-08-06 18:25:52.079615	2017-08-06 18:25:52.079615	2
195	13	799.98	Completed	chezca1228@yahoo.com	43M65699XT928721R	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-07 11:04:21.587228	2018-08-07 11:04:21.587274	2017-08-07 11:04:21.590343	2017-08-07 11:04:21.590343	2
196	12	799.98	Completed	chezca1228@yahoo.com	35E09314KT5706508	\N	Ortigas, Solaris One	2017-08-07 11:07:19.509933	2018-08-07 11:07:19.509984	2017-08-07 11:07:19.512704	2017-08-07 11:07:19.512704	2
197	13	799.98	Completed	chezca1228@yahoo.com	0TD39585P7615630T	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-08 11:07:00.959815	2018-08-08 11:07:00.959869	2017-08-08 11:07:00.98697	2017-08-08 11:07:00.98697	2
198	12	799.98	Completed	chezca1228@yahoo.com	2W822307XW2423303	\N	Ortigas, Solaris One	2017-08-08 11:21:36.924704	2018-08-08 11:21:36.92475	2017-08-08 11:21:36.954091	2017-08-08 11:21:36.954091	2
199	13	799.98	Completed	chezca1228@yahoo.com	26525766M9622443R	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-09 11:09:02.997733	2018-08-09 11:09:02.997785	2017-08-09 11:09:03.000801	2017-08-09 11:09:03.000801	2
200	12	799.98	Completed	chezca1228@yahoo.com	0JE847189B151153L	\N	Ortigas, Solaris One	2017-08-09 13:12:41.589892	2018-08-09 13:12:41.589941	2017-08-09 13:12:41.592841	2017-08-09 13:12:41.592841	2
201	12	799.98	Completed	chezca1228@yahoo.com	1BK37329NT156635U	\N	Ortigas, Solaris One	2017-08-10 12:47:34.704705	2018-08-10 12:47:34.704754	2017-08-10 12:47:34.731294	2017-08-10 12:47:34.731294	2
202	13	799.98	Completed	chezca1228@yahoo.com	9CA93380P0280862H	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-10 13:22:05.668152	2018-08-10 13:22:05.668198	2017-08-10 13:22:05.700154	2017-08-10 13:22:05.700154	2
203	12	799.98	Completed	chezca1228@yahoo.com	139154009A0104353	\N	Ortigas, Solaris One	2017-08-11 11:01:12.085208	2018-08-11 11:01:12.08526	2017-08-11 11:01:12.092738	2017-08-11 11:01:12.092738	2
204	13	799.98	Completed	chezca1228@yahoo.com	28M92016WN519473M	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-11 14:52:14.170023	2018-08-11 14:52:14.170069	2017-08-11 14:52:14.172957	2017-08-11 14:52:14.172957	2
205	13	799.98	Completed	chezca1228@yahoo.com	6UF043071F1920325	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-12 11:44:12.666841	2018-08-12 11:44:12.666876	2017-08-12 11:44:12.671705	2017-08-12 11:44:12.671705	2
206	12	799.98	Completed	chezca1228@yahoo.com	13255987S0280911R	\N	Ortigas, Solaris One	2017-08-12 14:19:53.936787	2018-08-12 14:19:53.936821	2017-08-12 14:19:53.939222	2017-08-12 14:19:53.939222	2
207	12	799.98	Completed	chezca1228@yahoo.com	6PP64730BE888612E	\N	Ortigas, Solaris One	2017-08-24 09:10:55.162405	2018-08-24 09:10:55.162447	2017-08-24 09:10:55.164983	2017-08-24 09:10:55.164983	2
208	12	799.98	Completed	chezca1228@yahoo.com	6LG78712B0262622W	\N	Ortigas, Solaris One	2017-08-24 09:39:56.370575	2018-08-24 09:39:56.370661	2017-08-24 09:39:56.373358	2017-08-24 09:39:56.373358	2
209	12	799.98	Completed	chezca1228@yahoo.com	3EK78157LY417463J	\N	Ortigas, Solaris One	2017-08-24 10:01:38.83608	2018-08-24 10:01:38.83611	2017-08-24 10:01:38.838402	2017-08-24 10:01:38.838402	2
210	13	799.98	Completed	chezca1228@yahoo.com	2DV10023GX932440A	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-24 11:57:15.528919	2018-08-24 11:57:15.528962	2017-08-24 11:57:15.531429	2017-08-24 11:57:15.531429	2
211	12	799.98	Completed	chezca1228@yahoo.com	3XX872933E881014V	\N	Ortigas, Solaris One	2017-08-24 12:17:09.886096	2018-08-24 12:17:09.886137	2017-08-24 12:17:09.88863	2017-08-24 12:17:09.88863	2
212	12	799.98	Completed	chezca1228@yahoo.com	8PF448744X973391U	\N	Ortigas, Solaris One	2017-08-24 12:34:45.555583	2018-08-24 12:34:45.555622	2017-08-24 12:34:45.561555	2017-08-24 12:34:45.561555	2
213	13	799.98	Completed	chezca1228@yahoo.com	2JX18706VN689833B	\N	Megamall Buffalo's, Megamall Chubby's	2017-08-24 13:25:11.282294	2018-08-24 13:25:11.282331	2017-08-24 13:25:11.288944	2017-08-24 13:25:11.288944	2
214	12	799.98	Completed	chezca1228@yahoo.com	1EH0966633857970B	\N	Ortigas, Solaris One	2017-08-24 13:35:11.336324	2018-08-24 13:35:11.336359	2017-08-24 13:35:11.339082	2017-08-24 13:35:11.339082	2
215	12	799.98	Completed	chezca1228@yahoo.com	3NJ441561X016823M	\N	Ortigas, Solaris One	2017-08-24 13:58:17.292249	2018-08-24 13:58:17.292283	2017-08-24 13:58:17.294925	2017-08-24 13:58:17.294925	2
217	12	799.98	Completed	chezca1228@yahoo.com	5F9329062W8696818	\N	Ortigas, Solaris One	2017-08-24 19:25:26.431378	2018-08-24 19:25:26.431416	2017-08-24 19:25:26.437977	2017-08-24 19:25:26.437977	2
216	12	799.98	Completed	chezca1228@yahoo.com	27J148207S8966718	\N	Ortigas, Solaris One	2017-08-24 15:59:31.910493	2018-08-24 15:59:31.910531	2017-08-24 15:59:31.913666	2017-08-24 15:59:31.913666	2
218	12	799.98	Completed	chezca1228@yahoo.com	0MF355939T885803C	\N	Ortigas, Solaris One	2017-08-24 19:29:51.306655	2018-08-24 19:29:51.306687	2017-08-24 19:29:51.309129	2017-08-24 19:29:51.309129	2
\.


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('bills_id_seq', 218, true);


--
-- Data for Name: branch_subscriptions; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY branch_subscriptions (id, branch_id, subscription_id, created_at, updated_at) FROM stdin;
1	1	1	2016-04-18 01:35:36.18551	2016-04-18 01:35:36.18551
2	2	2	2016-05-05 00:56:24.90585	2016-05-05 00:56:24.90585
3	3	3	2016-07-17 02:46:46.606367	2016-07-17 02:46:46.606367
4	4	4	2016-08-06 10:58:17.264594	2016-08-06 10:58:17.264594
5	5	5	2016-08-11 07:40:48.694892	2016-08-11 07:40:48.694892
6	6	6	2016-08-13 08:31:08.827062	2016-08-13 08:31:08.827062
7	7	7	2016-08-19 02:26:45.287745	2016-08-19 02:26:45.287745
8	8	8	2016-08-24 05:28:59.318168	2016-08-24 05:28:59.318168
9	9	9	2016-12-20 08:13:31.582934	2016-12-20 08:13:31.582934
10	12	10	2017-03-06 09:03:03.21999	2017-03-06 09:03:03.21999
11	11	10	2017-03-06 09:03:03.259833	2017-03-06 09:03:03.259833
12	1	10	2017-03-06 09:03:03.294032	2017-03-06 09:03:03.294032
13	10	11	2017-03-06 09:16:22.06352	2017-03-06 09:16:22.06352
14	2	11	2017-03-06 09:16:22.095987	2017-03-06 09:16:22.095987
15	13	12	2017-04-04 02:53:23.614462	2017-04-04 02:53:23.614462
16	2	12	2017-04-04 02:53:23.655698	2017-04-04 02:53:23.655698
17	15	13	2017-07-10 05:58:47.200914	2017-07-10 05:58:47.200914
18	14	13	2017-07-10 05:58:47.236815	2017-07-10 05:58:47.236815
\.


--
-- Name: branch_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('branch_subscriptions_id_seq', 18, true);


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY branches (id, brand_id, name, address1, address2, city, zip, province_state, country, status, landline_no, mobile_no, fax_no, is_franchise, email_address, breadcrumbs, is_deleted, created_at, updated_at, color) FROM stdin;
1	1	Fort Bonifacio	Fort Bonifacio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-04-18 01:35:31.835867	2016-04-18 01:35:31.835867	#00A087
2	2	Ortigas	Ortigas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-05-05 00:56:21.216483	2016-05-05 00:56:21.216483	#DC143C
3	3	Ortigas	Ortigas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-07-17 02:46:43.832963	2016-07-17 02:46:43.832963	#98ACD1
4	4	SM MOA		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-08-06 10:58:13.737793	2016-08-06 10:58:13.737793	#00A087
5	5	University Mall	University Mall, Vito Cruz, Taft, Manila	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-08-11 07:40:41.084911	2016-08-11 07:40:41.084911	#FF8C00
6	6	Cavite Branch		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-08-13 08:31:05.736668	2016-08-13 08:31:05.736668	#1E81B4
7	7	Makati	Ayala Makati	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-08-19 02:26:42.120051	2016-08-19 02:26:42.120051	#00A087
8	8	Admin RB1	Makati City	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-08-24 05:28:56.854268	2016-08-24 05:28:56.854268	#DD525B
9	9	Bgc		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2016-12-20 08:13:22.608976	2016-12-20 08:13:22.608976	#8CAF41
11	1	Las Pinas	Las Pinas	\N		\N	\N	\N	\N	0698599			\N	laspinas@test.com	\N	f	2017-03-06 08:57:16.116698	2017-03-06 08:57:16.116698	#FF4500
12	1	Shangri La Shaw	Shangri La tower	\N	Mandaluyong	5556	\N	\N	\N				\N	shaw3999@test.com	\N	f	2017-03-06 08:57:59.605994	2017-03-06 08:57:59.605994	#60355B
13	2	Solaris One	Solaris One, Dela Rosa	\N	Makati	\N	\N	\N	\N	5521103	09178854241		\N	solarisone@getbuffaloed.com	\N	f	2017-03-31 05:53:47.978486	2017-03-31 05:53:47.978486	#FF4500
14	2	Megamall Buffalo's	Lower Ground Floor, Megamall A, Brgy. Wack Wack, Mandaluyong City	\N	Mandaluyong City	\N	\N	\N	\N				\N	megamall@getbuffaloed.com	\N	f	2017-07-04 05:14:57.333554	2017-07-04 05:14:57.333554	#60355B
10	2	Brixton	Unit 5, #1 Brixton Street, Brgy. Kapitolyo, Pasig City	\N	Pasig City	\N	\N	\N	\N				\N	brixton@getbuffaloed.com	\N	f	2017-03-01 15:49:41.809172	2017-07-04 05:17:44.683162	#DC143C
15	2	Megamall Chubby's	Mega Food Hall, Mega Fashion Hall, Megamall Bldg. D, Brgy. Wack Wack, Mandaluyong City	\N	Mandaluyong City	\N	\N	\N	\N				\N	chubbys.megamall@primehospitality.net	\N	f	2017-07-04 05:16:22.978353	2017-07-10 05:55:16.159054	#FF8C00
\.


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('branches_id_seq', 15, true);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY brands (id, client_id, name, description, landline_no, mobile_no, fax_no, avatar_file_name, avatar_content_type, avatar_file_size, avatar_update_at, website, is_deleted, created_at, updated_at) FROM stdin;
1	1	FoodServ	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-04-18 01:34:47.869072	2016-04-18 01:34:47.869072
3	3	Restobot	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-07-17 02:46:15.578886	2016-07-17 02:46:15.578886
4	4	Coffee Bean	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-08-06 10:58:00.854827	2016-08-06 10:58:00.854827
5	5	Res Toe Run	\N	\N	\N	\N	\N	\N	\N	\N	appsource.biz	f	2016-08-11 07:39:27.903534	2016-08-11 07:39:27.903534
6	6	Restaurant1	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-08-13 08:30:35.355882	2016-08-13 08:30:35.355882
7	7	C&B Coffee House	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-08-19 02:26:19.867363	2016-08-19 02:26:19.867363
8	8	Admin Rb1	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-08-24 05:28:45.107835	2016-08-24 05:28:45.107835
9	9	Tree House Cafe	\N	\N	\N	\N	\N	\N	\N	\N		f	2016-12-20 08:13:02.848023	2016-12-20 08:13:02.848023
2	2	Buffalo's Wings N' Things / Chubby's Rib Shack					\N	\N	\N	\N		f	2016-05-05 00:56:08.034461	2017-03-01 15:48:34.957502
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('brands_id_seq', 9, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY categories (id, brand_id, name, description, is_active, track_as_sales, is_deleted, parent_id, created_at, updated_at) FROM stdin;
1	1	Beverage	Beverage	t	f	f	\N	2017-02-22 03:36:38.552212	2017-02-22 03:36:38.552212
2	1	Food	Food	t	f	f	\N	2017-02-22 03:36:48.966397	2017-02-22 03:36:48.966397
19	2	Controllable Expnse		t	f	f	\N	2017-03-01 13:51:17.600988	2017-03-01 13:51:17.600988
20	2	Non Controllable Expense		t	f	f	\N	2017-03-01 13:51:44.397834	2017-03-01 13:51:44.397834
21	2	Meat		t	\N	f	15	2017-03-01 13:55:07.380799	2017-03-01 13:55:07.380799
22	2	Poultry		t	\N	f	15	2017-03-01 13:55:15.476874	2017-03-01 13:55:15.476874
23	2	Fish & Seafood		t	\N	f	15	2017-03-01 13:55:25.512257	2017-03-01 13:55:25.512257
24	2	Dairy		t	\N	f	15	2017-03-01 13:55:34.809719	2017-03-01 13:55:34.809719
25	2	Produce		t	\N	f	15	2017-03-01 13:55:43.9798	2017-03-01 13:55:43.9798
26	2	Food Other		t	\N	f	15	2017-03-01 13:55:53.132288	2017-03-01 13:55:53.132288
27	2	Soda		t	\N	f	16	2017-03-01 13:56:36.706741	2017-03-01 13:56:36.706741
28	2	Juice		t	\N	f	16	2017-03-01 13:56:44.232618	2017-03-01 13:56:44.232618
29	2	Water		t	\N	f	16	2017-03-01 13:56:51.106599	2017-03-01 13:56:51.106599
30	2	Local Beer		t	\N	f	17	2017-03-01 13:57:03.086047	2017-03-01 13:57:03.086047
31	2	Imported Beer		t	\N	f	17	2017-03-01 13:57:18.333809	2017-03-01 13:57:18.333809
32	2	Bottled Liquor		t	\N	f	18	2017-03-01 13:57:44.253609	2017-03-01 13:57:44.253609
33	2	Operating Supplies		t	\N	f	19	2017-03-01 13:57:58.949423	2017-03-01 13:57:58.949423
34	2	Utilities		t	\N	f	19	2017-03-01 13:58:07.271509	2017-03-01 13:58:07.271509
35	2	Other Controllable Expenses		t	\N	f	19	2017-03-01 13:58:25.761313	2017-03-01 13:58:25.761313
36	2	Rent		t	\N	f	20	2017-03-01 13:58:35.832814	2017-03-01 13:58:35.832814
38	2	Other Non Controllable Expenses		t	\N	f	20	2017-03-01 14:00:45.694953	2017-03-01 14:00:45.694953
39	2	Marketing & Advertising Expenses		t	\N	f	20	2017-03-01 14:01:17.951946	2017-03-01 14:01:17.951946
37	2	Management & Supervision Expenses		t	\N	f	20	2017-03-01 13:58:50.055435	2017-03-01 14:01:27.905243
40	2	Employee Fringe & Expense		t	f	f	\N	2017-03-08 06:43:42.278687	2017-03-08 06:43:42.278687
41	2	Employee Benefits		t	\N	f	40	2017-03-08 06:43:57.606405	2017-03-08 06:43:57.606405
17	2	Beer		t	t	f	\N	2017-03-01 13:50:57.733904	2017-07-12 02:21:40.425965
16	2	Beverage		t	t	f	\N	2017-03-01 13:50:51.389937	2017-07-12 02:22:03.075758
15	2	Food		t	t	f	\N	2017-03-01 13:50:41.297053	2017-07-12 02:22:12.435872
18	2	Liquor		t	t	f	\N	2017-03-01 13:51:07.593176	2017-07-12 02:22:18.77888
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('categories_id_seq', 41, true);


--
-- Data for Name: client_user_accesses; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY client_user_accesses (id, user_id, client_id, role_id, brand_id, branch_id, created_at, updated_at) FROM stdin;
1	1	1	1	\N	\N	2016-04-18 01:34:17.90988	2016-04-18 01:35:35.986425
2	2	2	4	\N	\N	2016-05-05 00:55:44.577843	2016-05-05 00:56:24.786472
3	5	3	7	\N	\N	2016-07-17 02:45:36.330889	2016-07-17 02:46:46.495312
4	6	4	10	\N	\N	2016-08-03 15:36:00.310048	2016-08-06 10:58:17.195303
5	7	5	13	\N	\N	2016-08-11 07:38:15.714915	2016-08-11 07:40:48.622215
6	8	6	16	\N	\N	2016-08-13 08:29:46.650872	2016-08-13 08:31:08.76415
7	9	7	19	\N	\N	2016-08-19 02:25:28.313924	2016-08-19 02:26:45.224253
8	10	8	22	\N	\N	2016-08-24 05:27:45.184365	2016-08-24 05:28:59.255127
9	11	9	25	\N	\N	2016-12-20 08:11:36.155501	2016-12-20 08:13:31.235111
12	15	1	1	\N	\N	2017-03-02 04:45:19.777894	2017-03-02 04:45:19.830302
13	16	1	1	\N	\N	2017-03-02 04:48:44.788981	2017-03-02 04:48:44.829017
14	17	2	6	2	10	2017-03-02 04:59:31.796905	2017-03-02 04:59:31.833249
15	20	2	6	2	10	2017-03-02 07:53:35.252913	2017-03-02 07:53:35.295816
16	21	2	6	2	13	2017-03-31 05:55:14.617209	2017-03-31 05:55:14.666989
17	22	2	6	2	14	2017-07-10 06:00:14.363886	2017-07-10 06:00:14.404429
18	23	2	6	2	15	2017-07-10 06:01:27.426765	2017-07-10 06:01:27.451272
19	24	2	5	2	\N	2017-07-10 06:09:25.324457	2017-07-10 06:09:25.360053
20	25	2	6	2	14	2017-07-10 06:58:08.688803	2017-07-10 06:58:08.715125
\.


--
-- Name: client_user_accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('client_user_accesses_id_seq', 20, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY clients (id, name, landline, mobile, fax, website, email, address1, address2, contact, avatar_file_name, avatar_content_type, avatar_file_size, avatar_uploaded_at, flag, created_at, updated_at) FROM stdin;
1	FoodServ	\N	\N	\N	\N		Ayala, Makati	\N		\N	\N	\N	\N	1	2016-04-18 01:34:40.874849	2016-04-18 01:34:40.874849
3	Restobot Company	\N	\N	\N	\N		Ortigas Center	\N		\N	\N	\N	\N	1	2016-07-17 02:45:53.546531	2016-07-17 02:45:53.546531
4	SJ Co	\N	\N	\N	\N			\N		\N	\N	\N	\N	1	2016-08-06 10:57:34.420953	2016-08-06 10:57:53.916241
5	Res Toe Run	\N	\N	\N	\N	ryu@appsource.biz	Unit 1401, Robinsons Equitable Tower, Ortigas, Pasig City	\N	4772777	\N	\N	\N	\N	1	2016-08-11 07:39:12.262801	2016-08-11 07:39:12.262801
6	Gousteu Company	\N	\N	\N	\N	apeiron.jmunts@gmail.com	Paris, France	\N	1234222312	\N	\N	\N	\N	1	2016-08-13 08:30:25.66029	2016-08-13 08:30:25.66029
7	C&B Coffee House	\N	\N	\N	\N	rb1test@yopmail.com	Makati City	\N	092134444	\N	\N	\N	\N	1	2016-08-19 02:26:08.315276	2016-08-19 02:26:08.315276
8	John Smith	\N	\N	\N	\N	adminrb1@yopmail.com	Makati City	\N	09324729	\N	\N	\N	\N	1	2016-08-24 05:28:22.959852	2016-08-24 05:28:22.959852
9	Steffco	\N	\N	\N	\N		Manila	\N	09283789	\N	\N	\N	\N	1	2016-12-20 08:12:37.142628	2016-12-20 08:12:37.142628
2	Buffalo's Wings N' Things Corp.	\N	\N	\N	\N		Ortigas	\N	0938247	\N	\N	\N	\N	1	2016-05-05 00:55:58.34211	2017-03-01 15:48:01.11603
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('clients_id_seq', 9, true);


--
-- Data for Name: conversions; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY conversions (id, brand_id, from_unit_id, to_unit_id, factor, is_active, is_deleted, created_at, updated_at) FROM stdin;
1	2	1	2	2.2	t	f	2017-03-01 13:45:59.160063	2017-03-01 13:45:59.160063
2	2	1	11	35.2	t	f	2017-03-01 13:46:35.350807	2017-03-01 13:46:35.350807
\.


--
-- Name: conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('conversions_id_seq', 2, true);


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY dashboards (id, client_id, brand_id, branch_id, customer_count, previous_date_entry, created_at, updated_at, purchase_total_amount, sales_total_amount) FROM stdin;
\.


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('dashboards_id_seq', 1, false);


--
-- Data for Name: employee_types; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY employee_types (id, name, description, dividend_id, created_at, updated_at) FROM stdin;
1	Kitchen Staff	Kitchen Area	\N	2016-04-18 02:05:13.315653	2016-04-18 02:05:13.315653
2	Front of the House		\N	2017-07-10 06:10:42.176347	2017-07-10 06:10:42.176347
3	Back of the House		\N	2017-07-10 06:10:57.353035	2017-07-10 06:10:57.353035
4	Chief		\N	2017-07-10 06:11:06.494957	2017-07-10 06:11:06.494957
5	BOH Team Leader		\N	2017-07-10 06:11:17.216531	2017-07-10 06:11:17.216531
6	FOH Team Leader		\N	2017-07-10 06:11:26.664524	2017-07-10 06:11:26.664524
\.


--
-- Name: employee_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('employee_types_id_seq', 6, true);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY employees (id, branch_id, employee_type_id, first_name, last_name, date_employed, job_id, birthdate, contact_no, sss, tin, address, hdmf, age, philhealth, "position", position_type, end_date, created_at, updated_at) FROM stdin;
1	1	1	Von	Naito	\N	\N	\N	0983247	897327	76868	Fort Bonifacio	6786	22	876876	Chef	Regular	\N	2016-04-18 02:06:22.520092	2016-04-18 02:06:22.520092
34	13	3	Alvin	Robiego	\N	\N	\N	09752209946	34-4571185-4	1211-1932-4969	Rd2 #12 Lot 12 Brgy. Sta. Ana, Lupang Arenda, Taytay, Rizal\r\n	1211-1932-4969	\N	0102-5627-8842	Cook	Regular	\N	2017-07-24 04:10:04.406124	2017-07-24 04:10:04.406124
2	10	4	Maria Victoria	Oamil	2013-02-12	\N	\N	09173788087	3439715688	445257662	14 Kalinga St. La Vista QC	913336051926	25	030255001236	Chief	Regular	\N	2017-07-10 06:28:54.009012	2017-07-20 01:09:32.378785
3	10	4	Ferly	Cabrera	\N	\N	\N	09956578883	34-0503224-3	254-640-794	31 Florenceville Brgy. Nagkaisang Nayon ,Novaliches Quezon City	1020-0396-1076	32	03-050324355-1	Purchasing	Regular	\N	2017-07-18 07:24:21.952357	2017-07-20 01:11:31.681117
4	14	2	Pamela	Picadizo	\N	\N	\N	09065146965	34-4291905-7	446-171-454	BLK 18 L10 ACACIA DRIVE PALMERA  WOODLANDS, PENAFRANCIA, BGY., ANTIPOLO\r\n	1211-1123-7611	\N	02-026161172-5	Server	Regular	\N	2017-07-20 01:19:27.800262	2017-07-20 01:19:27.800262
5	15	3	Ron Ron	Reblando	\N	\N	1991-11-04	09365384345	34-2523974-1	312-354-142	1538 B INT. 3 ANOTNIO ISIP ST. PACO,  MANILA\r\n	1210-6919-9293	\N	03-050848950-8	Cook	Contractual	\N	2017-07-20 01:23:21.918094	2017-07-20 01:23:21.918094
6	15	6	Roselle	Salomon	2016-05-09	\N	\N	09263310506	34-4859329-9	336-119-424	Blk 201 Lot II Southville 8B San Isidro, Rodriguez, Rizal\r\n	1211-7994-6385	\N	03-025690117-6	FOH Team Leader	Regular	\N	2017-07-20 01:25:17.854949	2017-07-20 01:25:17.854949
7	15	2	Elvina Joy	Tuazon	\N	\N	\N	09778359737	34-2290570-6	321-051-685-000	320 BUNGAD MALIS, GUIGUINTO, BULACAN\r\n	0010-7596-9504	\N	01-025379157-3	Server	Regular	\N	2017-07-20 01:27:00.463274	2017-07-20 01:27:00.463274
8	15	3	John Carlo	Villamiel	2017-03-02	\N	\N	09363931883	34-5825142-4	335-330-198	32 R. HERNANDEZ ST. SAN JOAQUIN PASIG CITY\r\n	1211-6781-0973	\N	01-052224026-0	cook	Contractual	\N	2017-07-20 01:28:40.842534	2017-07-20 01:28:40.842534
9	10	4	Vince Martin	Punto	2009-10-08	\N	1988-12-08	09178854241	04-2120563-3	276-943-710	SAN PABLO CITY LAGUNA\r\n	912285221846	\N	22-000071517-4	Director on Operations	Regular	\N	2017-07-20 01:31:12.4362	2017-07-20 01:31:12.4362
10	10	2	Lovely	Bisa	\N	\N	\N	09070912815	04-2743520-3	439-870-361-000	146 Champaca St. Brgy. San Joaquin, Pasig City\r\n	1210-9262-3839	\N	08-025571052-8	Server	Regular	\N	2017-07-20 01:32:33.055132	2017-07-20 01:32:33.055132
11	14	6	Marberose	Catilo	2017-01-03	\N	1993-09-07	09055413006	34-3681294-0	455-515-505	BLK 8 LOT 18 SANTOL ST. DIVIDEND HOMES, TAYTAY, RIZAL\r\n	0102-5639-8325	\N	01-025639832-5	FOH Team Leader	Contractual	\N	2017-07-20 01:36:38.932129	2017-07-20 01:36:38.932129
12	10	2	Carmela Jane	Domingo	2016-04-07	\N	\N	09752081962	34-3314836-1	472-754-535-000	25B SAN JOSE  BAGUMBAYAN, QUEZON CITY\r\n	1211-3614-3994	\N	03-051101193-7	Server	Regular	\N	2017-07-20 01:39:56.805272	2017-07-20 01:39:56.805272
13	10	3	Aldrin Christopher	Gualter	\N	\N	1994-06-01	09498211253	34-4374849-2	329-293-152	66 MAGDALENA SUBD. MALINAO, PASIG CITY\r\n	1211-1615-8035	\N	01-051876771-8	BOH TL Intern	Regular	\N	2017-07-20 02:28:06.301482	2017-07-20 02:28:06.301482
14	10	6	Maica Marie	Salonga	\N	\N	1985-02-10	09771813834	34-6088544-8	333-812-476-000	35 A. DUQUE ST. MALANDAY, VALENZUELA CITY\r\n	121176360377	\N	02-251253360-8	FOH Team Leader	Regular	\N	2017-07-20 02:29:35.239237	2017-07-20 02:29:35.239237
15	10	3	Jericho	Santos	2016-03-10	\N	\N	09206006406	34-2393656-7	450-685-840-000	BLK 96 LOT 21 SOUTHVILLE 8B BRGY. SAN ISIDRO, RODRIGUEZ, RIZAL	1210-8155-6154	\N	03-050717620-4		\N	\N	2017-07-20 02:31:11.691913	2017-07-20 02:31:11.691913
16	10	3	Ma.Rizza	Mendoza	\N	\N	\N	09059436159	02-2711795-4	322-711-376	BICUTAN, TAGUIG\r\n	1211-4775-8529	\N	2102-5321-5016	Cook	Contractual	\N	2017-07-20 02:45:56.516006	2017-07-20 02:45:56.516006
17	14	2	Rejoice Shalom	Deciar	\N	\N	\N	09335715638	02-3623792-2	327-132-245	SAN JUAN CITY, METRO MANILA\r\n	1211-5753-5812	\N	02-026606292-4	Server	Contractual	\N	2017-07-20 02:48:27.123001	2017-07-20 02:48:27.123001
19	10	4	Reynard 	Gallego	2012-11-06	\N	1988-04-06	09159374647	34-1642978-0	276-833-714	62 A CHAMPACA ST DOLMAR SUBD KALAWAAN SUR PASIG CITY\r\n	9122-8418-2383	\N	03-050841893-7	Training	Regular	\N	2017-07-20 02:54:24.790217	2017-07-20 02:54:24.790217
20	14	3	Christian	Matira	0011-07-16	\N	1987-03-01	09173718756	04-1915808-0	256-057-772-000		1490-0081-1238	\N	01-025222771-2	cook	Regular	\N	2017-07-24 03:31:08.512022	2017-07-24 03:31:08.512022
21	14	5	John Henry	Obico	\N	\N	\N	09061279948	34-5405525-0	329-576-233	255 BATIS CMPD. SAN MIGUEL, PASIG CITY\r\n	1211-8911-3892	\N	01-251313167-2	BOH Teamleader	Regular	\N	2017-07-24 03:33:05.616304	2017-07-24 03:33:05.616304
22	14	4	Myrtle Roxanne	Redera	\N	\N	1993-02-02	09062424679	34-3645164-4	443-951-431-000	Unit 401 Villa Ruel Tower, Villa Ruel St. Pasay City\r\n	9133-3605-0750	\N	01-251490057-2	Chief	Regular	\N	2017-07-24 03:34:59.203994	2017-07-24 03:34:59.203994
23	14	3	King	Rodillon	2017-02-02	\N	\N	09150765565	07-2449591-7	267-990-904	A. MARIANO ST. BGRY. STO. ROSARIO KANLURAN, PATEROS, MANILA\r\n	1211-0228-0378	\N	11-050605921-6	Cook	Contractual	\N	2017-07-24 03:36:46.205511	2017-07-24 03:36:46.205511
24	14	3	Nelson	Sunio	2015-11-08	\N	1989-05-08	09362396866	34-1658422-7	282-296-638	14 KAPALARAN ST. BARANGKA DRIVE MANDALLUYONG CITY\r\n	1211-2181-0321	\N	01-050798670-1	Cook	Regular	\N	2017-07-24 03:38:39.918745	2017-07-24 03:38:39.918745
27	13	2	Alona	Belinario	\N	\N	\N	09463656689	34-315-7176-5	442-871-973	02 HERBS ST. SOUTH SIGNAL VILLAGE, TAGUIG CITY\r\n	1210-8878-7687	\N	03-050983178-1	Server	Contractual	\N	2017-07-24 03:47:27.777675	2017-07-24 03:47:27.777675
28	10	5	Rizalde	Cestona	\N	\N	\N	09263350646	33-7886301-5	213-545-858	1167 LUALHATI ST. TONDO MANILA\r\n	9121-4100-8132	\N	02-050071078-1	BOH Teamleader	Regular	\N	2017-07-24 03:49:25.256295	2017-07-24 03:49:25.256295
29	13	5	Rodel	Delgado	\N	\N	1977-01-12	09054267886	33-6161373-5	246-186-530	946 SAN JOSE ST. MAUWAY MANDALUYONG CITY\r\n	1010-0112-1433	\N	03-050047016-6	BOH Teamleader	Regular	\N	2017-07-24 03:51:08.0873	2017-07-24 03:51:08.0873
30	13	4	Cheryline	Esmeralda	2016-10-07	\N	\N	09198094123	34-4700380-3	500-186-547		914250251102	\N	0302-5655-9435	Chief	Regular	\N	2017-07-24 03:57:46.158717	2017-07-24 03:57:46.158717
31	15	5	Renz Carlo	Freo	\N	\N	\N	09054148608	34-0557495-0	251-848-309	2209 LEVERIZA ST. PASAY CITY\r\n	1080-0099-2112	\N	03-050442761-3	BOH Teamleader	Regular	\N	2017-07-24 03:59:13.327637	2017-07-24 03:59:13.327637
32	13	3	Junio	Moresco Jr	2017-11-01	\N	1988-10-08	09267178159	34-0613292-2	306-876-185	448-A BANABA ST. , CEMBO, MAKATI\r\n	1010-0306-8890	\N	01-051762000-4	Cook	Regular	\N	2017-07-24 04:06:52.004901	2017-07-24 04:06:52.004901
33	13	2	Cherielou	Ricafrente	2017-11-01	\N	1992-09-04	09214439659	34-3171625-8	429-927-945	102 VET. VILLAGE, VET. AVENUE, BGRY. HOLY \r\n	1210-7388-4902	\N	03-051048797-0			\N	2017-07-24 04:08:44.34902	2017-07-24 04:08:44.34902
36	13	3	Miko	Silvano	\N	\N	1992-05-03	09052740907	34-2045110-0	334-741-799	#36 SIXTO EXT. , TANDANG SORA, Q.C.\r\n	9163-1868-5756	\N	22-000073818-2	Cook	Regular	\N	2017-07-24 04:13:08.872037	2017-07-24 04:13:08.872037
37	14	6	Pantino	Princess	2012-06-08	\N	\N	09959588667	34-3108555-2	417-494-619-000	42 EVANGELISTA AVE SANTOLAN PASIG CITY\r\n	9122-8414-6691	\N	030253827951	FOH Team Leader	Regular	\N	2017-07-24 07:14:52.084868	2017-07-24 07:14:52.084868
38	10	2	Ronnel	Fortifaes	2017-06-06	\N	1992-01-12	09168306450	34-2564184-7	309-120-437	30 LUALHATI ST.DONA DAMIANA VILL ROSARIO PASIG CITY\r\n	1211-43708962	\N	10511030787	Server	Contractual	\N	2017-07-24 07:18:08.979681	2017-07-24 07:18:08.979681
25	14	3	Marcelino	Tacata	\N	\N	1997-03-07	09155432041	34-5508568-0	477-489-276	728 MOLAVE ST SAN JOSE RD. RIZAL\r\n	1211-5864-9169	\N	0302-5871-1129	Cook	Contractual	\N	2017-07-24 03:40:27.084421	2017-07-24 07:33:21.195235
26	13	3	Dana	Aquino	\N	\N	\N	09173912026	01-2499688-3	470-180-3000	MANGANDIGAY CABRROGUIS QUIRINO\r\n	1211-4934-2062	\N	0405-0191-1145	Cook	Contractual	\N	2017-07-24 03:43:39.786028	2017-07-24 07:35:31.358701
35	13	2	Maureen	San Agustin	2017-12-06	\N	\N	09261428831	34-3680335-7		6641 TAYLO ST. BRGY.PIO DEL PILAR MAKATI CITY\r\n	1211-2352-2438	\N	08-051356176-1	Server	Contractual	\N	2017-07-24 04:11:27.839062	2017-07-24 07:39:31.128387
39	13	2	Jethro	Jocson	2017-05-06	\N	\N	09097466919	07-2561075-9	336141737-0000	BANGKAL, LUCBAN ST. MAKATI CITY\r\n	1211-94631514	\N	0102-6093-6935	Server	Contractual	\N	2017-07-24 07:24:06.79232	2017-07-24 07:24:06.79232
18	14	2	Guila Mae	Estandarte	2017-05-06	\N	0004-06-04	09153948900	34-6800526-2		1048 BAGONG SILANG ST.NANGKA MARIKINA CITY\r\n	1212-0033-1087	\N	0325-0718-1154	Server	Contractual	\N	2017-07-20 02:52:53.341767	2017-07-24 07:30:16.576583
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('employees_id_seq', 39, true);


--
-- Data for Name: inventories; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY inventories (id, branch_id, user_id, entry_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: inventories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('inventories_id_seq', 1, false);


--
-- Data for Name: inventory_items; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY inventory_items (id, inventory_id, item_id, stock_count, created_at, updated_at) FROM stdin;
\.


--
-- Name: inventory_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('inventory_items_id_seq', 1, false);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY items (id, brand_id, unit_id, category_id, name, item_type, is_active, track_as_sales, is_deleted, item_value, item_code, created_at, updated_at) FROM stdin;
1	2	2	21	Beef, Ground	Inventory	t	f	f	\N		2017-03-01 14:03:50.612147	2017-03-01 14:03:50.612147
2	2	2	21	Beef, Burger Patty	Inventory	t	f	f	\N		2017-03-01 14:04:16.781468	2017-03-01 14:04:16.781468
3	2	2	21	Beef, Hotdogs	Inventory	t	f	f	\N		2017-03-01 14:06:05.75664	2017-03-01 14:06:05.75664
4	2	2	21	Pork, Belly	Inventory	t	f	f	\N		2017-03-01 14:07:04.537017	2017-03-01 14:07:04.537017
5	2	2	21	Pork, Riblets	Inventory	t	f	f	\N		2017-03-01 14:07:34.492145	2017-03-01 14:07:34.492145
6	2	2	21	Pork, Shoulder Butt	Inventory	t	f	f	\N		2017-03-01 14:07:53.253613	2017-03-01 14:07:53.253613
7	2	2	22	Chicken, Leg Fillet	Inventory	t	f	f	\N		2017-03-01 14:08:48.120326	2017-03-01 14:10:01.235449
9	2	2	22	Chicken, Wings	Inventory	t	f	f	\N		2017-03-01 14:09:23.372767	2017-03-01 14:10:12.030442
8	2	2	22	Chicken, Tenders	Inventory	t	f	f	\N		2017-03-01 14:09:06.004966	2017-03-01 14:10:20.597307
10	2	2	24	Buttercup	Inventory	t	f	f	\N		2017-03-01 14:10:41.460908	2017-03-01 14:10:41.460908
11	2	2	24	Butterlicious	Inventory	t	f	f	\N		2017-03-01 14:11:01.056817	2017-03-01 14:11:01.056817
12	2	2	24	Cheese, Bleu	Inventory	t	f	f	\N		2017-03-01 14:11:44.048237	2017-03-01 14:11:44.048237
13	2	11	24	Cheese, Parmesan	Inventory	t	f	f	\N		2017-03-01 14:12:11.24125	2017-03-01 14:12:11.24125
14	2	11	24	Cheese, Cheddar Powder	Inventory	t	f	f	\N		2017-03-01 14:12:49.211334	2017-03-01 14:12:49.211334
15	2	13	24	Cheese, Sauce 	Inventory	t	f	f	\N		2017-03-01 14:14:17.883699	2017-03-01 14:14:32.826683
16	2	4	24	Cream, All Purpose	Inventory	t	f	f	\N		2017-03-01 14:15:08.894224	2017-03-01 14:15:08.894224
17	2	7	24	Cream, Whipping	Inventory	t	f	f	\N		2017-03-01 14:15:30.608266	2017-03-01 14:15:30.608266
18	2	5	24	Ice Cream, Cheese Cake	Inventory	t	f	f	\N		2017-03-01 14:16:14.258798	2017-03-01 14:16:14.258798
19	2	6	24	Milk, Fresh	Inventory	t	f	f	\N		2017-03-01 14:16:45.780334	2017-03-01 14:16:45.780334
20	2	11	25	Basil, Fresh	Inventory	t	f	f	\N		2017-03-01 14:17:22.342893	2017-03-01 14:17:22.342893
21	2	2	25	Cabbage	Inventory	t	f	f	\N		2017-03-01 14:17:49.868162	2017-03-01 14:17:49.868162
22	2	2	25	Carrots	Inventory	t	f	f	\N		2017-03-01 14:18:12.585609	2017-03-01 14:18:12.585609
23	2	11	25	Cilantro	Inventory	t	f	f	\N		2017-03-01 14:18:39.02342	2017-03-01 14:18:39.02342
24	2	2	25	Corn, Kernel	Inventory	t	f	f	\N		2017-03-01 14:19:18.991664	2017-03-01 14:19:18.991664
25	2	2	25	Fries, Crinkle Cut	Inventory	t	f	f	\N		2017-03-01 14:19:44.355985	2017-03-01 14:19:44.355985
26	2	2	25	Fries, Waffle Cut	Inventory	t	f	f	\N		2017-03-01 14:20:12.407148	2017-03-01 14:20:12.407148
27	2	2	25	Garlic, Fresh	Inventory	t	f	f	\N		2017-03-01 14:20:40.204755	2017-03-01 14:20:40.204755
28	2	11	25	Mint Leaves	Inventory	t	f	f	\N		2017-03-01 14:21:21.996542	2017-03-01 14:21:21.996542
29	2	8	25	Lemon, Fresh	Inventory	t	f	f	\N		2017-03-01 14:21:51.70757	2017-03-01 14:21:51.70757
30	2	8	25	Lime, Fresh	Inventory	t	f	f	\N		2017-03-01 14:22:12.63861	2017-03-01 14:22:12.63861
31	2	2	25	Lettuce, Iceberg	Inventory	t	f	f	\N		2017-03-01 14:22:38.810445	2017-03-01 14:22:38.810445
32	2	2	25	Onion, White	Inventory	t	f	f	\N		2017-03-01 14:23:06.286557	2017-03-01 14:23:06.286557
33	2	11	25	Parsley	Inventory	t	f	f	\N		2017-03-01 14:23:30.00997	2017-03-01 14:23:30.00997
34	2	2	25	Pepper, Green Bell	Inventory	t	f	f	\N		2017-03-01 14:24:03.180696	2017-03-01 14:24:03.180696
35	2	11	25	Pepper, Labuyo	Inventory	t	f	f	\N		2017-03-01 14:25:05.177178	2017-03-01 14:25:05.177178
36	2	2	25	Tomato, Roma	Inventory	t	f	f	\N		2017-03-01 14:25:31.96878	2017-03-01 14:25:31.96878
37	2	8	26	Base, Beef	Inventory	t	f	f	\N		2017-03-01 14:30:26.619959	2017-03-01 14:30:26.619959
38	2	6	26	Base, Texas Chili	Inventory	t	f	f	\N		2017-03-01 14:30:48.48907	2017-03-01 14:30:48.48907
39	2	2	26	Batter, Fry	Inventory	t	f	f	\N		2017-03-01 14:31:07.414965	2017-03-01 14:31:07.414965
40	2	2	26	Beans, Red Kidney	Inventory	t	f	f	\N		2017-03-01 14:31:28.476171	2017-03-01 14:31:28.476171
41	2	12	26	Blueberry Topping	Inventory	t	f	f	\N		2017-03-01 14:31:55.991557	2017-03-01 14:31:55.991557
42	2	8	26	Bread, Hotdog Bun	Inventory	t	f	f	\N		2017-03-01 14:33:00.903512	2017-03-01 14:33:00.903512
43	2	8	26	Bread, Loaf	Inventory	t	f	f	\N		2017-03-01 14:33:21.989472	2017-03-01 14:33:21.989472
44	2	8	26	Bread, Mini Burger Bun	Inventory	t	f	f	\N		2017-03-01 14:33:42.771859	2017-03-01 14:33:42.771859
45	2	12	26	Chipotle	Inventory	t	f	f	\N		2017-03-01 14:34:07.668505	2017-03-01 14:34:07.668505
46	2	2	26	Country Gravy Mix	Inventory	t	f	f	\N		2017-03-01 14:34:30.640624	2017-03-01 14:34:30.640624
47	2	2	26	Flour, Wing	Inventory	t	f	f	\N		2017-03-01 14:35:05.400386	2017-03-01 14:35:05.400386
48	2	11	26	Graham Crust	Inventory	t	f	f	\N		2017-03-01 14:36:38.624238	2017-03-01 14:36:38.624238
49	2	6	26	Honey	Inventory	t	f	f	\N		2017-03-01 14:36:56.565694	2017-03-01 14:36:56.565694
50	2	11	26	Jalapeno	Inventory	t	f	f	\N		2017-03-01 14:37:14.840693	2017-03-01 14:37:14.840693
51	2	11	26	Ketchup, Heinz	Inventory	t	f	f	\N		2017-03-01 14:37:41.065469	2017-03-01 14:37:41.065469
52	2	6	26	Liquid Smoke	Inventory	t	f	f	\N		2017-03-01 14:37:57.979749	2017-03-01 14:37:57.979749
53	2	5	26	Mayonnaise	Inventory	t	f	f	\N		2017-03-01 14:38:17.071389	2017-03-01 14:38:17.071389
54	2	12	26	Mustard, Yellow	Inventory	t	f	f	\N		2017-03-01 14:38:44.345329	2017-03-01 14:38:44.345329
55	2	12	26	Oil, Sesame	Inventory	t	f	f	\N		2017-03-01 14:39:11.074003	2017-03-01 14:39:11.074003
56	2	2	26	Oil, Shortening	Inventory	t	f	f	\N		2017-03-01 14:39:29.093789	2017-03-01 14:39:29.093789
57	2	6	26	Oil, Vegetable	Inventory	t	f	f	\N		2017-03-01 14:39:53.162504	2017-03-01 14:39:53.162504
58	2	11	26	Paste, Korean Pepper	Inventory	t	f	f	\N		2017-03-01 14:40:24.867352	2017-03-01 14:40:24.867352
59	2	11	26	Peanut, Roasted	Inventory	t	f	f	\N		2017-03-01 14:40:44.002115	2017-03-01 14:40:44.002115
60	2	11	26	Pickles, Relish	Inventory	t	f	f	\N		2017-03-01 14:41:17.558781	2017-03-01 14:41:17.558781
61	2	2	26	Rice	Inventory	t	f	f	\N		2017-03-01 14:41:33.547814	2017-03-01 14:41:33.547814
62	2	11	26	Salt, Iodized	Inventory	t	f	f	\N		2017-03-01 14:42:02.488355	2017-03-01 14:42:02.488355
63	2	6	26	Sauce, BBQ Chipotle	Inventory	t	f	f	\N		2017-03-01 14:42:32.411956	2017-03-01 14:42:32.411956
64	2	5	26	Sauce, BBQ Caramba	Inventory	t	f	f	\N		2017-03-01 14:42:56.0904	2017-03-01 14:42:56.0904
65	2	6	26	Sauce, BBQ Cayenne	Inventory	t	f	f	\N		2017-03-01 14:43:14.465018	2017-03-01 14:43:14.465018
66	2	6	26	Sauce, BBQ Honey (CRS)	Inventory	t	f	f	\N		2017-03-01 14:43:33.909344	2017-03-01 14:43:33.909344
67	2	5	26	Sauce, Premium Hot	Inventory	t	f	f	\N		2017-03-01 14:44:01.67583	2017-03-01 14:44:01.67583
68	2	5	26	Sauce, Homestyle BBQ	Inventory	t	f	f	\N		2017-03-01 14:44:21.618142	2017-03-01 14:44:21.618142
69	2	6	26	Sauce, New York's Finest	Inventory	t	f	f	\N		2017-03-01 14:44:43.775405	2017-03-01 14:44:43.775405
70	2	6	26	Sauce, Roasted Sesame	Inventory	t	f	f	\N		2017-03-01 14:45:13.112031	2017-03-01 14:45:13.112031
71	2	12	26	Sauce, Satay	Inventory	t	f	f	\N		2017-03-01 14:45:29.688664	2017-03-01 14:45:29.688664
72	2	6	26	Sauce, Soy	Inventory	t	f	f	\N		2017-03-01 14:46:00.569922	2017-03-01 14:46:00.569922
73	2	12	26	Sauce, Sriracha	Inventory	t	f	f	\N		2017-03-01 14:46:25.727948	2017-03-01 14:46:25.727948
74	2	12	26	Sauce, Sweet Chili	Inventory	t	f	f	\N		2017-03-01 14:46:46.658485	2017-03-01 14:46:46.658485
75	2	9	26	Sauce, Tabasco	Inventory	t	f	f	\N		2017-03-01 14:47:07.633424	2017-03-01 14:47:07.633424
76	2	4	26	Sauce, Tomato	Inventory	t	f	f	\N		2017-03-01 14:47:36.343827	2017-03-01 14:47:36.343827
77	2	9	26	Sauce, Wingsanity	Inventory	t	f	f	\N		2017-03-01 14:47:59.920443	2017-03-01 14:47:59.920443
78	2	2	26	Seasoning, Bacon	Inventory	t	f	f	\N		2017-03-01 14:48:18.991938	2017-03-01 14:48:18.991938
79	2	2	26	Seasoning, House Rub	Inventory	t	f	f	\N		2017-03-01 14:48:37.568813	2017-03-01 14:48:37.568813
80	2	2	26	Seasoning, Texas	Inventory	t	f	f	\N		2017-03-01 14:48:55.016981	2017-03-01 14:48:55.016981
81	2	11	26	Spice, Bayleaf	Inventory	t	f	f	\N		2017-03-01 14:50:30.319222	2017-03-01 14:50:30.319222
82	2	11	26	Spice, Cayenne	Inventory	t	f	f	\N		2017-03-01 14:50:46.894097	2017-03-01 14:50:46.894097
83	2	11	26	Spice, Cumin	Inventory	t	f	f	\N		2017-03-01 14:51:09.442277	2017-03-01 14:51:09.442277
84	2	11	26	Spice, Curry Powder	Inventory	t	f	f	\N		2017-03-01 14:52:38.115302	2017-03-01 14:52:38.115302
88	2	11	26	Spice, Onion Powder	Inventory	t	f	f	\N		2017-03-01 14:54:08.712489	2017-03-01 14:54:08.712489
96	2	4	26	Vinegar, Red Cane	Inventory	t	f	f	\N		2017-03-01 15:06:50.461853	2017-03-01 15:06:50.461853
97	2	9	28	Iced Tea Concentrate	Inventory	t	f	f	\N		2017-03-01 15:07:21.302325	2017-03-01 15:07:21.302325
98	2	9	29	Bottled Water	Inventory	t	f	f	\N		2017-03-01 15:07:46.7711	2017-03-01 15:07:46.7711
85	2	11	26	Spice, Crushed Red Pepper	Inventory	t	f	f	\N		2017-03-01 14:53:13.72062	2017-03-01 14:53:13.72062
86	2	11	26	Spice, Garlic Granulated	Inventory	t	f	f	\N		2017-03-01 14:53:33.765299	2017-03-01 14:53:33.765299
91	2	11	26	Spice, Smoked Paprika	Inventory	t	f	f	\N		2017-03-01 14:55:29.444114	2017-03-01 14:55:29.444114
92	2	2	26	Sugar, Brown	Inventory	t	f	f	\N		2017-03-01 15:05:20.120728	2017-03-01 15:05:20.120728
100	2	9	30	Brew Kettle	Inventory	t	f	f	\N		2017-03-01 15:17:18.391842	2017-03-01 15:17:18.391842
102	2	14	31	Heineken Keg	Inventory	t	f	f	\N		2017-03-01 15:27:20.766833	2017-03-01 15:27:20.766833
103	2	9	30	San Mig Light	Inventory	t	f	f	\N		2017-03-01 15:27:46.307803	2017-03-01 15:27:46.307803
104	2	9	30	San Mig Pale Pilsen	Inventory	t	f	f	\N		2017-03-01 15:28:15.094737	2017-03-01 15:28:15.094737
87	2	11	26	Spice, Ginger Powder	Inventory	t	f	f	\N		2017-03-01 14:53:52.122411	2017-03-01 14:53:52.122411
89	2	11	26	Spice, Pepper Fine Black	Inventory	t	f	f	\N		2017-03-01 14:54:27.524851	2017-03-01 14:54:27.524851
90	2	11	26	Spice, Pepper Grind Peppermill	Inventory	t	f	f	\N		2017-03-01 14:54:46.953732	2017-03-01 14:54:46.953732
93	2	2	26	Sugar, White	Inventory	t	f	f	\N		2017-03-01 15:05:45.438654	2017-03-01 15:05:45.438654
94	2	2	26	Tortilla Chips	Inventory	t	f	f	\N		2017-03-01 15:06:06.713822	2017-03-01 15:06:06.713822
95	2	8	26	Tortilla Flour 10"	Inventory	t	f	f	\N		2017-03-01 15:06:30.627453	2017-03-01 15:06:30.627453
99	2	7	27	Soda In Can	Inventory	t	f	f	\N		2017-03-01 15:08:10.433585	2017-03-01 15:08:10.433585
101	2	9	31	Heineken Bottle	Inventory	t	f	f	\N		2017-03-01 15:22:29.755824	2017-03-01 15:22:29.755824
105	2	9	31	Hoegarden	Inventory	t	f	f	\N		2017-03-01 15:28:51.448067	2017-03-01 15:28:51.448067
106	2	9	31	Stella Artois	Inventory	t	f	f	\N		2017-03-01 15:29:16.627497	2017-03-01 15:29:16.627497
107	2	12	32	Calamansi Concentrate	Inventory	t	f	f	\N		2017-03-01 15:32:38.475114	2017-03-01 15:32:38.475114
108	2	12	32	Dalandan Concentrate	Inventory	t	f	f	\N		2017-03-01 15:33:32.312661	2017-03-01 15:33:32.312661
109	2	12	32	Lime Juice, Island Mixer	Inventory	t	f	f	\N		2017-03-01 15:34:03.175908	2017-03-01 15:34:03.175908
110	2	12	32	Mojito Mint, Monin	Inventory	t	f	f	\N		2017-03-01 15:34:32.958421	2017-03-01 15:34:32.958421
111	2	12	32	Rhum, Bacardi Gold	Inventory	t	f	f	\N		2017-03-01 15:34:59.074951	2017-03-01 15:34:59.074951
112	2	12	32	Rhum, Tanduay White	Inventory	t	f	f	\N		2017-03-01 15:35:23.555854	2017-03-01 15:35:23.555854
113	2	12	32	Tequila, El Hombre	Inventory	t	f	f	\N		2017-03-01 15:35:47.761458	2017-03-01 15:35:47.761458
114	2	12	32	Tequila, Jose Cuervo	Inventory	t	f	f	\N		2017-03-01 15:36:10.62455	2017-03-01 15:36:10.62455
115	2	12	32	Triple Sec	Inventory	t	f	f	\N		2017-03-01 15:36:32.265697	2017-03-01 15:36:32.265697
116	2	12	32	Whiskey, Jack Daniel's	Inventory	t	f	f	\N		2017-03-01 15:37:08.910283	2017-03-01 15:37:08.910283
117	2	12	32	Whiskey, Jhonnie Walker Black Label	Inventory	t	f	f	\N		2017-03-01 15:37:51.857073	2017-03-01 15:37:51.857073
118	2	12	32	Vodka, Absolut Blue	Inventory	t	f	f	\N		2017-03-01 15:38:25.402136	2017-03-01 15:38:25.402136
119	2	12	32	Vodka, Absolut Kurant	Inventory	t	f	f	\N		2017-03-01 15:39:06.19749	2017-03-01 15:39:06.19749
120	2	7	32	Schweppes	Inventory	t	f	f	\N		2017-03-01 15:39:43.555206	2017-03-01 15:39:43.555206
121	2	8	33	Restaurant Supplies	Non-Inventory	t	f	f	\N		2017-03-01 15:40:09.390154	2017-03-01 15:40:09.390154
122	2	8	33	Cleaning Supplies	Non-Inventory	t	f	f	\N		2017-03-01 15:40:39.073432	2017-03-01 15:40:39.073432
123	2	8	33	Office Supplies	Non-Inventory	t	f	f	\N		2017-03-01 15:41:20.937284	2017-03-01 15:41:20.937284
124	2	8	33	Ice & Refrigeration	Non-Inventory	t	f	f	\N		2017-03-01 15:41:45.970121	2017-03-01 15:41:45.970121
125	2	8	34	Gas Expense	Non-Inventory	t	f	f	\N		2017-03-01 15:42:30.003319	2017-03-01 15:42:30.003319
126	2	8	34	Water & Sewer Expense	Inventory	t	f	f	\N		2017-03-01 15:42:55.929539	2017-03-01 15:42:55.929539
127	2	8	34	Electric Expense	Non-Inventory	t	f	f	\N		2017-03-01 15:43:20.33412	2017-03-01 15:43:20.33412
128	2	8	35	Recruitment & Training	Non-Inventory	t	f	f	\N		2017-03-01 15:44:05.185759	2017-03-01 15:44:05.185759
129	2	8	35	Repairs & Maintenance	Non-Inventory	t	f	f	\N		2017-03-01 15:44:28.431192	2017-03-01 15:44:28.431192
130	2	8	35	Other Direct Operating	Non-Inventory	t	f	f	\N		2017-03-01 15:45:16.216116	2017-03-01 15:45:16.216116
131	2	8	35	Business Travel	Non-Inventory	t	f	f	\N		2017-03-01 15:45:36.90145	2017-03-01 15:45:36.90145
132	2	8	35	Uniform Expense	Non-Inventory	t	f	f	\N		2017-03-01 15:45:59.083894	2017-03-01 15:45:59.083894
133	2	8	35	Telephone Expense	Non-Inventory	t	f	f	\N		2017-03-01 15:46:18.701596	2017-03-01 15:46:18.701596
134	2	8	39	Marketing Expense	Non-Inventory	t	f	f	\N		2017-03-01 15:46:56.443658	2017-03-01 15:46:56.443658
135	2	8	36	Base Rent	Non-Inventory	t	f	f	\N		2017-03-01 15:47:14.609275	2017-03-01 15:47:14.609275
136	2	8	36	Common Area Charges	Non-Inventory	t	f	f	\N		2017-03-01 15:47:37.951883	2017-03-01 15:47:37.951883
137	2	8	41	Employee Meal	Non-Inventory	t	f	f	\N		2017-03-08 06:44:19.428488	2017-03-08 06:44:19.428488
138	2	2	26	Cheetos, Cheddar	Inventory	t	f	f	\N	11992	2017-08-15 05:20:47.063294	2017-08-15 05:20:47.063294
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('items_id_seq', 138, true);


--
-- Data for Name: labor_hours; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY labor_hours (id, employee_id, created_at, updated_at) FROM stdin;
1	1	2016-04-20 08:04:02.256241	2016-04-20 08:04:02.256241
2	2	2017-07-11 06:02:49.034754	2017-07-11 06:02:49.034754
\.


--
-- Data for Name: labor_hours_entries; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY labor_hours_entries (id, labor_hour_id, working_date, branch_id, regular, overtime, night_differential, legal_holiday, special_holiday, absent, late, rest_day, created_at, updated_at) FROM stdin;
1	1	\N	\N	2.0	23.0	1.0	1.0	2.0	21.0	123.0	2.0	2016-04-20 08:04:02.26009	2016-04-20 08:04:02.26009
2	2	\N	\N	8.0	\N	\N	\N	\N	0.25	\N	\N	2017-07-11 06:02:49.064461	2017-07-11 06:02:49.064461
\.


--
-- Name: labor_hours_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('labor_hours_entries_id_seq', 2, true);


--
-- Name: labor_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('labor_hours_id_seq', 2, true);


--
-- Data for Name: manifolds; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY manifolds (id, client_id, name, description, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: manifolds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('manifolds_id_seq', 1, false);


--
-- Data for Name: order_lists; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY order_lists (id, po_date, po_number, terms, remarks, supplier_id, created_at, updated_at, status, pr_number, pr_date) FROM stdin;
3	2017-09-08 00:00:00	BWNT-PO-0000003	\N	\N	8	2017-08-09 02:31:21.31762	2017-08-09 02:31:21.31762	\N	\N	\N
5	\N	BWNT-PO-0000005	\N	\N	11	2017-08-15 06:43:55.17892	2017-08-15 06:43:55.17892	\N	\N	\N
6	\N	BWNT-PO-0000006	\N	\N	11	2017-08-17 05:50:03.877805	2017-08-17 05:50:03.877805	\N	\N	\N
1	2017-08-08 00:00:00	BWNT-PO-0000002	\N	\N	5	2017-08-08 15:04:58.426744	2017-08-25 03:06:39.148975	Notified	\N	\N
2	2017-08-08 00:00:00	BWNT-PO-0000002	\N	\N	5	2017-08-08 15:05:55.617032	2017-08-25 03:06:43.256064	Notified	\N	\N
4	2017-10-08 00:00:00	BWNT-PO-0000004	\N	\N	6	2017-08-10 02:51:55.758577	2017-08-25 03:06:46.590141	Notified	\N	\N
\.


--
-- Name: order_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('order_lists_id_seq', 6, true);


--
-- Data for Name: order_per_suppliers; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY order_per_suppliers (id, supplier_id, item_id, price_selected, branch_id, quantity, unit, remarks, created_at, updated_at, order_list_id) FROM stdin;
1	\N	47	\N	\N	40	Pack		2017-08-09 02:30:43.014499	2017-08-09 02:30:43.014499	1
2	\N	47	\N	\N	40	Pack		2017-08-09 02:30:58.415712	2017-08-09 02:30:58.415712	1
\.


--
-- Name: order_per_suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('order_per_suppliers_id_seq', 2, true);


--
-- Data for Name: payment_notifications; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY payment_notifications (id, params, transaction_type, status, transaction_id, subscription_id, created_at, updated_at) FROM stdin;
1	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 07, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:07:25 Mar 06, 2017 PST|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A8il9T27k9Fnji5K9b..zN544zP0AHyp-fxNSvjAIhGonkIx2SRiGvVm|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4XX51094HW774854R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=53e03f34c8c60|controller=payment_notifications|action=create	recurring_payment	Completed	4XX51094HW774854R	10	2017-03-07 10:22:52.263477	2017-03-07 10:22:52.263477
2	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 08, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:54:44 Mar 07, 2017 PST|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ai.5bQT0IEOAwZz0G2AWlZ32DvJdA4T06-pa6LRLyBJJPSyynd9KIBb8|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4EE585609G7048743|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=e1939843de52b|controller=payment_notifications|action=create	recurring_payment	Completed	4EE585609G7048743	10	2017-03-09 15:55:14.037835	2017-03-09 15:55:14.037835
3	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 08, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:56:39 Mar 07, 2017 PST|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AxY4PZnLwHn-wCsVYatnHp9kp4-PAXmWZcsi4D6gtSpIqcp3Mr3f8I7C|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5YB494474N941852L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=6fea27af3f3e3|controller=payment_notifications|action=create	recurring_payment	Completed	5YB494474N941852L	11	2017-03-09 15:55:14.905684	2017-03-09 15:55:14.905684
4	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 09, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:19:31 Mar 08, 2017 PST|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ApezEAS9iX7yeBpWCcLIPeWxnc6YAPIbzOt8i2z9jDTdtIBKmMjMNoWa|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=70B93961V7753332K|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=a0827abfc1a70|controller=payment_notifications|action=create	recurring_payment	Completed	70B93961V7753332K	10	2017-03-09 16:35:30.586218	2017-03-09 16:35:30.586218
5	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 09, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=02:34:23 Mar 08, 2017 PST|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AAh-gjn1ENnDuooduWNAFaW4Pdn0Aw3aZ0GYGg6pDGL4qR1UNueIFs48|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=65T14400L9089101H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=6fea27af3f3e3|controller=payment_notifications|action=create	recurring_payment	Completed	65T14400L9089101H	11	2017-03-09 17:08:22.423913	2017-03-09 17:08:22.423913
6	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 10, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:04:30 Mar 09, 2017 PST|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Az-7lYaCY5RXQ2BJcd7C3M0cHeqTA2qyhw3aDPrixMf81fNbC4ZHdcwR|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=27A94040RE802672G|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=4320b4a828a|controller=payment_notifications|action=create	recurring_payment	Completed	27A94040RE802672G	10	2017-03-09 18:36:40.084315	2017-03-09 18:36:40.084315
7	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 07, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=02:41:41 Mar 06, 2017 PST|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A2IIkvl7SnmpoaFJ-CPJ2hYqF27CAFXDf8NJeMjYR9yJvVpEEw7boRg6|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5634885357120592C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=5ea091f64aa29|controller=payment_notifications|action=create	recurring_payment	Completed	5634885357120592C	11	2017-03-09 20:49:03.459122	2017-03-09 20:49:03.459122
8	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 11, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:22:55 Mar 10, 2017 PST|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AxjHQLqJRMYK7vZO4T7aExY5Zf2mAlG9UGJ6Eqr1scy6KnYDkztEC7x4|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=315262499G8450012|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=a3c6e0625938|controller=payment_notifications|action=create	recurring_payment	Completed	315262499G8450012	10	2017-03-10 17:59:14.012673	2017-03-10 17:59:14.012673
12	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:38:48 Mar 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AXikpeG7zOGhVthM9Hx1rQTDJwJtAyAn84tFwvIW84Qcd5fatVBBp9mp|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2MB54892P47769704|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=89f5997f587ba|controller=payment_notifications|action=create	recurring_payment	Completed	2MB54892P47769704	11	2017-03-12 11:41:04.156456	2017-03-12 11:41:04.156456
14	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 14, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:43:52 Mar 13, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A2DHUUJFfLoDqJhvAeCSzJ84PombA4TWsf2mNJaBy5Jwii4mDwWywAmF|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5FS82240W49415408|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=67f6a46786872|controller=payment_notifications|action=create	recurring_payment	Completed	5FS82240W49415408	11	2017-03-13 14:11:04.693841	2017-03-13 14:11:04.693841
9	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=02:00:00 Mar 11, 2017 PST|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:26:55 Mar 10, 2017 PST|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AfL8JAkvK-PP8ASnAhGskamGi9c3A7Lq7dbJCV8rIgSGppi-AzkzmVdy|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0F217921YC711543B|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=c0a7f4c5b1229|controller=payment_notifications|action=create	recurring_payment	Completed	0F217921YC711543B	11	2017-03-10 18:52:33.632253	2017-03-10 18:52:33.632253
10	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:31:05 Mar 11, 2017 PST|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ax3FERumcKOmzhaNDpJ0-BjxLwGWAeirTLX0cmpGzf48OOyMbM9EO.PY|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3VS38502TD920774A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=2fcf6a5a55bdb|controller=payment_notifications|action=create	recurring_payment	Completed	3VS38502TD920774A	11	2017-03-11 15:03:39.881684	2017-03-11 15:03:39.881684
11	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:31:43 Mar 11, 2017 PST|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AUhHxxoHVJnXwS-zk7UF5Hg9I.HIA3Ml6z37.NNo1Lo6IWI5YLSovw4p|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4HN57160L58308314|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=69a593ccda5db|controller=payment_notifications|action=create	recurring_payment	Completed	4HN57160L58308314	10	2017-03-11 15:03:39.97994	2017-03-11 15:03:39.97994
13	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:39:26 Mar 12, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Aelt24aVzueoyfmCq8hXoGefzBxsA0Iq0kx.NDMgAEYTCgVtHPS-exQq|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=0BS511978D737183V|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=227e2b43ea19a|controller=payment_notifications|action=create	recurring_payment	Completed	0BS511978D737183V	10	2017-03-12 11:41:33.190685	2017-03-12 11:41:33.190685
15	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 14, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:44:22 Mar 13, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ADAlj7qDik1WwaWXS17hYRxoWM2yA89OWtVQ1HDRNwYjanPsC-HYEVW0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=2S001553NW3055430|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=72572121e5cb|controller=payment_notifications|action=create	recurring_payment	Completed	2S001553NW3055430	10	2017-03-13 14:16:50.295402	2017-03-13 14:16:50.295402
16	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:25:37 Mar 14, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A8PiOurJ1pfGWJsUernojno.idsRAZ1qEeFnceYaYn5hh1e2ibJ8GXEJ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8YR70370TV741392H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=63b3c24784f24|controller=payment_notifications|action=create	recurring_payment	Completed	8YR70370TV741392H	11	2017-03-14 12:31:49.790961	2017-03-14 12:31:49.790961
17	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:26:28 Mar 14, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AwCSHNkP-2F9DbL6QGkrgMEPm2vRAt8hU4gvUtGrW3scLqA4jBrZVC0B|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=41472457867844017|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=2c8a2376a1f83|controller=payment_notifications|action=create	recurring_payment	Completed	41472457867844017	10	2017-03-14 12:34:05.903061	2017-03-14 12:34:05.903061
18	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 16, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:16:22 Mar 15, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AgePMPfbDDc05TM5uouG2O9s9U74AB7TYyMslAQ-WxM27RXGyFlzW7D.|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=21D818576C9157032|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=38dc1fa8a89ca|controller=payment_notifications|action=create	recurring_payment	Completed	21D818576C9157032	11	2017-03-15 18:18:29.455034	2017-03-15 18:18:29.455034
19	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 16, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:17:20 Mar 15, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AXbHfyOhp.g26Kv5HlJEYOBllEYOAjf0SUZ.ka9DZh9mi2GJs2RjeHO1|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=60971981M76901826|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=c4c18a9df384a|controller=payment_notifications|action=create	recurring_payment	Completed	60971981M76901826	10	2017-03-15 18:19:31.090686	2017-03-15 18:19:31.090686
20	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:05:00 Mar 16, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ARyNDMbKwa-zLx7AtfPa-etrhyTVA0nAzTNJZrOKyyTe91ZsVAmtIdYY|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0KJ2602797380661H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=38dc1fa8a89ca|controller=payment_notifications|action=create	recurring_payment	Completed	0KJ2602797380661H	11	2017-03-16 10:08:14.624168	2017-03-16 10:08:14.624168
21	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:39:09 Mar 16, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A--8MSCLabuvN8L.-MHjxC9uypBtAZpCuLISaOjSi5imTp065CFS8ieT|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=3XH34851LR2250815|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=90d889ac48449|controller=payment_notifications|action=create	recurring_payment	Completed	3XH34851LR2250815	10	2017-03-16 18:42:10.104368	2017-03-16 18:42:10.104368
22	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:02:16 Mar 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AAJ8sHGjPsxLjCwiCHRzFxwimkULABX8jTSkm5jQkWaHGN6fKPmcwo-z|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5RS42308YU773714A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=49150579629c4|controller=payment_notifications|action=create	recurring_payment	Completed	5RS42308YU773714A	11	2017-03-18 11:57:13.299525	2017-03-18 11:57:13.299525
23	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:15:55 Mar 18, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AqYbpTrBnVmRxqI0yTqRFW3k.p.ZAiry381EQdIYqp81PULksTt0mxS-|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0L4181412H807124K|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e5cf63ee77acd|controller=payment_notifications|action=create	recurring_payment	Completed	0L4181412H807124K	11	2017-03-20 05:46:59.851804	2017-03-20 05:46:59.851804
29	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:18:04 Mar 20, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A0KTMB4-ZjjK-X-NYRBS6h0mNzW.Ao137cxWKIsjwYVyuaJciFefI2WW|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1KT61747GB655805B|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=ef666d9b53750|controller=payment_notifications|action=create	recurring_payment	Completed	1KT61747GB655805B	11	2017-03-20 15:45:47.493911	2017-03-20 15:45:47.493911
32	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:04:44 Mar 22, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AxUtUIbXh2XxFDGQChkLNYdprLpWA4yxpAck5E7-ouxghPhrUF5geATQ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=94A46840NC2079439|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=ceb9cef1717a9|controller=payment_notifications|action=create	recurring_payment	Completed	94A46840NC2079439	10	2017-03-22 12:12:38.029643	2017-03-22 12:12:38.029643
42	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 28, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=09:04:53 Mar 27, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ARyNDMbKwa-zLx7AtfPa-etrhyTVAo.cBiLVLzlLIEYyF5l8mI0b6Rfz|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6BG78208GL2240024|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=7a9f326a8aed|controller=payment_notifications|action=create	recurring_payment	Completed	6BG78208GL2240024	11	2017-03-27 18:37:45.767389	2017-03-27 18:37:45.767389
43	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 28, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=09:02:19 Mar 27, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A9LC3Qajo-H2V8mPq4eIktgPvG2RAj1Wb8RtAWbmccRJxpB-89VzpB20|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4PH32258D50814520|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=d44fdfb483643|controller=payment_notifications|action=create	recurring_payment	Completed	4PH32258D50814520	10	2017-03-27 18:53:58.349356	2017-03-27 18:53:58.349356
45	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 29, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:47:58 Mar 28, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A--8MSCLabuvN8L.-MHjxC9uypBtAnQOH.Wa8k9T1ycTBnpaUpetffy4|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=98099090CG688813H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e97fce2623477|controller=payment_notifications|action=create	recurring_payment	Completed	98099090CG688813H	11	2017-03-28 14:50:22.448067	2017-03-28 14:50:22.448067
24	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:13:55 Mar 19, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ao2KSflmyz9CFvOfJsmi7mqa2XGOAe8gKvPlNefMFZqKgruLX5aDMxKe|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2P797260DL550340F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e5cf63ee77acd|controller=payment_notifications|action=create	recurring_payment	Completed	2P797260DL550340F	11	2017-03-20 05:49:24.665679	2017-03-20 05:49:24.665679
31	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:16:21 Mar 21, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AOhv37Ek6itTAOUbJIggFaAfJtpYAZ8NZ6Q8h6Oka7l5GRkR9G0vJFjm|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=7CN13642BF7653408|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=ceb9cef1717a9|controller=payment_notifications|action=create	recurring_payment	Completed	7CN13642BF7653408	10	2017-03-21 13:19:16.565264	2017-03-21 13:19:16.565264
25	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:54:17 Mar 19, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Aaw-Fd69z.JLuiq13ejMN-CsSMuuAbknzpKCSMFwqdox9R9SdX40XAuw|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=67J96093H15275150|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=62c086aca5983|controller=payment_notifications|action=create	recurring_payment	Completed	67J96093H15275150	10	2017-03-20 05:50:47.932905	2017-03-20 05:50:47.932905
26	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:16:27 Mar 18, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AAt6oC33W1VsnoAwyub6beDvH8gmAgiGCSuCFGA5YOSjufNZSCZe7hPy|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=22T61140N7281412X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=d41394a22133|controller=payment_notifications|action=create	recurring_payment	Completed	22T61140N7281412X	10	2017-03-20 06:04:20.736126	2017-03-20 06:04:20.736126
27	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:58:26 Mar 17, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AUmv9J3knY3wGGZoAYL5LM.8OzizAiaKqA9opxz86x9QTNYBQQlnn2Sg|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=46E86760MG082671F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=1655e678f1c17|controller=payment_notifications|action=create	recurring_payment	Completed	46E86760MG082671F	10	2017-03-20 07:40:31.550928	2017-03-20 07:40:31.550928
28	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:15:48 Mar 20, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ANjcFFL6thfg3pfU8XyZ4HGhsY0wAyKKalNNDQ3Or8dCUnoIkXXpqhkU|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=95E35009P59814608|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=3c771b05c8c11|controller=payment_notifications|action=create	recurring_payment	Completed	95E35009P59814608	10	2017-03-20 14:45:13.932703	2017-03-20 14:45:13.932703
30	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:03:49 Mar 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A21kmBLyRcQpDSjYvmswlm3ckjahAI0tZB1er5Joi6WIfJGKsu4.R-0Q|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4YJ014872J954300R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=ef666d9b53750|controller=payment_notifications|action=create	recurring_payment	Completed	4YJ014872J954300R	11	2017-03-21 10:06:17.294607	2017-03-21 10:06:17.294607
33	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:20:24 Mar 22, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AASzyL5CrabrvXMpM6GA4eeXaiKXA2nzd-wP8A3eDOGV51INEfVoJqvH|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7KE52659V90912307|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=30efd9fb2bb7f|controller=payment_notifications|action=create	recurring_payment	Completed	7KE52659V90912307	11	2017-03-22 12:32:42.193178	2017-03-22 12:32:42.193178
34	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:05:25 Mar 23, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ArFZ5DF1pEd4euI2jpvbEwe5Q4BiA9CqmZmONyj9tjsF7xwn9p2TC-5f|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=47T77703L09009335|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=ceb9cef1717a9|controller=payment_notifications|action=create	recurring_payment	Completed	47T77703L09009335	10	2017-03-23 10:08:31.500005	2017-03-23 10:08:31.500005
35	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:40:28 Mar 23, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A7Xq.m5SGYwRpSL9NqOlxN6DHXvxAgzLW2phcK.PRy0QiPbzJcNuL8Ba|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5VH9850585007351N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=7c9c164b55f10|controller=payment_notifications|action=create	recurring_payment	Completed	5VH9850585007351N	11	2017-03-23 12:52:11.871861	2017-03-23 12:52:11.871861
36	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:16:11 Mar 24, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AGrQ4O-ktk7juq90QNZTDZ0rFCx2ArTPYwso.xp81y9c-UfYagmyeS-h|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=9XF54752LE677664S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=ceb9cef1717a9|controller=payment_notifications|action=create	recurring_payment	Completed	9XF54752LE677664S	10	2017-03-24 10:19:32.422766	2017-03-24 10:19:32.422766
38	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 26, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:22:18 Mar 25, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ACUe-E7Hjxmeel8FjYAtjnx-yjHAAtIg0ChIn16OKh.gD41IQ1GGeCFZ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=9UE789726X948411F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=4c254477800aa|controller=payment_notifications|action=create	recurring_payment	Completed	9UE789726X948411F	10	2017-03-25 15:57:57.520489	2017-03-25 15:57:57.520489
40	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:44:52 Mar 26, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=At-lD.ebJxipTWa3Fr92PQtDSOt8AkKASP4oTaxZJl5R-k61WQIpTCnE|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0LN54449BC319632X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=aa3a7e52dc185|controller=payment_notifications|action=create	recurring_payment	Completed	0LN54449BC319632X	11	2017-03-26 11:47:21.424276	2017-03-26 11:47:21.424276
44	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 29, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:23:38 Mar 28, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AKlnBHE8Tz.g91g.bJgogv1Wqso7Az19iByC3OEsnNtc8kQVfM9tv3tL|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=45T68324WK587430F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=d44fdfb483643|controller=payment_notifications|action=create	recurring_payment	Completed	45T68324WK587430F	10	2017-03-28 10:26:51.635755	2017-03-28 10:26:51.635755
37	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:07:40 Mar 24, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AgXsP2MAb7ZqE92Q72NeN-mMl2ASAwS5beDUwXjRRyQzk-Q.Luk5rPMs|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3HV94072E0551973N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=f5ae4fd53e72|controller=payment_notifications|action=create	recurring_payment	Completed	3HV94072E0551973N	11	2017-03-24 13:10:01.711446	2017-03-24 13:10:01.711446
39	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 26, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:13:47 Mar 25, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AUaxvSojqajxsiGA9qXfGuCulUctABtVe3pFQiEjx4plNUQ3saWBAdWM|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9A8086207T475142A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=f5ae4fd53e72|controller=payment_notifications|action=create	recurring_payment	Completed	9A8086207T475142A	11	2017-03-25 16:00:33.593606	2017-03-25 16:00:33.593606
41	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:50:25 Mar 26, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AS.sXmO3SZlbZsuBgmx57wrfjxyDAGKoXafYHZ77rBF7zQiVpn5kuaQ.|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=1YJ8859786736870C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=ab3215efc9a94|controller=payment_notifications|action=create	recurring_payment	Completed	1YJ8859786736870C	10	2017-03-26 11:53:22.820395	2017-03-26 11:53:22.820395
47	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 30, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:14:55 Mar 29, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AJNnakzp-aNWqieqcqrOPGN1SgpBAfBEd0iVSfW5UKz7u2yNemeLXkFJ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4MB53739JL761391J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=56cbe2a60870|controller=payment_notifications|action=create	recurring_payment	Completed	4MB53739JL761391J	10	2017-03-29 12:17:22.773675	2017-03-29 12:17:22.773675
46	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 30, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:27:59 Mar 29, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AEpkQeo.7CeU2vMwvJUpaJz5A5pwASFckr-MeESZXHQjrGW7PwNBau1C|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=12E73656L1092324N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e97fce2623477|controller=payment_notifications|action=create	recurring_payment	Completed	12E73656L1092324N	11	2017-03-29 11:30:28.230359	2017-03-29 11:30:28.230359
48	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 31, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:55:43 Mar 30, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A43nh2bZKIS-rPO52.dhOvFRo0JAA08XXeo2vlK5-1H8JtbTjVcXlib-|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7CA07684NM8640815|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=7d8968e88b6fd|controller=payment_notifications|action=create	recurring_payment	Completed	7CA07684NM8640815	11	2017-03-30 12:58:27.905942	2017-03-30 12:58:27.905942
49	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Mar 31, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:02:40 Mar 30, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AYMCg84yQGrlmqXkTdz1CHxkHlnlA0C7g3GWTQsGvpBoR1ylB0JKQQ1g|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=3JP57080T9110690H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=114c849ab8b79|controller=payment_notifications|action=create	recurring_payment	Completed	3JP57080T9110690H	10	2017-03-30 13:05:26.845331	2017-03-30 13:05:26.845331
51	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 04, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:29:05 Apr 03, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AKny1HbvGZphOTewPOlgTzhYi9GiAUJSoafugneRvS9HUtTi7sq5Ln04|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4P8439886H550323Y|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=17725d7d8cb7|controller=payment_notifications|action=create	recurring_payment	Completed	4P8439886H550323Y	10	2017-04-04 07:45:56.918213	2017-04-04 07:45:56.918213
50	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 02, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:29:08 Apr 01, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AkcuK0s9bpo9BQaWJeI47y51PNUyA-9eALVu9ye8OdCUiifYVIAE2Yy7|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=56L83832FN2405458|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=c3a73866f235|controller=payment_notifications|action=create	recurring_payment	Completed	56L83832FN2405458	10	2017-04-04 07:10:42.488617	2017-04-04 07:10:42.488617
52	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 01, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:48:32 Mar 31, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AFd.erwt7VoeoUMr85yut0RloHozAZDu6BLwrLYB4sAmGXaIkLxrVfTp|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4RJ697058L5583813|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=3f8db66ec612b|controller=payment_notifications|action=create	recurring_payment	Completed	4RJ697058L5583813	11	2017-04-04 08:07:57.658532	2017-04-04 08:07:57.658532
53	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 02, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:45:50 Apr 01, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AOdZvun5.QttWoS6t6vDMXAH9XRhAd5oUgPt.PkCylOQZLYJzEfTKooG|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5P6378765A0442301|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=18399ee94de3c|controller=payment_notifications|action=create	recurring_payment	Completed	5P6378765A0442301	11	2017-04-04 08:13:49.89642	2017-04-04 08:13:49.89642
54	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 01, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:51:46 Mar 31, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A9A0gZTWcGyirG.qnLuzNtP0Yj-IAF53sagAFkrilos5--aJTHYtHX75|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=7K356859HY0765218|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=c3a73866f235|controller=payment_notifications|action=create	recurring_payment	Completed	7K356859HY0765218	10	2017-04-04 08:44:39.728592	2017-04-04 08:44:39.728592
55	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 04, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:28:14 Apr 03, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AA24pxGod.zZmeVkZZBZLqTKHTFqA6TJRz8Nd18W7NukgbspDyHeVBQV|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=42612856R0937703U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=81907be96b9f1|controller=payment_notifications|action=create	recurring_payment	Completed	42612856R0937703U	11	2017-04-04 08:55:49.294063	2017-04-04 08:55:49.294063
56	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 03, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:12:12 Apr 02, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AEPisTkyRVDN-DgDcwFo3PX0vGhVAW2.ND56l3taX6CwbC1u4vndCpvk|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6G285248E8671452A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=18399ee94de3c|controller=payment_notifications|action=create	recurring_payment	Completed	6G285248E8671452A	11	2017-04-04 09:32:06.958772	2017-04-04 09:32:06.958772
57	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:08:48 Apr 04, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=APvissTSNYxEsF2tvyvfCnTn10fsAme2IRgIDPiWEpVlXEC9pRl9An.K|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=71B97096V00754109|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=3a633705ceb7b|controller=payment_notifications|action=create	recurring_payment	Completed	71B97096V00754109	12	2017-04-04 15:00:33.037141	2017-04-04 15:00:33.037141
58	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:12:21 Apr 04, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A-6xki9zSqhzaT35SN1MdGgLf6S-AImMOYYFO14ZM8vz9-uendUm1png|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=32J21426PY409131A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=42dc11ab1937f|controller=payment_notifications|action=create	recurring_payment	Completed	32J21426PY409131A	10	2017-04-04 16:27:19.322265	2017-04-04 16:27:19.322265
59	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:14:20 Apr 04, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ASyS9flVHpw.TVh9qeZ5ZvDRSbV4AXU.THieH2JRiB9avdT6NQEm4pFu|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=567674389U0870006|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=6ce7aaec262|controller=payment_notifications|action=create	recurring_payment	Completed	567674389U0870006	11	2017-04-04 17:10:24.271691	2017-04-04 17:10:24.271691
60	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 06, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:07:52 Apr 05, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AYDz3VVi23rWDCvyhP.w27AHO-M8A3au7-CF.seqfelqqOAoOfzphxSB|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=03937632VS583142U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=9741ae5453cb6|controller=payment_notifications|action=create	recurring_payment	Completed	03937632VS583142U	12	2017-04-05 15:06:56.583234	2017-04-05 15:06:56.583234
61	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 06, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:09:45 Apr 05, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ABOJ7.659zHSuoL0n3pw-QOQnxk8ABPK2LDMAu1iWMIynjQ.sxOjpk6w|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=76U64875RU080701F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=e4db818ce49ce|controller=payment_notifications|action=create	recurring_payment	Completed	76U64875RU080701F	10	2017-04-05 15:51:12.562755	2017-04-05 15:51:12.562755
63	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 07, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:21:56 Apr 06, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AY8hG4GFcbnx.98GkAz1Wl4F8.GFA-YUzcD3y.LXWjdHMl9CIiPrkgD0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1SA712202C144752J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=9741ae5453cb6|controller=payment_notifications|action=create	recurring_payment	Completed	1SA712202C144752J	12	2017-04-06 10:24:49.061218	2017-04-06 10:24:49.061218
62	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 06, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:09:54 Apr 05, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AuKBN9huwViNoJ0x3RD9emm15w31Add9PhNMxL2.MxtvteDoKg2sBg9w|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=82L99979NF9158010|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=3ca18b0cdc45c|controller=payment_notifications|action=create	recurring_payment	Completed	82L99979NF9158010	11	2017-04-05 16:11:37.791583	2017-04-05 16:11:37.791583
67	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 09, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:02:18 Apr 08, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AyESVAbrmVCYrW4MPUlTtKONk47DADf8mg.bXYg3NQzA9nihcxqNx5-U|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=03Y959742H739502Y|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=99600ed820720|controller=payment_notifications|action=create	recurring_payment	Completed	03Y959742H739502Y	12	2017-04-08 14:05:37.570348	2017-04-08 14:05:37.570348
74	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:16:28 Apr 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A0ix-hNml-FL9GCjy0iYAtzkGomOAZydFhiw3Zv48zj0Pxi23NAE6uIo|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3TS59659D4392410X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e67d261eb32f8|controller=payment_notifications|action=create	recurring_payment	Completed	3TS59659D4392410X	11	2017-04-12 11:29:24.36079	2017-04-12 11:29:24.36079
80	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:17:22 Apr 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A6pleMXvtBgfrZfnzkcfyEwOU-U0AcTCrowpOwNcT.wDPBGryPxWU.Rc|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=62G594064V425843G|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=407c3495a5ce4|controller=payment_notifications|action=create	recurring_payment	Completed	62G594064V425843G	12	2017-04-12 11:59:28.975396	2017-04-12 11:59:28.975396
81	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=12:50:07 Apr 12, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AbzlMQfnGCW1kgs7W9U77Rx7TroaAQdvEqHKfic9Eow7Pdez5ZiYvY9k|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=9YA991581M147534R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=cc97c6fcf41e|controller=payment_notifications|action=create	recurring_payment	Completed	9YA991581M147534R	10	2017-04-12 20:14:46.702298	2017-04-12 20:14:46.702298
87	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:32:15 Apr 17, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AKPT7Qq25dG1xHK3J5OtR2IKf.3YAFuaI.op9HxFiYNzz1D8NTbhqXpx|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=2U509975A4524151M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=601ea5ccb8992|controller=payment_notifications|action=create	recurring_payment	Completed	2U509975A4524151M	10	2017-04-17 13:35:46.963283	2017-04-17 13:35:46.963283
64	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 08, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:35:03 Apr 07, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A9dADuYwvEjnZFZR-7rNxIVnbQoAAUgA83j-ROhByY.qTIWXCp-b79n1|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=81F94769YL277090C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=9741ae5453cb6|controller=payment_notifications|action=create	recurring_payment	Completed	81F94769YL277090C	12	2017-04-07 16:43:25.57689	2017-04-07 16:43:25.57689
69	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:56:32 Apr 09, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ac2vPLbHj-CHp-02lM-tO1.27KzXAvGvz4xZBDXdEe5kOvdftKlS33fN|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=36V821959S942603E|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=83db76923687d|controller=payment_notifications|action=create	recurring_payment	Completed	36V821959S942603E	12	2017-04-09 13:59:11.834419	2017-04-09 13:59:11.834419
70	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:58:06 Apr 09, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AsA9zTxZOXofFCweKOzeKrTucto.Agy5W2fqsybRN3s1xNaow962VfbH|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=39H65818G67864221|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=c70c0cf3e2b15|controller=payment_notifications|action=create	recurring_payment	Completed	39H65818G67864221	10	2017-04-09 14:01:41.052587	2017-04-09 14:01:41.052587
76	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:17:22 Apr 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AY2b2GaGtkAbvhOc8GpLmku5tiPsABLQNey.Z65Xb7GGlL-IRnExxT0I|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=62G594064V425843G|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=407c3495a5ce4|controller=payment_notifications|action=create	recurring_payment	Completed	62G594064V425843G	12	2017-04-12 11:29:25.343252	2017-04-12 11:29:25.343252
77	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:15:26 Apr 11, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ank2tKFWfKxYTtURfPH9QuJ1P7i9AELIVb7eu7qUFdVJA3qz9cS5Z68-|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=9YS20449WD2401719|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=64964960a1963|controller=payment_notifications|action=create	recurring_payment	Completed	9YS20449WD2401719	10	2017-04-12 11:35:22.907763	2017-04-12 11:35:22.907763
83	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=12:51:04 Apr 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ApZwcZsoP.0EhLY44k88Z0WcxxqnARfmqaDiO8hosULE.XLYZz0JZ2q9|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9DE727454R2908521|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=f5c173c637dbd|controller=payment_notifications|action=create	recurring_payment	Completed	9DE727454R2908521	12	2017-04-12 20:14:48.296287	2017-04-12 20:14:48.296287
65	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 09, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:22:54 Apr 08, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AipzpiML256w9-akHONKruBmK6ovA5nA-2BQu3l1ssvZY8GKfFu2Q.qX|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=84T04696EF450560Y|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=8b10d1dffa0a|controller=payment_notifications|action=create	recurring_payment	Completed	84T04696EF450560Y	11	2017-04-08 10:26:42.86128	2017-04-08 10:26:42.86128
72	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=10:26:46 Apr 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AnV43zAiO44cYCY7WnPeRyVuk19pASlqR2UAHJzsOonlEirrjG9oG5YY|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2GC07826WE570535T|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=1536d368949ec|controller=payment_notifications|action=create	recurring_payment	Completed	2GC07826WE570535T	11	2017-04-10 17:29:26.616504	2017-04-10 17:29:26.616504
78	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:17:22 Apr 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A6pleMXvtBgfrZfnzkcfyEwOU-U0AcTCrowpOwNcT.wDPBGryPxWU.Rc|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=62G594064V425843G|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=407c3495a5ce4|controller=payment_notifications|action=create	recurring_payment	Completed	62G594064V425843G	12	2017-04-12 11:35:25.799971	2017-04-12 11:35:25.799971
79	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:16:28 Apr 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AyKHtDB-a3LlR4V7OIBhqNgBlyHhAgLs3T4Eda6JZ8.ZaByq0GyuKBe.|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3TS59659D4392410X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e67d261eb32f8|controller=payment_notifications|action=create	recurring_payment	Completed	3TS59659D4392410X	11	2017-04-12 11:43:18.87786	2017-04-12 11:43:18.87786
82	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=12:50:50 Apr 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AOdZvun5.QttWoS6t6vDMXAH9XRhASYp4TY8Eyhi4frOeuCoH2wtjArc|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7FN66719NC5607353|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=e197db1774d8c|controller=payment_notifications|action=create	recurring_payment	Completed	7FN66719NC5607353	11	2017-04-12 20:14:47.404822	2017-04-12 20:14:47.404822
86	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=10:44:40 Apr 16, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AwD4sJJmdrzDKNGw7KMAMuZSx1AHAjzNzqmlFRKrl-jxLxRYnfrRw9a7|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=98B46793YF073664Y|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=89fe9ead8c401|controller=payment_notifications|action=create	recurring_payment	Completed	98B46793YF073664Y	11	2017-04-16 17:47:50.510106	2017-04-16 17:47:50.510106
66	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 09, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:58:13 Apr 08, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=An8LYWsJHvE0M2jFDtr74NlqTrlCA1ns.W1P0ahUIZYoEa6Rrkpk.x7I|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=7TV924352N186905L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=419422831adbe|controller=payment_notifications|action=create	recurring_payment	Completed	7TV924352N186905L	10	2017-04-08 14:02:17.021569	2017-04-08 14:02:17.021569
68	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:28:50 Apr 09, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AlzNL.ngTGDarBQvIOo--kgIeerMAilWLogIkd.jWwtqXypOKjpZx7Cj|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2X3171644X816220L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=8b10d1dffa0a|controller=payment_notifications|action=create	recurring_payment	Completed	2X3171644X816220L	11	2017-04-09 10:33:15.86134	2017-04-09 10:33:15.86134
71	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:47:11 Apr 10, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ap0TlumVsEjiMiLKsZewhZcZAKzCA6D9cVYKmd0ZWl9f81qe6vKFXQEX|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=5JM16829UB2998333|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=c70c0cf3e2b15|controller=payment_notifications|action=create	recurring_payment	Completed	5JM16829UB2998333	10	2017-04-10 10:51:48.147631	2017-04-10 10:51:48.147631
73	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=10:29:12 Apr 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A5jg5FHbO3aWQKHd4A60fQrDAEioAu2SgcDFOxn.W12WBjo73zkxVzk-|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3RY76589TX538800D|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=f5184f769be4|controller=payment_notifications|action=create	recurring_payment	Completed	3RY76589TX538800D	12	2017-04-10 17:32:39.595866	2017-04-10 17:32:39.595866
75	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:15:26 Apr 11, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AQj8XjlV6U56Z5Be1dq.nMrzNg8FA7PQeC5H9qBq6IWFYhPDmyeBDlOI|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=9YS20449WD2401719|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=64964960a1963|controller=payment_notifications|action=create	recurring_payment	Completed	9YS20449WD2401719	10	2017-04-12 11:29:25.062808	2017-04-12 11:29:25.062808
85	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=10:44:53 Apr 16, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AqBqA1nSf.CEBj1d5rbDP.LO-woKAyR7RxXeSSKBqoll3obdYObYGiZu|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=99S15943CP1909510|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=bd93d7fd298f7|controller=payment_notifications|action=create	recurring_payment	Completed	99S15943CP1909510	12	2017-04-16 17:47:50.401393	2017-04-16 17:47:50.401393
84	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:09:27 Apr 16, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A1oGOA3gzVMcdXmtIgfbakbg7h5YAqIvE1J7QsatCGoYvhr6-7GU9ppG|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=1K586958C48496154|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=b5245ed0b6f30|controller=payment_notifications|action=create	recurring_payment	Completed	1K586958C48496154	10	2017-04-16 10:12:58.090489	2017-04-16 10:12:58.090489
89	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:34:05 Apr 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AnV43zAiO44cYCY7WnPeRyVuk19pACSvcN.6Y-XkP3mRLRis5t3RoJp8|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=68M240237D205960D|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=4b1a05af435f8|controller=payment_notifications|action=create	recurring_payment	Completed	68M240237D205960D	12	2017-04-17 13:37:56.931828	2017-04-17 13:37:56.931828
91	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:24:21 Apr 19, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AWupihapJ55v4E8OFm29kEztHiEDAKULAT7TDec5C39TlNbycFi0Te5X|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6YS159494G2535903|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=4b5644e48d2e|controller=payment_notifications|action=create	recurring_payment	Completed	6YS159494G2535903	12	2017-04-19 10:27:56.584265	2017-04-19 10:27:56.584265
96	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:19:29 Apr 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AuO1vB7EOZLPTHEin2U0HXTQU6ZsArWnOLVQUiyc3cpzNMSgy91eLmRT|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=98936220GL217542F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=b4da5ce138512|controller=payment_notifications|action=create	recurring_payment	Completed	98936220GL217542F	11	2017-04-21 10:22:54.718631	2017-04-21 10:22:54.718631
97	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:28:49 Apr 23, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AlzNL.ngTGDarBQvIOo--kgIeerMAWNegZrxJD5hHyl0f6vLCeXfsRZD|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5UX888387K8203413|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=f85f8e9d4978f|controller=payment_notifications|action=create	recurring_payment	Completed	5UX888387K8203413	11	2017-04-23 10:31:46.074348	2017-04-23 10:31:46.074348
101	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=12:05:26 Apr 24, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A2X.vtnsjfTZd.PC7PrwBhtuirHiAe6d3pBUl2IvhrAma.PLVetRIxH8|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=54Y51050PB558025H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=65e99b1dc27e2|controller=payment_notifications|action=create	recurring_payment	Completed	54Y51050PB558025H	12	2017-04-25 06:44:31.91925	2017-04-25 06:44:31.91925
88	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:33:57 Apr 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AH1pol-O9H-rvd9mM0ld1W1mHNV0Arh01WxEc4Ynwhr5x6M2S4PTAAnT|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8FB35184AP1548617|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=55933a3acda71|controller=payment_notifications|action=create	recurring_payment	Completed	8FB35184AP1548617	11	2017-04-17 13:36:50.714358	2017-04-17 13:36:50.714358
98	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:37:43 Apr 23, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Axzuw7JO97QEsqqATqKWqCvWgYgbAVaPEe--6AguSrABR0.5ZkughtY6|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1UJ380213F190244F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=7189d84fec06d|controller=payment_notifications|action=create	recurring_payment	Completed	1UJ380213F190244F	12	2017-04-23 10:40:52.373681	2017-04-23 10:40:52.373681
102	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=12:02:47 Apr 24, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AYuK.fkGZ2oTLW-A8lbAGEOXCqMaAQ5S8z1x5sTMjrGfkFig4ZrlE7jd|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7WN29943GU861230E|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=303442d92e5e1|controller=payment_notifications|action=create	recurring_payment	Completed	7WN29943GU861230E	11	2017-04-25 06:56:38.031584	2017-04-25 06:56:38.031584
104	payment_cycle=Daily|txn_type=recurring_payment_suspended_due_to_max_failed_payment|last_name=Wayne|next_payment_date=N/A|residence_country=US|initial_payment_amount=0.00|currency_code=USD|time_created=01:14:29 Mar 06, 2017 PST|verify_sign=AitFUzqO8ZXxGicaEa14GLIKyp.1A2RVccAhbx.V1P-NI0Ca2j3r0LLv|period_type= Regular|payer_status=verified|test_ipn=1|tax=0.00|payer_email=chezca1228@yahoo.com|first_name=Thomas|receiver_email=development@appsourcev4.com|payer_id=A979FXHAL7YHA|product_type=1|shipping=0.00|amount_per_cycle=799.98|profile_status=Suspended|charset=windows-1252|notify_version=3.8|amount=799.98|outstanding_balance=799.98|recurring_payment_id=I-83UUV1266BNS|product_name=Yearly Payment for a total of 2 branches|ipn_track_id=a3807706450d9|controller=payment_notifications|action=create	recurring_payment_suspended_due_to_max_failed_payment	\N	\N	11	2017-04-25 17:58:59.70956	2017-04-25 17:58:59.70956
107	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 30, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:47:26 Apr 29, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AQq9S7Ok-pw8oyfqd1s.l.8B2TrvALnJwWxwFnAy4ORS3vUgM8TO1FqJ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1XL36445MT495340P|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=17f128f2220ab|controller=payment_notifications|action=create	recurring_payment	Completed	1XL36445MT495340P	12	2017-05-17 19:06:09.347577	2017-05-17 19:06:09.347577
90	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:42:52 Apr 18, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AJl1dt6HKFjg4eshTbaC9x9ukD65A1vY6ShRgamZOmWgPMA8feoo5LfT|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5EW50688WB734374R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=55933a3acda71|controller=payment_notifications|action=create	recurring_payment	Completed	5EW50688WB734374R	11	2017-04-18 10:47:06.015184	2017-04-18 10:47:06.015184
92	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:33:33 Apr 19, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-83UUV1266BNS|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AWlpMEKr1B-fiuanqDTdbMsRWouOAjd6lm0jZg5l1ZIyJcf2NkU1ZmNA|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0M414360E5283852W|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=01:14:29 Mar 06, 2017 PST|ipn_track_id=b46daf49ebd00|controller=payment_notifications|action=create	recurring_payment	Completed	0M414360E5283852W	11	2017-04-19 18:36:49.606298	2017-04-19 18:36:49.606298
94	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:20:25 Apr 20, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AN5dvMzgbTsBV6grkY.xVn8oo9MNAc0b1Mt77489n2sylb0mvNl6wLDb|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4DL94355WJ150421M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=6a2dd16cea761|controller=payment_notifications|action=create	recurring_payment	Completed	4DL94355WJ150421M	10	2017-04-20 10:23:51.126724	2017-04-20 10:23:51.126724
99	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=09:33:31 Apr 23, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A0asK6oiIZmtBFrRCq-Iiqf8lrk.ANvKAZ2hrKJzVxmROhA3Glsr0l7K|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=2J849542BJ0899343|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=b5c246bb9ec03|controller=payment_notifications|action=create	recurring_payment	Completed	2J849542BJ0899343	10	2017-04-23 19:10:58.258597	2017-04-23 19:10:58.258597
100	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:40:46 Apr 24, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ABNwXHYHyCWXgNRZJ4KbIpfOAMKJADCOxi6QQGzPNBtlPzj4Xof.f3JA|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=4UY94629GE940841P|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=b5c246bb9ec03|controller=payment_notifications|action=create	recurring_payment	Completed	4UY94629GE940841P	10	2017-04-24 10:53:44.715923	2017-04-24 10:53:44.715923
103	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 26, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:40:41 Apr 25, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AGfSKS1zcdhJM-C6l0DknJMIv8LLAlmBMCff-lp7oLNAYA-hqDqyYu4i|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4CP86845SD162932L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=65e99b1dc27e2|controller=payment_notifications|action=create	recurring_payment	Completed	4CP86845SD162932L	12	2017-04-25 10:43:56.397868	2017-04-25 10:43:56.397868
93	mc_gross=119.97|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:35:52 Apr 19, 2017 PDT|payment_status=Completed|product_name=Monthly Payment for a total of 3 branches|charset=windows-1252|recurring_payment_id=I-ASXJDAURKJJV|first_name=Thomas|mc_fee=3.78|notify_version=3.8|amount_per_cycle=119.97|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AfAkavmC3xOd-bBA3ryNkIOB-nAFA-t1EIcmzgaECPTXGJYis-K.ufq-|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=119.97|txn_id=94M64516BJ215290J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=3.78|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Monthly Payment for a total of 3 branches|payment_gross=119.97|shipping=0.00|product_type=1|time_created=01:01:10 Mar 06, 2017 PST|ipn_track_id=6a2dd16cea761|controller=payment_notifications|action=create	recurring_payment	Completed	94M64516BJ215290J	10	2017-04-19 18:38:49.528908	2017-04-19 18:38:49.528908
95	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:05:27 Apr 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AXbHfyOhp.g26Kv5HlJEYOBllEYOAuXSqRWXA1i2BoBkBOGExX-Q.iFY|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1H6832848A1676511|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=55ea8c2a5e0db|controller=payment_notifications|action=create	recurring_payment	Completed	1H6832848A1676511	12	2017-04-21 10:08:57.403867	2017-04-21 10:08:57.403867
105	payment_cycle=Daily|txn_type=recurring_payment_suspended_due_to_max_failed_payment|last_name=Wayne|next_payment_date=N/A|residence_country=US|initial_payment_amount=0.00|currency_code=USD|time_created=01:01:10 Mar 06, 2017 PST|verify_sign=A9BiAtHlNpvdHOX3mPrOVBHDOETPAz1zhpyMDnNk6amd104BExGRXgdB|period_type= Regular|payer_status=verified|test_ipn=1|tax=0.00|payer_email=chezca1228@yahoo.com|first_name=Thomas|receiver_email=development@appsourcev4.com|payer_id=A979FXHAL7YHA|product_type=1|shipping=0.00|amount_per_cycle=119.97|profile_status=Suspended|charset=windows-1252|notify_version=3.8|amount=119.97|outstanding_balance=119.97|recurring_payment_id=I-ASXJDAURKJJV|product_name=Monthly Payment for a total of 3 branches|ipn_track_id=e2b9bbc0b2e0b|controller=payment_notifications|action=create	recurring_payment_suspended_due_to_max_failed_payment	\N	\N	10	2017-04-25 18:00:22.393411	2017-04-25 18:00:22.393411
106	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Apr 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=09:23:27 Apr 26, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AyVuUcpetZUWCXV.EHq.qRhxEb6.AgJvtZuuOGzwzYMozXt.8qxXaoeT|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7GE04061GB3676238|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=330f60d5dc25e|controller=payment_notifications|action=create	recurring_payment	Completed	7GE04061GB3676238	12	2017-04-26 16:26:55.133138	2017-04-26 16:26:55.133138
108	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 02, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:02:46 May 01, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ADmPnIPY3I7Vr6t4FxyXGQRPk2D-AhUoSxaqn5Vv20f9YFcOQenmmSZH|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1YG06688S0816400C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=1274014540877|controller=payment_notifications|action=create	recurring_payment	Completed	1YG06688S0816400C	12	2017-05-17 19:14:24.318112	2017-05-17 19:14:24.318112
109	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 03, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:08:33 May 02, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AbVpE46Hdzh6d29Gu3X3iR8qqXBgALX5z7h8jKH5RJ2OumHJ1SE3OZa9|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9ST93618R4093620S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=1274014540877|controller=payment_notifications|action=create	recurring_payment	Completed	9ST93618R4093620S	12	2017-05-17 19:16:58.522623	2017-05-17 19:16:58.522623
110	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:35:43 May 09, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AX8Qhp1KduwF1PenaWfGM32xmlvMAZfm6WqCH.Q.tMJ3veRJ9Vdrb0fz|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1AJ07747WR560863A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=1e46a6c15ddbc|controller=payment_notifications|action=create	recurring_payment	Completed	1AJ07747WR560863A	12	2017-05-17 20:00:23.516237	2017-05-17 20:00:23.516237
111	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:57:09 May 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A-X91d6dvj07IIDTUn5hM8p8w8LxA3u9jph29B8C3xZ.suJneXyddDIB|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=21434985K0849823Y|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=1e46a6c15ddbc|controller=payment_notifications|action=create	recurring_payment	Completed	21434985K0849823Y	12	2017-05-17 22:49:14.93421	2017-05-17 22:49:14.93421
112	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 07, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=10:59:53 May 06, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AMA-XRFWCsglr5DA--cCeSe601sMA7Oh1K3RfPUu2TPZartTDkWOlaHe|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5PX14880CW1108949|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=66a9dd244f5bf|controller=payment_notifications|action=create	recurring_payment	Completed	5PX14880CW1108949	12	2017-05-18 06:29:46.871513	2017-05-18 06:29:46.871513
113	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 16, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:27:47 May 15, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AR6jfZ-xy9rVRwbk5sa6I.SAgPkdAeWhyV2Z0SGG0qoRTNI9iBZ5E42W|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=26G02041FS3562356|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=33616bde98515|controller=payment_notifications|action=create	recurring_payment	Completed	26G02041FS3562356	12	2017-05-18 10:32:31.241583	2017-05-18 10:32:31.241583
114	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:34:00 May 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AWupihapJ55v4E8OFm29kEztHiEDACfKquf9OaOig6Y2qAazzPyc89Qr|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=76E77136E5566792C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=838508e3efb85|controller=payment_notifications|action=create	recurring_payment	Completed	76E77136E5566792C	12	2017-05-18 10:49:07.37092	2017-05-18 10:49:07.37092
115	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:15:28 May 14, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AhEqPBa2LPCE3sKdenmfssNtAsh0As8W6QHPcqbGTonSvoxL.kl2bMtW|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=32L27600UY147580W|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=33616bde98515|controller=payment_notifications|action=create	recurring_payment	Completed	32L27600UY147580W	12	2017-05-18 14:23:17.265763	2017-05-18 14:23:17.265763
116	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:19:10 May 18, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AtrOkJdYRqM2XBxo8RGe-.2vt4caAhGTLLK9AT7Kf8kvgLMgLXFNW0Mb|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2AN57847G1045515H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=838508e3efb85|controller=payment_notifications|action=create	recurring_payment	Completed	2AN57847G1045515H	12	2017-05-18 16:52:00.919386	2017-05-18 16:52:00.919386
118	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=11:06:21 May 26, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AipzpiML256w9-akHONKruBmK6ovAPuk5O8cRgnicsKSv9vOzJUUCqXJ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=88453102Y6509904X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=2eb668ad96e58|controller=payment_notifications|action=create	recurring_payment	Completed	88453102Y6509904X	12	2017-05-26 18:10:42.627725	2017-05-26 18:10:42.627725
119	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 31, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:35:34 May 30, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=As7YjUf-EtwWTklniO1RIaVMU-GLAnwZUK9XvGBv8AuyqS64S8f4h1Sz|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0FD89442TG854182V|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=4ce3d250bcb87|controller=payment_notifications|action=create	recurring_payment	Completed	0FD89442TG854182V	12	2017-05-30 10:39:48.643901	2017-05-30 10:39:48.643901
132	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 02, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:12:23 Jul 01, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A37ljju0wTvGa4UumtLT0baFTK01Aeg-azhW-QMMVL0RW0fQISD2SKLN|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=08M2178415231872U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	08M2178415231872U	12	2017-07-01 21:24:40.279976	2017-07-01 21:24:40.279976
157	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:53:01 Jul 16, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AQU0e5vuZCvSg-XJploSa.sGUDlpAyAWSibjjUef-15XgKgXP1hKe5Ar|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4HL028481T755701F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	4HL028481T755701F	13	2017-07-19 12:12:04.580467	2017-07-19 12:12:04.580467
117	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 May 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:58:59 May 22, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Aj-KgkP9gPuP8-fV0MIkJdp5JSojAVuXzDEjWZYuuJHNCEXPLHqjf5V1|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5DF93997LV013081H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=966ac3c48c781|controller=payment_notifications|action=create	recurring_payment	Completed	5DF93997LV013081H	12	2017-05-23 06:30:55.314792	2017-05-23 06:30:55.314792
122	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:22:58 Jun 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AU0xwkp09ogOUgLWIglNEgjpuxUmAFZt6pu6KPqYArMUTTt8zf0Z-XUK|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=77R710263H0544946|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	77R710263H0544946	12	2017-06-22 13:03:58.673927	2017-06-22 13:03:58.673927
124	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:12:25 Jun 23, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A.9-vqvsXq0hxJ6NRwAMTJqyxDqAAryv98ppEIWZhRbqqHSd2H9JjzI8|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1UD74171PX752153J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	1UD74171PX752153J	12	2017-06-23 13:35:26.022204	2017-06-23 13:35:26.022204
125	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:48:43 Jun 24, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AV5g.RRvzcNMaeOO73JJ-F3fudM2ARTz.rkzpVf.YHsB9-Z.fQByU80g|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8W7437310S407051X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	8W7437310S407051X	12	2017-06-24 12:53:01.07952	2017-06-24 12:53:01.07952
126	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 26, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:20:23 Jun 25, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=As42CP0jABWG2HOituI.lTaeaj1nAbj2X7VkprAz8xdSWGj7yqgSR5p.|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3S277505WY975321T|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	3S277505WY975321T	12	2017-06-25 11:25:21.075835	2017-06-25 11:25:21.075835
127	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:41:59 Jun 26, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=APvissTSNYxEsF2tvyvfCnTn10fsAX1HD4WdXvUdUjvzP3Snk7ovpXER|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=54A53831CM062390S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	54A53831CM062390S	12	2017-06-26 10:47:26.133524	2017-06-26 10:47:26.133524
120	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=12:16:43 Jun 04, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AOOl9s5jo7zgw1gC3EwjVkric6Q3|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2K644498T1217860R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=b0dc24215188b|controller=payment_notifications|action=create	recurring_payment	Completed	2K644498T1217860R	12	2017-06-04 19:20:48.40867	2017-06-04 19:20:48.40867
121	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:09:13 Jun 20, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AAXk.4xTqZKKmyPjxA7u4fiEF3diAzByCn6SJIuzHHjf.XLSc3j0kg1t|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7G3746182D8427635|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	7G3746182D8427635	12	2017-06-22 12:22:59.663473	2017-06-22 12:22:59.663473
123	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:57:20 Jun 22, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=As7YjUf-EtwWTklniO1RIaVMU-GLAqE59lOHOHpEEquhA-83kJNvv3UP|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6KU767870A064412X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	6KU767870A064412X	12	2017-06-22 15:09:00.343551	2017-06-22 15:09:00.343551
129	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 29, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:26:02 Jun 28, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A3VYEEP1tvQNeoxbfr-eCqx0LcHiA9pNBDc2r2fzowX76vMmDmqB1rKM|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4K861442FF1570227|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	4K861442FF1570227	12	2017-06-28 13:30:26.715966	2017-06-28 13:30:26.715966
133	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 03, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:59:40 Jul 02, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=APUFQmLx9NphmBcTIE3oGC1r73WUAZI63CvBzDgNsVN2IQLX1.-zwPBI|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5UG01101V9319334M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	5UG01101V9319334M	12	2017-07-02 14:04:32.564724	2017-07-02 14:04:32.564724
138	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 08, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:36:01 Jul 07, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AfL8JAkvK-PP8ASnAhGskamGi9c3ASJKAUUNVp4HLQzT9A7mXxOv1FYf|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4C092732BB644134B|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	4C092732BB644134B	12	2017-07-07 11:40:36.337856	2017-07-07 11:40:36.337856
128	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 28, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:28:42 Jun 27, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ABNwXHYHyCWXgNRZJ4KbIpfOAMKJANoLS6j.acVuSam3LGwcISbHYsnt|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8XE6546222100420N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	8XE6546222100420N	12	2017-06-27 13:33:06.15075	2017-06-27 13:33:06.15075
131	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 01, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:18:30 Jun 30, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ax9VZxQVkOPGwIrq1h7mZMv3AK7GAo9pRhNItWt9-5HVycEc1jLzOp7a|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=59J02363VY238261P|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	59J02363VY238261P	12	2017-06-30 12:23:00.800702	2017-06-30 12:23:00.800702
134	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 04, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:12:27 Jul 03, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AwCSHNkP-2F9DbL6QGkrgMEPm2vRArPC2f2nzZuO9-5C.XW6qbmRyRTX|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9VJ85211A7780450W|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	9VJ85211A7780450W	12	2017-07-03 12:17:32.218309	2017-07-03 12:17:32.218309
135	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:38:34 Jul 04, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ABDwnh71.BrXhuq2crSWAN--XC9QA.lUc.kU1-OoItgBHCK0zQLanhwk|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=47M516632B009324K|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	47M516632B009324K	12	2017-07-04 10:43:30.545501	2017-07-04 10:43:30.545501
136	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 06, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:19:16 Jul 05, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AEvg9f6BKxrhAAdrDS9wSE0EE8FFAkSusT881e7HPgk4Rzwm-Zt3qgO0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0EJ33454UJ121043S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	0EJ33454UJ121043S	12	2017-07-05 12:24:32.88812	2017-07-05 12:24:32.88812
137	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 07, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:10:34 Jul 06, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ARyNDMbKwa-zLx7AtfPa-etrhyTVArbnkCgji4j4-d..hkIhRYnvlUqo|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0W3878470Y226953R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	0W3878470Y226953R	12	2017-07-06 10:15:07.426857	2017-07-06 10:15:07.426857
130	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jun 30, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:03:38 Jun 29, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A2S-C.Y6Y9TpqJXgSim76To8U-4CAqJMoP149AaysnPhbplogeJvuYQz|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2T38903995993560P|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	2T38903995993560P	12	2017-06-29 13:08:31.27814	2017-06-29 13:08:31.27814
141	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:43:24 Jul 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ap0TlumVsEjiMiLKsZewhZcZAKzCAHSErX7IaGhBATW5WIUdZL713ljb|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1G242732SL981174E|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	1G242732SL981174E	12	2017-07-10 11:48:38.690944	2017-07-10 11:48:38.690944
143	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:54:21 Jul 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A3FeuJ.9KWrTpAUzvFoPqExa.3PLA3hXXy45Y.RjGSm1MnlqcWHvEOER|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8MF269451A707371C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	8MF269451A707371C	12	2017-07-11 11:03:33.593252	2017-07-11 11:03:33.593252
150	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:01:35 Jul 14, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ANGIHx50I59oDMFzHfXK-G2nySdmAmF3qloZKpDpY1ccAEWCb-q1kNna|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6D44567027019372X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	6D44567027019372X	12	2017-07-14 14:06:41.716796	2017-07-14 14:06:41.716796
152	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 16, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:04:22 Jul 15, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AlNsyP4B-VE3fykqTTbzBt.74kfzAQjgOAyG-7u-HpJuVo0tQ1.yEDjE|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=63879442Y35584155|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	63879442Y35584155	12	2017-07-15 13:09:39.97681	2017-07-15 13:09:39.97681
155	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:38:17 Jul 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AFd.erwt7VoeoUMr85yut0RloHozAk2EKucIC-rtk9z9IAgNK1zWi4cl|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1K5198533A9560020|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	1K5198533A9560020	13	2017-07-19 09:23:46.041532	2017-07-19 09:23:46.041532
139	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 09, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:53:27 Jul 08, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AlOlEc95EaPOaPpDS0VjJUCLvhmyAKp5S4a8X.64.U8QfssfM5BnWEJt|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8V974234YY035745D|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	8V974234YY035745D	12	2017-07-08 11:01:43.437348	2017-07-08 11:01:43.437348
144	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:26:21 Jul 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AnnTEqqfB9RzN6-rN64iDUpykl-qARSF9e-utwOcxRvGm0eL1BENZ17e|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3KE70500R8625430A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	3KE70500R8625430A	13	2017-07-11 12:34:41.864446	2017-07-11 12:34:41.864446
148	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 14, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:25:56 Jul 13, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Aw-hoBjK5vCB7NBs-sT.atT7LSJIAlYiKaWHDt83FLzCDqkQOeoUpAJZ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=258214816L7137306|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	258214816L7137306	12	2017-07-13 14:30:44.439284	2017-07-13 14:30:44.439284
149	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:06:51 Jul 14, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AYZGGa3n.Ik8uygCuexDyxMbLqmqAcX6GkuJbHLzkAPlv5eb1jWofa63|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7N465458TR911021U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	7N465458TR911021U	13	2017-07-14 10:12:05.924649	2017-07-14 10:12:05.924649
151	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 16, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:27:27 Jul 15, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AVFvrroR9BL.LnjR2eCD8c9ZR3asAh2JoQ7gPgN-b7YEJMbfAgcAnrdU|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=81Y48951038043225|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	81Y48951038043225	13	2017-07-15 12:32:15.170259	2017-07-15 12:32:15.170259
153	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:16:51 Jul 18, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A25S80wehbt8obUsQlBFp-jPqU1fACDHPY52QdyWI8dXalaEnpU9PYZM|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8F9227289W8667733|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	8F9227289W8667733	13	2017-07-19 07:49:36.127837	2017-07-19 07:49:36.127837
140	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:52:41 Jul 09, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AWtfL6Bc4xPGaBGL.JQPP6KqqaC-A1cDckPF4pJzzWFRiBbaczgnBZgc|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1A602188E1123905S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	1A602188E1123905S	12	2017-07-09 11:57:34.611572	2017-07-09 11:57:34.611572
142	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:53:09 Jul 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ajiy6YmBz00sV0oT2S-obuaQ3kehAqeUFEQ3.wjuSfUm6RHl5GN0mRR9|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3WG58573E55143700|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	3WG58573E55143700	13	2017-07-10 11:57:47.9903	2017-07-10 11:57:47.9903
145	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:36:44 Jul 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A-2571xtKc7zfa3gSrNtvhvIgpLZAZVJivwNUcGKA47PQTae-e2EGbvA|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3NU46628DM252173M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	3NU46628DM252173M	13	2017-07-12 10:44:51.350633	2017-07-12 10:44:51.350633
146	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:48:37 Jul 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AwFBb3JFHSxMdjo2nANAdeqCmzepA.qNcxdnTX7RO6NBoFZuFaZZ1Jy6|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8RA41941HL384564U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	8RA41941HL384564U	12	2017-07-12 13:05:20.350813	2017-07-12 13:05:20.350813
147	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 14, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:07:17 Jul 13, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ADmPnIPY3I7Vr6t4FxyXGQRPk2D-ASvNvbqdTgp8RIGzXtNVi7FWCbF0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5MS33967UY5790940|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	5MS33967UY5790940	13	2017-07-13 11:11:58.985448	2017-07-13 11:11:58.985448
154	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:57:41 Jul 16, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AAXUDeWm6RGbJ0GeUjbjQLb8U6hmAvaZWFyg46jvuu7pQNYBSKnvGJ85|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=02N68908E0366941T|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	02N68908E0366941T	12	2017-07-19 08:46:05.798367	2017-07-19 08:46:05.798367
156	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:18:31 Jul 18, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AAjgpFMc22TbxGEPhBkTdDCfIdQ2A2PeDeuq3W4yIlt7U8XZowmuYblS|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=04544189SU793302D|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	04544189SU793302D	12	2017-07-19 09:30:19.792446	2017-07-19 09:30:19.792446
165	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:27:06 Jul 22, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AI6XxsHUoOHL02cDJ3IqXWJ57udLA0rA0giVmHahSkdKOvvS8imxPYaT|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5T253718TA514410L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=f1277f3c94d33|controller=payment_notifications|action=create	recurring_payment	Completed	5T253718TA514410L	12	2017-07-22 10:34:24.159042	2017-07-22 10:34:24.159042
166	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:23:08 Jul 22, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=At7-EaYJBGlIhm7vDmYA5xoe84C1AFAP6x.HU8FqlcMNvc2nBoKryeEu|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=17P390156P832121J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=9c10576bc90da|controller=payment_notifications|action=create	recurring_payment	Completed	17P390156P832121J	13	2017-07-22 13:28:01.186609	2017-07-22 13:28:01.186609
167	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:21:31 Jul 23, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AlLjZyUxzvtq5pK4-AOSkTM98NV-APhXNh88org9AsCGGp3x35WWxS0o|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8T930056L6926684S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=ac105a09611ac|controller=payment_notifications|action=create	recurring_payment	Completed	8T930056L6926684S	13	2017-07-23 10:27:02.333507	2017-07-23 10:27:02.333507
158	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:25:44 Jul 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AyG6OEik.jj4i4rwMFDLTtw5AI3mA.evi9Kp7bvjaOe0poqVSyel5nvq|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9U427429DP1724322|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	9U427429DP1724322	12	2017-07-19 12:18:49.097297	2017-07-19 12:18:49.097297
159	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:29:24 Jul 19, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A0uEaIiR68-zbTrTIDvzrysBqj-hArolfI5PPBC1Ur3Haz7RPHRhW3JQ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5Y633473LR930444M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	5Y633473LR930444M	13	2017-07-19 14:14:25.469909	2017-07-19 14:14:25.469909
161	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:18:31 Jul 20, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ALyBPL6HsXT-5I3c762d-AI6c2swAaPsXWW-vHsRUXABAJec8OpDtybK|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0KR60546YT592505U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=8b7da000f1f04|controller=payment_notifications|action=create	recurring_payment	Completed	0KR60546YT592505U	13	2017-07-20 13:26:25.139142	2017-07-20 13:26:25.139142
163	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:22:25 Jul 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AP37U7gPUL7wW.bhj7gUYHr1YqBVALqq6z4MkaqpuEVgP14US4B0eYOp|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=85M987927X608672C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=9c10576bc90da|controller=payment_notifications|action=create	recurring_payment	Completed	85M987927X608672C	13	2017-07-21 10:27:54.513002	2017-07-21 10:27:54.513002
160	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:02:28 Jul 19, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Am82Np6AEAAE8c8ZFN8ZSYXcXhsZAuAWS7XJ-XBT2HuBu-GRy7eVfKxe|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0P976802C0104650J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	0P976802C0104650J	12	2017-07-19 15:07:48.841053	2017-07-19 15:07:48.841053
164	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:30:19 Jul 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AZpiKAI6qfxb4xaUykSSZbOh5vP5AvtCX1i5QUi6iDdCUPa2QslrnY1o|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4SC32967F4002215L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=43c5179a1bab0|controller=payment_notifications|action=create	recurring_payment	Completed	4SC32967F4002215L	12	2017-07-21 10:36:09.937781	2017-07-21 10:36:09.937781
162	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:23:34 Jul 20, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A9f34bPN4aw40k8HgTcAC9RZ1LIaAMkMFPtWLV56Slvtw6MYglvfDRTD|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=79E36524P56529423|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d7aa920725430|controller=payment_notifications|action=create	recurring_payment	Completed	79E36524P56529423	12	2017-07-20 14:42:35.657352	2017-07-20 14:42:35.657352
168	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 24, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:27:30 Jul 23, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A0FIHGGYIJ-nD8w6ijMHucFJMWkkAQDlll7WSikU2PKd6Liz57I9aUpW|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2C792827YY890825H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=e0b02639e72ed|controller=payment_notifications|action=create	recurring_payment	Completed	2C792827YY890825H	12	2017-07-23 10:33:20.881449	2017-07-23 10:33:20.881449
169	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:28:22 Jul 24, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AA9ExP64.cMZEWNqon.bnY6yQeMDAIXpR4FsC7UTTL9etHr5icJkR5zn|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1PV97374RW628354N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=ca8f2073874f2|controller=payment_notifications|action=create	recurring_payment	Completed	1PV97374RW628354N	12	2017-07-24 10:34:47.572741	2017-07-24 10:34:47.572741
170	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 25, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:03:15 Jul 24, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A1gZCGgaxq1yNJiDKaGm6NiQJNbiAcs9Ap5f2mvof9LOtBxL5fVP6lz0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4V864090EW283813W|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=ac105a09611ac|controller=payment_notifications|action=create	recurring_payment	Completed	4V864090EW283813W	13	2017-07-24 11:08:44.266235	2017-07-24 11:08:44.266235
171	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:32:49 Jul 26, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A3O4kA8u3GUe1-FpGzlLQLZgBEFPALNQ-8YdWoVDd5pnyIBhjAviwEjD|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6R398128K9503660D|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=cd7d8951275ea|controller=payment_notifications|action=create	recurring_payment	Completed	6R398128K9503660D	12	2017-07-28 02:57:10.866365	2017-07-28 02:57:10.866365
172	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 27, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:34:58 Jul 26, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AFlriDVAEuS5BixOsim6H3-zXWP0AqdGPjwiwUOjdi50DPXPXaBHTIaP|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7FF1514764574993M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=3a89aaeccfc37|controller=payment_notifications|action=create	recurring_payment	Completed	7FF1514764574993M	13	2017-07-28 03:20:46.138449	2017-07-28 03:20:46.138449
173	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 26, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:16:14 Jul 25, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A.6lS3qEtYPFSeB1EVgJBE688RfXAAFO1c958ad0dnYHXWPDUetvgwS6|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=42P20553RE458392R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=ac105a09611ac|controller=payment_notifications|action=create	recurring_payment	Completed	42P20553RE458392R	13	2017-07-28 03:38:27.845402	2017-07-28 03:38:27.845402
190	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 04, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:58:54 Aug 03, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A.AzgZEU.V1wrC92CwtVxQAv1DDQABuJeGL493FNvYzyYC3I4e5jKuw5|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4M031568FC2114741|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=d5220c354ff05|controller=payment_notifications|action=create	recurring_payment	Completed	4M031568FC2114741	13	2017-08-03 15:04:08.744692	2017-08-03 15:04:08.744692
194	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 06, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:34:04 Aug 05, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Av2k4fYtZPPuhggknnAikUVzv3AjApNxVkes5UuG4ekEJ3RV8PZHVr4Q|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9M7443084G744861U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=d5220c354ff05|controller=payment_notifications|action=create	recurring_payment	Completed	9M7443084G744861U	13	2017-08-05 12:39:18.215207	2017-08-05 12:39:18.215207
198	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 08, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:01:52 Aug 07, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AJt9Su6uIMHe46emkH6-AJirYL18Asy1mFg6HZBT9IiewUGJOzzGHOdA|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=35E09314KT5706508|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d26ef20066002|controller=payment_notifications|action=create	recurring_payment	Completed	35E09314KT5706508	12	2017-08-07 11:07:19.541947	2017-08-07 11:07:19.541947
174	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 28, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:30:49 Jul 27, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AKpisrgtkQDkO6tcg.qeIDfT2FrdAspGNb.ayz4EROAv0nn0zOuFpmzA|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7EA56867X1636340S|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=3a89aaeccfc37|controller=payment_notifications|action=create	recurring_payment	Completed	7EA56867X1636340S	13	2017-07-28 04:50:01.690158	2017-07-28 04:50:01.690158
175	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 26, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:31:44 Jul 25, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Az9Xd1arTA5cZDl3CswiCti0qSA.AgMm2ltbFh0Ooxi-iSMo21wvaCe6|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7UY96657AY155423B|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=f9ca92a985802|controller=payment_notifications|action=create	recurring_payment	Completed	7UY96657AY155423B	12	2017-07-28 05:09:03.303615	2017-07-28 05:09:03.303615
176	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 28, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:39:26 Jul 27, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ADeWYfUAnar02.lyDQ-2iQlOtBHDAwOw3xNqyFrgXeGD0NsjpCtO2Gmx|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8XS236290E3065524|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=9f140cb23b891|controller=payment_notifications|action=create	recurring_payment	Completed	8XS236290E3065524	12	2017-07-28 05:22:14.276587	2017-07-28 05:22:14.276587
177	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 29, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:43:38 Jul 28, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AUhHxxoHVJnXwS-zk7UF5Hg9I.HIAiJhJ11jqrq9Z8eLzimxW-nkA17H|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=43R52644VM7380825|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=842dc5ae1eb86|controller=payment_notifications|action=create	recurring_payment	Completed	43R52644VM7380825	13	2017-07-28 15:40:48.048642	2017-07-28 15:40:48.048642
178	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 29, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:43:01 Jul 28, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AKz814L5uZdMu1qbf3JZ5YDtX1ikAcGW4wVd0XFl3EtWCFLioIqi7JfC|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7GS594629G179245N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=f531c0c3564cc|controller=payment_notifications|action=create	recurring_payment	Completed	7GS594629G179245N	12	2017-07-28 15:40:48.423705	2017-07-28 15:40:48.423705
179	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 30, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:34:28 Jul 29, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AhohO4-KgSw3.irCt33CzXOvr3DUAsuZQtHwemZ4CzhQL-sXM.Y0uFG3|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=69D50784NL393503C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=fbc926be082|controller=payment_notifications|action=create	recurring_payment	Completed	69D50784NL393503C	13	2017-07-29 11:00:02.801039	2017-07-29 11:00:02.801039
180	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 30, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:33:04 Jul 29, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AovEzlPCsQMDpmPF8wyyNnan-Or2Ai.TI8teVr7A6yp6Bu8Z-ulZcS0E|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=73892786GP6847828|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=158e47ee20f2|controller=payment_notifications|action=create	recurring_payment	Completed	73892786GP6847828	12	2017-07-29 11:06:14.742169	2017-07-29 11:06:14.742169
183	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 01, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:27:57 Jul 31, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ASF70zltkxECKkEhGr2c-kpo7VzaAj3OeQl600Ym1ALgt2DcLZPyjGIW|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3VX139913U957823X|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=fbc926be082|controller=payment_notifications|action=create	recurring_payment	Completed	3VX139913U957823X	13	2017-07-31 13:33:00.936767	2017-07-31 13:33:00.936767
186	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 02, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:09:07 Aug 01, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AvPWImHNUj0pk5wilK7Q3WuZMZ.QAIZuVbwXfFDMuqsTofAZ4Q4fn9gE|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=4CB60425WC1606646|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=2f6684b551f8|controller=payment_notifications|action=create	recurring_payment	Completed	4CB60425WC1606646	12	2017-08-01 11:14:16.14317	2017-08-01 11:14:16.14317
181	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 31, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:01:15 Jul 30, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ANiRqDci0COxMcr.DQ6u-yyNzJ7LAEEcBoAjo1Y.P4dphHPAdRXT7sBj|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3HU25929DH586645F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=fbc926be082|controller=payment_notifications|action=create	recurring_payment	Completed	3HU25929DH586645F	13	2017-07-30 12:06:58.802545	2017-07-30 12:06:58.802545
184	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 01, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:09:32 Jul 31, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ABLdOF-qjsY5sSBUWcyKjwmVHVGVAPN4zAzadpBueTVnEQcsDgh1sN5n|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2H598924E90895947|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=158e47ee20f2|controller=payment_notifications|action=create	recurring_payment	Completed	2H598924E90895947	12	2017-07-31 14:15:08.993683	2017-07-31 14:15:08.993683
185	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 02, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:06:54 Aug 01, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A9fzflAicCahWO9nepAdJw4zGXu3AeFrlGW.CF3TbhYPrV9CTBhDi5t0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1FG05199UJ986805A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=d5220c354ff05|controller=payment_notifications|action=create	recurring_payment	Completed	1FG05199UJ986805A	13	2017-08-01 11:12:06.90711	2017-08-01 11:12:06.90711
187	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 03, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:49:54 Aug 02, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AB4D1gCIktIekr43tuy.8HapuNzkAzfSI95qQkFDEDTIXAti-x.0I6vg|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2MT01795Y2861151Y|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=2f6684b551f8|controller=payment_notifications|action=create	recurring_payment	Completed	2MT01795Y2861151Y	12	2017-08-02 10:56:11.97246	2017-08-02 10:56:11.97246
191	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:46:16 Aug 04, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A7lRxa76xmHCL33PX02qN6zIbG7iAvYvgC01aSXWv40nPRUr4i.YTDYh|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=31V23541SG251823H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=d5220c354ff05|controller=payment_notifications|action=create	recurring_payment	Completed	31V23541SG251823H	13	2017-08-04 10:51:27.092885	2017-08-04 10:51:27.092885
196	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 07, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:54:46 Aug 06, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AiPC9BjkCyDFQXbSkoZcgqH3hpacAPJUTGvtmzkyalG1gEyXKFlCrpuA|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=676472415X879711V|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d85f26f019493|controller=payment_notifications|action=create	recurring_payment	Completed	676472415X879711V	12	2017-08-06 18:25:52.127841	2017-08-06 18:25:52.127841
182	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Jul 31, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:22:58 Jul 30, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A2b0.zNjbPXZuqrRrgiqWM48vJAbAxNKl2BdLsD6RyI1YFYT2BDFoYbo|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=98V10789DF500602N|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=158e47ee20f2|controller=payment_notifications|action=create	recurring_payment	Completed	98V10789DF500602N	12	2017-07-30 13:28:02.80626	2017-07-30 13:28:02.80626
188	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 03, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:24:04 Aug 02, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ANPqaIIjJFj9K9rndoPcyjmO.Nd-AWLNnmlKu8QBXpjyT10h3J64eVT0|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=7LM37541VH927403F|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=d5220c354ff05|controller=payment_notifications|action=create	recurring_payment	Completed	7LM37541VH927403F	13	2017-08-02 15:29:17.495519	2017-08-02 15:29:17.495519
189	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 04, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:51:44 Aug 03, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AtrOkJdYRqM2XBxo8RGe-.2vt4caATrNAmZ26G0ev2NhAyL-GBe1GHAw|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6HL38571LW079901E|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=2f6684b551f8|controller=payment_notifications|action=create	recurring_payment	Completed	6HL38571LW079901E	12	2017-08-03 10:57:35.655897	2017-08-03 10:57:35.655897
192	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 05, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:40:10 Aug 04, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AJ5dr2DShau.Oota22xf4JTuhCqiAeUTEA-SHuh9m8WriY79AfLRKc7d|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=01A82448XD219024A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=2f6684b551f8|controller=payment_notifications|action=create	recurring_payment	Completed	01A82448XD219024A	12	2017-08-04 13:46:06.866651	2017-08-04 13:46:06.866651
193	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 06, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:13:05 Aug 05, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AFtEL2VGAv8Kt-gyZwFHyESPmzOoAlC2QR0fgKl58SdHIv5E7ORMVwYl|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=46G34192W79753425|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=2f6684b551f8|controller=payment_notifications|action=create	recurring_payment	Completed	46G34192W79753425	12	2017-08-05 11:18:44.804067	2017-08-05 11:18:44.804067
195	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 07, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:52:46 Aug 06, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A2S1fniRGsoquzRDbs4f5rc383f8AuobQsEIYTC.4PhYq3zRO9Y4KOTw|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0WW97400WC899081E|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=9125dd65a196f|controller=payment_notifications|action=create	recurring_payment	Completed	0WW97400WC899081E	13	2017-08-06 18:25:52.098126	2017-08-06 18:25:52.098126
197	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 08, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:58:12 Aug 07, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Al.sEMmQrthTGy.423ZL7jGr63saAWr9.YR2olDLH5J1dDJQOAuZDLbt|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=43M65699XT928721R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=c452bfe829431|controller=payment_notifications|action=create	recurring_payment	Completed	43M65699XT928721R	13	2017-08-07 11:04:21.617867	2017-08-07 11:04:21.617867
199	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 09, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:05:05 Aug 08, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AM8eSy-369zGZhyburmqKvKw2IgEA95epfU5w9.YrDsF-BINkm.VJ6jj|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0TD39585P7615630T|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=c452bfe829431|controller=payment_notifications|action=create	recurring_payment	Completed	0TD39585P7615630T	13	2017-08-08 11:07:01.123514	2017-08-08 11:07:01.123514
200	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 09, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:21:26 Aug 08, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A5uQFvjc.UJtfUjlRK-VIf9WWQ8HAQCKu-ijOO8sT5N2M7CVIFzrZitt|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2W822307XW2423303|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d26ef20066002|controller=payment_notifications|action=create	recurring_payment	Completed	2W822307XW2423303	12	2017-08-08 11:21:37.006859	2017-08-08 11:21:37.006859
201	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:08:54 Aug 09, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AwN95I1todZR.HmQ7EkgJds232L3A8Xk7jB6q2dOr.PXAF1DWPCw7AAY|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=26525766M9622443R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=da59bd2fa69f4|controller=payment_notifications|action=create	recurring_payment	Completed	26525766M9622443R	13	2017-08-09 11:09:03.04517	2017-08-09 11:09:03.04517
202	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 10, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:11:28 Aug 09, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AMmBnrHtWGvSkk06jUOpWl63TjWcAMR1Wpk-MGdpNUDZ9eSMqTnJthVX|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0JE847189B151153L|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=d26ef20066002|controller=payment_notifications|action=create	recurring_payment	Completed	0JE847189B151153L	12	2017-08-09 13:12:41.61979	2017-08-09 13:12:41.61979
203	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:15:53 Aug 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ai1PaghZh5FmBLCDCTQpwG8jB264AZulqRVArnHRVqI804d8PnqcUvPh|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1BK37329NT156635U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=a26d6df11025|controller=payment_notifications|action=create	recurring_payment	Completed	1BK37329NT156635U	12	2017-08-10 12:47:34.793599	2017-08-10 12:47:34.793599
204	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 11, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:53:42 Aug 10, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A--8MSCLabuvN8L.-MHjxC9uypBtA1ONRSWDpIn-oNvN3bzCX2rk3VGS|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=9CA93380P0280862H|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=049d1f8ced7c1|controller=payment_notifications|action=create	recurring_payment	Completed	9CA93380P0280862H	13	2017-08-10 13:22:05.757321	2017-08-10 13:22:05.757321
206	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:52:00 Aug 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Auut4PlTFe6O8w0mvD1akJNKjbE3AN8MP.1c9ll-NC-dpG84IsZwSyhZ|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=28M92016WN519473M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=5e3ec21976e34|controller=payment_notifications|action=create	recurring_payment	Completed	28M92016WN519473M	13	2017-08-11 14:52:14.201304	2017-08-11 14:52:14.201304
207	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:43:19 Aug 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AvbrjyLw8e2V9PGT974X6JmrYVo9ALRx52bkTTcZ2hHHLnzpgxmu8DYS|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6UF043071F1920325|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=889bde5179cb3|controller=payment_notifications|action=create	recurring_payment	Completed	6UF043071F1920325	13	2017-08-12 11:44:12.711574	2017-08-12 11:44:12.711574
208	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 13, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:19:40 Aug 12, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A.CSYz4u5IILQm5wM0J0JbJiIcEuAMThhOdJgF7TKTAosnm12ogqhaTx|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=13255987S0280911R|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=7fdd95d03ff75|controller=payment_notifications|action=create	recurring_payment	Completed	13255987S0280911R	12	2017-08-12 14:19:53.983394	2017-08-12 14:19:53.983394
210	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 17, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:52:24 Aug 16, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AnJ2HUJsm40z244.ABNEwFR12hcFASukt0cChHiHC090T.ETB3prS6q5|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6LG78712B0262622W|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=fe280fc5be502|controller=payment_notifications|action=create	recurring_payment	Completed	6LG78712B0262622W	12	2017-08-24 09:39:56.399792	2017-08-24 09:39:56.399792
219	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 22, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:06:00 Aug 21, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ADvj-tIuMJxr3YEo-QPTwZC-2h.3A3K-vLPXvEpFfmKkPCtaMba8jlCE|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=27J148207S8966718|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=ee974f0ce7a48|controller=payment_notifications|action=create	recurring_payment	Completed	27J148207S8966718	12	2017-08-24 15:59:31.956105	2017-08-24 15:59:31.956105
205	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 12, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:00:21 Aug 11, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AdTGBgLJqHB6BwcvxY6ANgjjL6RcA-sAA4fOkbaocfsOOIvNrafM-pNX|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=139154009A0104353|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=7a9031f657e17|controller=payment_notifications|action=create	recurring_payment	Completed	139154009A0104353	12	2017-08-11 11:01:12.130204	2017-08-11 11:01:12.130204
209	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 23, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:59:23 Aug 22, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AUK9wrtQWuNVERgZdsILxXQAJRGVAXAC-etv4R6UpJ4Bj3qcyJsKrKyH|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=6PP64730BE888612E|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=25e5b21d5f85c|controller=payment_notifications|action=create	recurring_payment	Completed	6PP64730BE888612E	12	2017-08-24 09:10:55.192856	2017-08-24 09:10:55.192856
211	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 20, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=08:04:27 Aug 19, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=A5uQFvjc.UJtfUjlRK-VIf9WWQ8HAcyZBQiF4peNOREHnUfx61G9Mr-X|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3EK78157LY417463J|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=97d13081f3911|controller=payment_notifications|action=create	recurring_payment	Completed	3EK78157LY417463J	12	2017-08-24 10:01:38.866786	2017-08-24 10:01:38.866786
216	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 16, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:58:15 Aug 15, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ACvihIv6qn.ghXurvtLXrZhvQhB7A944CoLqu208yKAotFqTWn8fauoX|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=1EH0966633857970B|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=e4d14d5a807d7|controller=payment_notifications|action=create	recurring_payment	Completed	1EH0966633857970B	12	2017-08-24 13:35:11.382216	2017-08-24 13:35:11.382216
212	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=07:15:33 Aug 14, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AnV43zAiO44cYCY7WnPeRyVuk19pAPrKQ-KAXUK1PRDm-kyxF07cAA1n|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2DV10023GX932440A|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=9625f1d5e258b|controller=payment_notifications|action=create	recurring_payment	Completed	2DV10023GX932440A	13	2017-08-24 11:57:15.575095	2017-08-24 11:57:15.575095
214	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 21, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:37:32 Aug 20, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=ARlhq6hLAVqXSD5s.6w.I67yISfcAtkwVWTT2TVoleNcvT6HGUZGHjTH|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=8PF448744X973391U|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=8a312b387454d|controller=payment_notifications|action=create	recurring_payment	Completed	8PF448744X973391U	12	2017-08-24 12:34:45.64752	2017-08-24 12:34:45.64752
215	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 14, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=06:52:47 Aug 13, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-GUT5LGJ86USA|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AkBezA742JXefy3.CqZeGMWuR29lAAccYA-CAljEKK9zGsjxSU3n6sHP|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=2JX18706VN689833B|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=22:54:16 Jul 09, 2017 PDT|ipn_track_id=c748f6365196c|controller=payment_notifications|action=create	recurring_payment	Completed	2JX18706VN689833B	13	2017-08-24 13:25:11.327634	2017-08-24 13:25:11.327634
213	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 18, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=03:57:11 Aug 17, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AFln1XTG5ic49NimQuUsEdesIkJ1AskAT7M8x11HXrACJaCLqodRQf9A|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3XX872933E881014V|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=30fcdbf7c84f0|controller=payment_notifications|action=create	recurring_payment	Completed	3XX872933E881014V	12	2017-08-24 12:17:09.917001	2017-08-24 12:17:09.917001
217	payment_cycle=Daily|txn_type=recurring_payment_suspended_due_to_max_failed_payment|last_name=Wayne|next_payment_date=N/A|residence_country=US|initial_payment_amount=0.00|currency_code=USD|time_created=22:54:16 Jul 09, 2017 PDT|verify_sign=AifRXePG8-WX5zRFTirXvnmeI8dSAS0MBEGMUO-2DyPnRkUQLld0m43C|period_type= Regular|payer_status=verified|test_ipn=1|tax=0.00|payer_email=chezca1228@yahoo.com|first_name=Thomas|receiver_email=development@appsourcev4.com|payer_id=A979FXHAL7YHA|product_type=1|shipping=0.00|amount_per_cycle=799.98|profile_status=Suspended|charset=windows-1252|notify_version=3.8|amount=799.98|outstanding_balance=799.98|recurring_payment_id=I-GUT5LGJ86USA|product_name=Yearly Payment for a total of 2 branches|ipn_track_id=e2e6d04d63a8d|controller=payment_notifications|action=create	recurring_payment_suspended_due_to_max_failed_payment	\N	\N	13	2017-08-24 13:35:15.111358	2017-08-24 13:35:15.111358
218	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 19, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:25:24 Aug 18, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AuJSHhUcP.t0KLZLPdnCHuuKZZEnAR3Pb68uWOOqw1041GVznpjd63tp|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=3NJ441561X016823M|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=bb558a317e12e|controller=payment_notifications|action=create	recurring_payment	Completed	3NJ441561X016823M	12	2017-08-24 13:58:17.322723	2017-08-24 13:58:17.322723
220	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 14, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=05:25:55 Aug 13, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=AmaRhnanYPKcNtVevHkWfXA-4NJwAz1QtSodbvDyc6Hvb7xDxJykokwM|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=5F9329062W8696818|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=f5615eb0e8bb9|controller=payment_notifications|action=create	recurring_payment	Completed	5F9329062W8696818	12	2017-08-24 19:25:26.461841	2017-08-24 19:25:26.461841
221	mc_gross=799.98|outstanding_balance=0.00|period_type= Regular|next_payment_date=03:00:00 Aug 15, 2017 PDT|protection_eligibility=Ineligible|payment_cycle=Daily|tax=0.00|payer_id=A979FXHAL7YHA|payment_date=04:20:42 Aug 14, 2017 PDT|payment_status=Completed|product_name=Yearly Payment for a total of 2 branches|charset=windows-1252|recurring_payment_id=I-BC9L3UJTV3SF|first_name=Thomas|mc_fee=23.50|notify_version=3.8|amount_per_cycle=799.98|payer_status=verified|currency_code=USD|business=development@appsourcev4.com|verify_sign=Ap0TlumVsEjiMiLKsZewhZcZAKzCAHHmFT2KqWX.xPCZf8VGLMOzsk7x|payer_email=chezca1228@yahoo.com|initial_payment_amount=0.00|profile_status=Active|amount=799.98|txn_id=0MF355939T885803C|payment_type=instant|last_name=Wayne|receiver_email=development@appsourcev4.com|payment_fee=23.50|receiver_id=735EDMPEM8498|txn_type=recurring_payment|mc_currency=USD|residence_country=US|test_ipn=1|transaction_subject=Yearly Payment for a total of 2 branches|payment_gross=799.98|shipping=0.00|product_type=1|time_created=19:50:56 Apr 03, 2017 PDT|ipn_track_id=64bc4f82eb511|controller=payment_notifications|action=create	recurring_payment	Completed	0MF355939T885803C	12	2017-08-24 19:29:51.337662	2017-08-24 19:29:51.337662
\.


--
-- Name: payment_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('payment_notifications_id_seq', 221, true);


--
-- Data for Name: per_brand_orders; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY per_brand_orders (id, branch_id, order_list_id, order_per_supplier_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: per_brand_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('per_brand_orders_id_seq', 1, false);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY permissions (id, role_id, section_id, client_id, is_create, is_read, is_update, is_destroy, created_at, updated_at) FROM stdin;
1	1	1	1	t	t	t	t	2016-04-18 01:34:40.966617	2016-04-18 01:34:40.966617
2	1	2	1	t	t	t	t	2016-04-18 01:34:40.975459	2016-04-18 01:34:40.975459
3	1	3	1	t	t	t	t	2016-04-18 01:34:40.978944	2016-04-18 01:34:40.978944
4	1	4	1	t	t	t	t	2016-04-18 01:34:40.982707	2016-04-18 01:34:40.982707
5	1	5	1	t	t	t	t	2016-04-18 01:34:40.986218	2016-04-18 01:34:40.986218
6	1	6	1	t	t	t	t	2016-04-18 01:34:41.001379	2016-04-18 01:34:41.001379
7	1	7	1	t	t	t	t	2016-04-18 01:34:41.004667	2016-04-18 01:34:41.004667
8	1	8	1	t	t	t	t	2016-04-18 01:34:41.008629	2016-04-18 01:34:41.008629
9	1	9	1	t	t	t	t	2016-04-18 01:34:41.015301	2016-04-18 01:34:41.015301
10	1	10	1	t	t	t	t	2016-04-18 01:34:41.018682	2016-04-18 01:34:41.018682
11	1	11	1	t	t	t	t	2016-04-18 01:34:41.025291	2016-04-18 01:34:41.025291
12	1	12	1	t	t	t	t	2016-04-18 01:34:41.029156	2016-04-18 01:34:41.029156
13	1	13	1	t	t	t	t	2016-04-18 01:34:41.035724	2016-04-18 01:34:41.035724
14	1	14	1	t	t	t	t	2016-04-18 01:34:41.0391	2016-04-18 01:34:41.0391
15	1	15	1	t	t	t	t	2016-04-18 01:34:41.045549	2016-04-18 01:34:41.045549
16	1	16	1	t	t	t	t	2016-04-18 01:34:41.04876	2016-04-18 01:34:41.04876
17	1	17	1	t	t	t	t	2016-04-18 01:34:41.055143	2016-04-18 01:34:41.055143
18	1	18	1	t	t	t	t	2016-04-18 01:34:41.066136	2016-04-18 01:34:41.066136
19	1	19	1	t	t	t	t	2016-04-18 01:34:41.07003	2016-04-18 01:34:41.07003
20	1	20	1	t	t	t	t	2016-04-18 01:34:41.073297	2016-04-18 01:34:41.073297
21	1	21	1	t	t	t	t	2016-04-18 01:34:41.079629	2016-04-18 01:34:41.079629
22	1	22	1	t	t	t	t	2016-04-18 01:34:41.088437	2016-04-18 01:34:41.088437
23	1	23	1	t	t	t	t	2016-04-18 01:34:41.093117	2016-04-18 01:34:41.093117
24	1	24	1	t	t	t	t	2016-04-18 01:34:41.098205	2016-04-18 01:34:41.098205
25	2	1	1	f	t	f	f	2016-04-18 01:34:41.111301	2016-04-18 01:34:41.111301
26	2	2	1	f	t	f	f	2016-04-18 01:34:41.118094	2016-04-18 01:34:41.118094
27	2	3	1	f	t	f	f	2016-04-18 01:34:41.121173	2016-04-18 01:34:41.121173
28	2	4	1	f	t	f	f	2016-04-18 01:34:41.131411	2016-04-18 01:34:41.131411
29	2	5	1	f	t	f	f	2016-04-18 01:34:41.134492	2016-04-18 01:34:41.134492
30	2	6	1	f	t	f	f	2016-04-18 01:34:41.137598	2016-04-18 01:34:41.137598
31	2	7	1	f	t	f	f	2016-04-18 01:34:41.141199	2016-04-18 01:34:41.141199
32	2	8	1	f	t	f	f	2016-04-18 01:34:41.147949	2016-04-18 01:34:41.147949
33	2	9	1	f	t	f	f	2016-04-18 01:34:41.150788	2016-04-18 01:34:41.150788
34	2	10	1	f	t	f	f	2016-04-18 01:34:41.157357	2016-04-18 01:34:41.157357
35	2	11	1	f	t	f	f	2016-04-18 01:34:41.160319	2016-04-18 01:34:41.160319
36	2	12	1	f	t	f	f	2016-04-18 01:34:41.166963	2016-04-18 01:34:41.166963
37	2	13	1	f	t	f	f	2016-04-18 01:34:41.169822	2016-04-18 01:34:41.169822
38	2	14	1	f	t	f	f	2016-04-18 01:34:41.176608	2016-04-18 01:34:41.176608
39	2	15	1	f	t	f	f	2016-04-18 01:34:41.179506	2016-04-18 01:34:41.179506
40	2	16	1	f	t	f	f	2016-04-18 01:34:41.186082	2016-04-18 01:34:41.186082
41	2	17	1	f	t	f	f	2016-04-18 01:34:41.189033	2016-04-18 01:34:41.189033
42	2	18	1	f	t	f	f	2016-04-18 01:34:41.195712	2016-04-18 01:34:41.195712
49	3	1	1	f	t	f	f	2016-04-18 01:34:41.236568	2016-04-18 01:34:41.236568
50	3	2	1	f	t	f	f	2016-04-18 01:34:41.24799	2016-04-18 01:34:41.24799
51	3	3	1	f	t	f	f	2016-04-18 01:34:41.250834	2016-04-18 01:34:41.250834
52	3	4	1	f	t	f	f	2016-04-18 01:34:41.254713	2016-04-18 01:34:41.254713
53	3	5	1	f	t	f	f	2016-04-18 01:34:41.257664	2016-04-18 01:34:41.257664
54	3	6	1	f	t	f	f	2016-04-18 01:34:41.267442	2016-04-18 01:34:41.267442
55	3	7	1	f	t	f	f	2016-04-18 01:34:41.271022	2016-04-18 01:34:41.271022
56	3	8	1	f	t	f	f	2016-04-18 01:34:41.276955	2016-04-18 01:34:41.276955
57	3	9	1	f	t	f	f	2016-04-18 01:34:41.282972	2016-04-18 01:34:41.282972
58	3	10	1	f	t	f	f	2016-04-18 01:34:41.285796	2016-04-18 01:34:41.285796
59	3	11	1	f	t	f	f	2016-04-18 01:34:41.289169	2016-04-18 01:34:41.289169
60	3	12	1	f	t	f	f	2016-04-18 01:34:41.296015	2016-04-18 01:34:41.296015
61	3	13	1	f	t	f	f	2016-04-18 01:34:41.298877	2016-04-18 01:34:41.298877
62	3	14	1	f	t	f	f	2016-04-18 01:34:41.305535	2016-04-18 01:34:41.305535
63	3	15	1	f	t	f	f	2016-04-18 01:34:41.308395	2016-04-18 01:34:41.308395
64	3	16	1	f	t	f	f	2016-04-18 01:34:41.315002	2016-04-18 01:34:41.315002
65	3	17	1	f	t	f	f	2016-04-18 01:34:41.317922	2016-04-18 01:34:41.317922
66	3	18	1	f	t	f	f	2016-04-18 01:34:41.324647	2016-04-18 01:34:41.324647
67	3	19	1	f	t	f	f	2016-04-18 01:34:41.327515	2016-04-18 01:34:41.327515
68	3	20	1	f	t	f	f	2016-04-18 01:34:41.334102	2016-04-18 01:34:41.334102
69	3	21	1	f	t	f	f	2016-04-18 01:34:41.33699	2016-04-18 01:34:41.33699
70	3	22	1	f	t	f	f	2016-04-18 01:34:41.344189	2016-04-18 01:34:41.344189
73	4	1	2	t	t	t	t	2016-05-05 00:55:58.359749	2016-05-05 00:55:58.359749
74	4	2	2	t	t	t	t	2016-05-05 00:55:58.367447	2016-05-05 00:55:58.367447
75	4	3	2	t	t	t	t	2016-05-05 00:55:58.370909	2016-05-05 00:55:58.370909
76	4	4	2	t	t	t	t	2016-05-05 00:55:58.378094	2016-05-05 00:55:58.378094
77	4	5	2	t	t	t	t	2016-05-05 00:55:58.381521	2016-05-05 00:55:58.381521
78	4	6	2	t	t	t	t	2016-05-05 00:55:58.388747	2016-05-05 00:55:58.388747
79	4	7	2	t	t	t	t	2016-05-05 00:55:58.392146	2016-05-05 00:55:58.392146
80	4	8	2	t	t	t	t	2016-05-05 00:55:58.399442	2016-05-05 00:55:58.399442
81	4	9	2	t	t	t	t	2016-05-05 00:55:58.402598	2016-05-05 00:55:58.402598
82	4	10	2	t	t	t	t	2016-05-05 00:55:58.410286	2016-05-05 00:55:58.410286
83	4	11	2	t	t	t	t	2016-05-05 00:55:58.41344	2016-05-05 00:55:58.41344
84	4	12	2	t	t	t	t	2016-05-05 00:55:58.420259	2016-05-05 00:55:58.420259
85	4	13	2	t	t	t	t	2016-05-05 00:55:58.423102	2016-05-05 00:55:58.423102
86	4	14	2	t	t	t	t	2016-05-05 00:55:58.429762	2016-05-05 00:55:58.429762
87	4	15	2	t	t	t	t	2016-05-05 00:55:58.432634	2016-05-05 00:55:58.432634
88	4	16	2	t	t	t	t	2016-05-05 00:55:58.439153	2016-05-05 00:55:58.439153
89	4	17	2	t	t	t	t	2016-05-05 00:55:58.459123	2016-05-05 00:55:58.459123
90	4	18	2	t	t	t	t	2016-05-05 00:55:58.462392	2016-05-05 00:55:58.462392
91	4	19	2	t	t	t	t	2016-05-05 00:55:58.469096	2016-05-05 00:55:58.469096
92	4	20	2	t	t	t	t	2016-05-05 00:55:58.472166	2016-05-05 00:55:58.472166
93	4	21	2	t	t	t	t	2016-05-05 00:55:58.478805	2016-05-05 00:55:58.478805
94	4	22	2	t	t	t	t	2016-05-05 00:55:58.481721	2016-05-05 00:55:58.481721
95	4	23	2	t	t	t	t	2016-05-05 00:55:58.488696	2016-05-05 00:55:58.488696
96	4	24	2	t	t	t	t	2016-05-05 00:55:58.49181	2016-05-05 00:55:58.49181
97	5	1	2	f	t	f	f	2016-05-05 00:55:58.508183	2016-05-05 00:55:58.508183
98	5	2	2	f	t	f	f	2016-05-05 00:55:58.511625	2016-05-05 00:55:58.511625
99	5	3	2	f	t	f	f	2016-05-05 00:55:58.514638	2016-05-05 00:55:58.514638
100	5	4	2	f	t	f	f	2016-05-05 00:55:58.517596	2016-05-05 00:55:58.517596
101	5	5	2	f	t	f	f	2016-05-05 00:55:58.521015	2016-05-05 00:55:58.521015
102	5	6	2	f	t	f	f	2016-05-05 00:55:58.527867	2016-05-05 00:55:58.527867
103	5	7	2	f	t	f	f	2016-05-05 00:55:58.531163	2016-05-05 00:55:58.531163
104	5	8	2	f	t	f	f	2016-05-05 00:55:58.537985	2016-05-05 00:55:58.537985
105	5	9	2	f	t	f	f	2016-05-05 00:55:58.541304	2016-05-05 00:55:58.541304
106	5	10	2	f	t	f	f	2016-05-05 00:55:58.548283	2016-05-05 00:55:58.548283
107	5	11	2	f	t	f	f	2016-05-05 00:55:58.551558	2016-05-05 00:55:58.551558
108	5	12	2	f	t	f	f	2016-05-05 00:55:58.558504	2016-05-05 00:55:58.558504
109	5	13	2	f	t	f	f	2016-05-05 00:55:58.561684	2016-05-05 00:55:58.561684
110	5	14	2	f	t	f	f	2016-05-05 00:55:58.568623	2016-05-05 00:55:58.568623
111	5	15	2	f	t	f	f	2016-05-05 00:55:58.57165	2016-05-05 00:55:58.57165
112	5	16	2	f	t	f	f	2016-05-05 00:55:58.578603	2016-05-05 00:55:58.578603
113	5	17	2	f	t	f	f	2016-05-05 00:55:58.581645	2016-05-05 00:55:58.581645
114	5	18	2	f	t	f	f	2016-05-05 00:55:58.588687	2016-05-05 00:55:58.588687
115	5	19	2	f	t	f	f	2016-05-05 00:55:58.591753	2016-05-05 00:55:58.591753
116	5	20	2	f	t	f	f	2016-05-05 00:55:58.598714	2016-05-05 00:55:58.598714
117	5	21	2	f	t	f	f	2016-05-05 00:55:58.601918	2016-05-05 00:55:58.601918
118	5	22	2	f	t	f	f	2016-05-05 00:55:58.609039	2016-05-05 00:55:58.609039
119	5	23	2	f	t	f	f	2016-05-05 00:55:58.612108	2016-05-05 00:55:58.612108
120	5	24	2	f	t	f	f	2016-05-05 00:55:58.618747	2016-05-05 00:55:58.618747
48	2	24	1	t	t	t	t	2016-04-18 01:34:41.224308	2017-03-02 06:07:40.982398
47	2	23	1	t	t	t	t	2016-04-18 01:34:41.221361	2017-03-02 06:07:40.993608
121	6	1	2	f	t	f	f	2016-05-05 00:55:58.631388	2016-05-05 00:55:58.631388
122	6	2	2	f	t	f	f	2016-05-05 00:55:58.638643	2016-05-05 00:55:58.638643
123	6	3	2	f	t	f	f	2016-05-05 00:55:58.641777	2016-05-05 00:55:58.641777
124	6	4	2	f	t	f	f	2016-05-05 00:55:58.648556	2016-05-05 00:55:58.648556
125	6	5	2	f	t	f	f	2016-05-05 00:55:58.655172	2016-05-05 00:55:58.655172
126	6	6	2	f	t	f	f	2016-05-05 00:55:58.658385	2016-05-05 00:55:58.658385
127	6	7	2	f	t	f	f	2016-05-05 00:55:58.664949	2016-05-05 00:55:58.664949
128	6	8	2	f	t	f	f	2016-05-05 00:55:58.667945	2016-05-05 00:55:58.667945
129	6	9	2	f	t	f	f	2016-05-05 00:55:58.670902	2016-05-05 00:55:58.670902
130	6	10	2	f	t	f	f	2016-05-05 00:55:58.673958	2016-05-05 00:55:58.673958
131	6	11	2	f	t	f	f	2016-05-05 00:55:58.677037	2016-05-05 00:55:58.677037
132	6	12	2	f	t	f	f	2016-05-05 00:55:58.680171	2016-05-05 00:55:58.680171
133	6	13	2	f	t	f	f	2016-05-05 00:55:58.686874	2016-05-05 00:55:58.686874
134	6	14	2	f	t	f	f	2016-05-05 00:55:58.693517	2016-05-05 00:55:58.693517
135	6	15	2	f	t	f	f	2016-05-05 00:55:58.696555	2016-05-05 00:55:58.696555
136	6	16	2	f	t	f	f	2016-05-05 00:55:58.703198	2016-05-05 00:55:58.703198
137	6	17	2	f	t	f	f	2016-05-05 00:55:58.706181	2016-05-05 00:55:58.706181
138	6	18	2	f	t	f	f	2016-05-05 00:55:58.712725	2016-05-05 00:55:58.712725
139	6	19	2	f	t	f	f	2016-05-05 00:55:58.715775	2016-05-05 00:55:58.715775
142	6	22	2	f	t	f	f	2016-05-05 00:55:58.733459	2016-05-05 00:55:58.733459
143	6	23	2	f	t	f	f	2016-05-05 00:55:58.740066	2016-05-05 00:55:58.740066
144	6	24	2	f	t	f	f	2016-05-05 00:55:58.743265	2016-05-05 00:55:58.743265
145	7	1	3	t	t	t	t	2016-07-17 02:45:53.57278	2016-07-17 02:45:53.57278
146	7	2	3	t	t	t	t	2016-07-17 02:45:53.577114	2016-07-17 02:45:53.577114
147	7	3	3	t	t	t	t	2016-07-17 02:45:53.584299	2016-07-17 02:45:53.584299
148	7	4	3	t	t	t	t	2016-07-17 02:45:53.591631	2016-07-17 02:45:53.591631
149	7	5	3	t	t	t	t	2016-07-17 02:45:53.594955	2016-07-17 02:45:53.594955
150	7	6	3	t	t	t	t	2016-07-17 02:45:53.602003	2016-07-17 02:45:53.602003
151	7	7	3	t	t	t	t	2016-07-17 02:45:53.605486	2016-07-17 02:45:53.605486
152	7	8	3	t	t	t	t	2016-07-17 02:45:53.612379	2016-07-17 02:45:53.612379
153	7	9	3	t	t	t	t	2016-07-17 02:45:53.615398	2016-07-17 02:45:53.615398
154	7	10	3	t	t	t	t	2016-07-17 02:45:53.622584	2016-07-17 02:45:53.622584
155	7	11	3	t	t	t	t	2016-07-17 02:45:53.625629	2016-07-17 02:45:53.625629
156	7	12	3	t	t	t	t	2016-07-17 02:45:53.633693	2016-07-17 02:45:53.633693
157	7	13	3	t	t	t	t	2016-07-17 02:45:53.637019	2016-07-17 02:45:53.637019
158	7	14	3	t	t	t	t	2016-07-17 02:45:53.644329	2016-07-17 02:45:53.644329
159	7	15	3	t	t	t	t	2016-07-17 02:45:53.647363	2016-07-17 02:45:53.647363
160	7	16	3	t	t	t	t	2016-07-17 02:45:53.654298	2016-07-17 02:45:53.654298
161	7	17	3	t	t	t	t	2016-07-17 02:45:53.65766	2016-07-17 02:45:53.65766
162	7	18	3	t	t	t	t	2016-07-17 02:45:53.664763	2016-07-17 02:45:53.664763
163	7	19	3	t	t	t	t	2016-07-17 02:45:53.667712	2016-07-17 02:45:53.667712
164	7	20	3	t	t	t	t	2016-07-17 02:45:53.674944	2016-07-17 02:45:53.674944
165	7	21	3	t	t	t	t	2016-07-17 02:45:53.677968	2016-07-17 02:45:53.677968
166	7	22	3	t	t	t	t	2016-07-17 02:45:53.684946	2016-07-17 02:45:53.684946
167	7	23	3	t	t	t	t	2016-07-17 02:45:53.692323	2016-07-17 02:45:53.692323
168	7	24	3	t	t	t	t	2016-07-17 02:45:53.695418	2016-07-17 02:45:53.695418
169	8	1	3	f	t	f	f	2016-07-17 02:45:53.712649	2016-07-17 02:45:53.712649
170	8	2	3	f	t	f	f	2016-07-17 02:45:53.716338	2016-07-17 02:45:53.716338
171	8	3	3	f	t	f	f	2016-07-17 02:45:53.723328	2016-07-17 02:45:53.723328
172	8	4	3	f	t	f	f	2016-07-17 02:45:53.726671	2016-07-17 02:45:53.726671
173	8	5	3	f	t	f	f	2016-07-17 02:45:53.733705	2016-07-17 02:45:53.733705
174	8	6	3	f	t	f	f	2016-07-17 02:45:53.736948	2016-07-17 02:45:53.736948
175	8	7	3	f	t	f	f	2016-07-17 02:45:53.743872	2016-07-17 02:45:53.743872
176	8	8	3	f	t	f	f	2016-07-17 02:45:53.746861	2016-07-17 02:45:53.746861
177	8	9	3	f	t	f	f	2016-07-17 02:45:53.754054	2016-07-17 02:45:53.754054
178	8	10	3	f	t	f	f	2016-07-17 02:45:53.757036	2016-07-17 02:45:53.757036
179	8	11	3	f	t	f	f	2016-07-17 02:45:53.764186	2016-07-17 02:45:53.764186
180	8	12	3	f	t	f	f	2016-07-17 02:45:53.771487	2016-07-17 02:45:53.771487
181	8	13	3	f	t	f	f	2016-07-17 02:45:53.774582	2016-07-17 02:45:53.774582
182	8	14	3	f	t	f	f	2016-07-17 02:45:53.781706	2016-07-17 02:45:53.781706
183	8	15	3	f	t	f	f	2016-07-17 02:45:53.784751	2016-07-17 02:45:53.784751
184	8	16	3	f	t	f	f	2016-07-17 02:45:53.791789	2016-07-17 02:45:53.791789
185	8	17	3	f	t	f	f	2016-07-17 02:45:53.794737	2016-07-17 02:45:53.794737
186	8	18	3	f	t	f	f	2016-07-17 02:45:53.801843	2016-07-17 02:45:53.801843
187	8	19	3	f	t	f	f	2016-07-17 02:45:53.804853	2016-07-17 02:45:53.804853
188	8	20	3	f	t	f	f	2016-07-17 02:45:53.812308	2016-07-17 02:45:53.812308
189	8	21	3	f	t	f	f	2016-07-17 02:45:53.815271	2016-07-17 02:45:53.815271
190	8	22	3	f	t	f	f	2016-07-17 02:45:53.822408	2016-07-17 02:45:53.822408
191	8	23	3	f	t	f	f	2016-07-17 02:45:53.825637	2016-07-17 02:45:53.825637
192	8	24	3	f	t	f	f	2016-07-17 02:45:53.83287	2016-07-17 02:45:53.83287
193	9	1	3	f	t	f	f	2016-07-17 02:45:53.845807	2016-07-17 02:45:53.845807
194	9	2	3	f	t	f	f	2016-07-17 02:45:53.85314	2016-07-17 02:45:53.85314
195	9	3	3	f	t	f	f	2016-07-17 02:45:53.856152	2016-07-17 02:45:53.856152
196	9	4	3	f	t	f	f	2016-07-17 02:45:53.863028	2016-07-17 02:45:53.863028
197	9	5	3	f	t	f	f	2016-07-17 02:45:53.866259	2016-07-17 02:45:53.866259
198	9	6	3	f	t	f	f	2016-07-17 02:45:53.873101	2016-07-17 02:45:53.873101
199	9	7	3	f	t	f	f	2016-07-17 02:45:53.876417	2016-07-17 02:45:53.876417
200	9	8	3	f	t	f	f	2016-07-17 02:45:53.883569	2016-07-17 02:45:53.883569
201	9	9	3	f	t	f	f	2016-07-17 02:45:53.890703	2016-07-17 02:45:53.890703
202	9	10	3	f	t	f	f	2016-07-17 02:45:53.894058	2016-07-17 02:45:53.894058
203	9	11	3	f	t	f	f	2016-07-17 02:45:53.901175	2016-07-17 02:45:53.901175
204	9	12	3	f	t	f	f	2016-07-17 02:45:53.904208	2016-07-17 02:45:53.904208
205	9	13	3	f	t	f	f	2016-07-17 02:45:53.911707	2016-07-17 02:45:53.911707
206	9	14	3	f	t	f	f	2016-07-17 02:45:53.91497	2016-07-17 02:45:53.91497
207	9	15	3	f	t	f	f	2016-07-17 02:45:53.922281	2016-07-17 02:45:53.922281
208	9	16	3	f	t	f	f	2016-07-17 02:45:53.925629	2016-07-17 02:45:53.925629
209	9	17	3	f	t	f	f	2016-07-17 02:45:53.932849	2016-07-17 02:45:53.932849
210	9	18	3	f	t	f	f	2016-07-17 02:45:53.935919	2016-07-17 02:45:53.935919
211	9	19	3	f	t	f	f	2016-07-17 02:45:53.943297	2016-07-17 02:45:53.943297
212	9	20	3	f	t	f	f	2016-07-17 02:45:53.950573	2016-07-17 02:45:53.950573
213	9	21	3	f	t	f	f	2016-07-17 02:45:53.953944	2016-07-17 02:45:53.953944
214	9	22	3	f	t	f	f	2016-07-17 02:45:53.961237	2016-07-17 02:45:53.961237
215	9	23	3	f	t	f	f	2016-07-17 02:45:53.964651	2016-07-17 02:45:53.964651
216	9	24	3	f	t	f	f	2016-07-17 02:45:53.971795	2016-07-17 02:45:53.971795
217	10	1	4	t	t	t	t	2016-08-06 10:57:34.443599	2016-08-06 10:57:34.443599
218	10	2	4	t	t	t	t	2016-08-06 10:57:34.447789	2016-08-06 10:57:34.447789
219	10	3	4	t	t	t	t	2016-08-06 10:57:34.45482	2016-08-06 10:57:34.45482
220	10	4	4	t	t	t	t	2016-08-06 10:57:34.458092	2016-08-06 10:57:34.458092
221	10	5	4	t	t	t	t	2016-08-06 10:57:34.465068	2016-08-06 10:57:34.465068
222	10	6	4	t	t	t	t	2016-08-06 10:57:34.468042	2016-08-06 10:57:34.468042
223	10	7	4	t	t	t	t	2016-08-06 10:57:34.474852	2016-08-06 10:57:34.474852
224	10	8	4	t	t	t	t	2016-08-06 10:57:34.477661	2016-08-06 10:57:34.477661
225	10	9	4	t	t	t	t	2016-08-06 10:57:34.48434	2016-08-06 10:57:34.48434
226	10	10	4	t	t	t	t	2016-08-06 10:57:34.487115	2016-08-06 10:57:34.487115
227	10	11	4	t	t	t	t	2016-08-06 10:57:34.493705	2016-08-06 10:57:34.493705
228	10	12	4	t	t	t	t	2016-08-06 10:57:34.496649	2016-08-06 10:57:34.496649
229	10	13	4	t	t	t	t	2016-08-06 10:57:34.499413	2016-08-06 10:57:34.499413
230	10	14	4	t	t	t	t	2016-08-06 10:57:34.506006	2016-08-06 10:57:34.506006
231	10	15	4	t	t	t	t	2016-08-06 10:57:34.508825	2016-08-06 10:57:34.508825
232	10	16	4	t	t	t	t	2016-08-06 10:57:34.515349	2016-08-06 10:57:34.515349
233	10	17	4	t	t	t	t	2016-08-06 10:57:34.518138	2016-08-06 10:57:34.518138
234	10	18	4	t	t	t	t	2016-08-06 10:57:34.524806	2016-08-06 10:57:34.524806
235	10	19	4	t	t	t	t	2016-08-06 10:57:34.527571	2016-08-06 10:57:34.527571
236	10	20	4	t	t	t	t	2016-08-06 10:57:34.534132	2016-08-06 10:57:34.534132
237	10	21	4	t	t	t	t	2016-08-06 10:57:34.536915	2016-08-06 10:57:34.536915
238	10	22	4	t	t	t	t	2016-08-06 10:57:34.543549	2016-08-06 10:57:34.543549
239	10	23	4	t	t	t	t	2016-08-06 10:57:34.54637	2016-08-06 10:57:34.54637
240	10	24	4	t	t	t	t	2016-08-06 10:57:34.552983	2016-08-06 10:57:34.552983
241	11	1	4	f	t	f	f	2016-08-06 10:57:34.565038	2016-08-06 10:57:34.565038
242	11	2	4	f	t	f	f	2016-08-06 10:57:34.568107	2016-08-06 10:57:34.568107
243	11	3	4	f	t	f	f	2016-08-06 10:57:34.574797	2016-08-06 10:57:34.574797
244	11	4	4	f	t	f	f	2016-08-06 10:57:34.577556	2016-08-06 10:57:34.577556
245	11	5	4	f	t	f	f	2016-08-06 10:57:34.584351	2016-08-06 10:57:34.584351
246	11	6	4	f	t	f	f	2016-08-06 10:57:34.587174	2016-08-06 10:57:34.587174
247	11	7	4	f	t	f	f	2016-08-06 10:57:34.593814	2016-08-06 10:57:34.593814
248	11	8	4	f	t	f	f	2016-08-06 10:57:34.596612	2016-08-06 10:57:34.596612
249	11	9	4	f	t	f	f	2016-08-06 10:57:34.603218	2016-08-06 10:57:34.603218
250	11	10	4	f	t	f	f	2016-08-06 10:57:34.606064	2016-08-06 10:57:34.606064
251	11	11	4	f	t	f	f	2016-08-06 10:57:34.612722	2016-08-06 10:57:34.612722
252	11	12	4	f	t	f	f	2016-08-06 10:57:34.615456	2016-08-06 10:57:34.615456
253	11	13	4	f	t	f	f	2016-08-06 10:57:34.618229	2016-08-06 10:57:34.618229
254	11	14	4	f	t	f	f	2016-08-06 10:57:34.624895	2016-08-06 10:57:34.624895
255	11	15	4	f	t	f	f	2016-08-06 10:57:34.627645	2016-08-06 10:57:34.627645
256	11	16	4	f	t	f	f	2016-08-06 10:57:34.634246	2016-08-06 10:57:34.634246
257	11	17	4	f	t	f	f	2016-08-06 10:57:34.637112	2016-08-06 10:57:34.637112
258	11	18	4	f	t	f	f	2016-08-06 10:57:34.643865	2016-08-06 10:57:34.643865
259	11	19	4	f	t	f	f	2016-08-06 10:57:34.646696	2016-08-06 10:57:34.646696
260	11	20	4	f	t	f	f	2016-08-06 10:57:34.653409	2016-08-06 10:57:34.653409
261	11	21	4	f	t	f	f	2016-08-06 10:57:34.6562	2016-08-06 10:57:34.6562
262	11	22	4	f	t	f	f	2016-08-06 10:57:34.662857	2016-08-06 10:57:34.662857
263	11	23	4	f	t	f	f	2016-08-06 10:57:34.665637	2016-08-06 10:57:34.665637
264	11	24	4	f	t	f	f	2016-08-06 10:57:34.672272	2016-08-06 10:57:34.672272
265	12	1	4	f	t	f	f	2016-08-06 10:57:34.684224	2016-08-06 10:57:34.684224
266	12	2	4	f	t	f	f	2016-08-06 10:57:34.68701	2016-08-06 10:57:34.68701
267	12	3	4	f	t	f	f	2016-08-06 10:57:34.693597	2016-08-06 10:57:34.693597
268	12	4	4	f	t	f	f	2016-08-06 10:57:34.696335	2016-08-06 10:57:34.696335
269	12	5	4	f	t	f	f	2016-08-06 10:57:34.703063	2016-08-06 10:57:34.703063
270	12	6	4	f	t	f	f	2016-08-06 10:57:34.70597	2016-08-06 10:57:34.70597
271	12	7	4	f	t	f	f	2016-08-06 10:57:34.712559	2016-08-06 10:57:34.712559
272	12	8	4	f	t	f	f	2016-08-06 10:57:34.715348	2016-08-06 10:57:34.715348
273	12	9	4	f	t	f	f	2016-08-06 10:57:34.721899	2016-08-06 10:57:34.721899
274	12	10	4	f	t	f	f	2016-08-06 10:57:34.72471	2016-08-06 10:57:34.72471
275	12	11	4	f	t	f	f	2016-08-06 10:57:34.727394	2016-08-06 10:57:34.727394
276	12	12	4	f	t	f	f	2016-08-06 10:57:34.73396	2016-08-06 10:57:34.73396
277	12	13	4	f	t	f	f	2016-08-06 10:57:34.736718	2016-08-06 10:57:34.736718
278	12	14	4	f	t	f	f	2016-08-06 10:57:34.7433	2016-08-06 10:57:34.7433
279	12	15	4	f	t	f	f	2016-08-06 10:57:34.752753	2016-08-06 10:57:34.752753
280	12	16	4	f	t	f	f	2016-08-06 10:57:34.75559	2016-08-06 10:57:34.75559
281	12	17	4	f	t	f	f	2016-08-06 10:57:34.75833	2016-08-06 10:57:34.75833
282	12	18	4	f	t	f	f	2016-08-06 10:57:34.765208	2016-08-06 10:57:34.765208
283	12	19	4	f	t	f	f	2016-08-06 10:57:34.768697	2016-08-06 10:57:34.768697
284	12	20	4	f	t	f	f	2016-08-06 10:57:34.775599	2016-08-06 10:57:34.775599
285	12	21	4	f	t	f	f	2016-08-06 10:57:34.779174	2016-08-06 10:57:34.779174
286	12	22	4	f	t	f	f	2016-08-06 10:57:34.786118	2016-08-06 10:57:34.786118
287	12	23	4	f	t	f	f	2016-08-06 10:57:34.78925	2016-08-06 10:57:34.78925
288	12	24	4	f	t	f	f	2016-08-06 10:57:34.796254	2016-08-06 10:57:34.796254
289	13	1	5	t	t	t	t	2016-08-11 07:39:12.275564	2016-08-11 07:39:12.275564
290	13	2	5	t	t	t	t	2016-08-11 07:39:12.282874	2016-08-11 07:39:12.282874
291	13	3	5	t	t	t	t	2016-08-11 07:39:12.289811	2016-08-11 07:39:12.289811
292	13	4	5	t	t	t	t	2016-08-11 07:39:12.292824	2016-08-11 07:39:12.292824
293	13	5	5	t	t	t	t	2016-08-11 07:39:12.299539	2016-08-11 07:39:12.299539
294	13	6	5	t	t	t	t	2016-08-11 07:39:12.302446	2016-08-11 07:39:12.302446
295	13	7	5	t	t	t	t	2016-08-11 07:39:12.309214	2016-08-11 07:39:12.309214
296	13	8	5	t	t	t	t	2016-08-11 07:39:12.312139	2016-08-11 07:39:12.312139
297	13	9	5	t	t	t	t	2016-08-11 07:39:12.31888	2016-08-11 07:39:12.31888
298	13	10	5	t	t	t	t	2016-08-11 07:39:12.321725	2016-08-11 07:39:12.321725
299	13	11	5	t	t	t	t	2016-08-11 07:39:12.328453	2016-08-11 07:39:12.328453
300	13	12	5	t	t	t	t	2016-08-11 07:39:12.332553	2016-08-11 07:39:12.332553
301	13	13	5	t	t	t	t	2016-08-11 07:39:12.339276	2016-08-11 07:39:12.339276
302	13	14	5	t	t	t	t	2016-08-11 07:39:12.34239	2016-08-11 07:39:12.34239
303	13	15	5	t	t	t	t	2016-08-11 07:39:12.349246	2016-08-11 07:39:12.349246
304	13	16	5	t	t	t	t	2016-08-11 07:39:12.352216	2016-08-11 07:39:12.352216
305	13	17	5	t	t	t	t	2016-08-11 07:39:12.359156	2016-08-11 07:39:12.359156
306	13	18	5	t	t	t	t	2016-08-11 07:39:12.362531	2016-08-11 07:39:12.362531
307	13	19	5	t	t	t	t	2016-08-11 07:39:12.369849	2016-08-11 07:39:12.369849
308	13	20	5	t	t	t	t	2016-08-11 07:39:12.372811	2016-08-11 07:39:12.372811
309	13	21	5	t	t	t	t	2016-08-11 07:39:12.379672	2016-08-11 07:39:12.379672
310	13	22	5	t	t	t	t	2016-08-11 07:39:12.382583	2016-08-11 07:39:12.382583
311	13	23	5	t	t	t	t	2016-08-11 07:39:12.389411	2016-08-11 07:39:12.389411
312	13	24	5	t	t	t	t	2016-08-11 07:39:12.392348	2016-08-11 07:39:12.392348
313	14	1	5	f	t	f	f	2016-08-11 07:39:12.408399	2016-08-11 07:39:12.408399
314	14	2	5	f	t	f	f	2016-08-11 07:39:12.411508	2016-08-11 07:39:12.411508
315	14	3	5	f	t	f	f	2016-08-11 07:39:12.414321	2016-08-11 07:39:12.414321
316	14	4	5	f	t	f	f	2016-08-11 07:39:12.421088	2016-08-11 07:39:12.421088
317	14	5	5	f	t	f	f	2016-08-11 07:39:12.423978	2016-08-11 07:39:12.423978
318	14	6	5	f	t	f	f	2016-08-11 07:39:12.430724	2016-08-11 07:39:12.430724
319	14	7	5	f	t	f	f	2016-08-11 07:39:12.433527	2016-08-11 07:39:12.433527
320	14	8	5	f	t	f	f	2016-08-11 07:39:12.440425	2016-08-11 07:39:12.440425
321	14	9	5	f	t	f	f	2016-08-11 07:39:12.443213	2016-08-11 07:39:12.443213
322	14	10	5	f	t	f	f	2016-08-11 07:39:12.449982	2016-08-11 07:39:12.449982
323	14	11	5	f	t	f	f	2016-08-11 07:39:12.452769	2016-08-11 07:39:12.452769
324	14	12	5	f	t	f	f	2016-08-11 07:39:12.45981	2016-08-11 07:39:12.45981
325	14	13	5	f	t	f	f	2016-08-11 07:39:12.462721	2016-08-11 07:39:12.462721
326	14	14	5	f	t	f	f	2016-08-11 07:39:12.469314	2016-08-11 07:39:12.469314
327	14	15	5	f	t	f	f	2016-08-11 07:39:12.472238	2016-08-11 07:39:12.472238
328	14	16	5	f	t	f	f	2016-08-11 07:39:12.47887	2016-08-11 07:39:12.47887
329	14	17	5	f	t	f	f	2016-08-11 07:39:12.48173	2016-08-11 07:39:12.48173
330	14	18	5	f	t	f	f	2016-08-11 07:39:12.488794	2016-08-11 07:39:12.488794
331	14	19	5	f	t	f	f	2016-08-11 07:39:12.491639	2016-08-11 07:39:12.491639
332	14	20	5	f	t	f	f	2016-08-11 07:39:12.501347	2016-08-11 07:39:12.501347
333	14	21	5	f	t	f	f	2016-08-11 07:39:12.508394	2016-08-11 07:39:12.508394
334	14	22	5	f	t	f	f	2016-08-11 07:39:12.517455	2016-08-11 07:39:12.517455
335	14	23	5	f	t	f	f	2016-08-11 07:39:12.520449	2016-08-11 07:39:12.520449
336	14	24	5	f	t	f	f	2016-08-11 07:39:12.527117	2016-08-11 07:39:12.527117
337	15	1	5	f	t	f	f	2016-08-11 07:39:12.539134	2016-08-11 07:39:12.539134
338	15	2	5	f	t	f	f	2016-08-11 07:39:12.542056	2016-08-11 07:39:12.542056
339	15	3	5	f	t	f	f	2016-08-11 07:39:12.548963	2016-08-11 07:39:12.548963
340	15	4	5	f	t	f	f	2016-08-11 07:39:12.551718	2016-08-11 07:39:12.551718
341	15	5	5	f	t	f	f	2016-08-11 07:39:12.558469	2016-08-11 07:39:12.558469
342	15	6	5	f	t	f	f	2016-08-11 07:39:12.561532	2016-08-11 07:39:12.561532
343	15	7	5	f	t	f	f	2016-08-11 07:39:12.568397	2016-08-11 07:39:12.568397
344	15	8	5	f	t	f	f	2016-08-11 07:39:12.571266	2016-08-11 07:39:12.571266
345	15	9	5	f	t	f	f	2016-08-11 07:39:12.577927	2016-08-11 07:39:12.577927
346	15	10	5	f	t	f	f	2016-08-11 07:39:12.580847	2016-08-11 07:39:12.580847
347	15	11	5	f	t	f	f	2016-08-11 07:39:12.587568	2016-08-11 07:39:12.587568
348	15	12	5	f	t	f	f	2016-08-11 07:39:12.590426	2016-08-11 07:39:12.590426
349	15	13	5	f	t	f	f	2016-08-11 07:39:12.597103	2016-08-11 07:39:12.597103
350	15	14	5	f	t	f	f	2016-08-11 07:39:12.600003	2016-08-11 07:39:12.600003
351	15	15	5	f	t	f	f	2016-08-11 07:39:12.606659	2016-08-11 07:39:12.606659
352	15	16	5	f	t	f	f	2016-08-11 07:39:12.609628	2016-08-11 07:39:12.609628
353	15	17	5	f	t	f	f	2016-08-11 07:39:12.616464	2016-08-11 07:39:12.616464
354	15	18	5	f	t	f	f	2016-08-11 07:39:12.6193	2016-08-11 07:39:12.6193
355	15	19	5	f	t	f	f	2016-08-11 07:39:12.626097	2016-08-11 07:39:12.626097
356	15	20	5	f	t	f	f	2016-08-11 07:39:12.629031	2016-08-11 07:39:12.629031
357	15	21	5	f	t	f	f	2016-08-11 07:39:12.631847	2016-08-11 07:39:12.631847
358	15	22	5	f	t	f	f	2016-08-11 07:39:12.638585	2016-08-11 07:39:12.638585
359	15	23	5	f	t	f	f	2016-08-11 07:39:12.645958	2016-08-11 07:39:12.645958
360	15	24	5	f	t	f	f	2016-08-11 07:39:12.648923	2016-08-11 07:39:12.648923
361	16	1	6	t	t	t	t	2016-08-13 08:30:25.678882	2016-08-13 08:30:25.678882
362	16	2	6	t	t	t	t	2016-08-13 08:30:25.68767	2016-08-13 08:30:25.68767
363	16	3	6	t	t	t	t	2016-08-13 08:30:25.695045	2016-08-13 08:30:25.695045
364	16	4	6	t	t	t	t	2016-08-13 08:30:25.698505	2016-08-13 08:30:25.698505
365	16	5	6	t	t	t	t	2016-08-13 08:30:25.705834	2016-08-13 08:30:25.705834
366	16	6	6	t	t	t	t	2016-08-13 08:30:25.709186	2016-08-13 08:30:25.709186
367	16	7	6	t	t	t	t	2016-08-13 08:30:25.716506	2016-08-13 08:30:25.716506
368	16	8	6	t	t	t	t	2016-08-13 08:30:25.719597	2016-08-13 08:30:25.719597
369	16	9	6	t	t	t	t	2016-08-13 08:30:25.726638	2016-08-13 08:30:25.726638
370	16	10	6	t	t	t	t	2016-08-13 08:30:25.72977	2016-08-13 08:30:25.72977
371	16	11	6	t	t	t	t	2016-08-13 08:30:25.736772	2016-08-13 08:30:25.736772
372	16	12	6	t	t	t	t	2016-08-13 08:30:25.739932	2016-08-13 08:30:25.739932
373	16	13	6	t	t	t	t	2016-08-13 08:30:25.747303	2016-08-13 08:30:25.747303
374	16	14	6	t	t	t	t	2016-08-13 08:30:25.754245	2016-08-13 08:30:25.754245
375	16	15	6	t	t	t	t	2016-08-13 08:30:25.75715	2016-08-13 08:30:25.75715
376	16	16	6	t	t	t	t	2016-08-13 08:30:25.759849	2016-08-13 08:30:25.759849
377	16	17	6	t	t	t	t	2016-08-13 08:30:25.766421	2016-08-13 08:30:25.766421
378	16	18	6	t	t	t	t	2016-08-13 08:30:25.769081	2016-08-13 08:30:25.769081
379	16	19	6	t	t	t	t	2016-08-13 08:30:25.775671	2016-08-13 08:30:25.775671
380	16	20	6	t	t	t	t	2016-08-13 08:30:25.778378	2016-08-13 08:30:25.778378
381	16	21	6	t	t	t	t	2016-08-13 08:30:25.785075	2016-08-13 08:30:25.785075
382	16	22	6	t	t	t	t	2016-08-13 08:30:25.788003	2016-08-13 08:30:25.788003
383	16	23	6	t	t	t	t	2016-08-13 08:30:25.794497	2016-08-13 08:30:25.794497
384	16	24	6	t	t	t	t	2016-08-13 08:30:25.79724	2016-08-13 08:30:25.79724
385	17	1	6	f	t	f	f	2016-08-13 08:30:25.809065	2016-08-13 08:30:25.809065
386	17	2	6	f	t	f	f	2016-08-13 08:30:25.815585	2016-08-13 08:30:25.815585
387	17	3	6	f	t	f	f	2016-08-13 08:30:25.818333	2016-08-13 08:30:25.818333
388	17	4	6	f	t	f	f	2016-08-13 08:30:25.824832	2016-08-13 08:30:25.824832
389	17	5	6	f	t	f	f	2016-08-13 08:30:25.827551	2016-08-13 08:30:25.827551
390	17	6	6	f	t	f	f	2016-08-13 08:30:25.833954	2016-08-13 08:30:25.833954
391	17	7	6	f	t	f	f	2016-08-13 08:30:25.8368	2016-08-13 08:30:25.8368
392	17	8	6	f	t	f	f	2016-08-13 08:30:25.843227	2016-08-13 08:30:25.843227
393	17	9	6	f	t	f	f	2016-08-13 08:30:25.846327	2016-08-13 08:30:25.846327
394	17	10	6	f	t	f	f	2016-08-13 08:30:25.854327	2016-08-13 08:30:25.854327
395	17	11	6	f	t	f	f	2016-08-13 08:30:25.857175	2016-08-13 08:30:25.857175
396	17	12	6	f	t	f	f	2016-08-13 08:30:25.863583	2016-08-13 08:30:25.863583
397	17	13	6	f	t	f	f	2016-08-13 08:30:25.86632	2016-08-13 08:30:25.86632
398	17	14	6	f	t	f	f	2016-08-13 08:30:25.872795	2016-08-13 08:30:25.872795
399	17	15	6	f	t	f	f	2016-08-13 08:30:25.87545	2016-08-13 08:30:25.87545
400	17	16	6	f	t	f	f	2016-08-13 08:30:25.878174	2016-08-13 08:30:25.878174
401	17	17	6	f	t	f	f	2016-08-13 08:30:25.888033	2016-08-13 08:30:25.888033
402	17	18	6	f	t	f	f	2016-08-13 08:30:25.894492	2016-08-13 08:30:25.894492
403	17	19	6	f	t	f	f	2016-08-13 08:30:25.8973	2016-08-13 08:30:25.8973
404	17	20	6	f	t	f	f	2016-08-13 08:30:25.900119	2016-08-13 08:30:25.900119
405	17	21	6	f	t	f	f	2016-08-13 08:30:25.906685	2016-08-13 08:30:25.906685
406	17	22	6	f	t	f	f	2016-08-13 08:30:25.909347	2016-08-13 08:30:25.909347
407	17	23	6	f	t	f	f	2016-08-13 08:30:25.915932	2016-08-13 08:30:25.915932
408	17	24	6	f	t	f	f	2016-08-13 08:30:25.918596	2016-08-13 08:30:25.918596
409	18	1	6	f	t	f	f	2016-08-13 08:30:25.934684	2016-08-13 08:30:25.934684
410	18	2	6	f	t	f	f	2016-08-13 08:30:25.937505	2016-08-13 08:30:25.937505
411	18	3	6	f	t	f	f	2016-08-13 08:30:25.944035	2016-08-13 08:30:25.944035
412	18	4	6	f	t	f	f	2016-08-13 08:30:25.946919	2016-08-13 08:30:25.946919
413	18	5	6	f	t	f	f	2016-08-13 08:30:25.953495	2016-08-13 08:30:25.953495
414	18	6	6	f	t	f	f	2016-08-13 08:30:25.956283	2016-08-13 08:30:25.956283
415	18	7	6	f	t	f	f	2016-08-13 08:30:25.96271	2016-08-13 08:30:25.96271
416	18	8	6	f	t	f	f	2016-08-13 08:30:25.965432	2016-08-13 08:30:25.965432
417	18	9	6	f	t	f	f	2016-08-13 08:30:25.96813	2016-08-13 08:30:25.96813
418	18	10	6	f	t	f	f	2016-08-13 08:30:25.974561	2016-08-13 08:30:25.974561
419	18	11	6	f	t	f	f	2016-08-13 08:30:25.977315	2016-08-13 08:30:25.977315
420	18	12	6	f	t	f	f	2016-08-13 08:30:25.984009	2016-08-13 08:30:25.984009
421	18	13	6	f	t	f	f	2016-08-13 08:30:25.986722	2016-08-13 08:30:25.986722
422	18	14	6	f	t	f	f	2016-08-13 08:30:25.993324	2016-08-13 08:30:25.993324
423	18	15	6	f	t	f	f	2016-08-13 08:30:25.996021	2016-08-13 08:30:25.996021
424	18	16	6	f	t	f	f	2016-08-13 08:30:26.002607	2016-08-13 08:30:26.002607
425	18	17	6	f	t	f	f	2016-08-13 08:30:26.005354	2016-08-13 08:30:26.005354
426	18	18	6	f	t	f	f	2016-08-13 08:30:26.011942	2016-08-13 08:30:26.011942
427	18	19	6	f	t	f	f	2016-08-13 08:30:26.014655	2016-08-13 08:30:26.014655
428	18	20	6	f	t	f	f	2016-08-13 08:30:26.017383	2016-08-13 08:30:26.017383
429	18	21	6	f	t	f	f	2016-08-13 08:30:26.024049	2016-08-13 08:30:26.024049
430	18	22	6	f	t	f	f	2016-08-13 08:30:26.02675	2016-08-13 08:30:26.02675
431	18	23	6	f	t	f	f	2016-08-13 08:30:26.033304	2016-08-13 08:30:26.033304
432	18	24	6	f	t	f	f	2016-08-13 08:30:26.036012	2016-08-13 08:30:26.036012
433	19	1	7	t	t	t	t	2016-08-19 02:26:08.337439	2016-08-19 02:26:08.337439
434	19	2	7	t	t	t	t	2016-08-19 02:26:08.346853	2016-08-19 02:26:08.346853
435	19	3	7	t	t	t	t	2016-08-19 02:26:08.355642	2016-08-19 02:26:08.355642
436	19	4	7	t	t	t	t	2016-08-19 02:26:08.363673	2016-08-19 02:26:08.363673
437	19	5	7	t	t	t	t	2016-08-19 02:26:08.366549	2016-08-19 02:26:08.366549
438	19	6	7	t	t	t	t	2016-08-19 02:26:08.374086	2016-08-19 02:26:08.374086
439	19	7	7	t	t	t	t	2016-08-19 02:26:08.377054	2016-08-19 02:26:08.377054
440	19	8	7	t	t	t	t	2016-08-19 02:26:08.383649	2016-08-19 02:26:08.383649
441	19	9	7	t	t	t	t	2016-08-19 02:26:08.38657	2016-08-19 02:26:08.38657
442	19	10	7	t	t	t	t	2016-08-19 02:26:08.393795	2016-08-19 02:26:08.393795
443	19	11	7	t	t	t	t	2016-08-19 02:26:08.397155	2016-08-19 02:26:08.397155
444	19	12	7	t	t	t	t	2016-08-19 02:26:08.404153	2016-08-19 02:26:08.404153
445	19	13	7	t	t	t	t	2016-08-19 02:26:08.407122	2016-08-19 02:26:08.407122
446	19	14	7	t	t	t	t	2016-08-19 02:26:08.414021	2016-08-19 02:26:08.414021
447	19	15	7	t	t	t	t	2016-08-19 02:26:08.416964	2016-08-19 02:26:08.416964
448	19	16	7	t	t	t	t	2016-08-19 02:26:08.423879	2016-08-19 02:26:08.423879
449	19	17	7	t	t	t	t	2016-08-19 02:26:08.426905	2016-08-19 02:26:08.426905
450	19	18	7	t	t	t	t	2016-08-19 02:26:08.433832	2016-08-19 02:26:08.433832
451	19	19	7	t	t	t	t	2016-08-19 02:26:08.436899	2016-08-19 02:26:08.436899
452	19	20	7	t	t	t	t	2016-08-19 02:26:08.444184	2016-08-19 02:26:08.444184
453	19	21	7	t	t	t	t	2016-08-19 02:26:08.447056	2016-08-19 02:26:08.447056
454	19	22	7	t	t	t	t	2016-08-19 02:26:08.45378	2016-08-19 02:26:08.45378
455	19	23	7	t	t	t	t	2016-08-19 02:26:08.456536	2016-08-19 02:26:08.456536
456	19	24	7	t	t	t	t	2016-08-19 02:26:08.463219	2016-08-19 02:26:08.463219
457	20	1	7	f	t	f	f	2016-08-19 02:26:08.475306	2016-08-19 02:26:08.475306
458	20	2	7	f	t	f	f	2016-08-19 02:26:08.482117	2016-08-19 02:26:08.482117
459	20	3	7	f	t	f	f	2016-08-19 02:26:08.484882	2016-08-19 02:26:08.484882
460	20	4	7	f	t	f	f	2016-08-19 02:26:08.491532	2016-08-19 02:26:08.491532
461	20	5	7	f	t	f	f	2016-08-19 02:26:08.494436	2016-08-19 02:26:08.494436
462	20	6	7	f	t	f	f	2016-08-19 02:26:08.501447	2016-08-19 02:26:08.501447
463	20	7	7	f	t	f	f	2016-08-19 02:26:08.504279	2016-08-19 02:26:08.504279
464	20	8	7	f	t	f	f	2016-08-19 02:26:08.507003	2016-08-19 02:26:08.507003
465	20	9	7	f	t	f	f	2016-08-19 02:26:08.513688	2016-08-19 02:26:08.513688
466	20	10	7	f	t	f	f	2016-08-19 02:26:08.51645	2016-08-19 02:26:08.51645
467	20	11	7	f	t	f	f	2016-08-19 02:26:08.523035	2016-08-19 02:26:08.523035
468	20	12	7	f	t	f	f	2016-08-19 02:26:08.525851	2016-08-19 02:26:08.525851
469	20	13	7	f	t	f	f	2016-08-19 02:26:08.532512	2016-08-19 02:26:08.532512
470	20	14	7	f	t	f	f	2016-08-19 02:26:08.535227	2016-08-19 02:26:08.535227
471	20	15	7	f	t	f	f	2016-08-19 02:26:08.541907	2016-08-19 02:26:08.541907
472	20	16	7	f	t	f	f	2016-08-19 02:26:08.544729	2016-08-19 02:26:08.544729
473	20	17	7	f	t	f	f	2016-08-19 02:26:08.55132	2016-08-19 02:26:08.55132
474	20	18	7	f	t	f	f	2016-08-19 02:26:08.554049	2016-08-19 02:26:08.554049
475	20	19	7	f	t	f	f	2016-08-19 02:26:08.556798	2016-08-19 02:26:08.556798
476	20	20	7	f	t	f	f	2016-08-19 02:26:08.564116	2016-08-19 02:26:08.564116
477	20	21	7	f	t	f	f	2016-08-19 02:26:08.57123	2016-08-19 02:26:08.57123
478	20	22	7	f	t	f	f	2016-08-19 02:26:08.574618	2016-08-19 02:26:08.574618
479	20	23	7	f	t	f	f	2016-08-19 02:26:08.581685	2016-08-19 02:26:08.581685
480	20	24	7	f	t	f	f	2016-08-19 02:26:08.584929	2016-08-19 02:26:08.584929
481	21	1	7	f	t	f	f	2016-08-19 02:26:08.602033	2016-08-19 02:26:08.602033
482	21	2	7	f	t	f	f	2016-08-19 02:26:08.605245	2016-08-19 02:26:08.605245
483	21	3	7	f	t	f	f	2016-08-19 02:26:08.612722	2016-08-19 02:26:08.612722
484	21	4	7	f	t	f	f	2016-08-19 02:26:08.615911	2016-08-19 02:26:08.615911
485	21	5	7	f	t	f	f	2016-08-19 02:26:08.625423	2016-08-19 02:26:08.625423
486	21	6	7	f	t	f	f	2016-08-19 02:26:08.64144	2016-08-19 02:26:08.64144
487	21	7	7	f	t	f	f	2016-08-19 02:26:08.650878	2016-08-19 02:26:08.650878
488	21	8	7	f	t	f	f	2016-08-19 02:26:08.653951	2016-08-19 02:26:08.653951
489	21	9	7	f	t	f	f	2016-08-19 02:26:08.660651	2016-08-19 02:26:08.660651
490	21	10	7	f	t	f	f	2016-08-19 02:26:08.663535	2016-08-19 02:26:08.663535
491	21	11	7	f	t	f	f	2016-08-19 02:26:08.677958	2016-08-19 02:26:08.677958
492	21	12	7	f	t	f	f	2016-08-19 02:26:08.681059	2016-08-19 02:26:08.681059
493	21	13	7	f	t	f	f	2016-08-19 02:26:08.692012	2016-08-19 02:26:08.692012
494	21	14	7	f	t	f	f	2016-08-19 02:26:08.699216	2016-08-19 02:26:08.699216
495	21	15	7	f	t	f	f	2016-08-19 02:26:08.702223	2016-08-19 02:26:08.702223
496	21	16	7	f	t	f	f	2016-08-19 02:26:08.708875	2016-08-19 02:26:08.708875
497	21	17	7	f	t	f	f	2016-08-19 02:26:08.711642	2016-08-19 02:26:08.711642
498	21	18	7	f	t	f	f	2016-08-19 02:26:08.718269	2016-08-19 02:26:08.718269
499	21	19	7	f	t	f	f	2016-08-19 02:26:08.721202	2016-08-19 02:26:08.721202
500	21	20	7	f	t	f	f	2016-08-19 02:26:08.727778	2016-08-19 02:26:08.727778
501	21	21	7	f	t	f	f	2016-08-19 02:26:08.731879	2016-08-19 02:26:08.731879
502	21	22	7	f	t	f	f	2016-08-19 02:26:08.738549	2016-08-19 02:26:08.738549
503	21	23	7	f	t	f	f	2016-08-19 02:26:08.741311	2016-08-19 02:26:08.741311
504	21	24	7	f	t	f	f	2016-08-19 02:26:08.747916	2016-08-19 02:26:08.747916
505	22	1	8	t	t	t	t	2016-08-24 05:28:22.976246	2016-08-24 05:28:22.976246
506	22	2	8	t	t	t	t	2016-08-24 05:28:22.979496	2016-08-24 05:28:22.979496
507	22	3	8	t	t	t	t	2016-08-24 05:28:22.986094	2016-08-24 05:28:22.986094
508	22	4	8	t	t	t	t	2016-08-24 05:28:22.988863	2016-08-24 05:28:22.988863
509	22	5	8	t	t	t	t	2016-08-24 05:28:22.995683	2016-08-24 05:28:22.995683
510	22	6	8	t	t	t	t	2016-08-24 05:28:22.998433	2016-08-24 05:28:22.998433
511	22	7	8	t	t	t	t	2016-08-24 05:28:23.004963	2016-08-24 05:28:23.004963
512	22	8	8	t	t	t	t	2016-08-24 05:28:23.007678	2016-08-24 05:28:23.007678
513	22	9	8	t	t	t	t	2016-08-24 05:28:23.014411	2016-08-24 05:28:23.014411
514	22	10	8	t	t	t	t	2016-08-24 05:28:23.017181	2016-08-24 05:28:23.017181
515	22	11	8	t	t	t	t	2016-08-24 05:28:23.02368	2016-08-24 05:28:23.02368
516	22	12	8	t	t	t	t	2016-08-24 05:28:23.026473	2016-08-24 05:28:23.026473
517	22	13	8	t	t	t	t	2016-08-24 05:28:23.02922	2016-08-24 05:28:23.02922
518	22	14	8	t	t	t	t	2016-08-24 05:28:23.035746	2016-08-24 05:28:23.035746
519	22	15	8	t	t	t	t	2016-08-24 05:28:23.03846	2016-08-24 05:28:23.03846
520	22	16	8	t	t	t	t	2016-08-24 05:28:23.045069	2016-08-24 05:28:23.045069
521	22	17	8	t	t	t	t	2016-08-24 05:28:23.047774	2016-08-24 05:28:23.047774
522	22	18	8	t	t	t	t	2016-08-24 05:28:23.054282	2016-08-24 05:28:23.054282
523	22	19	8	t	t	t	t	2016-08-24 05:28:23.057517	2016-08-24 05:28:23.057517
524	22	20	8	t	t	t	t	2016-08-24 05:28:23.06424	2016-08-24 05:28:23.06424
525	22	21	8	t	t	t	t	2016-08-24 05:28:23.067054	2016-08-24 05:28:23.067054
526	22	22	8	t	t	t	t	2016-08-24 05:28:23.074089	2016-08-24 05:28:23.074089
527	22	23	8	t	t	t	t	2016-08-24 05:28:23.077094	2016-08-24 05:28:23.077094
528	22	24	8	t	t	t	t	2016-08-24 05:28:23.083799	2016-08-24 05:28:23.083799
529	23	1	8	f	t	f	f	2016-08-24 05:28:23.095979	2016-08-24 05:28:23.095979
530	23	2	8	f	t	f	f	2016-08-24 05:28:23.098796	2016-08-24 05:28:23.098796
531	23	3	8	f	t	f	f	2016-08-24 05:28:23.105678	2016-08-24 05:28:23.105678
532	23	4	8	f	t	f	f	2016-08-24 05:28:23.108393	2016-08-24 05:28:23.108393
533	23	5	8	f	t	f	f	2016-08-24 05:28:23.115082	2016-08-24 05:28:23.115082
534	23	6	8	f	t	f	f	2016-08-24 05:28:23.117833	2016-08-24 05:28:23.117833
535	23	7	8	f	t	f	f	2016-08-24 05:28:23.124666	2016-08-24 05:28:23.124666
536	23	8	8	f	t	f	f	2016-08-24 05:28:23.12741	2016-08-24 05:28:23.12741
537	23	9	8	f	t	f	f	2016-08-24 05:28:23.134145	2016-08-24 05:28:23.134145
538	23	10	8	f	t	f	f	2016-08-24 05:28:23.136961	2016-08-24 05:28:23.136961
539	23	11	8	f	t	f	f	2016-08-24 05:28:23.143643	2016-08-24 05:28:23.143643
540	23	12	8	f	t	f	f	2016-08-24 05:28:23.14635	2016-08-24 05:28:23.14635
541	23	13	8	f	t	f	f	2016-08-24 05:28:23.153129	2016-08-24 05:28:23.153129
542	23	14	8	f	t	f	f	2016-08-24 05:28:23.155917	2016-08-24 05:28:23.155917
543	23	15	8	f	t	f	f	2016-08-24 05:28:23.162602	2016-08-24 05:28:23.162602
544	23	16	8	f	t	f	f	2016-08-24 05:28:23.165564	2016-08-24 05:28:23.165564
545	23	17	8	f	t	f	f	2016-08-24 05:28:23.172865	2016-08-24 05:28:23.172865
546	23	18	8	f	t	f	f	2016-08-24 05:28:23.175708	2016-08-24 05:28:23.175708
547	23	19	8	f	t	f	f	2016-08-24 05:28:23.17845	2016-08-24 05:28:23.17845
548	23	20	8	f	t	f	f	2016-08-24 05:28:23.185038	2016-08-24 05:28:23.185038
549	23	21	8	f	t	f	f	2016-08-24 05:28:23.187724	2016-08-24 05:28:23.187724
550	23	22	8	f	t	f	f	2016-08-24 05:28:23.194229	2016-08-24 05:28:23.194229
551	23	23	8	f	t	f	f	2016-08-24 05:28:23.196922	2016-08-24 05:28:23.196922
552	23	24	8	f	t	f	f	2016-08-24 05:28:23.203772	2016-08-24 05:28:23.203772
553	24	1	8	f	t	f	f	2016-08-24 05:28:23.215662	2016-08-24 05:28:23.215662
554	24	2	8	f	t	f	f	2016-08-24 05:28:23.222338	2016-08-24 05:28:23.222338
555	24	3	8	f	t	f	f	2016-08-24 05:28:23.22505	2016-08-24 05:28:23.22505
556	24	4	8	f	t	f	f	2016-08-24 05:28:23.227749	2016-08-24 05:28:23.227749
557	24	5	8	f	t	f	f	2016-08-24 05:28:23.234366	2016-08-24 05:28:23.234366
558	24	6	8	f	t	f	f	2016-08-24 05:28:23.237054	2016-08-24 05:28:23.237054
559	24	7	8	f	t	f	f	2016-08-24 05:28:23.243557	2016-08-24 05:28:23.243557
560	24	8	8	f	t	f	f	2016-08-24 05:28:23.246875	2016-08-24 05:28:23.246875
561	24	9	8	f	t	f	f	2016-08-24 05:28:23.253355	2016-08-24 05:28:23.253355
562	24	10	8	f	t	f	f	2016-08-24 05:28:23.256057	2016-08-24 05:28:23.256057
563	24	11	8	f	t	f	f	2016-08-24 05:28:23.262624	2016-08-24 05:28:23.262624
564	24	12	8	f	t	f	f	2016-08-24 05:28:23.265483	2016-08-24 05:28:23.265483
565	24	13	8	f	t	f	f	2016-08-24 05:28:23.272184	2016-08-24 05:28:23.272184
566	24	14	8	f	t	f	f	2016-08-24 05:28:23.274886	2016-08-24 05:28:23.274886
567	24	15	8	f	t	f	f	2016-08-24 05:28:23.281615	2016-08-24 05:28:23.281615
568	24	16	8	f	t	f	f	2016-08-24 05:28:23.284341	2016-08-24 05:28:23.284341
569	24	17	8	f	t	f	f	2016-08-24 05:28:23.287018	2016-08-24 05:28:23.287018
570	24	18	8	f	t	f	f	2016-08-24 05:28:23.293629	2016-08-24 05:28:23.293629
571	24	19	8	f	t	f	f	2016-08-24 05:28:23.296343	2016-08-24 05:28:23.296343
572	24	20	8	f	t	f	f	2016-08-24 05:28:23.302916	2016-08-24 05:28:23.302916
573	24	21	8	f	t	f	f	2016-08-24 05:28:23.305646	2016-08-24 05:28:23.305646
574	24	22	8	f	t	f	f	2016-08-24 05:28:23.312363	2016-08-24 05:28:23.312363
575	24	23	8	f	t	f	f	2016-08-24 05:28:23.31512	2016-08-24 05:28:23.31512
576	24	24	8	f	t	f	f	2016-08-24 05:28:23.321723	2016-08-24 05:28:23.321723
577	25	1	9	t	t	t	t	2016-12-20 08:12:37.665011	2016-12-20 08:12:37.665011
578	25	2	9	t	t	t	t	2016-12-20 08:12:37.952697	2016-12-20 08:12:37.952697
579	25	3	9	t	t	t	t	2016-12-20 08:12:37.959959	2016-12-20 08:12:37.959959
580	25	4	9	t	t	t	t	2016-12-20 08:12:37.965458	2016-12-20 08:12:37.965458
581	25	5	9	t	t	t	t	2016-12-20 08:12:37.973679	2016-12-20 08:12:37.973679
582	25	6	9	t	t	t	t	2016-12-20 08:12:37.97757	2016-12-20 08:12:37.97757
583	25	7	9	t	t	t	t	2016-12-20 08:12:37.985336	2016-12-20 08:12:37.985336
584	25	8	9	t	t	t	t	2016-12-20 08:12:37.992771	2016-12-20 08:12:37.992771
585	25	9	9	t	t	t	t	2016-12-20 08:12:37.996235	2016-12-20 08:12:37.996235
586	25	10	9	t	t	t	t	2016-12-20 08:12:38.011409	2016-12-20 08:12:38.011409
587	25	11	9	t	t	t	t	2016-12-20 08:12:38.015154	2016-12-20 08:12:38.015154
588	25	12	9	t	t	t	t	2016-12-20 08:12:38.024402	2016-12-20 08:12:38.024402
589	25	13	9	t	t	t	t	2016-12-20 08:12:38.035529	2016-12-20 08:12:38.035529
590	25	14	9	t	t	t	t	2016-12-20 08:12:38.040439	2016-12-20 08:12:38.040439
591	25	15	9	t	t	t	t	2016-12-20 08:12:38.05111	2016-12-20 08:12:38.05111
592	25	16	9	t	t	t	t	2016-12-20 08:12:38.055125	2016-12-20 08:12:38.055125
593	25	17	9	t	t	t	t	2016-12-20 08:12:38.063844	2016-12-20 08:12:38.063844
594	25	18	9	t	t	t	t	2016-12-20 08:12:38.068125	2016-12-20 08:12:38.068125
595	25	19	9	t	t	t	t	2016-12-20 08:12:38.076245	2016-12-20 08:12:38.076245
596	25	20	9	t	t	t	t	2016-12-20 08:12:38.084021	2016-12-20 08:12:38.084021
597	25	21	9	t	t	t	t	2016-12-20 08:12:38.08773	2016-12-20 08:12:38.08773
598	25	22	9	t	t	t	t	2016-12-20 08:12:38.095468	2016-12-20 08:12:38.095468
599	25	23	9	t	t	t	t	2016-12-20 08:12:38.099224	2016-12-20 08:12:38.099224
600	25	24	9	t	t	t	t	2016-12-20 08:12:38.106988	2016-12-20 08:12:38.106988
601	26	1	9	f	t	f	f	2016-12-20 08:12:38.125271	2016-12-20 08:12:38.125271
602	26	2	9	f	t	f	f	2016-12-20 08:12:38.136881	2016-12-20 08:12:38.136881
603	26	3	9	f	t	f	f	2016-12-20 08:12:38.143429	2016-12-20 08:12:38.143429
604	26	4	9	f	t	f	f	2016-12-20 08:12:38.155839	2016-12-20 08:12:38.155839
605	26	5	9	f	t	f	f	2016-12-20 08:12:38.159827	2016-12-20 08:12:38.159827
606	26	6	9	f	t	f	f	2016-12-20 08:12:38.163571	2016-12-20 08:12:38.163571
607	26	7	9	f	t	f	f	2016-12-20 08:12:38.171309	2016-12-20 08:12:38.171309
608	26	8	9	f	t	f	f	2016-12-20 08:12:38.178963	2016-12-20 08:12:38.178963
609	26	9	9	f	t	f	f	2016-12-20 08:12:38.187229	2016-12-20 08:12:38.187229
610	26	10	9	f	t	f	f	2016-12-20 08:12:38.192504	2016-12-20 08:12:38.192504
611	26	11	9	f	t	f	f	2016-12-20 08:12:38.200434	2016-12-20 08:12:38.200434
612	26	12	9	f	t	f	f	2016-12-20 08:12:38.20818	2016-12-20 08:12:38.20818
613	26	13	9	f	t	f	f	2016-12-20 08:12:38.212923	2016-12-20 08:12:38.212923
614	26	14	9	f	t	f	f	2016-12-20 08:12:38.220834	2016-12-20 08:12:38.220834
615	26	15	9	f	t	f	f	2016-12-20 08:12:38.228106	2016-12-20 08:12:38.228106
616	26	16	9	f	t	f	f	2016-12-20 08:12:38.232433	2016-12-20 08:12:38.232433
617	26	17	9	f	t	f	f	2016-12-20 08:12:38.240017	2016-12-20 08:12:38.240017
618	26	18	9	f	t	f	f	2016-12-20 08:12:38.247214	2016-12-20 08:12:38.247214
619	26	19	9	f	t	f	f	2016-12-20 08:12:38.251004	2016-12-20 08:12:38.251004
620	26	20	9	f	t	f	f	2016-12-20 08:12:38.258231	2016-12-20 08:12:38.258231
621	26	21	9	f	t	f	f	2016-12-20 08:12:38.261758	2016-12-20 08:12:38.261758
622	26	22	9	f	t	f	f	2016-12-20 08:12:38.269285	2016-12-20 08:12:38.269285
623	26	23	9	f	t	f	f	2016-12-20 08:12:38.276722	2016-12-20 08:12:38.276722
624	26	24	9	f	t	f	f	2016-12-20 08:12:38.280434	2016-12-20 08:12:38.280434
625	27	1	9	f	t	f	f	2016-12-20 08:12:38.298729	2016-12-20 08:12:38.298729
626	27	2	9	f	t	f	f	2016-12-20 08:12:38.306224	2016-12-20 08:12:38.306224
627	27	3	9	f	t	f	f	2016-12-20 08:12:38.313781	2016-12-20 08:12:38.313781
628	27	4	9	f	t	f	f	2016-12-20 08:12:38.317866	2016-12-20 08:12:38.317866
629	27	5	9	f	t	f	f	2016-12-20 08:12:38.32642	2016-12-20 08:12:38.32642
630	27	6	9	f	t	f	f	2016-12-20 08:12:38.335125	2016-12-20 08:12:38.335125
631	27	7	9	f	t	f	f	2016-12-20 08:12:38.340722	2016-12-20 08:12:38.340722
632	27	8	9	f	t	f	f	2016-12-20 08:12:38.348469	2016-12-20 08:12:38.348469
633	27	9	9	f	t	f	f	2016-12-20 08:12:38.35625	2016-12-20 08:12:38.35625
634	27	10	9	f	t	f	f	2016-12-20 08:12:38.360307	2016-12-20 08:12:38.360307
635	27	11	9	f	t	f	f	2016-12-20 08:12:38.368233	2016-12-20 08:12:38.368233
636	27	12	9	f	t	f	f	2016-12-20 08:12:38.376989	2016-12-20 08:12:38.376989
637	27	13	9	f	t	f	f	2016-12-20 08:12:38.381113	2016-12-20 08:12:38.381113
638	27	14	9	f	t	f	f	2016-12-20 08:12:38.389035	2016-12-20 08:12:38.389035
639	27	15	9	f	t	f	f	2016-12-20 08:12:38.398551	2016-12-20 08:12:38.398551
640	27	16	9	f	t	f	f	2016-12-20 08:12:38.402389	2016-12-20 08:12:38.402389
641	27	17	9	f	t	f	f	2016-12-20 08:12:38.409931	2016-12-20 08:12:38.409931
642	27	18	9	f	t	f	f	2016-12-20 08:12:38.417126	2016-12-20 08:12:38.417126
643	27	19	9	f	t	f	f	2016-12-20 08:12:38.420607	2016-12-20 08:12:38.420607
644	27	20	9	f	t	f	f	2016-12-20 08:12:38.428134	2016-12-20 08:12:38.428134
645	27	21	9	f	t	f	f	2016-12-20 08:12:38.431682	2016-12-20 08:12:38.431682
646	27	22	9	f	t	f	f	2016-12-20 08:12:38.439537	2016-12-20 08:12:38.439537
647	27	23	9	f	t	f	f	2016-12-20 08:12:38.446902	2016-12-20 08:12:38.446902
648	27	24	9	f	t	f	f	2016-12-20 08:12:38.450598	2016-12-20 08:12:38.450598
72	3	24	1	t	t	t	t	2016-04-18 01:34:41.355341	2017-03-02 06:07:07.44162
71	3	23	1	t	t	t	t	2016-04-18 01:34:41.348145	2017-03-02 06:07:07.470761
46	2	22	1	t	t	t	t	2016-04-18 01:34:41.214917	2017-03-02 06:07:41.002853
45	2	21	1	t	t	t	t	2016-04-18 01:34:41.211944	2017-03-02 06:07:41.006606
44	2	20	1	t	t	t	t	2016-04-18 01:34:41.205342	2017-03-02 06:07:41.015096
43	2	19	1	t	t	t	t	2016-04-18 01:34:41.198684	2017-03-02 06:07:41.017761
141	6	21	2	t	t	t	t	2016-05-05 00:55:58.726539	2017-03-02 07:52:44.260439
140	6	20	2	t	t	t	t	2016-05-05 00:55:58.722694	2017-03-02 07:52:44.271577
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('permissions_id_seq', 648, true);


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY plans (id, name, description, amount, period, plan_type, brand_limit, branch_limit, created_at, updated_at, duration_in_days) FROM stdin;
1	Free Trial	Free trial for 2 months	0.00	monthly	Free	1	3	2016-04-01 02:02:50.928617	2016-04-01 02:02:50.928617	60
2	Monthly Payment	Monthly payment with unlimited usage	39.99	monthly	Subscription	0	0	2016-04-01 02:02:50.952233	2016-04-01 02:02:50.952233	\N
3	Yearly Payment	Yearly payment with unlimited usage	399.99	yearly	Subscription	0	0	2016-04-01 02:02:50.983141	2016-04-01 02:02:50.983141	\N
\.


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('plans_id_seq', 3, true);


--
-- Data for Name: purchase_items; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY purchase_items (id, item_id, unit_id, purchase_id, quantity, purchase_item_amount, remarks, vat_type, purchase_item_total_amount, borrowed_from_id, created_at, updated_at) FROM stdin;
14	44	8	14	75.0	4.60		VAT-Inclusive	345.0	\N	2017-03-30 09:46:03.375576	2017-03-30 09:46:03.375576
15	43	8	14	30.0	6.60		VAT-Inclusive	198.0	\N	2017-03-30 09:46:17.792957	2017-03-30 09:46:17.792957
16	43	8	15	40.0	6.60		VAT-Inclusive	264.0	\N	2017-03-30 09:47:09.720555	2017-03-30 09:47:09.720555
17	42	8	15	20.0	4.50		VAT-Inclusive	90.0	\N	2017-03-30 09:47:23.363606	2017-03-30 09:47:23.363606
18	44	8	15	25.0	4.60		VAT-Inclusive	115.0	\N	2017-03-30 09:47:37.36924	2017-03-30 09:47:37.36924
19	121	8	16	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-03-30 09:51:07.212408	2017-03-30 09:51:07.212408
20	97	9	17	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-03-30 09:53:05.962587	2017-03-30 09:53:05.962587
21	8	2	18	4.48	81.51		VAT-Exempted	365.16	\N	2017-03-30 09:54:50.155073	2017-03-30 09:54:50.155073
22	8	2	19	6.64	81.41		VAT-Exempted	540.58	\N	2017-03-30 09:56:58.774491	2017-03-30 09:56:58.774491
23	7	2	20	26.4	100.00		VAT-Exempted	2640.0	\N	2017-03-30 09:59:23.235	2017-03-30 09:59:23.235
24	6	2	20	59.88	84.10		VAT-Exempted	5035.7	\N	2017-03-30 10:01:27.807977	2017-03-30 10:01:27.807977
25	115	12	21	152.15	6.70		VAT-Inclusive	1020.0	\N	2017-03-30 10:02:30.833871	2017-03-30 10:02:30.833871
29	53	5	22	3.0	300.00		VAT-Inclusive	900.0	\N	2017-03-30 10:09:37.612678	2017-03-30 10:09:37.612678
30	40	2	22	42.24	51.14		VAT-Inclusive	2160.0	\N	2017-03-30 10:10:09.418739	2017-03-30 10:10:09.418739
31	24	1	22	38.84	25.49		VAT-Inclusive	990.0	\N	2017-03-30 10:10:49.921032	2017-03-30 10:10:49.921032
32	95	8	22	80.0	20.33		VAT-Inclusive	1626.66	\N	2017-03-30 10:12:27.691289	2017-03-30 10:12:27.691289
33	121	8	23	3.0	200.00	Latex Gloves	VAT-Inclusive	600.0	\N	2017-03-30 10:15:44.957585	2017-03-30 10:15:44.957585
34	121	8	23	600.0	0.90	8oz paper cups	VAT-Inclusive	540.0	\N	2017-03-30 10:16:11.586172	2017-03-30 10:16:11.586172
35	121	8	23	30.0	30.00	1 case of Paper Towels	VAT-Inclusive	900.0	\N	2017-03-30 10:16:40.261968	2017-03-30 10:16:40.261968
36	121	8	23	200.0	0.75	Spoon Black	VAT-Inclusive	150.0	\N	2017-03-30 10:17:04.182068	2017-03-30 10:17:04.182068
37	121	8	23	500.0	1.20	260cc paper bowl	VAT-Inclusive	600.0	\N	2017-03-30 10:17:29.977855	2017-03-30 10:17:29.977855
38	121	8	23	200.0	2.65	16oz paper cup	VAT-Inclusive	530.0	\N	2017-03-30 10:17:59.789205	2017-03-30 10:17:59.789205
39	121	8	23	100.0	2.85	22oz paper cup	VAT-Inclusive	285.0	\N	2017-03-30 10:19:15.59223	2017-03-30 10:19:15.59223
40	121	8	23	100.0	1.00	260cc lids	VAT-Inclusive	100.0	\N	2017-03-30 10:19:41.741859	2017-03-30 10:19:41.741859
41	121	8	23	100.0	1.05	520cc lids	VAT-Inclusive	105.0	\N	2017-03-30 10:19:56.304362	2017-03-30 10:19:56.304362
42	122	8	23	2.0	75.00	Jumbo Roll Tissue\r\n	VAT-Inclusive	150.0	\N	2017-03-30 10:20:19.24195	2017-03-30 10:20:19.24195
43	122	8	24	1.0	125.00	Zonrox	VAT-Inclusive	125.0	\N	2017-03-30 10:22:55.068428	2017-03-30 10:22:55.068428
44	122	8	24	5.0	88.00	Joy	VAT-Inclusive	440.0	\N	2017-03-30 10:23:06.462794	2017-03-30 10:23:06.462794
45	122	8	24	2.0	16.00	Dia Black	VAT-Inclusive	32.0	\N	2017-03-30 10:23:19.861146	2017-03-30 10:23:19.861146
46	122	8	24	2.0	18.00	Fedon Scubbing Pad	VAT-Inclusive	36.0	\N	2017-03-30 10:23:37.164636	2017-03-30 10:23:37.164636
47	122	8	24	2.0	60.00	Mop Heads	VAT-Inclusive	120.0	\N	2017-03-30 10:23:53.438876	2017-03-30 10:23:53.438876
48	122	8	25	1.0	125.00	zonrox\r\n	VAT-Inclusive	125.0	\N	2017-03-30 10:26:12.080944	2017-03-30 10:26:12.080944
49	122	8	25	5.0	88.00	joy	VAT-Inclusive	440.0	\N	2017-03-30 10:26:24.278593	2017-03-30 10:26:24.278593
50	122	8	25	1.0	18.00	fedon scrubbing pad	VAT-Inclusive	18.0	\N	2017-03-30 10:26:48.010912	2017-03-30 10:26:48.010912
51	122	8	25	12.0	15.83	white towel	VAT-Inclusive	190.0	\N	2017-03-30 10:27:13.660071	2017-03-30 10:27:13.660071
52	122	8	25	1.0	350.00	lysol	VAT-Inclusive	350.0	\N	2017-03-30 10:27:32.390012	2017-03-30 10:27:32.390012
53	123	8	25	3.0	25.00	masking tape	VAT-Inclusive	75.0	\N	2017-03-30 10:27:55.076431	2017-03-30 10:27:55.076431
54	123	8	25	2.0	35.00	pentel pen	VAT-Inclusive	70.0	\N	2017-03-30 10:28:11.38352	2017-03-30 10:28:11.38352
55	121	8	26	4.0	200.00	latex gloves	VAT-Inclusive	800.0	\N	2017-03-30 10:29:11.924079	2017-03-30 10:29:11.924079
56	121	8	26	600.0	0.90	8oz cups	VAT-Inclusive	540.0	\N	2017-03-30 10:29:28.905787	2017-03-30 10:29:28.905787
57	121	8	26	100.0	0.80	brown bag #8	VAT-Inclusive	80.0	\N	2017-03-30 10:29:46.789742	2017-03-30 10:29:46.789742
58	121	8	26	100.0	3.68	XXL trash liner	VAT-Inclusive	368.0	\N	2017-03-30 10:30:06.763011	2017-03-30 10:30:06.763011
59	121	8	26	1000.0	0.25	6 x 7 PE	VAT-Inclusive	250.0	\N	2017-03-30 10:30:24.370463	2017-03-30 10:30:24.370463
60	121	8	26	700.0	1.20	260cc	VAT-Inclusive	840.0	\N	2017-03-30 10:30:42.12996	2017-03-30 10:30:42.12996
61	121	8	26	100.0	2.10	520cc	VAT-Inclusive	210.0	\N	2017-03-30 10:30:58.424912	2017-03-30 10:30:58.424912
62	121	8	26	100.0	1.00	260cc lids\r\n	VAT-Inclusive	100.0	\N	2017-03-30 10:31:16.368623	2017-03-30 10:31:16.368623
63	121	8	26	100.0	1.05	520cc lids\r\n	VAT-Inclusive	105.0	\N	2017-03-30 10:31:28.84836	2017-03-30 10:31:28.84836
64	121	8	27	3.0	200.00	latex gloves	VAT-Inclusive	600.0	\N	2017-03-30 10:33:11.398828	2017-03-30 10:33:11.398828
65	121	8	27	600.0	0.90	8oz cups	VAT-Inclusive	540.0	\N	2017-03-30 10:33:31.221126	2017-03-30 10:33:31.221126
66	121	8	27	30.0	30.00	paper towels	VAT-Inclusive	900.0	\N	2017-03-30 10:33:46.396321	2017-03-30 10:33:46.396321
67	121	8	27	100.0	0.80	brown bag #8	VAT-Inclusive	80.0	\N	2017-03-30 10:34:01.122425	2017-03-30 10:34:01.122425
68	121	8	27	100.0	1.60	brown bag #16	VAT-Inclusive	160.0	\N	2017-03-30 10:38:05.670634	2017-03-30 10:38:05.670634
69	121	8	27	100.0	0.75	spoon black	VAT-Inclusive	75.0	\N	2017-03-30 10:38:20.932971	2017-03-30 10:38:20.932971
70	121	8	27	100.0	0.75	fork black	VAT-Inclusive	75.0	\N	2017-03-30 10:38:58.627364	2017-03-30 10:38:58.627364
71	121	8	27	100.0	0.75	knife black	VAT-Inclusive	75.0	\N	2017-03-30 10:39:12.063333	2017-03-30 10:39:12.063333
72	121	8	27	1000.0	0.25	6 x 7 PE	VAT-Inclusive	250.0	\N	2017-03-30 10:39:33.993555	2017-03-30 10:39:33.993555
73	121	8	27	600.0	1.30	260cc	VAT-Inclusive	780.0	\N	2017-03-30 10:40:13.843954	2017-03-30 10:40:13.843954
74	121	8	27	100.0	2.10	520cc	VAT-Inclusive	210.0	\N	2017-03-30 10:40:31.392969	2017-03-30 10:40:31.392969
75	121	8	27	100.0	2.85	22oz cup	VAT-Inclusive	285.0	\N	2017-03-30 10:40:56.418426	2017-03-30 10:40:56.418426
76	121	8	27	100.0	1.00	260cc lids	VAT-Inclusive	100.0	\N	2017-03-30 10:41:30.409903	2017-03-30 10:41:30.409903
77	121	8	27	100.0	1.05	520cc lids	VAT-Inclusive	105.0	\N	2017-03-30 10:41:45.828802	2017-03-30 10:41:45.828802
78	122	8	27	2.0	70.00	jumbo roll tissue	VAT-Inclusive	140.0	\N	2017-03-30 10:42:14.318033	2017-03-30 10:42:14.318033
79	122	8	28	1.0	125.00	zonrox	VAT-Inclusive	125.0	\N	2017-03-30 10:43:31.669894	2017-03-30 10:43:31.669894
80	122	8	28	5.0	88.00	joy	VAT-Inclusive	440.0	\N	2017-03-30 10:45:13.418014	2017-03-30 10:45:13.418014
81	122	8	28	3.0	16.00	dia black	VAT-Inclusive	48.0	\N	2017-03-30 10:45:31.427585	2017-03-30 10:45:31.427585
82	122	8	28	2.0	18.00	fedon scrubbing pad	VAT-Inclusive	36.0	\N	2017-03-30 10:45:54.029753	2017-03-30 10:45:54.029753
83	123	8	28	2.0	35.00	pentel pen\r\n	VAT-Inclusive	70.0	\N	2017-03-30 10:46:33.818093	2017-03-30 10:46:33.818093
84	9	2	29	110.0	84.09		VAT-Exempted	9250.0	\N	2017-03-30 10:48:22.268716	2017-03-30 10:48:22.268716
85	9	2	30	73.39	68.64		VAT-Exempted	5037.36	\N	2017-03-30 10:50:16.989077	2017-03-30 10:50:16.989077
89	9	2	32	22.66	68.64		VAT-Exempted	1555.3	\N	2017-03-30 10:54:23.021567	2017-03-30 10:54:23.021567
90	9	2	32	15.75	81.37		VAT-Exempted	1281.64	\N	2017-03-30 10:54:52.471717	2017-03-30 10:54:52.471717
91	9	2	34	12.36	68.66		VAT-Exempted	848.62	\N	2017-03-30 10:57:14.366978	2017-03-30 10:57:14.366978
92	9	2	35	56.32	68.64		VAT-Exempted	3865.6	\N	2017-03-30 10:58:43.993916	2017-03-30 10:58:43.993916
93	8	2	35	22.22	81.36		VAT-Exempted	1807.9	\N	2017-03-30 10:59:21.525458	2017-03-30 10:59:21.525458
94	8	2	30	4.4	81.36		VAT-Exempted	358.0	\N	2017-03-30 11:01:34.197205	2017-03-30 11:01:34.197205
95	9	2	31	21.12	68.64		VAT-Exempted	1449.6	\N	2017-03-30 11:02:29.258495	2017-03-30 11:02:29.258495
96	8	2	31	18.04	81.36		VAT-Exempted	1467.8	\N	2017-03-30 11:02:55.258527	2017-03-30 11:02:55.258527
97	9	2	36	12.54	68.64		VAT-Exempted	860.7	\N	2017-03-30 11:04:45.573014	2017-03-30 11:04:45.573014
98	8	2	36	11.22	81.36		VAT-Exempted	912.9	\N	2017-03-30 11:05:09.632483	2017-03-30 11:05:09.632483
99	9	2	37	31.02	68.64		VAT-Exempted	2129.1	\N	2017-03-30 11:06:39.038164	2017-03-30 11:06:39.038164
101	8	2	37	4.49	81.33		VAT-Exempted	365.16	\N	2017-03-30 11:07:29.856045	2017-03-30 11:07:29.856045
102	6	2	38	59.88	84.10		VAT-Exempted	5035.7	\N	2017-03-30 11:09:34.958359	2017-03-30 11:09:34.958359
103	7	2	38	52.8	100.00		VAT-Exempted	5280.0	\N	2017-03-30 11:10:35.628598	2017-03-30 11:10:35.628598
104	15	13	39	6.0	530.00		VAT-Inclusive	3180.0	\N	2017-03-30 11:28:35.323201	2017-03-30 11:28:35.323201
105	39	2	40	45.0	55.36		VAT-Exclusive	2491.07	\N	2017-03-30 11:30:03.406297	2017-03-30 11:30:03.406297
106	47	2	40	60.0	46.88		VAT-Exclusive	2812.5	\N	2017-03-30 11:31:05.644258	2017-03-30 11:31:05.644258
108	63	6	40	1.0	257.14		VAT-Exclusive	257.14	\N	2017-03-30 11:32:27.355655	2017-03-30 11:32:27.355655
109	64	5	40	1.0	468.75		VAT-Exclusive	468.75	\N	2017-03-30 11:32:57.510042	2017-03-30 11:32:57.510042
111	68	5	40	2.0	580.36		VAT-Exclusive	1160.71	\N	2017-03-30 11:33:24.349556	2017-03-30 11:33:24.349556
112	69	6	40	2.0	207.15		VAT-Exclusive	414.29	\N	2017-03-30 11:33:50.84584	2017-03-30 11:33:50.84584
113	70	6	40	1.0	241.07		VAT-Exclusive	241.07	\N	2017-03-30 11:34:21.657537	2017-03-30 11:34:21.657537
114	38	6	40	14.0	111.61		VAT-Exclusive	1562.51	\N	2017-03-30 11:35:17.915114	2017-03-30 11:35:17.915114
115	77	9	41	3.0	214.29		VAT-Exclusive	642.86	\N	2017-03-30 11:36:17.416403	2017-03-30 11:36:17.416403
116	76	4	42	72.0	15.83		VAT-Exclusive	1139.46	\N	2017-03-30 11:37:52.316327	2017-03-30 11:37:52.316327
117	37	8	42	180.0	3.81		VAT-Exclusive	685.1	\N	2017-03-30 11:38:39.02047	2017-03-30 11:38:39.02047
118	75	9	42	8.0	203.46		VAT-Exclusive	1627.71	\N	2017-03-30 11:39:14.31924	2017-03-30 11:39:14.31924
119	25	2	43	22.0	34.09		VAT-Inclusive	750.0	\N	2017-03-30 11:41:04.026854	2017-03-30 11:41:04.026854
120	26	2	43	53.98	64.56		VAT-Inclusive	3484.68	\N	2017-03-30 11:44:11.106065	2017-03-30 11:44:11.106065
121	24	2	44	38.94	25.42		VAT-Inclusive	990.0	\N	2017-03-30 11:46:56.51938	2017-03-30 11:46:56.51938
122	40	2	44	21.12	51.14		VAT-Inclusive	1080.0	\N	2017-03-30 11:47:43.616683	2017-03-30 11:47:43.616683
123	19	6	44	2.0	60.00		VAT-Inclusive	120.0	\N	2017-03-30 11:49:46.672192	2017-03-30 11:49:46.672192
124	16	4	44	16.0	42.50		VAT-Inclusive	680.0	\N	2017-03-30 11:52:27.16478	2017-03-30 11:52:27.16478
125	53	5	44	3.0	300.00		VAT-Inclusive	900.0	\N	2017-03-30 11:52:38.122248	2017-03-30 11:52:38.122248
126	1	2	44	17.6	88.64		VAT-Inclusive	1560.0	\N	2017-03-30 11:53:35.720096	2017-03-30 11:53:35.720096
127	5	2	44	66.0	70.45		VAT-Inclusive	4650.0	\N	2017-03-30 11:55:27.083827	2017-03-30 11:55:27.083827
128	95	8	44	120.0	20.33		VAT-Inclusive	2439.99	\N	2017-03-30 11:58:18.349131	2017-03-30 11:58:18.349131
130	99	7	45	48.0	17.41	Pepsi reg	VAT-Exclusive	835.71	\N	2017-03-30 12:00:12.983045	2017-03-30 12:00:12.983045
131	99	7	45	28.0	14.92	Pepsi max	VAT-Exclusive	417.86	\N	2017-03-30 12:00:30.642533	2017-03-30 12:00:30.642533
132	99	7	45	48.0	17.41	7up\r\n	VAT-Exclusive	835.71	\N	2017-03-30 12:01:04.413834	2017-03-30 12:01:04.413834
133	99	7	45	48.0	17.41	Mountain Dew\r\n	VAT-Exclusive	835.71	\N	2017-03-30 12:01:21.678815	2017-03-30 12:01:21.678815
134	99	7	45	24.0	17.41	Mirinda\r\n	VAT-Exclusive	417.86	\N	2017-03-30 12:01:52.206542	2017-03-30 12:01:52.206542
135	99	7	45	48.0	17.41	Mugrootbeer\r\n	VAT-Exclusive	835.71	\N	2017-03-30 12:02:17.858341	2017-03-30 12:02:17.858341
136	98	9	45	48.0	8.11		VAT-Exclusive	389.28	\N	2017-03-30 12:02:42.590173	2017-03-30 12:02:42.590173
137	18	5	46	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-03-30 12:04:39.256973	2017-03-30 12:04:39.256973
138	5	2	47	88.0	72.73		VAT-Inclusive	6400.0	\N	2017-03-30 12:05:59.112604	2017-03-30 12:05:59.112604
139	39	2	48	10.0	55.36		VAT-Exclusive	553.57	\N	2017-03-30 12:13:08.870355	2017-03-30 12:13:08.870355
140	46	2	48	12.0	165.18		VAT-Exclusive	1982.14	\N	2017-03-30 12:13:53.357298	2017-03-30 12:13:53.357298
141	47	2	48	40.0	46.88		VAT-Exclusive	1875.0	\N	2017-03-30 12:14:13.037049	2017-03-30 12:14:13.037049
142	63	6	48	2.0	257.15		VAT-Exclusive	514.29	\N	2017-03-30 12:14:42.589174	2017-03-30 12:14:42.589174
143	68	5	48	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-03-30 12:15:03.727313	2017-03-30 12:15:03.727313
144	69	6	48	20.0	191.48		VAT-Exclusive	3829.57	\N	2017-03-30 12:15:31.004586	2017-03-30 12:15:31.004586
145	78	2	48	2.0	196.43		VAT-Exclusive	392.86	\N	2017-03-30 12:16:15.03036	2017-03-30 12:16:15.03036
146	79	2	48	2.0	258.93		VAT-Exclusive	517.86	\N	2017-03-30 12:16:37.915428	2017-03-30 12:16:37.915428
147	80	2	48	2.0	171.88		VAT-Exclusive	343.75	\N	2017-03-30 12:17:22.600078	2017-03-30 12:17:22.600078
148	38	6	48	14.0	111.61		VAT-Exclusive	1562.5	\N	2017-03-30 12:19:20.141054	2017-03-30 12:19:20.141054
149	94	2	48	33.0	65.91		VAT-Exclusive	2175.0	\N	2017-03-30 12:20:03.517954	2017-03-30 12:20:03.517954
150	9	2	49	157.56	68.64		VAT-Exempted	10814.62	\N	2017-03-30 12:22:17.544928	2017-03-30 12:22:17.544928
151	8	2	49	67.89	81.37		VAT-Exempted	5523.94	\N	2017-03-30 12:22:48.192478	2017-03-30 12:22:48.192478
152	7	2	51	52.8	100.00		VAT-Exempted	5280.0	\N	2017-03-30 12:24:11.604217	2017-03-30 12:24:11.604217
153	121	8	53	1.0	500.00	foil\r\n	VAT-Inclusive	500.0	\N	2017-03-30 12:27:12.656536	2017-03-30 12:27:12.656536
154	121	8	53	2.0	200.00	latex gloves	VAT-Inclusive	400.0	\N	2017-03-30 12:27:30.089229	2017-03-30 12:27:30.089229
155	121	8	53	100.0	1.05	80cc	VAT-Inclusive	105.0	\N	2017-03-30 12:27:52.952111	2017-03-30 12:27:52.952111
156	121	8	53	100.0	0.24	30cc lid	VAT-Inclusive	24.0	\N	2017-03-30 12:28:09.69004	2017-03-30 12:28:09.69004
157	121	8	53	500.0	0.90	8oz cup	VAT-Inclusive	450.0	\N	2017-03-30 12:28:27.966882	2017-03-30 12:28:27.966882
158	121	8	53	100.0	1.50	12oz cup	VAT-Inclusive	150.0	\N	2017-03-30 12:28:53.326894	2017-03-30 12:28:53.326894
159	121	8	53	100.0	0.80	paper bag #8	VAT-Inclusive	80.0	\N	2017-03-30 12:29:11.79289	2017-03-30 12:29:11.79289
160	121	8	53	100.0	1.60	paper bag #16	VAT-Inclusive	160.0	\N	2017-03-30 12:29:19.635562	2017-03-30 12:29:19.635562
161	121	8	53	1000.0	0.25	6 x 7 P.E.	VAT-Inclusive	250.0	\N	2017-03-30 12:29:45.506123	2017-03-30 12:29:45.506123
162	121	8	53	500.0	1.30	260cc	VAT-Inclusive	650.0	\N	2017-03-30 12:30:07.123671	2017-03-30 12:30:07.123671
163	121	8	53	200.0	2.10	520cc	VAT-Inclusive	420.0	\N	2017-03-30 12:30:25.764976	2017-03-30 12:30:25.764976
165	121	8	53	150.0	1.00	260cc lids\r\n	VAT-Inclusive	150.0	\N	2017-03-30 12:33:14.883732	2017-03-30 12:33:14.883732
166	121	8	53	150.0	1.05	520cc lids\r\n	VAT-Inclusive	157.5	\N	2017-03-30 12:33:48.376518	2017-03-30 12:33:48.376518
167	122	8	53	5.0	88.00	joy	VAT-Inclusive	440.0	\N	2017-03-30 12:34:58.769713	2017-03-30 12:34:58.769713
168	122	8	53	1.0	16.00	dia black	VAT-Inclusive	16.0	\N	2017-03-30 12:35:21.407769	2017-03-30 12:35:21.407769
169	122	8	53	3.0	18.00	fedon scrubbing pad	VAT-Inclusive	54.0	\N	2017-03-30 12:35:40.560834	2017-03-30 12:35:40.560834
170	122	8	53	1.0	350.00	lysol\r\n	VAT-Inclusive	350.0	\N	2017-03-30 12:35:59.261502	2017-03-30 12:35:59.261502
175	95	8	54	60.0	20.33		VAT-Inclusive	1220.0	\N	2017-03-30 12:42:38.765734	2017-03-30 12:42:38.765734
179	9	2	56	28.34	68.63		VAT-Exempted	1944.88	\N	2017-03-30 12:47:29.904882	2017-03-30 12:47:29.904882
181	9	2	57	20.37	68.64		VAT-Exempted	1398.26	\N	2017-03-30 12:50:50.931218	2017-03-30 12:50:50.931218
191	9	2	62	10.78	68.64		VAT-Exempted	739.9	\N	2017-03-30 13:04:40.640919	2017-03-30 13:04:40.640919
194	9	2	63	62.17	68.54		VAT-Exempted	4261.22	\N	2017-03-30 13:07:47.570692	2017-03-30 13:07:47.570692
197	8	2	64	6.6	81.36		VAT-Exempted	537.0	\N	2017-03-30 13:14:50.376758	2017-03-30 13:14:50.376758
199	46	2	65	10.0	165.18		VAT-Exclusive	1651.79	\N	2017-03-30 13:17:50.790887	2017-03-30 13:17:50.790887
201	63	6	65	3.0	257.14		VAT-Exclusive	771.43	\N	2017-03-30 13:18:50.351239	2017-03-30 13:18:50.351239
171	123	8	53	2.0	35.00	pentel pen	VAT-Inclusive	70.0	\N	2017-03-30 12:36:16.316851	2017-03-30 12:36:16.316851
172	40	2	54	21.12	51.14		VAT-Inclusive	1080.0	\N	2017-03-30 12:38:30.841341	2017-03-30 12:38:30.841341
173	53	5	54	2.0	300.00		VAT-Inclusive	600.0	\N	2017-03-30 12:38:43.406491	2017-03-30 12:38:43.406491
174	25	2	54	29.99	40.92		VAT-Inclusive	1227.26	\N	2017-03-30 12:39:37.074731	2017-03-30 12:39:37.074731
176	17	7	54	3.0	308.00		VAT-Inclusive	924.0	\N	2017-03-30 12:43:04.701329	2017-03-30 12:43:04.701329
180	8	2	56	11.0	81.36		VAT-Exempted	895.0	\N	2017-03-30 12:49:13.722714	2017-03-30 12:49:13.722714
185	8	2	59	45.49	81.36		VAT-Exempted	3701.21	\N	2017-03-30 12:55:38.287345	2017-03-30 12:55:38.287345
186	9	2	60	153.6	68.64		VAT-Exempted	10542.82	\N	2017-03-30 12:57:03.060529	2017-03-30 12:57:03.060529
189	9	2	61	46.5	68.78		VAT-Exempted	3198.18	\N	2017-03-30 13:02:16.870347	2017-03-30 13:02:16.870347
190	8	2	61	4.57	81.47		VAT-Exempted	372.32	\N	2017-03-30 13:02:52.163173	2017-03-30 13:02:52.163173
202	64	5	65	1.0	468.75		VAT-Exclusive	468.75	\N	2017-03-30 13:19:09.202489	2017-03-30 13:19:09.202489
177	16	4	54	16.0	42.50		VAT-Inclusive	680.0	\N	2017-03-30 12:43:52.652795	2017-03-30 12:43:52.652795
182	8	2	57	11.17	81.41		VAT-Exempted	909.32	\N	2017-03-30 12:51:41.842547	2017-03-30 12:51:41.842547
196	9	2	64	18.92	68.64		VAT-Exempted	1298.6	\N	2017-03-30 13:14:14.523169	2017-03-30 13:14:14.523169
200	47	2	65	50.0	46.88		VAT-Exclusive	2343.75	\N	2017-03-30 13:18:18.302632	2017-03-30 13:18:18.302632
178	18	5	55	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-03-30 12:45:05.365661	2017-03-30 12:45:05.365661
183	8	2	58	22.44	81.36		VAT-Exempted	1825.8	\N	2017-03-30 12:53:26.852493	2017-03-30 12:53:26.852493
184	9	2	59	331.14	68.64		VAT-Exempted	22728.52	\N	2017-03-30 12:54:55.264214	2017-03-30 12:54:55.264214
187	8	2	60	22.26	161.79		VAT-Exempted	3601.48	\N	2017-03-30 12:57:32.99727	2017-03-30 12:57:32.99727
193	8	2	62	18.04	81.36		VAT-Exempted	1467.8	\N	2017-03-30 13:06:22.210763	2017-03-30 13:06:22.210763
195	8	2	63	22.26	81.38		VAT-Exempted	1811.48	\N	2017-03-30 13:11:49.504376	2017-03-30 13:11:49.504376
198	39	2	65	35.0	55.36		VAT-Exclusive	1937.5	\N	2017-03-30 13:17:17.724666	2017-03-30 13:17:17.724666
203	68	5	65	5.0	580.36		VAT-Exclusive	2901.78	\N	2017-03-30 13:19:30.224616	2017-03-30 13:19:30.224616
204	70	6	65	2.0	241.07		VAT-Exclusive	482.14	\N	2017-03-30 13:20:23.638298	2017-03-30 13:20:23.638298
205	79	2	65	2.0	258.93		VAT-Exclusive	517.86	\N	2017-03-30 13:20:39.394486	2017-03-30 13:20:39.394486
206	134	8	66	1.0	1330.00	double play a stand sticker	VAT-Inclusive	1330.0	\N	2017-03-30 13:22:37.631719	2017-03-30 13:22:37.631719
207	121	8	67	4.0	50.00	Check out form	VAT-Inclusive	200.0	\N	2017-03-30 13:24:16.218964	2017-03-30 13:24:16.218964
208	121	8	67	1.0	50.00	Chief Report	VAT-Inclusive	50.0	\N	2017-03-30 13:24:32.711062	2017-03-30 13:24:32.711062
209	121	8	67	20.0	38.00	Order Slip\r\n	VAT-Inclusive	760.0	\N	2017-03-30 13:24:55.88448	2017-03-30 13:24:55.88448
210	99	7	68	48.0	17.41		VAT-Exclusive	835.71	\N	2017-03-30 13:31:13.411779	2017-03-30 13:31:13.411779
211	7	2	69	52.8	100.00		VAT-Exempted	5280.0	\N	2017-03-30 13:39:42.418466	2017-03-30 13:39:42.418466
212	15	13	70	6.0	530.00		VAT-Inclusive	3180.0	\N	2017-03-30 13:41:20.735878	2017-03-30 13:41:20.735878
213	121	8	71	5.0	35.00	Disposable Gloves	VAT-Inclusive	175.0	\N	2017-03-30 13:42:27.264727	2017-03-30 13:42:27.264727
214	121	8	71	100.0	0.70	30cc 	VAT-Inclusive	70.0	\N	2017-03-30 13:56:50.790682	2017-03-30 13:56:50.790682
215	121	8	71	100.0	3.68	XXL trash bag liner	VAT-Inclusive	368.0	\N	2017-03-30 13:57:44.366373	2017-03-30 13:57:44.366373
216	121	8	71	150.0	0.75	Spoon Black	VAT-Inclusive	112.5	\N	2017-03-30 13:58:07.990574	2017-03-30 13:58:07.990574
217	121	8	71	100.0	0.75	Fork Black	VAT-Inclusive	75.0	\N	2017-03-30 13:58:23.839261	2017-03-30 13:58:23.839261
218	121	8	71	200.0	1.30	260cc 	VAT-Inclusive	260.0	\N	2017-03-30 13:58:44.062929	2017-03-30 13:58:44.062929
219	122	8	71	2.0	70.00	jumbo roll tissue\r\n	VAT-Inclusive	140.0	\N	2017-03-30 13:59:08.295254	2017-03-30 13:59:08.295254
220	122	8	71	5.0	88.00	joy\r\n	VAT-Inclusive	440.0	\N	2017-03-30 13:59:23.370463	2017-03-30 13:59:23.370463
221	123	8	71	3.0	35.00	pentel pen	VAT-Inclusive	105.0	\N	2017-03-30 13:59:47.02771	2017-03-30 13:59:47.02771
222	47	2	72	20.0	46.88		VAT-Exclusive	937.5	\N	2017-03-30 14:06:29.190828	2017-03-30 14:06:29.190828
223	64	5	72	3.0	495.42		VAT-Exclusive	1486.25	\N	2017-03-30 14:06:52.818248	2017-03-30 14:06:52.818248
224	69	6	72	12.0	207.14		VAT-Exclusive	2485.71	\N	2017-03-30 14:07:43.423738	2017-03-30 14:07:43.423738
225	94	2	72	165.0	65.91		VAT-Exclusive	10875.0	\N	2017-03-30 14:08:38.576129	2017-03-30 14:08:38.576129
226	25	2	73	120.0	40.91		VAT-Inclusive	4909.03	\N	2017-03-30 14:26:54.638693	2017-03-30 14:26:54.638693
227	39	2	74	10.0	55.36		VAT-Exclusive	553.57	\N	2017-03-30 14:28:40.20792	2017-03-30 14:28:40.20792
228	47	2	74	30.0	46.88		VAT-Exclusive	1406.25	\N	2017-03-30 14:29:02.839402	2017-03-30 14:29:02.839402
229	63	6	74	1.0	257.14		VAT-Exclusive	257.14	\N	2017-03-30 14:29:36.75121	2017-03-30 14:29:36.75121
230	64	5	74	1.0	468.75		VAT-Exclusive	468.75	\N	2017-03-30 14:29:56.579256	2017-03-30 14:29:56.579256
231	68	5	74	2.0	580.36		VAT-Exclusive	1160.72	\N	2017-03-30 14:30:25.652643	2017-03-30 14:30:25.652643
232	69	6	74	20.0	196.03		VAT-Exclusive	3920.57	\N	2017-03-30 14:30:48.716759	2017-03-30 14:30:48.716759
233	79	2	74	2.0	258.93		VAT-Exclusive	517.86	\N	2017-03-30 14:31:12.984271	2017-03-30 14:31:12.984271
234	97	9	75	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-03-30 14:32:14.63576	2017-03-30 14:32:14.63576
235	15	13	76	11.0	530.00		VAT-Inclusive	5830.0	\N	2017-03-30 14:33:18.434732	2017-03-30 14:33:18.434732
236	121	8	77	1.0	500.00	Nanya Wrap	VAT-Inclusive	500.0	\N	2017-03-30 14:34:28.261574	2017-03-30 14:34:28.261574
237	121	8	77	2.0	200.00	Latex Gloves	VAT-Inclusive	400.0	\N	2017-03-30 14:34:54.680004	2017-03-30 14:34:54.680004
238	121	8	77	300.0	0.90	8oz cup	VAT-Inclusive	270.0	\N	2017-03-30 14:35:34.597073	2017-03-30 14:35:34.597073
239	121	8	77	300.0	1.30	260cc	VAT-Inclusive	390.0	\N	2017-03-30 14:35:50.042423	2017-03-30 14:35:50.042423
240	121	8	77	100.0	2.65	16oz cup	VAT-Inclusive	265.0	\N	2017-03-30 14:36:13.966815	2017-03-30 14:36:13.966815
241	122	8	78	1.0	125.00	zonrox	VAT-Inclusive	125.0	\N	2017-03-30 14:37:18.534427	2017-03-30 14:37:18.534427
242	122	8	78	1.0	290.00	baygon\r\n	VAT-Inclusive	290.0	\N	2017-03-30 14:37:31.475889	2017-03-30 14:37:31.475889
243	122	8	78	4.0	88.00	joy	VAT-Inclusive	352.0	\N	2017-03-30 14:37:47.605678	2017-03-30 14:37:47.605678
244	122	8	78	2.0	16.00	dia black\r\n	VAT-Inclusive	32.0	\N	2017-03-30 14:38:03.592998	2017-03-30 14:38:03.592998
245	122	8	78	2.0	18.00	fedon scrubbing pad	VAT-Inclusive	36.0	\N	2017-03-30 14:38:20.187031	2017-03-30 14:38:20.187031
246	18	5	79	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-03-30 14:39:32.471654	2017-03-30 14:39:32.471654
247	19	6	80	8.0	13.75		VAT-Inclusive	110.0	\N	2017-03-30 14:41:09.016356	2017-03-30 14:41:09.016356
248	53	5	80	2.0	300.00		VAT-Inclusive	600.0	\N	2017-03-30 14:41:37.594079	2017-03-30 14:41:37.594079
249	5	2	80	44.0	72.73		VAT-Inclusive	3200.0	\N	2017-03-30 14:43:53.454237	2017-03-30 14:43:53.454237
250	95	8	80	60.0	20.33		VAT-Inclusive	1220.0	\N	2017-03-30 14:44:17.270973	2017-03-30 14:44:17.270973
251	95	8	80	72.0	16.94		VAT-Inclusive	1220.0	\N	2017-03-30 14:45:06.256143	2017-03-30 14:45:06.256143
252	12	2	80	7.45	318.52		VAT-Inclusive	2373.0	\N	2017-03-30 14:45:46.126159	2017-03-30 14:45:46.126159
253	17	7	80	3.0	308.00		VAT-Inclusive	924.0	\N	2017-03-30 14:46:02.258443	2017-03-30 14:46:02.258443
254	16	4	80	16.0	42.50		VAT-Inclusive	680.0	\N	2017-03-30 14:46:20.752158	2017-03-30 14:46:20.752158
255	26	2	81	26.99	129.11		VAT-Inclusive	3484.68	\N	2017-03-30 14:47:48.873934	2017-03-30 14:47:48.873934
256	121	8	82	1000.0	1.05	80cc 	VAT-Inclusive	1050.0	\N	2017-03-31 12:33:05.000448	2017-03-31 12:33:05.000448
257	121	8	82	900.0	0.45	sauce lid	VAT-Inclusive	405.0	\N	2017-03-31 12:33:29.929699	2017-03-31 12:33:29.929699
258	121	8	82	650.0	1.30	260cc	VAT-Inclusive	845.0	\N	2017-03-31 12:33:49.635116	2017-03-31 12:33:49.635116
259	121	8	82	650.0	1.00	520cc	VAT-Inclusive	650.0	\N	2017-03-31 12:34:07.690792	2017-03-31 12:34:07.690792
260	121	8	82	500.0	2.10	520cc lids	VAT-Inclusive	1050.0	\N	2017-03-31 12:34:29.356117	2017-03-31 12:34:29.356117
261	121	8	82	700.0	0.75	spoon black	VAT-Inclusive	525.0	\N	2017-03-31 12:41:27.035263	2017-03-31 12:41:27.035263
262	121	8	82	700.0	0.75	fork black	VAT-Inclusive	525.0	\N	2017-03-31 12:41:50.174962	2017-03-31 12:41:50.174962
263	121	8	82	700.0	0.75	knife black	VAT-Inclusive	525.0	\N	2017-03-31 12:41:59.411055	2017-03-31 12:41:59.411055
264	121	8	82	500.0	1.60	brown bag #16	VAT-Inclusive	800.0	\N	2017-03-31 12:42:19.416626	2017-03-31 12:42:19.416626
265	5	2	83	45.54	135.52		VAT-Inclusive	6171.5	\N	2017-03-31 12:46:52.487455	2017-03-31 12:46:52.487455
266	6	2	83	46.02	128.81		VAT-Inclusive	5927.89	\N	2017-03-31 12:47:30.626283	2017-03-31 12:47:30.626283
267	5	2	84	42.11	135.51		VAT-Inclusive	5706.4	\N	2017-03-31 12:49:24.129295	2017-03-31 12:49:24.129295
268	122	8	85	1.0	125.00	zonrox	VAT-Inclusive	125.0	\N	2017-03-31 12:51:07.424096	2017-03-31 12:51:07.424096
269	122	8	85	1.0	290.00	baygon	VAT-Inclusive	290.0	\N	2017-03-31 12:51:22.786896	2017-03-31 12:51:22.786896
270	122	8	85	5.0	88.00	joy	VAT-Inclusive	440.0	\N	2017-03-31 12:51:39.191341	2017-03-31 12:51:39.191341
271	122	8	85	2.0	16.00	dia black	VAT-Inclusive	32.0	\N	2017-03-31 12:51:59.762501	2017-03-31 12:51:59.762501
272	122	8	85	12.0	15.83	white towel	VAT-Inclusive	190.0	\N	2017-03-31 12:52:14.5472	2017-03-31 12:52:14.5472
273	122	8	85	2.0	18.00	fedon scrubbing pad	VAT-Inclusive	36.0	\N	2017-03-31 12:52:37.106545	2017-03-31 12:52:37.106545
274	122	8	85	1.0	350.00	lysol	VAT-Inclusive	350.0	\N	2017-03-31 12:52:52.02312	2017-03-31 12:52:52.02312
275	122	8	85	2.0	60.00	mop heads	VAT-Inclusive	120.0	\N	2017-03-31 12:53:13.172915	2017-03-31 12:53:13.172915
277	123	8	85	2.0	25.00	masking tape	VAT-Inclusive	50.0	\N	2017-03-31 12:53:52.602622	2017-03-31 12:53:52.602622
278	123	8	85	1.0	35.00	pentel pen	VAT-Inclusive	35.0	\N	2017-03-31 12:54:05.655409	2017-03-31 12:54:05.655409
279	121	8	86	2.0	200.00	latex gloves	VAT-Inclusive	400.0	\N	2017-03-31 12:59:38.603235	2017-03-31 12:59:38.603235
280	121	8	86	200.0	1.05	80cc	VAT-Inclusive	210.0	\N	2017-03-31 12:59:53.446557	2017-03-31 12:59:53.446557
281	121	8	86	800.0	0.24	30cc	VAT-Inclusive	192.0	\N	2017-03-31 13:00:26.833303	2017-03-31 13:00:26.833303
282	121	8	86	200.0	0.45	sauce lid	VAT-Inclusive	90.0	\N	2017-03-31 13:00:44.05358	2017-03-31 13:00:44.05358
283	121	8	86	500.0	0.90	8oz cup	VAT-Inclusive	450.0	\N	2017-03-31 13:01:03.862307	2017-03-31 13:01:03.862307
284	121	8	86	200.0	1.50	12oz cup	VAT-Inclusive	300.0	\N	2017-03-31 13:01:22.532111	2017-03-31 13:01:22.532111
285	121	8	86	30.0	30.00	paper towel	VAT-Inclusive	900.0	\N	2017-03-31 13:01:43.989817	2017-03-31 13:01:43.989817
286	121	8	86	100.0	0.80	brown bag#8	VAT-Inclusive	80.0	\N	2017-03-31 13:02:00.081576	2017-03-31 13:02:00.081576
287	121	8	86	100.0	1.60	brown bag#16	VAT-Inclusive	160.0	\N	2017-03-31 13:02:11.261545	2017-03-31 13:02:11.261545
288	121	8	86	100.0	3.68	trash liner	VAT-Inclusive	368.0	\N	2017-03-31 13:02:27.770801	2017-03-31 13:02:27.770801
289	121	8	86	1.0	120.00	red straw	VAT-Inclusive	120.0	\N	2017-03-31 13:02:45.210932	2017-03-31 13:02:45.210932
290	121	8	86	1000.0	0.25	6 x 7 PE	VAT-Inclusive	250.0	\N	2017-03-31 13:03:09.841197	2017-03-31 13:03:09.841197
291	121	8	86	400.0	1.30	260cc	VAT-Inclusive	520.0	\N	2017-03-31 13:03:27.471491	2017-03-31 13:03:27.471491
292	121	8	86	100.0	2.65	16 oz cup	VAT-Inclusive	265.0	\N	2017-03-31 13:03:43.901645	2017-03-31 13:03:43.901645
293	121	8	86	100.0	1.00	260cc lids	VAT-Inclusive	100.0	\N	2017-03-31 13:03:58.878442	2017-03-31 13:03:58.878442
294	121	8	86	500.0	0.80	sando bag	VAT-Inclusive	400.0	\N	2017-03-31 13:04:13.58562	2017-03-31 13:04:13.58562
295	24	2	87	77.88	25.42		VAT-Inclusive	1980.0	\N	2017-03-31 13:08:29.89293	2017-03-31 13:08:29.89293
296	40	2	87	21.12	51.14		VAT-Inclusive	1080.0	\N	2017-03-31 13:09:01.265102	2017-03-31 13:09:01.265102
297	57	6	87	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-03-31 13:09:37.194223	2017-03-31 13:09:37.194223
298	53	5	87	1.0	1200.00		VAT-Inclusive	1200.0	\N	2017-03-31 13:09:56.253036	2017-03-31 13:09:56.253036
299	1	2	87	17.6	88.64		VAT-Inclusive	1560.0	\N	2017-03-31 13:10:26.588542	2017-03-31 13:10:26.588542
300	5	2	87	22.0	72.73		VAT-Inclusive	1600.0	\N	2017-03-31 13:11:26.584232	2017-03-31 13:11:26.584232
301	33	11	88	17.6	3.35		VAT-Exempted	59.0	\N	2017-03-31 13:12:43.943984	2017-03-31 13:12:43.943984
302	21	2	88	121.0	23.76		VAT-Exempted	2875.0	\N	2017-03-31 13:13:04.766179	2017-03-31 13:13:04.766179
303	22	2	88	4.4	26.36		VAT-Exempted	116.0	\N	2017-03-31 13:13:34.085176	2017-03-31 13:13:34.085176
304	32	2	88	5.5	21.82		VAT-Exempted	120.0	\N	2017-03-31 13:13:58.432369	2017-03-31 13:13:58.432369
305	21	2	89	11.0	20.45		VAT-Exempted	225.0	\N	2017-03-31 13:15:05.730577	2017-03-31 13:15:05.730577
306	30	8	89	10.0	11.80		VAT-Exempted	118.0	\N	2017-03-31 13:15:17.627099	2017-03-31 13:15:17.627099
307	32	2	89	11.0	21.82		VAT-Exempted	240.0	\N	2017-03-31 13:15:44.442762	2017-03-31 13:15:44.442762
308	33	11	89	7.04	3.35		VAT-Exempted	23.6	\N	2017-03-31 13:16:12.840754	2017-03-31 13:16:12.840754
309	34	2	89	4.4	26.36		VAT-Exempted	116.0	\N	2017-03-31 13:16:44.932204	2017-03-31 13:16:44.932204
310	36	2	89	6.6	24.09		VAT-Exempted	159.0	\N	2017-03-31 13:17:09.424807	2017-03-31 13:17:09.424807
311	27	2	89	1.1	69.55		VAT-Exempted	76.5	\N	2017-03-31 13:17:34.549582	2017-03-31 13:17:34.549582
312	20	11	89	3.52	4.77		VAT-Exempted	16.8	\N	2017-03-31 13:18:02.480192	2017-03-31 13:18:02.480192
313	28	11	89	3.52	6.76		VAT-Exempted	23.8	\N	2017-03-31 13:18:18.154192	2017-03-31 13:18:18.154192
314	23	11	89	3.52	4.77		VAT-Exempted	16.8	\N	2017-03-31 13:18:38.99424	2017-03-31 13:18:38.99424
315	56	2	90	275.0	42.27		VAT-Inclusive	11625.0	\N	2017-03-31 13:20:45.445652	2017-03-31 13:20:45.445652
316	134	8	91	4.0	650.00		VAT-Inclusive	2600.0	\N	2017-03-31 13:24:26.728635	2017-03-31 13:24:26.728635
317	121	8	92	1.0	570.00		VAT-Inclusive	570.0	\N	2017-03-31 13:25:22.289058	2017-03-31 13:25:22.289058
318	121	8	93	2.0	50.00	check out form and chief report	VAT-Inclusive	100.0	\N	2017-03-31 13:26:46.829467	2017-03-31 13:26:46.829467
319	134	8	94	20.0	90.00	double play	VAT-Inclusive	1800.0	\N	2017-03-31 13:28:17.33121	2017-03-31 13:28:17.33121
320	121	8	96	1000.0	0.85	buffalo'sliner	VAT-Inclusive	850.0	\N	2017-03-31 13:31:02.586645	2017-03-31 13:31:02.586645
322	24	1	98	34.8	56.90		VAT-Inclusive	1980.0	\N	2017-04-04 07:33:01.475962	2017-04-04 07:33:01.475962
323	40	1	98	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-04-04 07:34:22.726443	2017-04-04 07:34:22.726443
324	19	6	98	4.0	55.00		VAT-Inclusive	220.0	\N	2017-04-04 07:35:12.052152	2017-04-04 07:35:12.052152
325	53	5	98	3.0	300.00		VAT-Inclusive	900.0	\N	2017-04-04 07:35:36.6681	2017-04-04 07:35:36.6681
326	1	1	98	10.0	195.00		VAT-Exempted	1950.0	\N	2017-04-04 07:37:06.380618	2017-04-04 07:37:06.380618
327	95	8	98	96.0	16.94		VAT-Inclusive	1626.66	\N	2017-04-04 07:39:25.827343	2017-04-04 07:39:25.827343
328	12	1	98	3.39	699.17		VAT-Inclusive	2370.2	\N	2017-04-04 07:41:53.409178	2017-04-04 07:41:53.409178
329	13	1	98	2.0	600.00		VAT-Inclusive	1200.0	\N	2017-04-04 07:44:34.887374	2017-04-04 07:44:34.887374
330	16	4	98	16.0	42.50		VAT-Inclusive	680.0	\N	2017-04-04 07:45:05.183775	2017-04-04 07:45:05.183775
331	121	8	97	2000.0	0.90	Buffalo's and Chubby's Liner	VAT-Exclusive	1800.0	\N	2017-04-04 07:46:22.213129	2017-04-04 07:46:22.213129
332	121	8	99	1.0	7330.00		VAT-Inclusive	7330.0	\N	2017-04-04 07:49:02.816578	2017-04-04 07:49:02.816578
333	122	8	100	1.0	1536.00		VAT-Inclusive	1536.0	\N	2017-04-04 07:50:25.698121	2017-04-04 07:50:25.698121
334	36	1	101	3.0	53.00		VAT-Exempted	159.0	\N	2017-04-04 07:52:21.650814	2017-04-04 07:52:21.650814
335	23	1	101	0.1	168.00		VAT-Exempted	16.8	\N	2017-04-04 07:52:54.505591	2017-04-04 07:52:54.505591
336	32	1	101	2.0	48.00		VAT-Exempted	96.0	\N	2017-04-04 07:53:19.971162	2017-04-04 07:53:19.971162
337	33	1	101	0.1	98.00		VAT-Exempted	9.8	\N	2017-04-04 07:53:41.729653	2017-04-04 07:53:41.729653
338	34	1	101	3.0	63.00		VAT-Exempted	189.0	\N	2017-04-04 07:54:11.926632	2017-04-04 07:54:11.926632
339	39	2	102	35.0	55.36		VAT-Exclusive	1937.5	\N	2017-04-04 07:57:22.507195	2017-04-04 07:57:22.507195
341	47	2	102	40.0	46.88		VAT-Exclusive	1875.0	\N	2017-04-04 08:01:02.023164	2017-04-04 08:01:02.023164
342	63	6	102	1.2	214.28		VAT-Exclusive	257.14	\N	2017-04-04 08:04:05.703624	2017-04-04 08:04:05.703624
343	68	5	102	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-04-04 08:05:05.488085	2017-04-04 08:05:05.488085
344	69	6	102	4.0	196.43		VAT-Exclusive	785.71	\N	2017-04-04 08:05:57.884204	2017-04-04 08:05:57.884204
345	70	6	102	1.19	202.58		VAT-Exclusive	241.07	\N	2017-04-04 08:09:17.214744	2017-04-04 08:09:17.214744
346	79	2	102	2.0	258.93		VAT-Exclusive	517.86	\N	2017-04-04 08:10:08.084662	2017-04-04 08:10:08.084662
347	38	6	102	10.0	111.61		VAT-Exclusive	1116.07	\N	2017-04-04 08:11:11.413057	2017-04-04 08:11:11.413057
349	46	1	102	7.28	363.03		VAT-Exclusive	2642.86	\N	2017-04-04 08:14:56.423361	2017-04-04 08:14:56.423361
348	64	5	102	1.0	468.75		VAT-Exclusive	468.75	\N	2017-04-04 08:12:27.033398	2017-04-04 08:12:27.033398
350	67	5	103	1.0	758.93		VAT-Exclusive	758.93	\N	2017-04-04 08:16:41.627535	2017-04-04 08:16:41.627535
351	7	1	104	24.0	220.00		VAT-Exempted	5280.0	\N	2017-04-04 08:18:35.249444	2017-04-04 08:18:35.249444
352	6	1	104	24.22	185.00		VAT-Exempted	4480.7	\N	2017-04-04 08:19:28.219237	2017-04-04 08:19:28.219237
353	97	9	105	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-04-04 08:40:15.666151	2017-04-04 08:40:15.666151
359	109	12	107	96.0	5.83		VAT-Inclusive	560.0	\N	2017-04-04 08:58:33.35451	2017-04-04 08:58:33.35451
360	36	1	109	4.0	53.00		VAT-Exempted	212.0	\N	2017-04-04 09:00:41.339747	2017-04-04 09:00:41.339747
364	33	1	109	0.1	98.00		VAT-Exempted	9.8	\N	2017-04-04 09:03:37.648638	2017-04-04 09:03:37.648638
369	124	8	110	3.0	200.00	Tube Ice	VAT-Exempted	600.0	\N	2017-04-05 10:29:52.097829	2017-04-05 10:29:52.097829
377	57	6	110	3.2	177.50		VAT-Inclusive	568.0	\N	2017-04-05 10:37:07.776766	2017-04-05 10:37:07.776766
381	37	8	110	180.0	4.33		VAT-Inclusive	778.5	\N	2017-04-05 10:41:17.118773	2017-04-05 10:41:17.118773
387	131	8	111	1.0	61.00	Fare for buying butters	VAT-Exempted	61.0	\N	2017-04-05 10:45:58.927061	2017-04-05 10:45:58.927061
390	61	1	112	25.0	46.00		VAT-Exempted	1150.0	\N	2017-04-05 10:51:25.208478	2017-04-05 10:51:25.208478
402	36	1	113	3.0	160.00		VAT-Exempted	480.0	\N	2017-04-05 11:14:35.557356	2017-04-05 11:14:35.557356
403	32	1	113	3.0	65.00		VAT-Exempted	195.0	\N	2017-04-05 11:15:00.88036	2017-04-05 11:15:00.88036
405	33	1	113	0.2	180.00		VAT-Exempted	36.0	\N	2017-04-05 11:16:07.315873	2017-04-05 11:16:07.315873
412	5	1	117	30.0	160.00		VAT-Exempted	4800.0	\N	2017-04-05 11:42:39.018125	2017-04-05 11:42:39.018125
414	42	8	118	20.0	4.50		VAT-Inclusive	90.0	\N	2017-04-05 11:44:57.078362	2017-04-05 11:44:57.078362
417	11	2	112	42.24	110.19		VAT-Exclusive	4654.28	\N	2017-04-06 07:01:09.320132	2017-04-06 07:01:09.320132
354	107	12	105	128.0	4.28		VAT-Inclusive	548.0	\N	2017-04-04 08:41:57.015517	2017-04-04 08:41:57.015517
355	25	1	106	20.0	75.00		VAT-Inclusive	1500.0	\N	2017-04-04 08:44:56.030537	2017-04-04 08:44:56.030537
356	26	1	106	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-04-04 08:47:14.014485	2017-04-04 08:47:14.014485
357	112	12	107	144.0	3.54		VAT-Inclusive	510.0	\N	2017-04-04 08:57:03.785254	2017-04-04 08:57:03.785254
358	113	12	107	134.4	11.16		VAT-Inclusive	1500.0	\N	2017-04-04 08:57:28.148404	2017-04-04 08:57:28.148404
361	21	1	109	6.0	45.00		VAT-Exempted	270.0	\N	2017-04-04 09:01:42.602073	2017-04-04 09:01:42.602073
363	28	1	109	0.1	238.00		VAT-Exempted	23.8	\N	2017-04-04 09:03:14.182458	2017-04-04 09:03:14.182458
366	31	1	109	0.8	68.00		VAT-Exempted	54.4	\N	2017-04-04 09:04:55.367963	2017-04-04 09:04:55.367963
367	22	1	109	0.25	59.00		VAT-Exempted	14.75	\N	2017-04-04 09:08:40.458632	2017-04-04 09:08:40.458632
368	137	8	110	1.0	650.00	Myrtle 9am, Rizal 9am, Santos 9am, Mico 9am, Bryan 9am, Lou 10am, Cheryline 3:30pm, Gezelle 11am, Rodel 5pm, Alvin 6pm, Lexie 4:30pm, Sharlaine 4:30pm, Lem 2:30pm	VAT-Exempted	650.0	\N	2017-04-05 10:28:30.333467	2017-04-05 10:28:30.333467
370	130	8	110	1.0	15.00	Printing of clearance form	VAT-Inclusive	15.0	\N	2017-04-05 10:30:20.91243	2017-04-05 10:30:20.91243
372	130	8	110	1.0	25.00	Lighter for kitchen	VAT-Inclusive	25.0	\N	2017-04-05 10:31:45.944122	2017-04-05 10:31:45.944122
373	130	8	110	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-05 10:32:31.456942	2017-04-05 10:32:31.456942
376	49	6	110	3.0	219.00		VAT-Inclusive	657.0	\N	2017-04-05 10:34:34.985533	2017-04-05 10:34:34.985533
379	93	1	110	2.0	55.65		VAT-Inclusive	111.3	\N	2017-04-05 10:39:34.195946	2017-04-05 10:39:34.195946
382	88	1	110	0.5	711.70		VAT-Inclusive	355.85	\N	2017-04-05 10:41:48.452801	2017-04-05 10:41:48.452801
383	72	6	110	1.0	36.75		VAT-Inclusive	36.75	\N	2017-04-05 10:42:23.831845	2017-04-05 10:42:23.831845
384	48	1	110	0.8	161.75		VAT-Inclusive	129.4	\N	2017-04-05 10:43:00.959903	2017-04-05 10:43:00.959903
386	74	12	110	81.92	8.41		VAT-Inclusive	688.8	\N	2017-04-05 10:44:14.275347	2017-04-05 10:44:14.275347
389	137	8	111	1.0	700.00	Myrtle 9am, Rizal 9am, Santos 9am, Bryan 9am, Mico 11am, Lou 10am, Jerlyn 11-3/5-9, Che 3:30pm, Lem 2:30pm, Sha 5pm, Lexie 5pm, Rodel 5pm, Alvin 5pm	VAT-Exempted	700.0	\N	2017-04-05 10:49:13.191627	2017-04-05 10:49:13.191627
391	131	8	112	1.0	100.00	Borrowed Wings from G5	VAT-Exempted	100.0	\N	2017-04-05 10:52:33.76215	2017-04-05 10:52:33.76215
396	137	8	112	1.0	600.00	Myrtle 9am, Rizal 9am, Santos 9am, Lou 10am, Jerlyn 11-3/5-9, Mico 11am, Lem 2:30pm, Che 3:30pm, Sha 5pm, Rodel 5pm, Alvin 5pm	VAT-Exempted	600.0	\N	2017-04-05 10:58:47.807207	2017-04-05 10:58:47.807207
401	73	12	110	34.0	11.03		VAT-Inclusive	375.0	\N	2017-04-05 11:09:52.733953	2017-04-05 11:09:52.733953
404	34	1	113	1.5	120.00		VAT-Exempted	180.0	\N	2017-04-05 11:15:35.498636	2017-04-05 11:15:35.498636
406	21	1	113	4.0	45.00		VAT-Exempted	180.0	\N	2017-04-05 11:16:27.936893	2017-04-05 11:16:27.936893
408	27	1	113	0.5	155.00		VAT-Exempted	77.5	\N	2017-04-05 11:17:33.521047	2017-04-05 11:17:33.521047
409	61	1	113	15.0	44.00		VAT-Exempted	660.0	\N	2017-04-05 11:18:09.640248	2017-04-05 11:18:09.640248
413	44	8	118	75.0	4.60		VAT-Inclusive	345.0	\N	2017-04-05 11:44:37.113766	2017-04-05 11:44:37.113766
415	43	8	118	10.0	6.60		VAT-Inclusive	66.0	\N	2017-04-05 11:45:16.885226	2017-04-05 11:45:16.885226
365	32	1	109	4.0	48.00		VAT-Exempted	192.0	\N	2017-04-04 09:04:23.526333	2017-04-04 09:04:23.526333
371	130	8	110	1.0	30.00	Printing of PCF	VAT-Inclusive	30.0	\N	2017-04-05 10:30:59.145339	2017-04-05 10:30:59.145339
374	131	8	110	1.0	112.00	Open Market	VAT-Exempted	112.0	\N	2017-04-05 10:33:23.003941	2017-04-05 10:33:23.003941
378	130	8	110	1.0	17.95	Ecobag	VAT-Inclusive	17.95	\N	2017-04-05 10:38:20.625455	2017-04-05 10:38:20.625455
380	92	1	110	2.0	47.25		VAT-Exempted	94.5	\N	2017-04-05 10:40:44.959987	2017-04-05 10:40:44.959987
385	41	12	110	21.0	8.00		VAT-Inclusive	168.0	\N	2017-04-05 10:43:21.33867	2017-04-05 10:43:21.33867
395	124	8	112	3.0	240.00	Tube Ice	VAT-Exempted	720.0	\N	2017-04-05 10:57:09.095387	2017-04-05 10:57:09.095387
407	22	1	113	0.25	75.00		VAT-Exempted	18.75	\N	2017-04-05 11:16:51.752609	2017-04-05 11:16:51.752609
410	20	1	113	0.1	200.00		VAT-Exempted	20.0	\N	2017-04-05 11:18:28.865578	2017-04-05 11:18:28.865578
411	9	1	115	114.0	185.00		VAT-Exempted	21090.0	\N	2017-04-05 11:32:43.81274	2017-04-05 11:32:43.81274
418	10	2	112	47.52	60.16		VAT-Exclusive	2858.57	\N	2017-04-06 07:02:24.664596	2017-04-06 07:02:24.664596
419	10	2	111	26.24	79.78		VAT-Inclusive	2093.5	\N	2017-04-06 07:04:09.148021	2017-04-06 07:04:09.148021
420	137	8	119	1.0	650.00	Myrtle 9am, Rizal 9am, Santos 9am, Mico 11am, Lou 10am, Jerlyn 11-3/5-9, Che 3:30, Sha 5pm, Lexi 5pm, Lem 2:30,  Alvin 5pm, Mico 5pm	VAT-Exempted	650.0	\N	2017-04-09 06:57:03.262776	2017-04-09 06:57:03.262776
421	130	8	119	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-09 06:57:36.719914	2017-04-09 06:57:36.719914
422	131	8	119	1.0	100.00	Fare for buying Rice from the Market	VAT-Exempted	100.0	\N	2017-04-09 06:58:20.114016	2017-04-09 06:58:20.114016
423	131	8	119	1.0	150.00	Rustans to S1 Open Market	VAT-Exempted	150.0	\N	2017-04-09 07:01:01.579391	2017-04-09 07:01:01.579391
424	57	6	119	3.2	355.00		VAT-Inclusive	1136.0	\N	2017-04-09 07:01:41.990634	2017-04-09 07:01:41.990634
425	61	1	119	20.0	59.80		VAT-Exempted	1196.0	\N	2017-04-09 07:02:07.099793	2017-04-09 07:02:07.099793
427	21	2	119	5.21	49.21		VAT-Exempted	256.37	\N	2017-04-09 07:03:06.589759	2017-04-09 07:03:06.589759
428	123	8	119	1.0	235.00	Tape Dispenser	VAT-Inclusive	235.0	\N	2017-04-09 07:03:36.081666	2017-04-09 07:03:36.081666
429	61	1	119	25.0	46.80		VAT-Inclusive	1170.0	\N	2017-04-09 07:04:45.573536	2017-04-09 07:04:45.573536
430	124	8	120	1.0	720.00	Tube Ice	VAT-Exempted	720.0	\N	2017-04-09 07:29:40.226837	2017-04-09 07:29:40.226837
431	122	8	120	1.0	52.00	Dishwashing Liquid	VAT-Inclusive	52.0	\N	2017-04-09 07:30:06.609271	2017-04-09 07:30:06.609271
432	137	8	120	1.0	700.00	Rodel 5pm, Lexie 5pm, Che 4pm, Lem 2:30pm, Mico 12-4/6-10, Sharlaine 12-4/6-10, Jerlyn 11-3/5-9, Lou 10am, Santos 9am, Rizal 9am, Myrtle 9am	VAT-Exempted	700.0	\N	2017-04-09 07:33:00.181871	2017-04-09 07:33:00.181871
433	122	8	120	1.0	112.00	Dishwasing liquid and Detergent Powder	VAT-Inclusive	112.0	\N	2017-04-09 07:33:43.534115	2017-04-09 07:33:43.534115
434	130	8	120	1.0	63.50	Band Aid	VAT-Inclusive	63.5	\N	2017-04-09 07:34:57.98403	2017-04-09 07:34:57.98403
435	129	8	120	1.0	248.00	Light Bulb	VAT-Inclusive	248.0	\N	2017-04-09 07:46:12.364619	2017-04-09 07:46:12.364619
436	131	8	120	1.0	51.00	Borrowed buffalo's Liner	VAT-Exempted	51.0	\N	2017-04-09 07:46:47.930306	2017-04-09 07:46:47.930306
437	124	8	121	1.0	360.00	Tube Ice	VAT-Exempted	360.0	\N	2017-04-09 07:50:07.533553	2017-04-09 07:50:07.533553
438	137	8	121	1.0	300.00	Che 2pm, JM 4pm, Sha 4pm, Santos 9am, Alexie 10am, RR 9am	VAT-Exempted	300.0	\N	2017-04-09 07:52:55.396343	2017-04-09 07:52:55.396343
439	52	6	121	2.5	560.00		VAT-Inclusive	1400.0	\N	2017-04-09 07:54:02.615758	2017-04-09 07:54:02.615758
440	131	8	122	1.0	120.00	Transferred pulled pork to MMC	VAT-Exempted	120.0	\N	2017-04-09 10:12:58.943991	2017-04-09 10:12:58.943991
441	131	8	122	1.0	50.00	Borrowed Tortilla Chips from G5	VAT-Exempted	50.0	\N	2017-04-09 10:13:53.613493	2017-04-09 10:13:53.613493
442	137	8	122	1.0	250.00	Jerlyn 12-4/5-9, Rodel 10am, Myrtle 10am, Rizal 2pm	VAT-Exempted	250.0	\N	2017-04-09 10:15:49.438518	2017-04-09 10:15:49.438518
443	121	8	123	1.0	8887.00	LLRJ	VAT-Inclusive	8887.0	\N	2017-04-09 10:55:39.703711	2017-04-09 10:55:39.703711
444	122	8	124	1.0	1032.00	LLRJ	VAT-Inclusive	1032.0	\N	2017-04-09 10:56:49.675011	2017-04-09 10:56:49.675011
445	40	2	125	21.12	51.14		VAT-Inclusive	1080.0	\N	2017-04-09 10:58:08.102617	2017-04-09 10:58:08.102617
446	57	6	125	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-04-09 10:58:33.095698	2017-04-09 10:58:33.095698
447	53	5	125	3.0	300.00		VAT-Inclusive	900.0	\N	2017-04-09 10:58:49.816242	2017-04-09 10:58:49.816242
448	5	2	125	66.0	72.73		VAT-Exempted	4800.0	\N	2017-04-09 10:59:21.825146	2017-04-09 10:59:21.825146
449	95	8	125	120.0	16.94		VAT-Inclusive	2033.33	\N	2017-04-09 10:59:52.488091	2017-04-09 10:59:52.488091
450	13	11	125	70.4	17.05		VAT-Inclusive	1200.0	\N	2017-04-09 11:00:25.522226	2017-04-09 11:00:25.522226
451	17	7	125	2.0	308.00		VAT-Inclusive	616.0	\N	2017-04-09 11:00:45.534447	2017-04-09 11:00:45.534447
452	16	4	125	12.0	42.50		VAT-Inclusive	510.0	\N	2017-04-09 11:01:05.169199	2017-04-09 11:01:05.169199
454	28	11	126	3.52	6.19		VAT-Exempted	21.8	\N	2017-04-09 11:39:09.893117	2017-04-09 11:39:09.893117
455	30	8	126	10.0	14.16		VAT-Exempted	141.6	\N	2017-04-09 11:39:29.469019	2017-04-09 11:39:29.469019
456	34	2	126	4.4	28.64		VAT-Exempted	126.0	\N	2017-04-09 11:39:51.444466	2017-04-09 11:39:51.444466
457	32	2	126	6.6	20.91		VAT-Exempted	138.0	\N	2017-04-09 11:42:53.997964	2017-04-09 11:42:53.997964
458	36	2	126	4.4	24.09		VAT-Exempted	106.0	\N	2017-04-09 11:43:25.212438	2017-04-09 11:43:25.212438
459	21	2	126	11.0	20.91		VAT-Exempted	230.0	\N	2017-04-09 11:43:53.658946	2017-04-09 11:43:53.658946
460	23	11	126	3.52	3.92		VAT-Exempted	13.8	\N	2017-04-09 11:44:13.401262	2017-04-09 11:44:13.401262
461	27	2	126	0.55	71.82		VAT-Exempted	39.5	\N	2017-04-09 11:44:38.653769	2017-04-09 11:44:38.653769
462	33	11	126	3.52	2.78		VAT-Exempted	9.8	\N	2017-04-09 11:45:36.279239	2017-04-09 11:45:36.279239
463	56	2	127	275.0	42.27		VAT-Inclusive	11625.0	\N	2017-04-09 11:46:46.830974	2017-04-09 11:46:46.830974
464	9	2	128	67.01	68.64		VAT-Exempted	4599.46	\N	2017-04-09 11:48:38.973358	2017-04-09 11:48:38.973358
465	8	2	128	55.88	81.36		VAT-Exempted	4546.6	\N	2017-04-09 11:49:20.908928	2017-04-09 11:49:20.908928
466	99	7	129	144.0	19.50		VAT-Inclusive	2808.0	\N	2017-04-09 11:50:49.153188	2017-04-09 11:50:49.153188
467	20	11	130	3.52	4.77		VAT-Exempted	16.8	\N	2017-04-09 11:54:58.316304	2017-04-09 11:54:58.316304
468	33	11	130	10.56	2.78		VAT-Exempted	29.4	\N	2017-04-09 11:55:22.264552	2017-04-09 11:55:22.264552
469	22	2	130	1.1	26.36		VAT-Exempted	29.0	\N	2017-04-09 11:55:47.874772	2017-04-09 11:55:47.874772
470	30	8	130	20.0	11.80		VAT-Exempted	236.0	\N	2017-04-09 11:56:07.578743	2017-04-09 11:56:07.578743
471	34	2	130	2.2	28.64		VAT-Exempted	63.0	\N	2017-04-09 11:56:41.897231	2017-04-09 11:56:41.897231
472	27	2	130	1.1	71.82		VAT-Exempted	79.0	\N	2017-04-09 11:57:34.733793	2017-04-09 11:57:34.733793
473	36	2	130	4.4	24.09		VAT-Exempted	106.0	\N	2017-04-09 11:57:54.886996	2017-04-09 11:57:54.886996
474	32	2	130	11.0	21.82		VAT-Exempted	240.0	\N	2017-04-09 11:58:18.594017	2017-04-09 11:58:18.594017
475	35	11	130	3.52	2.13		VAT-Exempted	7.5	\N	2017-04-09 11:58:40.114026	2017-04-09 11:58:40.114026
476	15	13	131	6.0	530.00		VAT-Inclusive	3180.0	\N	2017-04-09 12:00:16.047208	2017-04-09 12:00:16.047208
477	50	11	131	103.84	3.27		VAT-Inclusive	340.0	\N	2017-04-09 12:00:42.042481	2017-04-09 12:00:42.042481
478	18	5	132	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-04-09 12:01:54.501206	2017-04-09 12:01:54.501206
479	130	8	133	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-04-12 09:06:52.387428	2017-04-12 09:06:52.387428
480	124	8	133	1.0	360.00	Tube Ice	VAT-Exempted	360.0	\N	2017-04-12 09:07:24.636603	2017-04-12 09:07:24.636603
481	96	4	133	4.0	19.00		VAT-Inclusive	76.0	\N	2017-04-12 09:07:50.443673	2017-04-12 09:07:50.443673
482	130	8	133	1.0	95.50	Hand Gloves for Dishwasher	VAT-Inclusive	95.5	\N	2017-04-12 09:08:18.045207	2017-04-12 09:08:18.045207
485	131	8	133	1.0	100.00	Borrowed Caramba BBQ from Glorietta	VAT-Exempted	100.0	\N	2017-04-12 09:10:18.306379	2017-04-12 09:10:18.306379
500	62	1	133	1.0	34.70		VAT-Inclusive	34.7	\N	2017-04-12 10:12:37.310521	2017-04-12 10:12:37.310521
501	41	12	133	21.0	8.00		VAT-Inclusive	168.0	\N	2017-04-12 10:12:54.029622	2017-04-12 10:12:54.029622
483	130	8	133	1.0	99.75	Long neck igniter	VAT-Inclusive	99.75	\N	2017-04-12 09:08:51.200912	2017-04-12 09:08:51.200912
487	131	8	133	1.0	120.00	Open Market	VAT-Exempted	120.0	\N	2017-04-12 09:13:20.803258	2017-04-12 09:13:20.803258
490	61	1	133	50.0	44.20		VAT-Exempted	2210.0	\N	2017-04-12 09:15:21.915409	2017-04-12 09:15:21.915409
491	130	8	133	1.0	229.75	Fly swatter	VAT-Inclusive	229.75	\N	2017-04-12 09:15:47.797593	2017-04-12 09:15:47.797593
496	74	12	133	19.2	8.97		VAT-Inclusive	172.2	\N	2017-04-12 10:10:18.910858	2017-04-12 10:10:18.910858
503	48	1	133	1.0	161.75		VAT-Inclusive	161.75	\N	2017-04-12 10:13:55.278012	2017-04-12 10:13:55.278012
484	131	8	133	1.0	130.00	Borrowed Bacon from Glorietta	VAT-Exempted	130.0	\N	2017-04-12 09:09:36.887012	2017-04-12 09:09:36.887012
486	137	8	133	1.0	550.00	Myrtle 9am, Sha 10am, Alvin 9am, Rodel 9am, Lexie 12nn, Lem 2:30pm, Che 4pm, Jerlyn 4pm, Lou 6pm, Mico 5pm, Santos 5pm	VAT-Exempted	550.0	\N	2017-04-12 09:13:02.486515	2017-04-12 09:13:02.486515
489	130	8	133	1.0	199.00	Cash deposit pouch	VAT-Inclusive	199.0	\N	2017-04-12 09:14:59.17361	2017-04-12 09:14:59.17361
493	73	12	133	68.0	10.88		VAT-Inclusive	740.0	\N	2017-04-12 09:30:25.260406	2017-04-12 09:30:25.260406
494	75	9	133	1.0	478.50		VAT-Inclusive	478.5	\N	2017-04-12 09:33:58.35126	2017-04-12 09:33:58.35126
495	92	1	133	2.0	47.25		VAT-Exempted	94.5	\N	2017-04-12 09:34:29.000624	2017-04-12 09:34:29.000624
502	88	1	133	0.5	711.70		VAT-Inclusive	355.85	\N	2017-04-12 10:13:30.407174	2017-04-12 10:13:30.407174
488	130	8	133	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-12 09:13:49.764829	2017-04-12 09:13:49.764829
492	76	4	133	48.0	17.72		VAT-Inclusive	850.8	\N	2017-04-12 09:29:52.691437	2017-04-12 09:29:52.691437
497	49	6	133	4.0	198.00		VAT-Inclusive	792.0	\N	2017-04-12 10:10:58.378013	2017-04-12 10:10:58.378013
499	55	12	133	13.24	16.74		VAT-Inclusive	221.7	\N	2017-04-12 10:12:11.346056	2017-04-12 10:12:11.346056
504	37	8	133	120.0	4.33		VAT-Inclusive	519.0	\N	2017-04-12 10:15:46.434623	2017-04-12 10:15:46.434623
505	122	8	135	1.0	89.00	Dishwashing Liquid	VAT-Inclusive	89.0	\N	2017-04-12 10:17:50.190722	2017-04-12 10:17:50.190722
506	137	8	135	1.0	600.00	Myrtle 9am, Rodel 9am, Alvin 9am, Rizal 11am, Sharlaine 10am, Lem 2:30, Cherry 4pm, Jerlyn 4pm, Lou 5pm, Mico 5pm, Santos 5pm	VAT-Exempted	600.0	\N	2017-04-12 10:19:30.251545	2017-04-12 10:19:30.251545
507	131	8	136	1.0	90.00	Borrowed wings from Glorietta	VAT-Exempted	90.0	\N	2017-04-12 10:20:34.220673	2017-04-12 10:20:34.220673
508	137	8	136	1.0	750.00	Alvin 9am, Rodel 9am, Myrtle 9am, Rizal 11-3/5-9, Sharlaine 10am, Jerlyn 11-3/5-9, Lexie 12-4/6-10, Lem 2:30pm, Che 4pm, Mico 5pm, Santos 5pm, Lou 5pm	VAT-Exempted	750.0	\N	2017-04-12 10:22:10.570671	2017-04-12 10:22:10.570671
509	124	8	136	1.0	840.00	Tube Ice	VAT-Exempted	840.0	\N	2017-04-12 10:22:47.642901	2017-04-12 10:22:47.642901
510	58	1	136	1.0	290.00		VAT-Inclusive	290.0	\N	2017-04-12 10:23:13.796458	2017-04-12 10:23:13.796458
511	131	8	136	1.0	384.00	Borrowed wings from Brixton	VAT-Exempted	384.0	\N	2017-04-12 10:23:41.212377	2017-04-12 10:23:41.212377
512	131	8	137	1.0	90.00	Transferred CBT from G5 to S1	VAT-Exempted	90.0	\N	2017-04-16 07:39:04.859397	2017-04-16 07:39:04.859397
513	137	8	137	1.0	250.00	Rodel 10am, Mico 3pm, Sharlaine 12n, Cheryline 10-9	VAT-Exempted	250.0	\N	2017-04-16 07:42:09.050959	2017-04-16 07:42:09.050959
514	124	8	137	1.0	110.00	1 sack	VAT-Exempted	110.0	\N	2017-04-16 07:43:11.624814	2017-04-16 07:43:11.624814
515	122	8	137	1.0	5.00	Detergent Powder	VAT-Inclusive	5.0	\N	2017-04-16 07:43:36.966902	2017-04-16 07:43:36.966902
516	23	1	137	0.14	389.50		VAT-Exempted	54.53	\N	2017-04-16 07:44:23.713734	2017-04-16 07:44:23.713734
517	33	1	137	0.12	291.17		VAT-Exempted	34.94	\N	2017-04-16 07:46:06.539834	2017-04-16 07:46:06.539834
518	134	8	138	1.0	337.50	Sticker for Menu	VAT-Inclusive	337.5	\N	2017-04-16 07:49:00.976536	2017-04-16 07:49:00.976536
519	134	8	139	1.0	1130.00	Grand Slam A-Stand	VAT-Inclusive	1130.0	\N	2017-04-16 07:50:44.253918	2017-04-16 07:50:44.253918
520	123	8	140	1.0	380.00	Order Slip	VAT-Inclusive	380.0	\N	2017-04-16 07:51:47.194191	2017-04-16 07:51:47.194191
521	9	1	141	80.6	151.00		VAT-Exempted	12170.6	\N	2017-04-16 07:53:19.988686	2017-04-16 07:53:19.988686
522	8	1	141	20.12	179.00		VAT-Exempted	3601.48	\N	2017-04-16 07:53:53.308021	2017-04-16 07:53:53.308021
523	39	2	142	45.0	55.37		VAT-Exclusive	2491.67	\N	2017-04-16 07:57:27.400903	2017-04-16 07:57:27.400903
525	64	5	142	1.0	468.75		VAT-Exclusive	468.75	\N	2017-04-16 07:58:40.09945	2017-04-16 07:58:40.09945
526	47	2	142	70.0	46.88		VAT-Exclusive	3281.25	\N	2017-04-16 07:59:16.640124	2017-04-16 07:59:16.640124
527	68	5	142	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-04-16 07:59:58.324896	2017-04-16 07:59:58.324896
528	69	6	142	16.0	196.43		VAT-Exclusive	3142.86	\N	2017-04-16 08:00:54.25746	2017-04-16 08:00:54.25746
529	78	2	142	10.0	98.21		VAT-Exclusive	982.14	\N	2017-04-16 08:01:24.725715	2017-04-16 08:01:24.725715
530	79	2	142	2.0	258.93		VAT-Exclusive	517.86	\N	2017-04-16 08:01:58.249303	2017-04-16 08:01:58.249303
531	80	2	142	2.0	171.88		VAT-Exclusive	343.75	\N	2017-04-16 08:02:28.768477	2017-04-16 08:02:28.768477
532	38	6	142	6.0	111.61		VAT-Exclusive	669.64	\N	2017-04-16 08:02:58.541404	2017-04-16 08:02:58.541404
533	94	1	142	15.0	145.00		VAT-Exclusive	2175.0	\N	2017-04-16 08:08:30.056551	2017-04-16 08:08:30.056551
534	77	9	143	2.0	214.29		VAT-Exclusive	428.57	\N	2017-04-16 08:10:02.26023	2017-04-16 08:10:02.26023
535	67	5	143	1.0	758.93		VAT-Exclusive	758.93	\N	2017-04-16 08:10:28.374857	2017-04-16 08:10:28.374857
536	97	9	144	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-04-16 08:11:53.240097	2017-04-16 08:11:53.240097
537	107	12	144	128.0	4.28		VAT-Inclusive	548.0	\N	2017-04-16 08:12:21.654809	2017-04-16 08:12:21.654809
538	36	1	145	3.0	63.00		VAT-Exempted	189.0	\N	2017-04-16 08:13:50.223889	2017-04-16 08:13:50.223889
539	32	1	145	5.0	48.00		VAT-Exempted	240.0	\N	2017-04-16 08:14:02.699769	2017-04-16 08:14:02.699769
540	34	1	145	2.0	68.00		VAT-Exempted	136.0	\N	2017-04-16 08:14:22.527451	2017-04-16 08:14:22.527451
541	33	1	145	0.3	118.00		VAT-Exempted	35.4	\N	2017-04-16 08:14:41.144117	2017-04-16 08:14:41.144117
542	23	1	145	0.1	138.00		VAT-Exempted	13.8	\N	2017-04-16 08:15:03.245169	2017-04-16 08:15:03.245169
543	27	1	145	0.5	168.00		VAT-Exempted	84.0	\N	2017-04-16 08:15:22.668488	2017-04-16 08:15:22.668488
544	21	1	145	7.0	51.00		VAT-Exempted	357.0	\N	2017-04-16 08:15:53.524481	2017-04-16 08:15:53.524481
545	30	8	145	15.0	12.80		VAT-Exempted	192.0	\N	2017-04-16 08:16:42.8717	2017-04-16 08:16:42.8717
546	22	1	145	0.25	68.00		VAT-Exempted	17.0	\N	2017-04-16 08:17:04.563293	2017-04-16 08:17:04.563293
547	20	1	145	0.1	138.00		VAT-Exempted	13.8	\N	2017-04-16 08:17:33.17238	2017-04-16 08:17:33.17238
548	35	1	145	0.1	75.00		VAT-Exempted	7.5	\N	2017-04-16 08:18:12.577245	2017-04-16 08:18:12.577245
549	14	1	146	1.0	270.00		VAT-Inclusive	270.0	\N	2017-04-16 08:19:37.236311	2017-04-16 08:19:37.236311
550	26	1	146	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-04-16 08:20:10.98204	2017-04-16 08:20:10.98204
551	121	8	147	2000.0	0.85	Buffalo's Greaseproof Liner	VAT-Exclusive	1700.0	\N	2017-04-16 08:21:35.222052	2017-04-16 08:21:35.222052
552	44	8	148	50.0	4.60		VAT-Inclusive	230.0	\N	2017-04-16 08:23:15.121298	2017-04-16 08:23:15.121298
553	43	8	148	30.0	6.60		VAT-Inclusive	198.0	\N	2017-04-16 08:23:34.886971	2017-04-16 08:23:34.886971
554	42	8	148	10.0	4.50		VAT-Inclusive	45.0	\N	2017-04-16 08:24:02.50273	2017-04-16 08:24:02.50273
555	32	1	149	5.0	49.00		VAT-Exempted	245.0	\N	2017-04-16 08:25:34.525882	2017-04-16 08:25:34.525882
556	36	1	149	2.0	63.00		VAT-Exempted	126.0	\N	2017-04-16 08:26:16.621085	2017-04-16 08:26:16.621085
557	34	1	149	1.5	68.00		VAT-Exempted	102.0	\N	2017-04-16 08:26:39.835295	2017-04-16 08:26:39.835295
558	21	1	149	5.0	51.00		VAT-Exempted	255.0	\N	2017-04-16 08:27:04.484907	2017-04-16 08:27:04.484907
559	33	1	149	0.1	118.00		VAT-Exempted	11.8	\N	2017-04-16 08:27:26.01471	2017-04-16 08:27:26.01471
560	30	8	149	10.0	19.32		VAT-Exempted	193.2	\N	2017-04-16 08:27:46.578833	2017-04-16 08:27:46.578833
561	22	1	149	0.25	63.00		VAT-Exempted	15.75	\N	2017-04-16 08:28:13.279399	2017-04-16 08:28:13.279399
562	27	1	149	0.5	168.00		VAT-Exempted	84.0	\N	2017-04-16 08:28:32.708842	2017-04-16 08:28:32.708842
563	9	1	150	60.2	151.00		VAT-Exempted	9090.2	\N	2017-04-16 08:29:49.397475	2017-04-16 08:29:49.397475
564	8	1	150	40.2	179.00		VAT-Exempted	7195.8	\N	2017-04-16 08:30:22.032172	2017-04-16 08:30:22.032172
565	21	1	151	5.0	46.00		VAT-Exempted	230.0	\N	2017-04-16 08:31:22.932016	2017-04-16 08:31:22.932016
566	34	1	151	1.0	78.00		VAT-Exempted	78.0	\N	2017-04-16 08:31:52.162911	2017-04-16 08:31:52.162911
567	36	1	151	1.0	63.00		VAT-Exempted	63.0	\N	2017-04-16 08:32:14.120581	2017-04-16 08:32:14.120581
568	32	1	151	2.0	49.00		VAT-Exempted	98.0	\N	2017-04-16 08:32:33.516367	2017-04-16 08:32:33.516367
569	122	8	152	1.0	45.00	Detergent Powder	VAT-Inclusive	45.0	\N	2017-04-16 08:55:53.350941	2017-04-16 08:55:53.350941
570	124	8	152	1.0	66.00	Tube Ice - 3 packs	VAT-Exempted	66.0	\N	2017-04-16 08:56:21.226336	2017-04-16 08:56:21.226336
571	130	8	152	1.0	380.00	AA Battery for weighing scale	VAT-Inclusive	380.0	\N	2017-04-16 08:56:50.528984	2017-04-16 08:56:50.528984
572	122	8	152	1.0	114.00	Bleach and Dishwasing Liquid	VAT-Inclusive	114.0	\N	2017-04-16 08:57:15.996372	2017-04-16 08:57:15.996372
574	122	8	153	1.0	100.00	Dishwashing liquid	VAT-Inclusive	100.0	\N	2017-04-18 07:54:43.049778	2017-04-18 07:54:43.049778
573	137	8	152	1.0	300.00	Rodel 3:30, Rizal 10am, Myrtle 11-3/4-9, Jerlyn 12-4/5-9	VAT-Exempted	300.0	\N	2017-04-16 08:57:51.595445	2017-04-16 08:57:51.595445
588	130	8	153	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-18 08:05:57.793166	2017-04-18 08:05:57.793166
591	137	8	153	13.0	50.00	Myrtle 9am, Sharlaine 10-3/5-8, Lou 3:30, Che 4pm, Lexie 5pm, Rizal 9am, Rodel 9am, Alvin 9am, Lem 2:30, Mico 5pm, Santos 5pm, Renz 5pm	VAT-Exempted	650.0	\N	2017-04-18 08:08:38.642596	2017-04-18 08:08:38.642596
595	129	8	154	1.0	3000.00	Aircon Cleaning	VAT-Inclusive	3000.0	\N	2017-04-18 08:14:35.750987	2017-04-18 08:14:35.750987
575	131	8	153	1.0	82.00	Open Market	VAT-Exempted	82.0	\N	2017-04-18 07:55:12.338435	2017-04-18 07:55:12.338435
577	71	12	153	14.08	15.41		VAT-Inclusive	217.0	\N	2017-04-18 07:56:23.754876	2017-04-18 07:56:23.754876
580	28	1	153	0.02	1800.00		VAT-Exempted	36.0	\N	2017-04-18 08:00:16.616532	2017-04-18 08:00:16.616532
581	61	1	153	25.0	49.98		VAT-Exempted	1249.5	\N	2017-04-18 08:00:47.653361	2017-04-18 08:00:47.653361
583	88	1	153	0.5	711.70		VAT-Inclusive	355.85	\N	2017-04-18 08:02:08.508983	2017-04-18 08:02:08.508983
589	122	8	153	1.0	52.00	Dishwashing Liquid	VAT-Inclusive	52.0	\N	2017-04-18 08:06:37.314672	2017-04-18 08:06:37.314672
590	123	8	153	1.0	700.00	Journal Tape	VAT-Inclusive	700.0	\N	2017-04-18 08:07:08.147246	2017-04-18 08:07:08.147246
592	91	1	153	0.1	1110.00		VAT-Inclusive	111.0	\N	2017-04-18 08:11:29.277337	2017-04-18 08:11:29.277337
593	122	8	154	1.0	89.00	Dishwashing Liquid	VAT-Inclusive	89.0	\N	2017-04-18 08:13:21.317568	2017-04-18 08:13:21.317568
594	129	8	154	1.0	970.00	Flourescent and light bulb for kitchen	VAT-Inclusive	970.0	\N	2017-04-18 08:14:10.654025	2017-04-18 08:14:10.654025
597	137	8	154	1.0	700.00	Myrtle 9am, Sharlaine 10-3/5-8, Lou 11am, Che 4pm, Lexie 5pm, Kris 5pm, Rizal 9am, Rodel 9am, Alvin 9am, Lem 2:30, Mico 5pm, Santos 5pm, Renz 5pm	VAT-Exempted	700.0	\N	2017-04-18 08:17:31.984651	2017-04-18 08:17:31.984651
576	76	4	153	48.0	17.88		VAT-Inclusive	858.0	\N	2017-04-18 07:55:47.734852	2017-04-18 07:55:47.734852
578	75	9	153	2.0	251.50		VAT-Inclusive	503.0	\N	2017-04-18 07:58:28.488308	2017-04-18 07:58:28.488308
579	37	8	153	120.0	4.88		VAT-Inclusive	585.0	\N	2017-04-18 07:58:58.984223	2017-04-18 07:58:58.984223
582	130	8	153	1.0	459.50	Butane Gas	VAT-Inclusive	459.5	\N	2017-04-18 08:01:35.953551	2017-04-18 08:01:35.953551
585	124	8	153	1.0	382.00		VAT-Exempted	382.0	\N	2017-04-18 08:03:50.930883	2017-04-18 08:03:50.930883
587	130	8	153	1.0	785.00	Printing of PCF and phocopying of training handouts	VAT-Inclusive	785.0	\N	2017-04-18 08:05:31.228954	2017-04-18 08:05:31.228954
586	50	1	153	1.8	192.50		VAT-Inclusive	346.5	\N	2017-04-18 08:04:37.587865	2017-04-18 08:04:37.587865
596	122	8	154	1.0	85.00	Bleach, Dishwashing and Detergent Powder	VAT-Inclusive	85.0	\N	2017-04-18 08:16:12.382838	2017-04-18 08:16:12.382838
598	129	8	154	1.0	83.00	Electrical tape, hose nozzle	VAT-Inclusive	83.0	\N	2017-04-18 08:18:03.619557	2017-04-18 08:18:03.619557
599	130	8	154	1.0	52.00	Double Adhesive	VAT-Inclusive	52.0	\N	2017-04-18 08:18:36.90986	2017-04-18 08:18:36.90986
600	131	1	154	1.0	137.00	Transferred Leg N' Thigh from Brixton	VAT-Exempted	137.0	\N	2017-04-18 08:25:47.286947	2017-04-18 08:25:47.286947
601	18	5	155	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-04-18 08:29:23.815581	2017-04-18 08:29:23.815581
602	15	13	156	7.0	530.00		VAT-Inclusive	3710.0	\N	2017-04-18 08:30:43.470968	2017-04-18 08:30:43.470968
603	50	1	156	2.8	121.43		VAT-Inclusive	340.0	\N	2017-04-18 08:32:07.800305	2017-04-18 08:32:07.800305
604	19	6	157	3.0	55.00		VAT-Inclusive	165.0	\N	2017-04-18 08:33:07.106855	2017-04-18 08:33:07.106855
605	53	5	157	2.0	300.00		VAT-Inclusive	600.0	\N	2017-04-18 08:33:22.28854	2017-04-18 08:33:22.28854
606	5	1	157	30.0	160.00		VAT-Exempted	4800.0	\N	2017-04-18 08:33:43.946245	2017-04-18 08:33:43.946245
607	17	7	157	2.0	308.00		VAT-Inclusive	616.0	\N	2017-04-18 08:34:05.098248	2017-04-18 08:34:05.098248
608	16	4	157	12.0	42.50		VAT-Inclusive	510.0	\N	2017-04-18 08:34:24.147311	2017-04-18 08:34:24.147311
609	9	1	158	41.0	151.00		VAT-Exempted	6191.0	\N	2017-04-18 08:35:55.588081	2017-04-18 08:35:55.588081
610	8	1	158	15.74	179.00		VAT-Exempted	2817.46	\N	2017-04-18 08:36:23.840849	2017-04-18 08:36:23.840849
611	36	1	160	4.0	68.00		VAT-Exempted	272.0	\N	2017-04-18 08:37:58.899422	2017-04-18 08:37:58.899422
612	34	1	160	3.0	73.00		VAT-Exempted	219.0	\N	2017-04-18 08:38:18.346493	2017-04-18 08:38:18.346493
613	32	1	160	5.0	49.00		VAT-Exempted	245.0	\N	2017-04-18 08:38:34.394448	2017-04-18 08:38:34.394448
614	21	1	160	6.0	49.00		VAT-Exempted	294.0	\N	2017-04-18 08:38:53.864402	2017-04-18 08:38:53.864402
615	33	1	160	0.4	118.00		VAT-Exempted	47.2	\N	2017-04-18 08:39:34.101155	2017-04-18 08:39:34.101155
616	23	1	160	0.1	158.00		VAT-Exempted	15.8	\N	2017-04-18 08:40:01.341138	2017-04-18 08:40:01.341138
617	20	1	160	0.1	148.00		VAT-Exempted	14.8	\N	2017-04-18 08:40:22.107541	2017-04-18 08:40:22.107541
618	35	1	160	0.1	79.00		VAT-Exempted	7.9	\N	2017-04-18 08:41:18.700655	2017-04-18 08:41:18.700655
619	22	1	160	0.5	63.00		VAT-Exempted	31.5	\N	2017-04-18 08:41:47.979703	2017-04-18 08:41:47.979703
620	30	8	160	1.0	238.72		VAT-Exempted	238.72	\N	2017-04-18 08:42:31.539713	2017-04-18 08:42:31.539713
621	31	1	160	1.0	68.00		VAT-Exempted	68.0	\N	2017-04-18 08:42:53.043271	2017-04-18 08:42:53.043271
622	121	8	161	1.0	850.00	Greaseproof Liner	VAT-Exclusive	850.0	\N	2017-04-18 08:44:05.236158	2017-04-18 08:44:05.236158
623	25	1	162	10.0	75.00		VAT-Inclusive	750.0	\N	2017-04-18 08:45:53.800681	2017-04-18 08:45:53.800681
624	26	1	162	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-04-18 08:47:01.269411	2017-04-18 08:47:01.269411
625	39	2	163	35.0	55.36		VAT-Exclusive	1937.5	\N	2017-04-18 08:50:02.012875	2017-04-18 08:50:02.012875
626	46	2	163	10.0	165.18		VAT-Exclusive	1651.79	\N	2017-04-18 08:50:49.848531	2017-04-18 08:50:49.848531
627	47	2	163	40.0	46.88		VAT-Exclusive	1875.0	\N	2017-04-18 08:51:13.1826	2017-04-18 08:51:13.1826
628	64	5	163	1.0	468.75		VAT-Exclusive	468.75	\N	2017-04-18 08:51:48.269156	2017-04-18 08:51:48.269156
629	68	5	163	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-04-18 08:52:36.240363	2017-04-18 08:52:36.240363
630	69	6	163	8.0	196.43		VAT-Exclusive	1571.43	\N	2017-04-18 08:53:35.682315	2017-04-18 08:53:35.682315
631	78	2	163	10.0	98.21		VAT-Exclusive	982.14	\N	2017-04-18 08:54:23.380523	2017-04-18 08:54:23.380523
632	79	2	163	2.0	258.93		VAT-Exclusive	517.86	\N	2017-04-18 08:55:00.049043	2017-04-18 08:55:00.049043
633	44	8	164	75.0	4.60		VAT-Inclusive	345.0	\N	2017-04-18 08:56:26.362444	2017-04-18 08:56:26.362444
634	42	8	164	20.0	4.50		VAT-Inclusive	90.0	\N	2017-04-18 08:56:49.769105	2017-04-18 08:56:49.769105
635	124	8	165	3.0	254.67	Tube Ice	VAT-Exempted	764.0	\N	2017-04-19 08:58:40.307197	2017-04-19 08:58:40.307197
636	121	8	165	1.0	330.00	30cc Paper Cup	VAT-Inclusive	330.0	\N	2017-04-19 08:59:03.573021	2017-04-19 08:59:03.573021
637	137	8	165	1.0	650.00	Myrtle 9am, Sharlaine 10-3/5-8, Lou 11am, Cheryline 4pm, Kris 5pm, Rodel 9am, Rizal 9am, Alvin 9am, Lem 2:30pm, Mico 5pm, Renz 5pm, Santos 5pm	VAT-Exempted	650.0	\N	2017-04-19 09:01:58.300922	2017-04-19 09:01:58.300922
638	131	8	165	1.0	48.00	Fare for buying 30cc Paper Cup	VAT-Exempted	48.0	\N	2017-04-19 09:03:29.366733	2017-04-19 09:03:29.366733
639	97	9	166	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-04-20 02:02:13.588097	2017-04-20 02:02:13.588097
640	121	8	167	1.0	6085.50		VAT-Inclusive	6085.5	\N	2017-04-20 02:02:59.761478	2017-04-20 02:02:59.761478
641	9	1	168	50.88	151.00		VAT-Exempted	7682.88	\N	2017-04-20 02:18:17.908003	2017-04-20 02:18:17.908003
642	8	1	168	30.6	179.00		VAT-Exempted	5477.4	\N	2017-04-20 02:18:50.373037	2017-04-20 02:18:50.373037
643	21	1	169	8.0	49.00		VAT-Exempted	392.0	\N	2017-04-20 02:21:42.720707	2017-04-20 02:21:42.720707
644	34	1	169	1.5	78.00		VAT-Exempted	117.0	\N	2017-04-20 02:21:58.837701	2017-04-20 02:21:58.837701
645	36	1	169	3.0	68.00		VAT-Exempted	204.0	\N	2017-04-20 02:22:19.111912	2017-04-20 02:22:19.111912
646	30	8	169	10.0	12.80		VAT-Exempted	128.0	\N	2017-04-20 02:22:34.960895	2017-04-20 02:22:34.960895
647	33	1	169	0.25	165.20		VAT-Exempted	41.3	\N	2017-04-20 02:23:11.390006	2017-04-20 02:23:11.390006
648	32	1	169	6.0	58.00		VAT-Exempted	348.0	\N	2017-04-20 02:23:30.654406	2017-04-20 02:23:30.654406
649	22	1	169	0.25	58.00		VAT-Exempted	14.5	\N	2017-04-20 02:23:45.285064	2017-04-20 02:23:45.285064
650	5	1	170	40.0	160.00		VAT-Exempted	6400.0	\N	2017-04-20 02:25:12.947788	2017-04-20 02:25:12.947788
651	95	8	170	96.0	16.94		VAT-Inclusive	1626.66	\N	2017-04-20 02:27:17.148554	2017-04-20 02:27:17.148554
652	99	7	171	72.0	17.41		VAT-Exclusive	1253.58	\N	2017-04-20 02:29:41.77507	2017-04-20 02:29:41.77507
653	100	9	172	120.0	29.42		VAT-Inclusive	3530.0	\N	2017-04-20 02:34:25.423389	2017-04-20 02:34:25.423389
654	103	9	173	120.0	30.63		VAT-Inclusive	3675.0	\N	2017-04-20 02:36:26.44412	2017-04-20 02:36:26.44412
655	130	8	174	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-20 10:34:54.601285	2017-04-20 10:34:54.601285
657	61	1	174	20.0	40.00		VAT-Exempted	800.0	\N	2017-04-20 10:36:03.628214	2017-04-20 10:36:03.628214
658	130	8	174	1.0	15.00	Printing of PCF	VAT-Inclusive	15.0	\N	2017-04-20 10:36:21.489697	2017-04-20 10:36:21.489697
659	137	8	174	15.0	50.00	Myrtle 9am, Sharlaine 10-3/5-8, Lou 11am, Cheryline 4pm, Kris 5pm, Rizal 9am, Rodel 9am, Alvin 9am, Renz 12-4/6-10, Santos 5pm, Mico 5pm	VAT-Exempted	750.0	\N	2017-04-20 10:38:44.669143	2017-04-20 10:38:44.669143
661	52	6	174	3.5	560.00		VAT-Inclusive	1960.0	\N	2017-04-20 10:41:01.972521	2017-04-20 10:41:01.972521
662	122	8	174	1.0	1120.00	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-04-20 10:42:09.603034	2017-04-20 10:42:09.603034
665	122	8	174	2.0	118.00	Trash Bag	VAT-Inclusive	236.0	\N	2017-04-20 10:49:47.637692	2017-04-20 10:49:47.637692
666	94	1	175	15.0	145.00		VAT-Exclusive	2175.0	\N	2017-04-21 01:30:12.738528	2017-04-21 01:30:12.738528
667	9	1	177	60.0	151.00		VAT-Exempted	9060.0	\N	2017-04-21 01:32:52.557053	2017-04-21 01:32:52.557053
668	36	1	180	3.0	58.00		VAT-Exempted	174.0	\N	2017-04-22 10:29:20.508338	2017-04-22 10:29:20.508338
669	32	1	180	5.0	58.00		VAT-Exempted	290.0	\N	2017-04-22 10:30:19.220852	2017-04-22 10:30:19.220852
670	34	1	180	1.0	78.00		VAT-Exempted	78.0	\N	2017-04-22 10:31:21.764433	2017-04-22 10:31:21.764433
671	21	1	180	6.0	46.00		VAT-Exempted	276.0	\N	2017-04-22 10:31:57.464903	2017-04-22 10:31:57.464903
672	30	8	180	10.0	12.80		VAT-Exempted	128.0	\N	2017-04-22 10:32:39.587739	2017-04-22 10:32:39.587739
673	33	11	180	10.56	3.35		VAT-Exempted	35.4	\N	2017-04-22 10:33:25.247847	2017-04-22 10:33:25.247847
674	20	11	180	3.52	3.92		VAT-Exempted	13.8	\N	2017-04-22 10:34:12.615904	2017-04-22 10:34:12.615904
682	131	8	184	1.0	56.00	G5 to S1 Borrow trash liner	VAT-Inclusive	56.0	\N	2017-04-22 12:38:59.025473	2017-04-22 12:38:59.025473
685	122	8	185	1.0	82.00	Powder and Joy	VAT-Inclusive	82.0	\N	2017-04-22 12:44:45.859662	2017-04-22 12:44:45.859662
687	124	8	186	1.0	66.00	Tube Ice	VAT-Inclusive	66.0	\N	2017-04-23 09:50:18.32131	2017-04-23 09:50:18.32131
688	61	1	186	5.0	70.00		VAT-Exempted	350.0	\N	2017-04-23 09:51:26.311272	2017-04-23 09:51:26.311272
689	122	8	186	1.0	226.00	Detergent, Dishwashing Liquid and Bleach	VAT-Inclusive	226.0	\N	2017-04-23 09:53:06.653529	2017-04-23 09:53:06.653529
690	137	8	186	5.0	50.00	Myrtle 11am, Kris 12nn, Rizal 1pm, Mico 11-3/5-9	VAT-Exempted	250.0	\N	2017-04-23 09:58:32.065565	2017-04-23 09:58:32.065565
691	43	8	187	40.0	6.60		VAT-Inclusive	264.0	\N	2017-04-23 10:11:30.861697	2017-04-23 10:11:30.861697
692	44	8	187	50.0	4.60		VAT-Inclusive	230.0	\N	2017-04-23 10:11:49.327942	2017-04-23 10:11:49.327942
675	28	11	180	3.52	6.19		VAT-Exempted	21.8	\N	2017-04-22 10:35:10.322343	2017-04-22 10:35:10.322343
676	27	2	180	1.1	76.36		VAT-Exempted	84.0	\N	2017-04-22 10:35:46.963972	2017-04-22 10:35:46.963972
677	7	1	181	24.0	220.00		VAT-Exempted	5280.0	\N	2017-04-22 10:40:17.021684	2017-04-22 10:40:17.021684
681	131	8	184	1.0	120.00	Brixton to S1 Borrow Leg n Thigh	VAT-Inclusive	120.0	\N	2017-04-22 12:38:12.411116	2017-04-22 12:38:12.411116
686	124	8	185	1.0	140.00		VAT-Inclusive	140.0	\N	2017-04-22 12:45:39.270743	2017-04-22 12:45:39.270743
695	137	8	188	1.0	700.00	Myrtle 9am, Jerlyn 10am, Rizal 9am, Rodel 9am, Santos 5pm, Lem 2:30pm, Mico 5pm, Renz 11am, Cheryline 4pm, Lexi 4:30pm, Sharlaine 12-4/6-10, Lou 11-3/5-9, 	VAT-Exempted	700.0	\N	2017-04-26 11:34:28.881045	2017-04-26 11:34:28.881045
696	130	8	188	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-26 11:34:47.870005	2017-04-26 11:34:47.870005
678	121	8	182	1.0	1775.50		VAT-Inclusive	1775.5	\N	2017-04-22 10:42:57.424029	2017-04-22 10:42:57.424029
679	9	1	183	50.1	151.00		VAT-Exempted	7565.1	\N	2017-04-22 10:45:20.668558	2017-04-22 10:45:20.668558
683	137	8	184	15.0	50.00	Renz, Miko, Santos, Rizal, Alvin,Rodel, Lem,Myrtle, Sha x2, Lou, Lexie, Kris x2, Che 	VAT-Exempted	750.0	\N	2017-04-22 12:41:33.412936	2017-04-22 12:41:33.412936
693	42	8	187	20.0	4.50		VAT-Inclusive	90.0	\N	2017-04-23 10:12:05.307158	2017-04-23 10:12:05.307158
694	61	1	188	20.0	40.00		VAT-Exempted	800.0	\N	2017-04-26 11:30:35.761955	2017-04-26 11:30:35.761955
680	124	8	184	6.0	120.00		VAT-Inclusive	720.0	\N	2017-04-22 12:37:15.48315	2017-04-22 12:37:15.48315
684	137	8	185	7.0	50.00	Arriane, Che, Lexie, Krissele, Alvin, Santos, Rodel, Alvin. 	VAT-Exempted	350.0	\N	2017-04-22 12:44:16.678402	2017-04-22 12:44:16.678402
697	124	8	188	1.0	764.00	Tube Ice	VAT-Exempted	764.0	\N	2017-04-26 11:35:21.321442	2017-04-26 11:35:21.321442
698	122	8	188	1.0	216.00	Glade Auto Spray	VAT-Inclusive	216.0	\N	2017-04-26 11:35:54.247553	2017-04-26 11:35:54.247553
699	61	1	189	25.0	40.00		VAT-Exempted	1000.0	\N	2017-04-26 11:39:29.702297	2017-04-26 11:39:29.702297
700	137	8	189	1.0	650.00	Jerlyn 10am, Rizal 9am, Rodel 9am, Renz 11am, Lem 2:30, Sharlaine 12-4/6-10, Lou 11-3/5-9, Cheryline 4pm, Lexi 4:30, Mico 5pm, Alvin 5pm	VAT-Exempted	650.0	\N	2017-04-26 11:41:21.920843	2017-04-26 11:41:21.920843
701	131	8	189	1.0	60.00	G5 to S1 Transfer of Monin	VAT-Exempted	60.0	\N	2017-04-26 11:42:01.220468	2017-04-26 11:42:01.220468
702	130	8	190	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-04-26 11:44:20.384154	2017-04-26 11:44:20.384154
703	123	8	190	1.0	18.00	Bond Paper	VAT-Inclusive	18.0	\N	2017-04-26 11:44:35.633516	2017-04-26 11:44:35.633516
704	130	8	190	1.0	60.00	Printing of House Rules	VAT-Inclusive	60.0	\N	2017-04-26 11:44:57.592587	2017-04-26 11:44:57.592587
705	92	1	190	1.0	51.95		VAT-Inclusive	51.95	\N	2017-04-26 11:45:22.96387	2017-04-26 11:45:22.96387
706	93	1	190	1.0	56.95		VAT-Inclusive	56.95	\N	2017-04-26 11:45:46.442303	2017-04-26 11:45:46.442303
707	37	8	190	72.0	5.28		VAT-Inclusive	380.1	\N	2017-04-26 11:46:16.341346	2017-04-26 11:46:16.341346
708	41	12	190	21.0	11.38		VAT-Inclusive	239.0	\N	2017-04-26 11:46:32.925168	2017-04-26 11:46:32.925168
709	96	4	190	4.0	19.00		VAT-Inclusive	76.0	\N	2017-04-26 11:46:52.070824	2017-04-26 11:46:52.070824
710	51	1	190	2.4	146.67		VAT-Inclusive	352.0	\N	2017-04-26 11:47:25.528333	2017-04-26 11:47:25.528333
711	76	4	190	24.0	18.19		VAT-Inclusive	436.5	\N	2017-04-26 11:48:14.2125	2017-04-26 11:48:14.2125
712	75	9	190	1.0	269.00		VAT-Inclusive	269.0	\N	2017-04-26 11:50:14.79095	2017-04-26 11:50:14.79095
713	72	6	190	1.0	34.65		VAT-Inclusive	34.65	\N	2017-04-26 11:50:37.985035	2017-04-26 11:50:37.985035
714	49	6	190	3.0	233.87		VAT-Inclusive	701.6	\N	2017-04-26 11:51:25.072799	2017-04-26 11:51:25.072799
715	20	1	190	0.09	442.00		VAT-Exempted	39.78	\N	2017-04-26 11:51:44.908581	2017-04-26 11:51:44.908581
716	124	8	190	1.0	840.00	Tube Ice	VAT-Exempted	840.0	\N	2017-04-26 11:56:38.41887	2017-04-26 11:56:38.41887
717	10	1	190	10.8	138.89		VAT-Exclusive	1500.0	\N	2017-04-26 11:57:34.546388	2017-04-26 11:57:34.546388
719	11	1	190	9.6	250.89		VAT-Exclusive	2408.57	\N	2017-04-26 11:58:16.05255	2017-04-26 11:58:16.05255
720	137	8	190	1.0	810.00	Gen Meet	VAT-Exempted	810.0	\N	2017-04-26 11:58:37.009112	2017-04-26 11:58:37.009112
721	131	8	190	1.0	130.00	Open Market	VAT-Exempted	130.0	\N	2017-04-26 11:58:57.558106	2017-04-26 11:58:57.558106
722	137	8	190	1.0	750.00	Myrtle 9am, Jerlyn 10am, Rizal 9am, Rodel 9am, Lou 11-3/5-9, Renz 11am, Sharlaine 12-4/6-10, Lem 2:30pm, Lexi 4:30, Cheryline 4pm, Mico 5pm, Santos 5pm, Alvin 5pm	VAT-Exempted	750.0	\N	2017-04-26 12:00:42.706384	2017-04-26 12:00:42.706384
723	27	1	191	0.5	198.00		VAT-Exempted	99.0	\N	2017-04-28 09:16:56.364975	2017-04-28 09:16:56.364975
724	30	8	191	10.0	11.80		VAT-Exempted	118.0	\N	2017-04-28 09:17:29.343279	2017-04-28 09:17:29.343279
725	32	1	191	6.0	54.00		VAT-Exempted	324.0	\N	2017-04-28 09:17:44.194577	2017-04-28 09:17:44.194577
726	21	1	191	3.0	48.00		VAT-Exempted	144.0	\N	2017-04-28 09:18:04.815788	2017-04-28 09:18:04.815788
727	34	1	191	2.0	78.00		VAT-Exempted	156.0	\N	2017-04-28 09:19:14.221562	2017-04-28 09:19:14.221562
728	36	1	191	2.0	63.00		VAT-Exempted	126.0	\N	2017-04-28 09:19:30.497571	2017-04-28 09:19:30.497571
729	20	11	191	3.52	3.92		VAT-Exempted	13.8	\N	2017-04-28 09:19:50.839899	2017-04-28 09:19:50.839899
730	28	11	191	3.52	6.19		VAT-Exempted	21.8	\N	2017-04-28 09:20:09.071657	2017-04-28 09:20:09.071657
731	32	1	192	3.0	58.00		VAT-Exempted	174.0	\N	2017-04-28 09:21:26.494157	2017-04-28 09:21:26.494157
732	34	1	192	1.0	78.00		VAT-Exempted	78.0	\N	2017-04-28 09:21:37.967936	2017-04-28 09:21:37.967936
733	36	1	192	3.0	58.00		VAT-Exempted	174.0	\N	2017-04-28 09:21:52.43406	2017-04-28 09:21:52.43406
734	33	1	192	0.3	118.00		VAT-Exempted	35.4	\N	2017-04-28 09:22:20.431575	2017-04-28 09:22:20.431575
735	22	1	192	0.25	58.00		VAT-Exempted	14.5	\N	2017-04-28 09:22:38.860296	2017-04-28 09:22:38.860296
736	23	1	192	0.1	118.00		VAT-Exempted	11.8	\N	2017-04-28 09:22:56.810014	2017-04-28 09:22:56.810014
737	30	8	192	15.0	8.53		VAT-Exempted	128.0	\N	2017-04-28 09:23:16.956762	2017-04-28 09:23:16.956762
738	27	1	192	0.5	178.00		VAT-Exempted	89.0	\N	2017-04-28 09:23:33.822703	2017-04-28 09:23:33.822703
739	35	1	192	0.1	79.00		VAT-Exempted	7.9	\N	2017-04-28 09:23:58.029088	2017-04-28 09:23:58.029088
740	21	1	192	3.0	46.00		VAT-Exempted	138.0	\N	2017-04-28 09:24:12.993411	2017-04-28 09:24:12.993411
741	5	1	193	10.0	180.00		VAT-Exempted	1800.0	\N	2017-04-28 09:25:27.547591	2017-04-28 09:25:27.547591
742	33	1	194	0.3	118.00		VAT-Exempted	35.4	\N	2017-04-28 09:26:37.393712	2017-04-28 09:26:37.393712
743	23	1	194	0.1	138.00		VAT-Exempted	13.8	\N	2017-04-28 09:27:01.54105	2017-04-28 09:27:01.54105
744	32	1	194	2.0	54.00		VAT-Exempted	108.0	\N	2017-04-28 09:27:16.123659	2017-04-28 09:27:16.123659
745	36	1	194	2.0	63.00		VAT-Exempted	126.0	\N	2017-04-28 09:27:32.889563	2017-04-28 09:27:32.889563
746	21	1	194	3.0	48.00		VAT-Exempted	144.0	\N	2017-04-28 09:27:50.256539	2017-04-28 09:27:50.256539
747	20	1	194	0.1	138.00		VAT-Exempted	13.8	\N	2017-04-28 09:28:04.542077	2017-04-28 09:28:04.542077
748	27	1	194	0.3	198.00		VAT-Exempted	59.4	\N	2017-04-28 09:29:47.188517	2017-04-28 09:29:47.188517
749	34	1	194	0.5	78.00		VAT-Exempted	39.0	\N	2017-04-28 09:30:01.737643	2017-04-28 09:30:01.737643
750	9	1	195	60.32	151.00		VAT-Exempted	9108.32	\N	2017-04-28 09:33:45.935856	2017-04-28 09:33:45.935856
751	8	1	195	30.76	179.00		VAT-Exempted	5506.04	\N	2017-04-28 09:34:15.213641	2017-04-28 09:34:15.213641
752	123	8	197	1.0	1950.00	Books	VAT-Inclusive	1950.0	\N	2017-04-28 09:36:44.556141	2017-04-28 09:36:44.556141
753	9	1	198	40.52	151.00		VAT-Exempted	6118.52	\N	2017-04-28 13:10:46.255523	2017-04-28 13:10:46.255523
754	97	9	199	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-04-28 13:12:37.997581	2017-04-28 13:12:37.997581
755	108	12	199	384.0	4.64		VAT-Inclusive	1782.0	\N	2017-04-28 13:13:02.090445	2017-04-28 13:13:02.090445
756	99	7	200	120.0	17.41		VAT-Exclusive	2089.28	\N	2017-04-28 13:14:22.515043	2017-04-28 13:14:22.515043
757	15	13	201	7.0	530.00		VAT-Inclusive	3710.0	\N	2017-04-28 13:15:47.211803	2017-04-28 13:15:47.211803
758	32	1	202	6.0	54.00		VAT-Exempted	324.0	\N	2017-04-28 13:16:59.574319	2017-04-28 13:16:59.574319
759	36	1	202	4.0	63.00		VAT-Exempted	252.0	\N	2017-04-28 13:17:11.159069	2017-04-28 13:17:11.159069
760	21	1	202	4.0	53.00		VAT-Exempted	212.0	\N	2017-04-28 13:17:24.580527	2017-04-28 13:17:24.580527
761	22	1	202	0.25	58.00		VAT-Exempted	14.5	\N	2017-04-28 13:17:48.115724	2017-04-28 13:17:48.115724
762	34	1	202	3.0	78.00		VAT-Exempted	234.0	\N	2017-04-28 13:19:13.960207	2017-04-28 13:19:13.960207
763	23	1	202	0.1	128.00		VAT-Exempted	12.8	\N	2017-04-28 13:19:29.010372	2017-04-28 13:19:29.010372
764	30	8	202	30.0	10.62		VAT-Exempted	318.6	\N	2017-04-28 13:19:58.03451	2017-04-28 13:19:58.03451
765	33	1	202	0.1	118.00		VAT-Exempted	11.8	\N	2017-04-28 13:20:12.904525	2017-04-28 13:20:12.904525
766	121	8	203	1.0	7361.50		VAT-Inclusive	7361.5	\N	2017-04-28 13:21:26.562337	2017-04-28 13:21:26.562337
767	122	8	204	1.0	1181.00		VAT-Inclusive	1181.0	\N	2017-04-28 13:22:23.678408	2017-04-28 13:22:23.678408
768	9	1	205	60.0	151.00		VAT-Exempted	9060.0	\N	2017-04-28 13:24:26.115038	2017-04-28 13:24:26.115038
769	8	1	205	40.86	179.00		VAT-Exempted	7313.94	\N	2017-04-28 13:24:47.57563	2017-04-28 13:24:47.57563
770	25	1	206	10.0	75.00		VAT-Inclusive	750.0	\N	2017-04-28 13:26:04.788811	2017-04-28 13:26:04.788811
771	26	1	206	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-04-28 13:26:42.373864	2017-04-28 13:26:42.373864
779	46	1	208	4.55	363.03		VAT-Exclusive	1651.79	\N	2017-04-28 13:31:14.907926	2017-04-28 13:31:14.907926
780	47	2	208	40.0	46.88		VAT-Inclusive	1875.0	\N	2017-04-28 13:31:33.299304	2017-04-28 13:31:33.299304
782	68	5	208	4.0	580.36		VAT-Exclusive	2321.43	\N	2017-04-28 13:32:15.124196	2017-04-28 13:32:15.124196
783	70	6	208	2.0	241.07		VAT-Exclusive	482.14	\N	2017-04-28 13:32:55.166526	2017-04-28 13:32:55.166526
784	38	6	208	4.0	111.61		VAT-Exclusive	446.43	\N	2017-04-28 13:33:14.048921	2017-04-28 13:33:14.048921
785	94	1	208	15.0	145.00		VAT-Exclusive	2175.0	\N	2017-04-28 13:33:28.600652	2017-04-28 13:33:28.600652
787	7	1	210	24.0	220.00		VAT-Exempted	5280.0	\N	2017-04-28 13:36:57.577102	2017-04-28 13:36:57.577102
788	18	5	211	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-04-28 13:39:11.643033	2017-04-28 13:39:11.643033
797	124	8	212	4.0	120.00		VAT-Inclusive	480.0	\N	2017-04-29 07:01:07.136608	2017-04-29 07:01:07.136608
802	128	8	212	1.0	50.00	BOH exam	VAT-Inclusive	50.0	\N	2017-04-29 07:15:31.128375	2017-04-29 07:15:31.128375
809	121	8	213	2.0	59.00	Trash Liner	VAT-Inclusive	118.0	\N	2017-04-29 07:29:57.537684	2017-04-29 07:29:57.537684
772	24	1	207	17.7	55.93		VAT-Inclusive	990.0	\N	2017-04-28 13:28:08.868594	2017-04-28 13:28:08.868594
775	19	6	207	3.0	55.00		VAT-Inclusive	165.0	\N	2017-04-28 13:29:08.402866	2017-04-28 13:29:08.402866
776	53	5	207	3.0	300.00		VAT-Inclusive	900.0	\N	2017-04-28 13:29:23.058486	2017-04-28 13:29:23.058486
777	16	4	207	12.0	56.67		VAT-Inclusive	680.0	\N	2017-04-28 13:29:44.55877	2017-04-28 13:29:44.55877
781	64	5	208	1.0	468.75		VAT-Exclusive	468.75	\N	2017-04-28 13:31:54.696121	2017-04-28 13:31:54.696121
793	61	1	212	50.0	40.00		VAT-Exempted	2000.0	\N	2017-04-29 06:54:21.434678	2017-04-29 06:54:21.434678
795	131	8	212	1.0	100.00	Borrowed Texas Seasoning From G5	VAT-Inclusive	100.0	\N	2017-04-29 06:58:22.576779	2017-04-29 06:58:22.576779
805	131	8	212	1.0	80.00	Borrowed Order Slip From G5	VAT-Inclusive	80.0	\N	2017-04-29 07:21:55.479519	2017-04-29 07:21:55.479519
773	40	1	207	19.2	112.50		VAT-Inclusive	2160.0	\N	2017-04-28 13:28:34.686637	2017-04-28 13:28:34.686637
774	57	6	207	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-04-28 13:28:50.566527	2017-04-28 13:28:50.566527
778	39	2	208	55.0	55.36		VAT-Exclusive	3044.64	\N	2017-04-28 13:30:42.465035	2017-04-28 13:30:42.465035
786	67	5	209	1.0	758.93		VAT-Exclusive	758.93	\N	2017-04-28 13:35:25.856199	2017-04-28 13:35:25.856199
789	131	8	212	1.0	135.00	Transferred Hotdogs from Kapitolyo	VAT-Inclusive	135.0	\N	2017-04-29 06:45:55.483152	2017-04-29 06:45:55.483152
790	130	8	212	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-04-29 06:47:00.169647	2017-04-29 06:47:00.169647
800	121	8	212	1.0	855.00	30cc, 80cc, Portion Bag	VAT-Inclusive	855.0	\N	2017-04-29 07:10:22.265918	2017-04-29 07:10:22.265918
803	132	8	212	3.0	406.67	Angelie Magallanes - 390\r\nEduardo Lasco - 415\r\nJoverlou Gestopa - 415	VAT-Inclusive	1220.0	\N	2017-04-29 07:18:31.921634	2017-04-29 07:18:31.921634
806	131	8	213	1.0	100.00	G5 to S1 Transfer Heinz	VAT-Inclusive	100.0	\N	2017-04-29 07:25:58.777773	2017-04-29 07:25:58.777773
808	137	8	213	6.0	50.00	Myrtle, Jerlyn, Sharlaine, Santos, Renz, Rizal	VAT-Exempted	300.0	\N	2017-04-29 07:28:07.085615	2017-04-29 07:28:07.085615
791	74	12	212	93.44	7.90		VAT-Inclusive	738.0	\N	2017-04-29 06:49:22.677314	2017-04-29 06:49:22.677314
792	20	11	212	6.0	8.33		VAT-Exempted	50.0	\N	2017-04-29 06:53:43.123148	2017-04-29 06:53:43.123148
794	121	8	212	1.0	99.75	Strainer	VAT-Inclusive	99.75	\N	2017-04-29 06:55:14.601704	2017-04-29 06:55:14.601704
796	131	8	212	1.0	54.00	fare for Buying 30cc and 80cc	VAT-Inclusive	54.0	\N	2017-04-29 06:59:10.623179	2017-04-29 06:59:10.623179
801	137	8	212	16.0	50.00	Jeh, Ruffa, Lem, Sharlaine, Lou 2x, Renz,  Rodel, Rizal, Myrtle, Che, Alvin, Santos, Miko, Lexie	VAT-Exempted	800.0	\N	2017-04-29 07:14:43.498529	2017-04-29 07:14:43.498529
810	124	8	213	2.0	120.00		VAT-Inclusive	240.0	\N	2017-04-29 07:31:37.252895	2017-04-29 07:31:37.252895
811	8	1	214	10.04	179.00		VAT-Exempted	1797.16	\N	2017-04-29 08:01:40.933293	2017-04-29 08:01:40.933293
812	33	11	215	10.56	3.35		VAT-Exempted	35.4	\N	2017-04-29 08:03:32.16629	2017-04-29 08:03:32.16629
813	34	1	215	3.0	78.00		VAT-Exempted	234.0	\N	2017-04-29 08:04:02.302547	2017-04-29 08:04:02.302547
814	36	1	215	3.0	63.00		VAT-Exempted	189.0	\N	2017-04-29 08:04:37.734059	2017-04-29 08:04:37.734059
815	35	11	215	3.52	2.24		VAT-Exempted	7.9	\N	2017-04-29 08:05:28.386576	2017-04-29 08:05:28.386576
816	27	1	215	0.5	198.00		VAT-Exempted	99.0	\N	2017-04-29 08:06:03.373505	2017-04-29 08:06:03.373505
817	21	1	215	3.0	48.00		VAT-Exempted	144.0	\N	2017-04-29 08:06:37.504093	2017-04-29 08:06:37.504093
819	31	1	215	0.5	68.00		VAT-Exempted	34.0	\N	2017-04-29 08:08:12.145099	2017-04-29 08:08:12.145099
820	22	1	215	0.25	58.00		VAT-Exempted	14.5	\N	2017-04-29 08:09:31.249811	2017-04-29 08:09:31.249811
821	104	9	216	72.0	28.00		VAT-Inclusive	2016.0	\N	2017-04-29 08:11:03.234412	2017-04-29 08:11:03.234412
822	103	9	217	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-04-29 08:14:09.646601	2017-04-29 08:14:09.646601
823	122	8	218	1.0	107.00	Joy, Powder, Bleach	VAT-Inclusive	107.0	\N	2017-04-29 08:17:12.322059	2017-04-29 08:17:12.322059
824	124	8	218	2.0	120.00		VAT-Inclusive	240.0	\N	2017-04-29 08:18:18.986658	2017-04-29 08:18:18.986658
825	137	8	218	6.0	50.00	Che, Jerlyn, Miko, Santos, Rizal, Sharlaine	VAT-Exempted	300.0	\N	2017-04-29 08:19:13.558283	2017-04-29 08:19:13.558283
826	131	8	218	1.0	105.00	LES to S1 Transfer Riblets	VAT-Inclusive	105.0	\N	2017-04-29 08:20:08.412141	2017-04-29 08:20:08.412141
827	131	8	218	1.0	82.00	SM TO S1 open market	VAT-Inclusive	82.0	\N	2017-04-29 09:25:55.823462	2017-04-29 09:25:55.823462
828	130	8	218	1.0	1009.25	Butane Gas and Gas Torch	VAT-Inclusive	1009.25	\N	2017-04-29 09:27:14.332759	2017-04-29 09:27:14.332759
829	37	8	218	180.0	4.88		VAT-Inclusive	877.5	\N	2017-04-29 09:30:03.960822	2017-04-29 09:30:03.960822
830	76	4	218	24.0	17.88		VAT-Inclusive	429.0	\N	2017-04-29 09:31:50.349501	2017-04-29 09:31:50.349501
831	93	1	218	1.0	53.00		VAT-Inclusive	53.0	\N	2017-04-29 09:36:07.705183	2017-04-29 09:36:07.705183
832	48	11	218	28.16	5.18		VAT-Inclusive	146.0	\N	2017-04-29 09:36:57.691492	2017-04-29 09:36:57.691492
833	60	11	218	14.26	6.07		VAT-Inclusive	86.5	\N	2017-04-29 09:38:49.596422	2017-04-29 09:38:49.596422
834	49	6	218	2.0	240.25		VAT-Inclusive	480.5	\N	2017-04-29 09:39:37.492071	2017-04-29 09:39:37.492071
835	62	1	218	1.0	24.00		VAT-Inclusive	24.0	\N	2017-04-29 09:40:22.297651	2017-04-29 09:40:22.297651
836	92	1	218	2.0	46.00		VAT-Inclusive	92.0	\N	2017-04-29 09:41:00.336272	2017-04-29 09:41:00.336272
837	73	12	218	29.12	9.38		VAT-Inclusive	273.0	\N	2017-04-29 09:42:07.696655	2017-04-29 09:42:07.696655
838	41	12	218	42.0	10.93		VAT-Inclusive	459.0	\N	2017-04-29 09:43:09.219392	2017-04-29 09:43:09.219392
839	137	8	219	5.0	50.00	Che 10am, Myrtle 1pm, Lou 3pm, Rodel 10-9	VAT-Exempted	250.0	\N	2017-04-30 14:03:55.0698	2017-04-30 14:03:55.0698
840	122	8	219	1.0	59.00	Trash Bag	VAT-Inclusive	59.0	\N	2017-04-30 14:04:22.594529	2017-04-30 14:04:22.594529
841	122	8	219	1.0	25.00	Bleach	VAT-Inclusive	25.0	\N	2017-04-30 14:04:41.949354	2017-04-30 14:04:41.949354
842	122	8	219	1.0	26.00	Joy	VAT-Inclusive	26.0	\N	2017-04-30 14:04:59.368035	2017-04-30 14:04:59.368035
843	121	8	220	1.0	386.40	260cc	VAT-Inclusive	386.4	\N	2017-05-04 13:00:27.887924	2017-05-04 13:00:27.887924
844	129	8	220	1.0	439.75	Rat Glue	VAT-Inclusive	439.75	\N	2017-05-04 13:01:13.279359	2017-05-04 13:01:13.279359
845	130	8	220	1.0	380.00	Plastic Wrap for Transmittal	VAT-Inclusive	380.0	\N	2017-05-04 13:02:12.16024	2017-05-04 13:02:12.16024
846	121	8	220	1.0	410.00	520 lids, large paper bag and 8oz cups	VAT-Inclusive	410.0	\N	2017-05-04 13:03:19.816347	2017-05-04 13:03:19.816347
847	121	8	220	1.0	75.00	Small Paper Bag	VAT-Inclusive	75.0	\N	2017-05-04 13:03:50.451924	2017-05-04 13:03:50.451924
848	129	8	220	1.0	500.00	Mouse trap 2pcs. 	VAT-Inclusive	500.0	\N	2017-05-04 13:04:39.468848	2017-05-04 13:04:39.468848
849	99	7	220	8.0	21.00	Pepsi Regular	VAT-Inclusive	168.0	\N	2017-05-04 13:15:43.247278	2017-05-04 13:15:43.247278
850	121	8	220	1.0	269.60	Trashliner	VAT-Inclusive	269.6	\N	2017-05-04 13:16:44.894171	2017-05-04 13:16:44.894171
851	122	8	220	1.0	263.30	Joy, Powder, Bleach	VAT-Inclusive	263.3	\N	2017-05-04 13:17:46.133002	2017-05-04 13:17:46.133002
852	50	1	220	2.8	140.25		VAT-Inclusive	392.7	\N	2017-05-04 13:18:24.494756	2017-05-04 13:18:24.494756
853	131	8	220	1.0	100.00	Open Market Restaurant supplies, Jalapeno and Mouse Trap	VAT-Inclusive	100.0	\N	2017-05-04 13:19:41.543975	2017-05-04 13:19:41.543975
854	122	8	220	1.0	41.00	Joy and powder	VAT-Inclusive	41.0	\N	2017-05-04 13:20:23.549476	2017-05-04 13:20:23.549476
855	137	8	220	9.0	50.00		VAT-Exempted	450.0	\N	2017-05-04 13:20:54.868625	2017-05-04 13:20:54.868625
856	121	8	220	3.0	118.75	Balikbayan Box for Bulk Order	VAT-Inclusive	356.25	\N	2017-05-04 13:21:50.572045	2017-05-04 13:21:50.572045
857	131	8	221	1.0	364.00	Transfer LNT from Megamall to S1	VAT-Inclusive	364.0	\N	2017-05-04 13:28:04.529571	2017-05-04 13:28:04.529571
858	137	8	221	15.0	50.00		VAT-Exempted	750.0	\N	2017-05-04 13:28:34.291391	2017-05-04 13:28:34.291391
859	130	8	221	1.0	45.00	Print of PCF and Timesheet	VAT-Inclusive	45.0	\N	2017-05-04 13:29:22.064622	2017-05-04 13:29:22.064622
860	124	8	221	5.0	120.00		VAT-Inclusive	600.0	\N	2017-05-04 13:48:01.663245	2017-05-04 13:48:01.663245
861	61	1	221	50.0	40.00		VAT-Exempted	2000.0	\N	2017-05-04 13:49:16.994113	2017-05-04 13:49:16.994113
862	137	8	222	17.0	50.00		VAT-Exempted	850.0	\N	2017-05-04 13:51:55.455021	2017-05-04 13:51:55.455021
863	131	8	222	1.0	140.00	LES to S1 for Order Slip	VAT-Inclusive	140.0	\N	2017-05-04 13:52:55.622683	2017-05-04 13:52:55.622683
864	130	8	223	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-04 13:55:32.952491	2017-05-04 13:55:32.952491
865	124	8	223	7.0	120.00		VAT-Inclusive	840.0	\N	2017-05-04 13:57:11.148167	2017-05-04 13:57:11.148167
866	137	8	223	15.0	50.00		VAT-Exempted	750.0	\N	2017-05-04 13:58:07.315344	2017-05-04 13:58:07.315344
867	11	2	223	1.32	146.02		VAT-Inclusive	192.75	\N	2017-05-04 13:59:29.048917	2017-05-04 13:59:29.048917
868	21	1	224	19.0	22.11		VAT-Exempted	420.0	\N	2017-05-05 08:07:20.392385	2017-05-05 08:07:20.392385
869	22	1	224	1.1	58.00		VAT-Exempted	63.8	\N	2017-05-05 08:07:44.016469	2017-05-05 08:07:44.016469
870	32	1	224	6.0	54.00		VAT-Exempted	324.0	\N	2017-05-05 08:08:02.022861	2017-05-05 08:08:02.022861
871	33	1	224	0.4	118.00		VAT-Exempted	47.2	\N	2017-05-05 08:08:31.865555	2017-05-05 08:08:31.865555
872	30	8	224	15.0	13.37		VAT-Exempted	200.6	\N	2017-05-05 08:08:51.962883	2017-05-05 08:08:51.962883
873	34	1	224	2.0	78.00		VAT-Exempted	156.0	\N	2017-05-05 08:09:09.135117	2017-05-05 08:09:09.135117
874	21	1	225	20.0	52.00		VAT-Exempted	1040.0	\N	2017-05-05 08:12:06.38348	2017-05-05 08:12:06.38348
875	22	1	225	1.0	58.00		VAT-Exempted	58.0	\N	2017-05-05 08:12:23.682511	2017-05-05 08:12:23.682511
876	33	1	225	0.3	118.00		VAT-Exempted	35.4	\N	2017-05-05 08:12:40.058989	2017-05-05 08:12:40.058989
877	23	1	225	0.1	138.00		VAT-Exempted	13.8	\N	2017-05-05 08:13:02.453457	2017-05-05 08:13:02.453457
878	27	1	225	0.5	198.00		VAT-Exempted	99.0	\N	2017-05-05 08:13:18.518049	2017-05-05 08:13:18.518049
879	36	1	225	3.0	63.00		VAT-Exempted	189.0	\N	2017-05-05 08:13:34.250676	2017-05-05 08:13:34.250676
888	39	2	229	20.0	55.36		VAT-Exclusive	1107.15	\N	2017-05-05 08:21:44.312568	2017-05-05 08:21:44.312568
889	46	2	229	18.0	165.18		VAT-Exclusive	2973.21	\N	2017-05-05 08:23:58.155362	2017-05-05 08:23:58.155362
892	68	5	229	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-05-05 08:25:31.176637	2017-05-05 08:25:31.176637
894	70	6	229	2.0	241.07		VAT-Exclusive	482.14	\N	2017-05-05 08:26:30.458213	2017-05-05 08:26:30.458213
895	80	2	229	2.0	171.88		VAT-Exclusive	343.75	\N	2017-05-05 08:26:52.806211	2017-05-05 08:26:52.806211
896	38	6	229	4.0	111.61		VAT-Exclusive	446.43	\N	2017-05-05 08:27:12.251827	2017-05-05 08:27:12.251827
902	40	1	232	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-05-05 08:35:18.923674	2017-05-05 08:35:18.923674
903	19	6	232	3.0	55.00		VAT-Inclusive	165.0	\N	2017-05-05 09:06:10.145755	2017-05-05 09:06:10.145755
908	17	7	232	2.0	308.00		VAT-Inclusive	616.0	\N	2017-05-05 09:08:19.769495	2017-05-05 09:08:19.769495
909	16	4	232	12.0	42.50		VAT-Inclusive	510.0	\N	2017-05-05 09:08:37.578476	2017-05-05 09:08:37.578476
910	40	1	233	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-05-05 09:10:33.329933	2017-05-05 09:10:33.329933
911	53	5	233	2.0	300.00		VAT-Inclusive	600.0	\N	2017-05-05 09:10:53.755186	2017-05-05 09:10:53.755186
914	56	1	234	50.0	105.00		VAT-Inclusive	5250.0	\N	2017-05-05 09:13:30.861561	2017-05-05 09:13:30.861561
918	121	8	236	1.0	10062.00		VAT-Inclusive	10062.0	\N	2017-05-05 09:18:02.881099	2017-05-05 09:18:02.881099
923	33	1	240	0.4	118.00		VAT-Exempted	47.2	\N	2017-05-05 09:23:57.343832	2017-05-05 09:23:57.343832
924	34	1	240	2.0	78.00		VAT-Exempted	156.0	\N	2017-05-05 09:24:13.997948	2017-05-05 09:24:13.997948
929	7	1	243	24.0	220.00		VAT-Exempted	5280.0	\N	2017-05-05 09:31:38.113497	2017-05-05 09:31:38.113497
932	11	2	244	6.6	146.02		VAT-Inclusive	963.75	\N	2017-05-05 11:25:30.011518	2017-05-05 11:25:30.011518
880	32	1	225	3.0	54.00		VAT-Exempted	162.0	\N	2017-05-05 08:13:50.814794	2017-05-05 08:13:50.814794
881	30	8	225	10.0	12.98		VAT-Exempted	129.8	\N	2017-05-05 08:14:10.75951	2017-05-05 08:14:10.75951
884	44	8	227	100.0	4.60		VAT-Inclusive	460.0	\N	2017-05-05 08:17:06.20775	2017-05-05 08:17:06.20775
887	77	9	228	2.0	214.29		VAT-Exclusive	428.57	\N	2017-05-05 08:18:54.9231	2017-05-05 08:18:54.9231
900	8	1	231	30.6	179.00		VAT-Exempted	5477.4	\N	2017-05-05 08:33:18.591731	2017-05-05 08:33:18.591731
901	24	1	232	17.7	55.93		VAT-Inclusive	990.0	\N	2017-05-05 08:34:55.315831	2017-05-05 08:34:55.315831
904	53	5	232	3.0	300.00		VAT-Inclusive	900.0	\N	2017-05-05 09:06:35.902525	2017-05-05 09:06:35.902525
907	12	1	232	3.5	699.60		VAT-Inclusive	2448.6	\N	2017-05-05 09:08:02.125778	2017-05-05 09:08:02.125778
916	26	1	234	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-05-05 09:14:55.556913	2017-05-05 09:14:55.556913
921	121	8	239	1.0	4140.00		VAT-Inclusive	4140.0	\N	2017-05-05 09:21:34.868624	2017-05-05 09:21:34.868624
926	9	1	241	32.16	151.00		VAT-Exempted	4856.16	\N	2017-05-05 09:25:42.409784	2017-05-05 09:25:42.409784
930	130	8	244	1.0	10.00	Printing of Job Hazard	VAT-Inclusive	10.0	\N	2017-05-05 11:21:48.681071	2017-05-05 11:21:48.681071
931	137	8	244	1.0	850.00	Myrtle 2:30, Cheryline 4pm, Jerlyn 10am, Cherilou 11-3/6-10, Sharlaine 12-4/7-11, Alexie 6p, Rizal 9am, Rodel 9am, Renz 11am, Mico 6pm, Alvin 6pm, Santos 5pm, Lem 2:30, Erlyn 2pm, Jom 2pm)	VAT-Exempted	850.0	\N	2017-05-05 11:24:41.090899	2017-05-05 11:24:41.090899
882	34	1	225	1.0	78.00		VAT-Exempted	78.0	\N	2017-05-05 08:14:29.022882	2017-05-05 08:14:29.022882
885	42	8	227	30.0	4.50		VAT-Inclusive	135.0	\N	2017-05-05 08:17:25.025304	2017-05-05 08:17:25.025304
886	43	8	227	20.0	6.60		VAT-Inclusive	132.0	\N	2017-05-05 08:17:48.727005	2017-05-05 08:17:48.727005
890	47	2	229	36.0	46.88		VAT-Exclusive	1687.5	\N	2017-05-05 08:24:25.349844	2017-05-05 08:24:25.349844
899	9	1	231	70.0	151.00		VAT-Exempted	10570.0	\N	2017-05-05 08:31:59.295362	2017-05-05 08:31:59.295362
905	5	1	232	30.0	180.00		VAT-Exempted	5400.0	\N	2017-05-05 09:07:00.05602	2017-05-05 09:07:00.05602
913	1	1	233	2.0	195.00		VAT-Exempted	390.0	\N	2017-05-05 09:12:07.37855	2017-05-05 09:12:07.37855
915	25	1	234	10.0	75.00		VAT-Inclusive	750.0	\N	2017-05-05 09:14:26.460638	2017-05-05 09:14:26.460638
917	18	5	235	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-05-05 09:16:13.623453	2017-05-05 09:16:13.623453
919	122	8	237	1.0	1470.00		VAT-Inclusive	1470.0	\N	2017-05-05 09:19:11.065635	2017-05-05 09:19:11.065635
920	56	1	238	125.0	93.00		VAT-Inclusive	11625.0	\N	2017-05-05 09:20:33.76052	2017-05-05 09:20:33.76052
922	32	1	240	7.0	54.00		VAT-Exempted	378.0	\N	2017-05-05 09:23:38.74632	2017-05-05 09:23:38.74632
925	36	1	240	3.0	63.00		VAT-Exempted	189.0	\N	2017-05-05 09:24:27.448607	2017-05-05 09:24:27.448607
933	75	9	244	4.0	241.60		VAT-Inclusive	966.4	\N	2017-05-05 11:26:16.299525	2017-05-05 11:26:16.299525
883	97	9	226	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-05-05 08:15:39.990353	2017-05-05 08:15:39.990353
891	64	5	229	1.0	468.75		VAT-Exclusive	468.75	\N	2017-05-05 08:24:48.075967	2017-05-05 08:24:48.075967
893	69	6	229	8.0	196.43		VAT-Exclusive	1571.43	\N	2017-05-05 08:26:02.673863	2017-05-05 08:26:02.673863
898	121	8	230	1.0	850.00		VAT-Exclusive	850.0	\N	2017-05-05 08:30:20.412637	2017-05-05 08:30:20.412637
906	95	8	232	120.0	0.00		VAT-Inclusive	0.0	\N	2017-05-05 09:07:37.881474	2017-05-05 09:07:37.881474
912	24	1	233	17.7	55.93		VAT-Inclusive	990.0	\N	2017-05-05 09:11:43.041731	2017-05-05 09:11:43.041731
927	1	1	242	6.0	195.00		VAT-Exempted	1170.0	\N	2017-05-05 09:28:43.417411	2017-05-05 09:28:43.417411
928	5	1	242	30.0	180.00		VAT-Exempted	5400.0	\N	2017-05-05 09:29:02.194739	2017-05-05 09:29:02.194739
934	130	8	244	1.0	60.00	Manila Paper for Store Cover	VAT-Inclusive	60.0	\N	2017-05-05 11:26:57.869653	2017-05-05 11:26:57.869653
935	58	1	244	1.0	290.00		VAT-Inclusive	290.0	\N	2017-05-05 11:27:23.654527	2017-05-05 11:27:23.654527
936	131	8	245	1.0	162.00	Open Market	VAT-Exempted	162.0	\N	2017-05-09 09:47:42.423497	2017-05-09 09:47:42.423497
937	122	8	245	1.0	40.00	Powder Detergent and Bleach	VAT-Inclusive	40.0	\N	2017-05-09 09:54:49.672742	2017-05-09 09:54:49.672742
938	122	8	245	1.0	431.00	Dishwashing liquid and Powder Detergent	VAT-Inclusive	431.0	\N	2017-05-09 09:56:53.853597	2017-05-09 09:56:53.853597
939	10	1	245	10.8	143.06		VAT-Exclusive	1545.0	\N	2017-05-09 09:59:38.92919	2017-05-09 09:59:38.92919
940	11	1	245	9.6	250.89		VAT-Exclusive	2408.57	\N	2017-05-09 10:00:51.464203	2017-05-09 10:00:51.464203
941	130	8	245	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-09 10:03:51.702861	2017-05-09 10:03:51.702861
942	16	4	245	6.0	48.75		VAT-Inclusive	292.5	\N	2017-05-09 10:05:59.989576	2017-05-09 10:05:59.989576
943	124	1	245	8.0	116.00		VAT-Exempted	928.0	\N	2017-05-09 10:08:36.33994	2017-05-09 10:08:36.33994
944	61	1	245	50.0	40.00		VAT-Exempted	2000.0	\N	2017-05-09 10:09:32.272392	2017-05-09 10:09:32.272392
945	137	8	245	17.0	50.00	Rodel Sunday, Rizal Saturday, Rizal 9am, Renz 9am, Mico 11am, Myrtle 9am, Lou 9am, Sharlaine 11-3/5-9, Lem 2:30, Cheryline 4pm, Jerlyn 4pm, Alvin 5pm, Rodel 5pm, Erlyn 10am, Jom 10am	VAT-Exempted	850.0	\N	2017-05-09 10:16:16.760862	2017-05-09 10:16:16.760862
946	49	6	245	3.0	227.50		VAT-Inclusive	682.5	\N	2017-05-09 10:18:53.554565	2017-05-09 10:18:53.554565
947	74	12	245	70.08	7.90		VAT-Inclusive	553.5	\N	2017-05-09 10:21:35.095793	2017-05-09 10:21:35.095793
948	72	6	245	1.0	36.50		VAT-Inclusive	36.5	\N	2017-05-09 10:23:05.735005	2017-05-09 10:23:05.735005
949	55	12	245	7.0	20.93		VAT-Inclusive	146.5	\N	2017-05-09 10:23:32.069273	2017-05-09 10:23:32.069273
950	71	12	245	14.08	15.41		VAT-Inclusive	217.0	\N	2017-05-09 10:24:05.333955	2017-05-09 10:24:05.333955
951	96	4	245	3.2	22.66		VAT-Inclusive	72.5	\N	2017-05-09 10:25:09.329612	2017-05-09 10:25:09.329612
952	37	8	245	180.0	4.88		VAT-Inclusive	877.5	\N	2017-05-09 10:25:36.562359	2017-05-09 10:25:36.562359
953	41	12	245	21.0	10.93		VAT-Inclusive	229.5	\N	2017-05-09 10:25:54.188202	2017-05-09 10:25:54.188202
954	92	1	245	2.0	46.00		VAT-Inclusive	92.0	\N	2017-05-09 10:26:44.250272	2017-05-09 10:26:44.250272
955	93	1	245	1.0	54.00		VAT-Inclusive	54.0	\N	2017-05-09 10:27:02.478543	2017-05-09 10:27:02.478543
956	76	4	245	36.0	17.88		VAT-Inclusive	643.5	\N	2017-05-09 10:29:18.894951	2017-05-09 10:29:18.894951
957	48	1	245	0.6	182.50		VAT-Inclusive	109.5	\N	2017-05-09 10:29:37.931366	2017-05-09 10:29:37.931366
958	88	1	245	0.5	829.00		VAT-Inclusive	414.5	\N	2017-05-09 10:30:29.847628	2017-05-09 10:30:29.847628
959	137	8	246	12.0	50.00	Myrtle 9am, Rizal 9am, Renz 9am, Lou 9am, Santos 12nn, Sharlaine 11-3/5-9, Lem 2:30, Cheryline 4pm, Jerlyn 4pm, Alvin 5pm, Mico 5pm	VAT-Exempted	600.0	\N	2017-05-09 10:40:19.585474	2017-05-09 10:40:19.585474
960	130	8	246	1.0	50.00	Printing of Prep Sheet	VAT-Inclusive	50.0	\N	2017-05-09 10:40:46.228408	2017-05-09 10:40:46.228408
961	131	8	246	1.0	120.00	Transfer of Texas Chili and Order Slip from Brixton	VAT-Exempted	120.0	\N	2017-05-09 10:41:24.105965	2017-05-09 10:41:24.105965
962	131	8	246	1.0	104.00	Fare for buying Ice cream scooper and restaurant supplies from Quiapo	VAT-Exempted	104.0	\N	2017-05-09 10:42:31.796925	2017-05-09 10:42:31.796925
963	121	8	246	1.0	255.00	300 pcs 8oz paper cup	VAT-Inclusive	255.0	\N	2017-05-09 10:49:27.945642	2017-05-09 10:49:27.945642
964	122	8	246	1.0	291.25	Powder Detergent, Bleach and Joy Dishwashing	VAT-Inclusive	291.25	\N	2017-05-09 10:50:44.139858	2017-05-09 10:50:44.139858
965	121	8	246	1.0	650.00	Ice Cream Scooper	VAT-Inclusive	650.0	\N	2017-05-09 10:51:23.590416	2017-05-09 10:51:23.590416
966	122	8	246	1.0	160.00	Stick broom	VAT-Inclusive	160.0	\N	2017-05-09 11:32:44.940294	2017-05-09 11:32:44.940294
967	121	8	246	1.0	1950.00	Paper Tray for Bulk Orders	VAT-Inclusive	1950.0	\N	2017-05-09 11:37:06.931057	2017-05-09 11:37:06.931057
968	24	1	247	35.4	55.93		VAT-Inclusive	1980.0	\N	2017-05-10 10:02:35.349171	2017-05-10 10:02:35.349171
969	40	1	247	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-05-10 10:03:26.499354	2017-05-10 10:03:26.499354
970	19	6	247	4.0	55.00		VAT-Inclusive	220.0	\N	2017-05-10 10:03:41.532155	2017-05-10 10:03:41.532155
973	1	1	247	4.0	195.00		VAT-Exempted	780.0	\N	2017-05-10 10:05:29.905067	2017-05-10 10:05:29.905067
974	95	8	247	96.0	16.94		VAT-Inclusive	1626.66	\N	2017-05-10 10:08:11.696318	2017-05-10 10:08:11.696318
975	16	4	247	20.0	42.50		VAT-Inclusive	850.0	\N	2017-05-10 10:08:28.741088	2017-05-10 10:08:28.741088
976	53	5	247	4.0	300.00		VAT-Inclusive	1200.0	\N	2017-05-10 10:09:19.050971	2017-05-10 10:09:19.050971
977	9	1	249	40.68	151.00		VAT-Exempted	6142.68	\N	2017-05-10 10:31:29.392158	2017-05-10 10:31:29.392158
978	97	9	250	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-05-10 10:32:22.527539	2017-05-10 10:32:22.527539
979	39	2	251	35.0	55.36		VAT-Exclusive	1937.5	\N	2017-05-10 10:33:14.969317	2017-05-10 10:33:14.969317
980	47	2	251	40.0	46.88		VAT-Exclusive	1875.0	\N	2017-05-10 10:33:31.867465	2017-05-10 10:33:31.867465
981	64	5	251	1.0	468.75		VAT-Exclusive	468.75	\N	2017-05-10 10:33:49.97203	2017-05-10 10:33:49.97203
982	68	5	251	2.0	580.36		VAT-Exclusive	1160.71	\N	2017-05-10 10:34:09.646802	2017-05-10 10:34:09.646802
983	80	2	251	4.0	171.88		VAT-Exclusive	687.5	\N	2017-05-10 10:34:51.718756	2017-05-10 10:34:51.718756
984	38	6	251	4.0	111.61		VAT-Exclusive	446.43	\N	2017-05-10 10:35:12.518096	2017-05-10 10:35:12.518096
985	94	1	251	15.0	145.00		VAT-Exclusive	2175.0	\N	2017-05-10 10:35:39.935526	2017-05-10 10:35:39.935526
986	36	1	252	3.0	63.00		VAT-Exempted	189.0	\N	2017-05-10 10:36:35.751757	2017-05-10 10:36:35.751757
987	34	1	252	1.0	78.00		VAT-Exempted	78.0	\N	2017-05-10 10:36:48.737269	2017-05-10 10:36:48.737269
988	21	1	252	3.0	53.00		VAT-Exempted	159.0	\N	2017-05-10 10:37:02.681322	2017-05-10 10:37:02.681322
989	27	1	252	0.5	208.00		VAT-Exempted	104.0	\N	2017-05-10 10:37:26.920254	2017-05-10 10:37:26.920254
990	23	1	252	0.1	138.00		VAT-Exempted	13.8	\N	2017-05-10 10:37:44.63964	2017-05-10 10:37:44.63964
991	33	1	252	0.3	118.00		VAT-Exempted	35.4	\N	2017-05-10 10:38:01.464396	2017-05-10 10:38:01.464396
992	35	1	252	0.1	89.00		VAT-Exempted	8.9	\N	2017-05-10 10:38:19.165049	2017-05-10 10:38:19.165049
993	20	1	252	0.1	138.00		VAT-Exempted	13.8	\N	2017-05-10 10:38:35.158812	2017-05-10 10:38:35.158812
994	30	8	252	20.0	16.23		VAT-Exempted	324.5	\N	2017-05-10 10:41:04.394383	2017-05-10 10:41:04.394383
995	22	1	252	0.25	53.00		VAT-Exempted	13.25	\N	2017-05-10 10:41:28.554007	2017-05-10 10:41:28.554007
996	31	1	252	0.9	63.00		VAT-Exempted	56.7	\N	2017-05-10 10:41:50.873685	2017-05-10 10:41:50.873685
997	103	9	253	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-05-10 11:05:52.382007	2017-05-10 11:05:52.382007
998	104	9	253	72.0	28.00		VAT-Inclusive	2016.0	\N	2017-05-10 11:06:12.385643	2017-05-10 11:06:12.385643
999	32	1	254	6.0	54.00		VAT-Exempted	324.0	\N	2017-05-10 11:07:21.535879	2017-05-10 11:07:21.535879
1000	36	1	254	3.0	63.00		VAT-Exempted	189.0	\N	2017-05-10 11:07:45.321411	2017-05-10 11:07:45.321411
1001	28	1	254	0.2	268.00		VAT-Exempted	53.6	\N	2017-05-10 11:08:05.502163	2017-05-10 11:08:05.502163
1002	21	1	254	3.0	56.00		VAT-Exempted	168.0	\N	2017-05-10 11:08:20.943751	2017-05-10 11:08:20.943751
1012	30	8	256	20.0	13.57		VAT-Exempted	271.4	\N	2017-05-10 11:48:39.720676	2017-05-10 11:48:39.720676
1013	23	11	256	3.52	3.92		VAT-Exempted	13.8	\N	2017-05-10 11:57:03.114689	2017-05-10 11:57:03.114689
1017	100	9	257	120.0	32.50		VAT-Inclusive	3900.0	\N	2017-05-10 12:08:22.59242	2017-05-10 12:08:22.59242
1037	61	1	263	25.0	40.00		VAT-Exempted	1000.0	\N	2017-05-13 11:43:16.554107	2017-05-13 11:43:16.554107
1046	32	1	267	6.0	54.00		VAT-Exempted	324.0	\N	2017-05-13 12:13:26.78155	2017-05-13 12:13:26.78155
1048	33	1	267	0.3	118.00		VAT-Exempted	35.4	\N	2017-05-13 12:18:33.164763	2017-05-13 12:18:33.164763
1049	21	1	267	7.0	56.00		VAT-Exempted	392.0	\N	2017-05-13 12:19:14.609264	2017-05-13 12:19:14.609264
1055	8	1	270	8.04	179.00		VAT-Exempted	1439.16	\N	2017-05-13 12:29:40.157817	2017-05-13 12:29:40.157817
1003	43	8	255	40.0	6.60		VAT-Inclusive	264.0	\N	2017-05-10 11:30:19.450151	2017-05-10 11:30:19.450151
1009	32	1	256	6.0	54.00		VAT-Exempted	324.0	\N	2017-05-10 11:44:18.591937	2017-05-10 11:44:18.591937
1014	20	11	256	3.52	3.92		VAT-Exempted	13.8	\N	2017-05-10 11:58:51.973012	2017-05-10 11:58:51.973012
1015	36	1	256	3.0	63.00		VAT-Exempted	189.0	\N	2017-05-10 11:59:59.786776	2017-05-10 11:59:59.786776
1018	101	9	257	48.0	49.58		VAT-Inclusive	2380.0	\N	2017-05-10 12:10:34.136572	2017-05-10 12:10:34.136572
1019	125	8	258	1.0	42205.77		VAT-Inclusive	42205.77	\N	2017-05-10 12:14:16.583791	2017-05-10 12:14:16.583791
1021	121	8	260	1.0	11397.00		VAT-Inclusive	11397.0	\N	2017-05-10 12:20:00.146795	2017-05-10 12:20:00.146795
1031	124	8	262	13.0	120.00		VAT-Inclusive	1560.0	\N	2017-05-13 11:38:54.588403	2017-05-13 11:38:54.588403
1042	99	7	265	144.0	17.41	Max, Reg, 7up, Mdew	VAT-Exclusive	2507.14	\N	2017-05-13 12:02:51.738693	2017-05-13 12:02:51.738693
1047	34	1	267	2.0	73.00		VAT-Exempted	146.0	\N	2017-05-13 12:17:03.694767	2017-05-13 12:17:03.694767
1054	9	1	270	19.9	151.00		VAT-Exempted	3004.9	\N	2017-05-13 12:29:09.463214	2017-05-13 12:29:09.463214
1058	24	1	273	35.4	55.93		VAT-Inclusive	1980.0	\N	2017-05-13 12:46:59.266784	2017-05-13 12:46:59.266784
1062	95	8	273	144.0	16.94		VAT-Inclusive	2439.99	\N	2017-05-13 12:50:09.199634	2017-05-13 12:50:09.199634
1004	44	8	255	50.0	4.60		VAT-Inclusive	230.0	\N	2017-05-10 11:30:38.022557	2017-05-10 11:30:38.022557
1007	22	1	256	0.5	48.00		VAT-Exempted	24.0	\N	2017-05-10 11:33:08.179529	2017-05-10 11:33:08.179529
1010	27	1	256	0.5	208.00		VAT-Exempted	104.0	\N	2017-05-10 11:45:22.408042	2017-05-10 11:45:22.408042
1020	122	8	259	1.0	1173.00		VAT-Inclusive	1173.0	\N	2017-05-10 12:17:42.203217	2017-05-10 12:17:42.203217
1022	123	8	261	1.0	104.00	Masking Tape	VAT-Inclusive	104.0	\N	2017-05-10 12:34:25.634128	2017-05-10 12:34:25.634128
1025	131	8	261	1.0	120.00	Fare for buying Wings	VAT-Exempted	120.0	\N	2017-05-10 12:35:28.286086	2017-05-10 12:35:28.286086
1027	8	1	261	0.5	182.10		VAT-Exempted	91.05	\N	2017-05-10 12:39:24.180851	2017-05-10 12:39:24.180851
1029	122	8	261	1.0	259.90	Push brush	VAT-Inclusive	259.9	\N	2017-05-10 12:43:28.49906	2017-05-10 12:43:28.49906
1030	9	1	261	19.7	172.41		VAT-Exempted	3396.45	\N	2017-05-11 02:26:21.062404	2017-05-11 02:26:21.062404
1032	130	8	262	1.0	75.00	Print of PCF and Variance	VAT-Inclusive	75.0	\N	2017-05-13 11:39:35.693525	2017-05-13 11:39:35.693525
1035	130	8	263	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-05-13 11:42:17.130801	2017-05-13 11:42:17.130801
1043	98	9	265	24.0	8.11		VAT-Exclusive	194.65	\N	2017-05-13 12:04:41.71862	2017-05-13 12:04:41.71862
1044	26	1	266	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-05-13 12:07:40.796212	2017-05-13 12:07:40.796212
1050	30	8	267	15.0	17.07		VAT-Exempted	256.0	\N	2017-05-13 12:19:43.154805	2017-05-13 12:19:43.154805
1052	134	8	268	15.0	90.00	Double Play and Grandslam Menu	VAT-Inclusive	1350.0	\N	2017-05-13 12:23:03.835015	2017-05-13 12:23:03.835015
1060	57	6	273	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-05-13 12:48:30.910582	2017-05-13 12:48:30.910582
1061	53	5	273	2.0	300.00		VAT-Inclusive	600.0	\N	2017-05-13 12:49:01.954318	2017-05-13 12:49:01.954318
1063	13	1	273	2.0	600.00		VAT-Inclusive	1200.0	\N	2017-05-13 12:52:09.558606	2017-05-13 12:52:09.558606
1064	17	7	273	2.0	165.00		VAT-Inclusive	330.0	\N	2017-05-13 12:52:42.229191	2017-05-13 12:52:42.229191
1008	21	1	256	6.0	56.00		VAT-Exempted	336.0	\N	2017-05-10 11:34:25.951224	2017-05-10 11:34:25.951224
1011	33	11	256	14.08	3.35		VAT-Exempted	47.2	\N	2017-05-10 11:47:40.47818	2017-05-10 11:47:40.47818
1016	34	1	256	2.0	68.00		VAT-Exempted	136.0	\N	2017-05-10 12:00:39.543998	2017-05-10 12:00:39.543998
1023	99	7	261	40.0	20.50		VAT-Inclusive	820.0	\N	2017-05-10 12:34:49.396003	2017-05-10 12:34:49.396003
1024	130	8	261	1.0	99.00	Mighty Bond	VAT-Inclusive	99.0	\N	2017-05-10 12:35:08.692027	2017-05-10 12:35:08.692027
1028	137	8	261	13.0	50.00	Myrtle 9am, Rizal 9am, Rodel 9am, Sharlaine 9am, Lou 11-3/5-9, Renz 12nn, Jom 10am, Lem 2:30, Cheryline 4pm, Jerlyn 4pm, Alvin 5pm, Santos 5pm	VAT-Exempted	650.0	\N	2017-05-10 12:40:44.373055	2017-05-10 12:40:44.373055
1033	137	8	262	13.0	50.00		VAT-Exempted	650.0	\N	2017-05-13 11:40:06.976189	2017-05-13 11:40:06.976189
1034	130	8	262	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-13 11:40:38.110746	2017-05-13 11:40:38.110746
1036	137	8	263	13.0	50.00		VAT-Exempted	650.0	\N	2017-05-13 11:42:41.01075	2017-05-13 11:42:41.01075
1038	131	8	263	2.0	120.00	LES to S1 Borrow Riblets\r\nG5 to S1 Transfer Cheese sauce	VAT-Inclusive	240.0	\N	2017-05-13 11:44:21.84542	2017-05-13 11:44:21.84542
1041	121	8	264	2.0	850.00	Buffalos Greaseproof Liner	VAT-Exclusive	1700.0	\N	2017-05-13 11:59:02.29883	2017-05-13 11:59:02.29883
1045	36	1	267	5.0	63.00		VAT-Exempted	315.0	\N	2017-05-13 12:12:31.422815	2017-05-13 12:12:31.422815
1051	22	1	267	0.5	48.00		VAT-Exempted	24.0	\N	2017-05-13 12:20:31.077256	2017-05-13 12:20:31.077256
1053	9	1	269	21.7	151.00		VAT-Exempted	3276.7	\N	2017-05-13 12:27:13.961108	2017-05-13 12:27:13.961108
1057	26	1	272	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-05-13 12:44:42.115318	2017-05-13 12:44:42.115318
1059	40	1	273	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-05-13 12:48:00.464777	2017-05-13 12:48:00.464777
1065	16	4	273	24.0	42.50		VAT-Inclusive	1020.0	\N	2017-05-13 12:54:36.712298	2017-05-13 12:54:36.712298
1066	131	8	274	1.0	188.00	LES to S1 Transfer Pulled Pork	VAT-Inclusive	188.0	\N	2017-05-13 15:15:38.654948	2017-05-13 15:15:38.654948
1067	137	8	274	7.0	50.00		VAT-Exempted	350.0	\N	2017-05-13 15:16:02.534935	2017-05-13 15:16:02.534935
1068	61	1	274	50.0	40.00		VAT-Exempted	2000.0	\N	2017-05-13 15:16:25.155667	2017-05-13 15:16:25.155667
1069	131	8	275	1.0	100.00	Borrowed cheese sauce from Kapitolyo	VAT-Exempted	100.0	\N	2017-05-17 11:49:09.994702	2017-05-17 11:49:09.994702
1070	137	8	275	7.0	50.00	Rodel 11am, Myrtle 11-3/4-9, Jerlyn 12-4/5-9, Mico 3pm, Jom 11am	VAT-Exempted	350.0	\N	2017-05-17 11:50:08.338522	2017-05-17 11:50:08.338522
1071	11	2	276	42.24	114.04		VAT-Exclusive	4817.14	\N	2017-05-17 11:52:25.585407	2017-05-17 11:52:25.585407
1072	10	2	276	23.76	65.03		VAT-Exclusive	1545.0	\N	2017-05-17 11:52:49.120677	2017-05-17 11:52:49.120677
1073	20	1	276	0.13	455.62		VAT-Exempted	59.23	\N	2017-05-17 11:53:45.176033	2017-05-17 11:53:45.176033
1074	33	1	276	0.19	295.84		VAT-Exempted	56.21	\N	2017-05-17 11:54:21.505086	2017-05-17 11:54:21.505086
1075	50	1	276	1.8	192.50		VAT-Inclusive	346.5	\N	2017-05-17 11:54:45.463405	2017-05-17 11:54:45.463405
1076	124	8	276	9.0	126.67	Tube Ice	VAT-Inclusive	1140.0	\N	2017-05-17 11:55:11.793915	2017-05-17 11:55:11.793915
1077	130	8	276	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-17 11:55:42.09384	2017-05-17 11:55:42.09384
1078	137	8	276	14.0	50.00	Erlyn 10am, Jom 10am, Rizal 9am, Rodel 9am, Renz 11am, Jerlyn 9am, Sharlaine 11-3/5-9, Lem 2:30, Che 4pm, Lou 4pm, Mico 4pm, Santos 5pm, Alvin 5pm	VAT-Exempted	700.0	\N	2017-05-17 11:57:29.800905	2017-05-17 11:57:29.800905
1079	92	1	276	2.0	46.80		VAT-Inclusive	93.6	\N	2017-05-17 11:58:02.688797	2017-05-17 11:58:02.688797
1080	131	8	276	1.0	130.00	Borrowed cheese sauce from Kapitolyo	VAT-Exempted	130.0	\N	2017-05-17 11:58:30.729491	2017-05-17 11:58:30.729491
1081	137	8	277	12.0	50.00	Myrtle 10am, Jerlyn 9am, Rizal 9am, Rodel 9am, Sharlaine 11-3/5-9, Che 4pm, Mico 4pm, Lou 4pm, Alvin 5pm, Santos 5pm, Renz 11am	VAT-Exempted	600.0	\N	2017-05-17 12:01:17.014226	2017-05-17 12:01:17.014226
1082	121	8	277	1.0	1139.00	500 pcs 8oz cup	VAT-Inclusive	1139.0	\N	2017-05-17 12:02:29.591584	2017-05-17 12:02:29.591584
1083	129	8	277	1.0	285.00	Chicken Wire	VAT-Inclusive	285.0	\N	2017-05-17 12:02:57.743445	2017-05-17 12:02:57.743445
1084	124	8	277	1.0	220.00	Tube Ice	VAT-Inclusive	220.0	\N	2017-05-17 12:03:26.96001	2017-05-17 12:03:26.96001
1085	130	8	277	1.0	649.75	Baskets for produce and container for bread	VAT-Inclusive	649.75	\N	2017-05-17 12:04:34.707079	2017-05-17 12:04:34.707079
1086	131	8	277	1.0	80.00	Cash and carry to S1, fare for buying 8oz paper cup	VAT-Exempted	80.0	\N	2017-05-17 12:05:18.804585	2017-05-17 12:05:18.804585
1087	131	8	277	1.0	108.00	Borrowed cheese sauce from Kapitolyo	VAT-Exempted	108.0	\N	2017-05-17 12:05:48.394967	2017-05-17 12:05:48.394967
1088	129	8	278	1.0	450.00	Chiller check up	VAT-Inclusive	450.0	\N	2017-05-17 12:08:33.731863	2017-05-17 12:08:33.731863
1089	137	8	278	14.0	50.00	Myrtle 10am, Rizal 9am, Rodel 9am, Sharlaine 9am, Renz 11am, Jerlyn 11-3/5-9, Jom 10am, Erlyn 10am, Cheryline 4pm, Lou 4pm, Mico 4pm, Alvin 5pm, Santos 5pm	VAT-Exempted	700.0	\N	2017-05-17 12:09:50.835929	2017-05-17 12:09:50.835929
1090	130	8	278	1.0	172.00	Envelope for cash deposit	VAT-Inclusive	172.0	\N	2017-05-17 12:10:28.301985	2017-05-17 12:10:28.301985
1091	123	8	278	1.0	99.50	Scissors and Order Slip	VAT-Inclusive	99.5	\N	2017-05-17 12:11:19.595398	2017-05-17 12:11:19.595398
1092	15	13	278	1.0	578.00		VAT-Inclusive	578.0	\N	2017-05-17 12:14:54.740564	2017-05-17 12:14:54.740564
1093	131	8	278	1.0	112.00	Open Market	VAT-Exempted	112.0	\N	2017-05-17 12:15:24.277427	2017-05-17 12:15:24.277427
1094	73	12	278	68.0	8.72		VAT-Inclusive	592.8	\N	2017-05-17 12:16:02.884701	2017-05-17 12:16:02.884701
1095	91	1	278	0.09	1233.33		VAT-Inclusive	111.0	\N	2017-05-17 12:16:38.324877	2017-05-17 12:16:38.324877
1096	41	12	278	21.0	8.00		VAT-Inclusive	168.0	\N	2017-05-17 12:16:52.130027	2017-05-17 12:16:52.130027
1097	37	8	278	180.0	4.33		VAT-Inclusive	778.5	\N	2017-05-17 12:17:55.661777	2017-05-17 12:17:55.661777
1098	74	12	278	70.08	6.94		VAT-Inclusive	486.3	\N	2017-05-17 12:18:52.344169	2017-05-17 12:18:52.344169
1099	51	11	278	105.6	4.05		VAT-Inclusive	427.5	\N	2017-05-17 12:19:29.539231	2017-05-17 12:19:29.539231
1100	49	6	278	3.0	198.00		VAT-Inclusive	594.0	\N	2017-05-17 12:19:46.405584	2017-05-17 12:19:46.405584
1101	75	9	278	2.0	239.25		VAT-Inclusive	478.5	\N	2017-05-17 12:21:05.555497	2017-05-17 12:21:05.555497
1102	76	4	278	48.0	17.72		VAT-Inclusive	850.8	\N	2017-05-17 12:21:31.184758	2017-05-17 12:21:31.184758
1103	48	1	278	1.2	161.75		VAT-Inclusive	194.1	\N	2017-05-17 12:21:53.630876	2017-05-17 12:21:53.630876
1104	93	1	278	1.0	55.65		VAT-Inclusive	55.65	\N	2017-05-17 12:22:22.942577	2017-05-17 12:22:22.942577
1105	62	1	278	1.0	16.25		VAT-Inclusive	16.25	\N	2017-05-17 12:22:38.203992	2017-05-17 12:22:38.203992
1106	50	1	278	2.8	140.25		VAT-Inclusive	392.7	\N	2017-05-17 12:22:57.469741	2017-05-17 12:22:57.469741
1107	6	1	279	19.91	283.36		VAT-Inclusive	5641.7	\N	2017-05-17 12:52:45.413722	2017-05-17 12:52:45.413722
1108	77	9	280	2.0	214.29		VAT-Exclusive	428.57	\N	2017-05-17 12:53:44.646681	2017-05-17 12:53:44.646681
1109	67	5	280	1.0	758.93		VAT-Exclusive	758.93	\N	2017-05-17 12:54:01.543993	2017-05-17 12:54:01.543993
1110	39	2	281	50.0	55.36		VAT-Exclusive	2767.86	\N	2017-05-17 12:55:15.266319	2017-05-17 12:55:15.266319
1111	47	2	281	70.0	46.88		VAT-Exclusive	3281.25	\N	2017-05-17 12:55:33.145412	2017-05-17 12:55:33.145412
1112	64	5	281	1.0	468.75		VAT-Exclusive	468.75	\N	2017-05-17 12:55:51.436778	2017-05-17 12:55:51.436778
1113	68	5	281	4.0	580.36		VAT-Exclusive	2321.43	\N	2017-05-17 12:56:09.675701	2017-05-17 12:56:09.675701
1114	69	6	281	16.0	196.43		VAT-Exclusive	3142.86	\N	2017-05-17 12:56:32.43735	2017-05-17 12:56:32.43735
1115	70	6	281	2.0	241.07		VAT-Exclusive	482.14	\N	2017-05-17 12:57:00.10328	2017-05-17 12:57:00.10328
1116	80	2	281	2.0	171.88		VAT-Exclusive	343.75	\N	2017-05-17 12:57:22.115266	2017-05-17 12:57:22.115266
1122	121	8	286	1.0	5630.00		VAT-Inclusive	5630.0	\N	2017-05-17 13:06:39.26256	2017-05-17 13:06:39.26256
1124	33	1	288	0.3	138.00		VAT-Exempted	41.4	\N	2017-05-17 13:12:53.496614	2017-05-17 13:12:53.496614
1127	22	1	288	0.25	48.00		VAT-Exempted	12.0	\N	2017-05-17 13:13:37.235951	2017-05-17 13:13:37.235951
1128	35	1	288	0.1	99.00		VAT-Exempted	9.9	\N	2017-05-17 13:13:52.961997	2017-05-17 13:13:52.961997
1130	36	1	288	3.0	63.00		VAT-Exempted	189.0	\N	2017-05-17 13:14:23.282451	2017-05-17 13:14:23.282451
1134	104	9	289	96.0	28.00		VAT-Inclusive	2688.0	\N	2017-05-17 13:18:59.149095	2017-05-17 13:18:59.149095
1136	123	8	292	1.0	570.10	Order Slip	VAT-Inclusive	570.1	\N	2017-05-17 13:27:00.719769	2017-05-17 13:27:00.719769
1137	9	1	293	70.94	151.00		VAT-Exempted	10711.94	\N	2017-05-17 13:28:23.115716	2017-05-17 13:28:23.115716
1138	8	1	293	17.46	179.00		VAT-Exempted	3125.34	\N	2017-05-17 13:28:51.7592	2017-05-17 13:28:51.7592
1141	30	8	294	15.0	12.80		VAT-Exempted	192.0	\N	2017-05-21 08:25:21.54981	2017-05-21 08:25:21.54981
1143	32	1	294	6.0	62.00		VAT-Exempted	372.0	\N	2017-05-21 08:29:16.041133	2017-05-21 08:29:16.041133
1150	34	1	295	2.0	78.00		VAT-Exempted	156.0	\N	2017-05-21 08:40:40.669103	2017-05-21 08:40:40.669103
1151	32	1	295	3.0	62.00		VAT-Exempted	186.0	\N	2017-05-21 08:42:35.831875	2017-05-21 08:42:35.831875
1154	31	1	295	0.32	98.00		VAT-Exempted	31.36	\N	2017-05-21 08:49:35.367857	2017-05-21 08:49:35.367857
1156	30	8	295	10.0	12.80		VAT-Exempted	128.0	\N	2017-05-21 08:58:12.281535	2017-05-21 08:58:12.281535
1159	22	1	295	0.25	46.00		VAT-Exempted	11.5	\N	2017-05-21 09:00:14.757982	2017-05-21 09:00:14.757982
1166	9	1	299	59.6	151.00		VAT-Exempted	8999.6	\N	2017-05-21 09:29:24.404473	2017-05-21 09:29:24.404473
1169	40	1	300	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-05-22 09:14:57.036101	2017-05-22 09:14:57.036101
1170	19	6	300	4.0	13.75		VAT-Inclusive	55.0	\N	2017-05-22 09:16:54.454617	2017-05-22 09:16:54.454617
1172	53	5	300	2.0	300.00		VAT-Inclusive	600.0	\N	2017-05-22 09:18:09.042944	2017-05-22 09:18:09.042944
1184	36	1	302	3.0	53.00		VAT-Exempted	159.0	\N	2017-05-22 09:44:42.408114	2017-05-22 09:44:42.408114
1188	30	8	302	15.0	10.67		VAT-Exempted	160.0	\N	2017-05-22 09:56:15.098716	2017-05-22 09:56:15.098716
1189	27	1	302	0.5	193.00		VAT-Exempted	96.5	\N	2017-05-22 09:58:34.338202	2017-05-22 09:58:34.338202
1193	64	5	303	2.0	468.75		VAT-Exclusive	937.5	\N	2017-05-22 10:11:22.773621	2017-05-22 10:11:22.773621
1194	68	5	303	1.0	580.36		VAT-Exclusive	580.36	\N	2017-05-22 10:13:27.023199	2017-05-22 10:13:27.023199
1202	131	8	304	1.0	50.00	Fare for buying 8oz from Guadalupe	VAT-Exempted	50.0	\N	2017-05-23 02:32:48.900639	2017-05-23 02:32:48.900639
1117	97	9	282	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-05-17 12:59:12.143949	2017-05-17 12:59:12.143949
1129	34	1	288	4.0	88.00		VAT-Exempted	352.0	\N	2017-05-17 13:14:08.210766	2017-05-17 13:14:08.210766
1140	27	1	294	0.5	198.00		VAT-Exempted	99.0	\N	2017-05-21 08:24:01.814161	2017-05-21 08:24:01.814161
1142	34	1	294	2.5	78.00		VAT-Exempted	195.0	\N	2017-05-21 08:28:14.979174	2017-05-21 08:28:14.979174
1144	36	1	294	4.0	63.00		VAT-Exempted	252.0	\N	2017-05-21 08:30:45.741017	2017-05-21 08:30:45.741017
1145	21	1	294	4.0	53.00		VAT-Exempted	212.0	\N	2017-05-21 08:32:29.325987	2017-05-21 08:32:29.325987
1146	23	1	294	0.1	318.00		VAT-Exempted	31.8	\N	2017-05-21 08:34:56.65589	2017-05-21 08:34:56.65589
1148	20	1	294	0.1	118.00		VAT-Exempted	11.8	\N	2017-05-21 08:36:15.267043	2017-05-21 08:36:15.267043
1160	28	1	295	0.1	268.00		VAT-Exempted	26.8	\N	2017-05-21 09:00:54.876773	2017-05-21 09:00:54.876773
1164	42	8	297	50.0	4.50		VAT-Inclusive	225.0	\N	2017-05-21 09:12:03.032088	2017-05-21 09:12:03.032088
1168	24	1	300	17.7	55.93		VAT-Inclusive	990.0	\N	2017-05-22 09:09:28.636789	2017-05-22 09:09:28.636789
1171	19	6	300	4.0	13.75		VAT-Inclusive	55.0	\N	2017-05-22 09:16:54.862226	2017-05-22 09:16:54.862226
1186	34	1	302	1.5	78.00		VAT-Exempted	117.0	\N	2017-05-22 09:48:18.896384	2017-05-22 09:48:18.896384
1203	122	8	304	1.0	78.00	Dishwashing liquid	VAT-Inclusive	78.0	\N	2017-05-23 02:33:22.82994	2017-05-23 02:33:22.82994
1205	130	8	304	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-23 02:34:19.52679	2017-05-23 02:34:19.52679
1208	122	8	305	1.0	1120.00	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-05-23 02:39:12.663969	2017-05-23 02:39:12.663969
1118	9	1	283	80.2	151.00		VAT-Exempted	12110.2	\N	2017-05-17 13:00:59.113666	2017-05-17 13:00:59.113666
1119	8	1	283	15.44	179.00		VAT-Exempted	2763.76	\N	2017-05-17 13:03:50.199853	2017-05-17 13:03:50.199853
1120	18	5	284	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-05-17 13:04:45.103392	2017-05-17 13:04:45.103392
1121	7	1	285	24.0	220.00		VAT-Exempted	5280.0	\N	2017-05-17 13:05:44.505914	2017-05-17 13:05:44.505914
1125	23	1	288	0.1	318.00		VAT-Exempted	31.8	\N	2017-05-17 13:13:05.331216	2017-05-17 13:13:05.331216
1126	21	1	288	5.0	58.00		VAT-Exempted	290.0	\N	2017-05-17 13:13:18.30125	2017-05-17 13:13:18.30125
1132	27	1	288	0.5	198.00		VAT-Exempted	99.0	\N	2017-05-17 13:16:16.507507	2017-05-17 13:16:16.507507
1135	15	13	291	7.0	530.00		VAT-Inclusive	3710.0	\N	2017-05-17 13:26:04.034277	2017-05-17 13:26:04.034277
1147	22	1	294	0.25	48.00		VAT-Exempted	12.0	\N	2017-05-21 08:35:43.167782	2017-05-21 08:35:43.167782
1155	33	1	295	0.2	168.00		VAT-Exempted	33.6	\N	2017-05-21 08:56:52.578793	2017-05-21 08:56:52.578793
1157	27	1	295	0.5	198.00		VAT-Exempted	99.0	\N	2017-05-21 08:58:42.323791	2017-05-21 08:58:42.323791
1161	2	1	296	10.0	300.00		VAT-Inclusive	3000.0	\N	2017-05-21 09:05:15.336179	2017-05-21 09:05:15.336179
1173	1	1	300	4.0	195.00		VAT-Exempted	780.0	\N	2017-05-22 09:20:45.097306	2017-05-22 09:20:45.097306
1175	12	1	300	3.5	698.40		VAT-Inclusive	2444.4	\N	2017-05-22 09:25:10.650718	2017-05-22 09:25:10.650718
1178	16	4	300	16.0	42.50		VAT-Inclusive	680.0	\N	2017-05-22 09:27:33.328582	2017-05-22 09:27:33.328582
1182	9	1	301	68.2	151.00		VAT-Exempted	10298.2	\N	2017-05-22 09:40:04.110102	2017-05-22 09:40:04.110102
1183	8	1	301	30.58	179.00		VAT-Exempted	5473.82	\N	2017-05-22 09:41:33.395487	2017-05-22 09:41:33.395487
1185	32	1	302	6.0	62.00		VAT-Exempted	372.0	\N	2017-05-22 09:46:10.585503	2017-05-22 09:46:10.585503
1187	21	1	302	5.0	49.00		VAT-Exempted	245.0	\N	2017-05-22 09:51:37.005945	2017-05-22 09:51:37.005945
1190	39	2	303	45.0	55.36		VAT-Exclusive	2491.07	\N	2017-05-22 10:05:37.603677	2017-05-22 10:05:37.603677
1195	69	6	303	8.0	196.43		VAT-Exclusive	1571.43	\N	2017-05-22 10:15:05.86301	2017-05-22 10:15:05.86301
1196	80	2	303	2.0	171.88		VAT-Exclusive	343.75	\N	2017-05-22 10:17:01.416164	2017-05-22 10:17:01.416164
1199	124	8	304	1.0	1320.00	Tube Ice	VAT-Inclusive	1320.0	\N	2017-05-23 02:31:30.162701	2017-05-23 02:31:30.162701
1200	121	8	304	950.0	1.00	8oz paper cup	VAT-Inclusive	950.0	\N	2017-05-23 02:32:00.277274	2017-05-23 02:32:00.277274
1201	130	8	304	1.0	30.00	Printing of PCF	VAT-Inclusive	30.0	\N	2017-05-23 02:32:20.956294	2017-05-23 02:32:20.956294
1123	122	8	287	1.0	1275.00		VAT-Inclusive	1275.0	\N	2017-05-17 13:07:31.887581	2017-05-17 13:07:31.887581
1131	32	1	288	4.0	62.00		VAT-Exempted	248.0	\N	2017-05-17 13:16:01.54467	2017-05-17 13:16:01.54467
1133	103	9	289	120.0	22.40		VAT-Inclusive	2688.0	\N	2017-05-17 13:18:38.501401	2017-05-17 13:18:38.501401
1139	33	1	294	0.3	168.00		VAT-Exempted	50.4	\N	2017-05-21 08:22:49.154802	2017-05-21 08:22:49.154802
1149	36	1	295	2.0	63.00		VAT-Exempted	126.0	\N	2017-05-21 08:39:14.315721	2017-05-21 08:39:14.315721
1158	21	1	295	3.0	51.00		VAT-Exempted	153.0	\N	2017-05-21 08:59:36.339888	2017-05-21 08:59:36.339888
1162	5	1	296	18.56	298.14		VAT-Inclusive	5533.48	\N	2017-05-21 09:05:58.459279	2017-05-21 09:05:58.459279
1163	43	8	297	50.0	6.60		VAT-Inclusive	330.0	\N	2017-05-21 09:11:05.467345	2017-05-21 09:11:05.467345
1165	26	1	298	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-05-21 09:20:21.660199	2017-05-21 09:20:21.660199
1167	8	1	299	35.56	179.00		VAT-Exempted	6365.24	\N	2017-05-21 09:30:30.783318	2017-05-21 09:30:30.783318
1174	95	8	300	72.0	16.94		VAT-Inclusive	1220.0	\N	2017-05-22 09:23:08.351261	2017-05-22 09:23:08.351261
1176	17	7	300	2.0	165.00		VAT-Inclusive	330.0	\N	2017-05-22 09:26:16.211294	2017-05-22 09:26:16.211294
1177	16	4	300	16.0	42.50		VAT-Inclusive	680.0	\N	2017-05-22 09:27:33.32079	2017-05-22 09:27:33.32079
1192	47	2	303	50.0	46.88		VAT-Exclusive	2343.75	\N	2017-05-22 10:09:24.140661	2017-05-22 10:09:24.140661
1197	38	6	303	8.0	111.61		VAT-Exclusive	892.85	\N	2017-05-22 10:18:30.763352	2017-05-22 10:18:30.763352
1198	137	8	304	1.0	700.00	Myrtle 10am, Jerlyn 11-3/5-9, Rodel 9am, Rizal 9am, Renz 11am, Jom 10am, Erlyn 10am, Alvin 5pm, Santos 5pm, Mico 4pm, Lou 4pm,  Sharlaine 9am, Cheryline 4pm	VAT-Exempted	700.0	\N	2017-05-23 02:31:01.892012	2017-05-23 02:31:01.892012
1204	61	1	304	50.0	40.00		VAT-Exempted	2000.0	\N	2017-05-23 02:33:45.121638	2017-05-23 02:33:45.121638
1206	130	8	305	1.0	238.00	Battery	VAT-Inclusive	238.0	\N	2017-05-23 02:37:09.861761	2017-05-23 02:37:09.861761
1207	137	8	305	1.0	700.00	Myrtle 10am, Sharlaine 9am, Jerlyn 11-3/5-9, Rizal 9am, Rodel 9am, Renz 11am, Lou 4pm, Cheryline 4pm, Mico 5pm, Alvin 5pm, Santos 5pm, Erlyn 10am, Jom 10am	VAT-Exempted	700.0	\N	2017-05-23 02:38:48.86813	2017-05-23 02:38:48.86813
1209	131	8	305	1.0	270.00	LES to S1 transfer CBT	VAT-Exempted	270.0	\N	2017-05-23 02:39:35.250113	2017-05-23 02:39:35.250113
1210	137	8	306	1.0	350.00	Renz 11am,  Sharlaine 10am, Mico 3pm, Rizal 9am, Cheryline 2pm, Erlyn 1pm, Jom 1pm	VAT-Exempted	350.0	\N	2017-05-23 02:44:18.062834	2017-05-23 02:44:18.062834
1211	122	8	306	1.0	89.00	Dishwashing liquid	VAT-Inclusive	89.0	\N	2017-05-23 02:44:38.564143	2017-05-23 02:44:38.564143
1212	121	8	306	1.0	269.55	2pc silicon spatula	VAT-Inclusive	269.55	\N	2017-05-23 02:45:01.587426	2017-05-23 02:45:01.587426
1213	122	8	307	1.0	25.00	Bleach	VAT-Inclusive	25.0	\N	2017-05-23 02:46:20.611606	2017-05-23 02:46:20.611606
1214	122	8	307	1.0	188.00	Powder detergent and dishwashing liquid	VAT-Inclusive	188.0	\N	2017-05-23 02:46:51.462332	2017-05-23 02:46:51.462332
1215	137	8	307	1.0	350.00	Myrtle 1pm, Jerlyn 3pm, Rodel 10am, Lou 11am, Jom 10am, Erlyn 1pm, Alvin 2pm	VAT-Exempted	350.0	\N	2017-05-23 02:47:48.41075	2017-05-23 02:47:48.41075
1216	33	1	308	0.17	308.00		VAT-Exempted	52.36	\N	2017-05-23 02:49:17.300127	2017-05-23 02:49:17.300127
1217	137	8	308	1.0	600.00	Sharlaine 11-3/5-9, Jerlyn 9am, Rodel 9am, Renz 9am, Mico 11am, Jom 10am, Myrtle 10am, Lou 4pm, Cheryline 4pm, Alvin 5pm, Santos 5pm	VAT-Exempted	600.0	\N	2017-05-23 02:51:25.91424	2017-05-23 02:51:25.91424
1218	137	8	308	1.0	155.00	Medicines for first aid kit	VAT-Inclusive	155.0	\N	2017-05-23 02:52:19.897684	2017-05-23 02:52:19.897684
1219	129	8	308	1.0	35.00	Hose Lock	VAT-Inclusive	35.0	\N	2017-05-23 02:52:44.579902	2017-05-23 02:52:44.579902
1220	124	8	308	1.0	1140.00	Tube Ice	VAT-Inclusive	1140.0	\N	2017-05-23 02:53:08.400999	2017-05-23 02:53:08.400999
1221	123	8	308	1.0	2200.00	Journal roll and Ribbon	VAT-Inclusive	2200.0	\N	2017-05-23 02:53:41.485026	2017-05-23 02:53:41.485026
1222	131	8	308	1.0	100.00	Transmittal	VAT-Exempted	100.0	\N	2017-05-23 02:54:05.156893	2017-05-23 02:54:05.156893
1223	5	1	309	9.12	298.14		VAT-Inclusive	2719.04	\N	2017-05-23 10:57:12.473201	2017-05-23 10:57:12.473201
1224	6	1	309	10.0	283.36		VAT-Inclusive	2833.6	\N	2017-05-23 10:58:19.192282	2017-05-23 10:58:19.192282
1225	56	1	310	125.0	93.00		VAT-Inclusive	11624.99	\N	2017-05-23 11:02:15.996353	2017-05-23 11:02:15.996353
1226	36	1	311	3.0	53.00		VAT-Exempted	159.0	\N	2017-05-23 11:10:00.023326	2017-05-23 11:10:00.023326
1227	34	1	311	3.0	78.00		VAT-Exempted	234.0	\N	2017-05-23 11:10:54.480514	2017-05-23 11:10:54.480514
1228	32	1	311	3.0	62.00		VAT-Exempted	186.0	\N	2017-05-23 11:11:29.458668	2017-05-23 11:11:29.458668
1229	33	1	311	0.3	168.00		VAT-Exempted	50.4	\N	2017-05-23 11:12:22.464264	2017-05-23 11:12:22.464264
1230	27	1	311	0.5	198.00		VAT-Exempted	99.0	\N	2017-05-23 11:12:58.641834	2017-05-23 11:12:58.641834
1231	20	1	311	0.2	118.00		VAT-Exempted	23.6	\N	2017-05-23 11:13:39.311769	2017-05-23 11:13:39.311769
1232	31	1	311	0.45	98.00		VAT-Exempted	44.1	\N	2017-05-23 11:14:24.017787	2017-05-23 11:14:24.017787
1233	137	8	312	1.0	500.00	Myrtle 10am, Jerlyn 9am, Sharlaine 11-3/5-9, Lou 4pm, Jerlyn 4pm, Rodel 9am, Renz 9am, Mico 4pm, Santos 4pm	VAT-Exempted	500.0	\N	2017-05-24 08:01:13.194024	2017-05-24 08:01:13.194024
1234	123	8	312	1.0	47.00	Record book	VAT-Inclusive	47.0	\N	2017-05-24 08:01:46.631595	2017-05-24 08:01:46.631595
1235	137	8	313	1.0	500.00	Sharlaine 9am, Myrtle 10am, Lou 4pm, Jerlyn 11-3/5-9, Rodel 9am, Renz 9am, Mico 5pm, Santos 5pm	VAT-Exempted	500.0	\N	2017-05-24 08:06:11.390419	2017-05-24 08:06:11.390419
1236	122	8	313	1.0	130.00	Stick broom	VAT-Inclusive	130.0	\N	2017-05-24 08:06:29.88996	2017-05-24 08:06:29.88996
1237	122	8	313	1.0	168.30	Trash liner	VAT-Inclusive	168.3	\N	2017-05-24 08:07:02.599296	2017-05-24 08:07:02.599296
1238	124	8	313	1.0	840.00	Tube Ice	VAT-Inclusive	840.0	\N	2017-05-24 08:08:25.857951	2017-05-24 08:08:25.857951
1239	97	9	314	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-05-24 10:20:02.680305	2017-05-24 10:20:02.680305
1240	121	8	315	1.0	1800.00		VAT-Exclusive	1800.0	\N	2017-05-24 10:21:26.680324	2017-05-24 10:21:26.680324
1241	122	8	316	1.0	1210.00		VAT-Inclusive	1210.0	\N	2017-05-24 10:24:13.082541	2017-05-24 10:24:13.082541
1242	121	8	317	1.0	4364.00		VAT-Inclusive	4364.0	\N	2017-05-24 10:25:41.407695	2017-05-24 10:25:41.407695
1243	99	7	318	168.0	17.41		VAT-Exclusive	2924.99	\N	2017-05-24 10:29:25.123604	2017-05-24 10:29:25.123604
1244	5	1	319	19.01	298.14		VAT-Inclusive	5667.64	\N	2017-05-24 10:42:21.645814	2017-05-24 10:42:21.645814
1245	36	1	320	3.0	50.00		VAT-Exempted	150.0	\N	2017-05-24 10:44:51.628319	2017-05-24 10:44:51.628319
1246	32	1	320	6.0	60.00		VAT-Exempted	360.0	\N	2017-05-24 10:45:05.553503	2017-05-24 10:45:05.553503
1247	21	1	320	5.0	50.00		VAT-Exempted	250.0	\N	2017-05-24 10:45:18.78551	2017-05-24 10:45:18.78551
1248	30	8	320	15.0	20.00		VAT-Exempted	300.0	\N	2017-05-24 10:45:32.480201	2017-05-24 10:45:32.480201
1249	35	1	320	0.1	120.00		VAT-Exempted	12.0	\N	2017-05-24 10:45:47.956282	2017-05-24 10:45:47.956282
1250	22	1	320	0.25	65.00		VAT-Exempted	16.25	\N	2017-05-24 10:46:04.465498	2017-05-24 10:46:04.465498
1251	61	1	320	50.0	44.00		VAT-Exempted	2200.0	\N	2017-05-24 10:46:18.490225	2017-05-24 10:46:18.490225
1252	134	8	321	1.0	325.00	Dads Day Coupon	VAT-Inclusive	325.0	\N	2017-05-24 10:50:06.703673	2017-05-24 10:50:06.703673
1253	121	8	322	1.0	500.00	Mop handle	VAT-Inclusive	500.0	\N	2017-05-24 10:51:15.026692	2017-05-24 10:51:15.026692
1254	9	1	323	70.28	151.00		VAT-Exempted	10612.28	\N	2017-05-24 10:52:46.257991	2017-05-24 10:52:46.257991
1255	8	1	323	30.72	179.00		VAT-Exempted	5498.88	\N	2017-05-24 10:54:03.94214	2017-05-24 10:54:03.94214
1256	21	1	324	3.0	50.00		VAT-Exempted	150.0	\N	2017-05-27 07:18:20.132582	2017-05-27 07:18:20.132582
1257	33	1	324	0.3	180.00		VAT-Exempted	54.0	\N	2017-05-27 07:19:46.484898	2017-05-27 07:19:46.484898
1258	34	1	324	1.0	110.00		VAT-Exempted	110.0	\N	2017-05-27 07:21:44.682357	2017-05-27 07:21:44.682357
1259	36	1	324	2.0	50.00		VAT-Exempted	100.0	\N	2017-05-27 07:23:19.934456	2017-05-27 07:23:19.934456
1262	18	5	326	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-05-27 07:40:07.071938	2017-05-27 07:40:07.071938
1271	27	1	329	0.5	200.00		VAT-Exempted	100.0	\N	2017-05-27 08:11:29.417489	2017-05-27 08:11:29.417489
1273	9	1	330	16.06	151.00		VAT-Exempted	2425.06	\N	2017-05-27 08:25:31.267918	2017-05-27 08:25:31.267918
1278	131	8	333	1.0	120.00	Fare for Buying Ketchup	VAT-Inclusive	120.0	\N	2017-05-27 11:17:49.081645	2017-05-27 11:17:49.081645
1281	51	11	333	31.68	4.05		VAT-Inclusive	128.25	\N	2017-05-27 11:21:05.063058	2017-05-27 11:21:05.063058
1283	37	8	333	60.0	5.28		VAT-Inclusive	316.75	\N	2017-05-27 11:23:49.197619	2017-05-27 11:23:49.197619
1285	51	11	333	52.8	4.17		VAT-Inclusive	220.0	\N	2017-05-27 11:27:15.772472	2017-05-27 11:27:15.772472
1287	122	8	333	1.0	216.00	Glade Autospray	VAT-Inclusive	216.0	\N	2017-05-27 11:28:55.319214	2017-05-27 11:28:55.319214
1288	130	8	333	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-27 11:29:37.27961	2017-05-27 11:29:37.27961
1290	131	8	333	1.0	88.00	Landmark to S1 for open Market	VAT-Inclusive	88.0	\N	2017-05-27 11:31:04.937794	2017-05-27 11:31:04.937794
1293	93	1	333	2.0	55.65		VAT-Inclusive	111.3	\N	2017-05-27 11:37:30.075827	2017-05-27 11:37:30.075827
1298	72	6	333	1.0	36.75		VAT-Inclusive	36.75	\N	2017-05-27 11:44:25.000543	2017-05-27 11:44:25.000543
1299	49	6	333	3.0	198.00		VAT-Inclusive	594.0	\N	2017-05-27 11:45:07.50929	2017-05-27 11:45:07.50929
1304	23	1	333	0.07	514.29		VAT-Exempted	36.0	\N	2017-05-27 11:55:28.000207	2017-05-27 11:55:28.000207
1311	104	9	336	72.0	28.00		VAT-Inclusive	2016.0	\N	2017-05-28 04:19:17.266699	2017-05-28 04:19:17.266699
1324	123	8	339	1.0	25.00		VAT-Inclusive	25.0	\N	2017-05-28 04:52:18.359106	2017-05-28 04:52:18.359106
1325	123	8	339	1.0	35.00		VAT-Inclusive	35.0	\N	2017-05-28 04:52:53.036287	2017-05-28 04:52:53.036287
1326	123	8	339	1.0	15.00		VAT-Inclusive	15.0	\N	2017-05-28 04:53:21.467971	2017-05-28 04:53:21.467971
1327	121	8	340	1.0	4448.00		VAT-Inclusive	4448.0	\N	2017-05-28 04:58:20.675344	2017-05-28 04:58:20.675344
1329	36	1	341	2.0	53.00		VAT-Exempted	106.0	\N	2017-05-28 08:29:47.376771	2017-05-28 08:29:47.376771
1330	21	1	341	3.0	45.00		VAT-Exempted	135.0	\N	2017-05-28 08:30:04.413312	2017-05-28 08:30:04.413312
1332	32	1	341	4.0	62.00		VAT-Exempted	248.0	\N	2017-05-28 08:33:22.531405	2017-05-28 08:33:22.531405
1333	33	1	341	0.2	168.00		VAT-Exempted	33.6	\N	2017-05-28 08:33:37.618577	2017-05-28 08:33:37.618577
1335	137	8	342	7.0	50.00	Alvin 10am,  Cherilou 3pm, Erlyn 2pm,  Miko 2pm, Jerlyn 10am, Jom 10am, Myrtle 1pm	VAT-Exempted	350.0	\N	2017-05-31 11:40:18.954159	2017-05-31 11:40:18.954159
1337	137	8	343	13.0	50.00	Myrtle 10am, Sharlaine 9am, Lou 11-3/5-9, Jerlyn 4pm, Cherilyn 4pm, Jom 10am, Erlyn 10am, Rodel 9am, Renz 9am, Mico 11am, Santos 5pm, Alvin 5pm	VAT-Exempted	650.0	\N	2017-05-31 11:42:48.983039	2017-05-31 11:42:48.983039
1338	130	8	343	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-05-31 11:43:11.053917	2017-05-31 11:43:11.053917
1344	76	4	343	16.0	17.73		VAT-Inclusive	283.6	\N	2017-05-31 11:45:39.424003	2017-05-31 11:45:39.424003
1360	1	1	347	4.0	195.00		VAT-Inclusive	780.0	\N	2017-05-31 12:23:41.200982	2017-05-31 12:23:41.200982
1260	9	1	325	30.0	151.00		VAT-Exempted	4530.0	\N	2017-05-27 07:31:36.349652	2017-05-27 07:31:36.349652
1263	94	1	328	16.0	107.73		VAT-Exclusive	1723.66	\N	2017-05-27 07:52:15.531832	2017-05-27 07:52:15.531832
1268	22	1	329	0.25	65.00		VAT-Exempted	16.25	\N	2017-05-27 08:06:06.237539	2017-05-27 08:06:06.237539
1270	33	1	329	0.2	180.00		VAT-Exempted	36.0	\N	2017-05-27 08:10:05.487244	2017-05-27 08:10:05.487244
1276	131	8	333	1.0	95.00	S1 to One Asia for PCF transmittal	VAT-Inclusive	95.0	\N	2017-05-27 11:16:04.417702	2017-05-27 11:16:04.417702
1279	130	8	333	1.0	30.00	Print of PCF	VAT-Inclusive	30.0	\N	2017-05-27 11:18:29.118174	2017-05-27 11:18:29.118174
1286	99	7	333	6.0	22.25	Mirinda	VAT-Inclusive	133.5	\N	2017-05-27 11:28:19.27936	2017-05-27 11:28:19.27936
1294	92	1	333	2.0	47.25		VAT-Inclusive	94.5	\N	2017-05-27 11:38:47.928481	2017-05-27 11:38:47.928481
1295	37	8	333	120.0	4.33		VAT-Inclusive	519.0	\N	2017-05-27 11:40:02.001217	2017-05-27 11:40:02.001217
1296	74	12	333	84.48	5.76		VAT-Inclusive	486.3	\N	2017-05-27 11:42:24.478746	2017-05-27 11:42:24.478746
1302	121	8	333	2.0	19.75	Sponge	VAT-Inclusive	39.5	\N	2017-05-27 11:48:21.537754	2017-05-27 11:48:21.537754
1312	103	9	336	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-05-28 04:20:05.170969	2017-05-28 04:20:05.170969
1320	122	8	339	2.0	35.00		VAT-Inclusive	70.0	\N	2017-05-28 04:48:57.327041	2017-05-28 04:48:57.327041
1322	122	8	339	3.0	18.00		VAT-Inclusive	54.0	\N	2017-05-28 04:50:41.546647	2017-05-28 04:50:41.546647
1323	122	8	339	1.0	60.00		VAT-Inclusive	60.0	\N	2017-05-28 04:51:31.912059	2017-05-28 04:51:31.912059
1334	35	1	341	0.1	139.00		VAT-Exempted	13.9	\N	2017-05-28 08:33:55.975318	2017-05-28 08:33:55.975318
1346	37	8	343	60.0	4.33		VAT-Inclusive	259.5	\N	2017-05-31 11:46:26.554223	2017-05-31 11:46:26.554223
1347	41	12	343	42.0	8.00		VAT-Inclusive	336.0	\N	2017-05-31 11:46:53.063247	2017-05-31 11:46:53.063247
1350	51	1	343	6.0	142.50		VAT-Inclusive	855.0	\N	2017-05-31 11:48:34.920427	2017-05-31 11:48:34.920427
1353	137	8	344	1.0	550.00	Myrtle 10am, Sharlaine 9am, Lou 11-3/5-9, Jerlyn 4pm, Cherilyn 4pm, Rodel 9am, Renz 9am, Mico 11am, Santos 5pm, Alvin 5pm	VAT-Exempted	550.0	\N	2017-05-31 11:51:35.549801	2017-05-31 11:51:35.549801
1261	8	1	325	15.2	179.00		VAT-Exempted	2720.8	\N	2017-05-27 07:33:25.634193	2017-05-27 07:33:25.634193
1264	21	1	329	6.0	50.00		VAT-Exempted	300.0	\N	2017-05-27 07:59:09.968318	2017-05-27 07:59:09.968318
1266	34	1	329	2.0	110.00		VAT-Exempted	220.0	\N	2017-05-27 08:03:24.772298	2017-05-27 08:03:24.772298
1272	61	1	329	25.0	44.00		VAT-Exempted	1100.0	\N	2017-05-27 08:13:17.02726	2017-05-27 08:13:17.02726
1277	131	8	333	1.0	60.00	G5 to S1 Borrowed 520 lids	VAT-Inclusive	60.0	\N	2017-05-27 11:17:00.888191	2017-05-27 11:17:00.888191
1282	92	1	333	1.0	51.95		VAT-Inclusive	51.95	\N	2017-05-27 11:22:21.12489	2017-05-27 11:22:21.12489
1284	76	4	333	32.0	18.56		VAT-Inclusive	594.0	\N	2017-05-27 11:26:33.26435	2017-05-27 11:26:33.26435
1289	137	8	333	14.0	50.00		VAT-Exempted	700.0	\N	2017-05-27 11:30:23.175504	2017-05-27 11:30:23.175504
1291	76	4	333	32.0	17.73		VAT-Inclusive	567.2	\N	2017-05-27 11:36:15.554502	2017-05-27 11:36:15.554502
1297	73	12	333	55.68	10.65		VAT-Inclusive	592.8	\N	2017-05-27 11:43:37.927485	2017-05-27 11:43:37.927485
1305	55	12	333	14.0	18.63		VAT-Inclusive	260.8	\N	2017-05-27 12:01:12.045792	2017-05-27 12:01:12.045792
1308	121	8	334	1.0	168.30	Trash Liner	VAT-Inclusive	168.3	\N	2017-05-27 12:06:03.475762	2017-05-27 12:06:03.475762
1309	124	8	334	4.0	125.00		VAT-Inclusive	500.0	\N	2017-05-27 12:09:03.921019	2017-05-27 12:09:03.921019
1319	122	8	339	1.0	125.00		VAT-Inclusive	125.0	\N	2017-05-28 04:48:23.579343	2017-05-28 04:48:23.579343
1321	122	8	339	7.0	88.00		VAT-Inclusive	616.0	\N	2017-05-28 04:50:03.814309	2017-05-28 04:50:03.814309
1331	22	1	341	0.25	48.00		VAT-Exempted	12.0	\N	2017-05-28 08:32:06.285175	2017-05-28 08:32:06.285175
1339	131	8	343	1.0	92.00	Open Market	VAT-Exempted	92.0	\N	2017-05-31 11:43:31.493895	2017-05-31 11:43:31.493895
1340	130	8	343	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-05-31 11:43:48.001732	2017-05-31 11:43:48.001732
1341	129	8	343	1.0	345.00	Flourescent for kitchen	VAT-Inclusive	345.0	\N	2017-05-31 11:44:14.711769	2017-05-31 11:44:14.711769
1342	33	1	343	0.17	288.24		VAT-Exempted	49.0	\N	2017-05-31 11:44:31.974896	2017-05-31 11:44:31.974896
1343	130	8	343	1.0	459.50	Butane	VAT-Inclusive	459.5	\N	2017-05-31 11:44:54.45052	2017-05-31 11:44:54.45052
1345	92	1	343	1.0	47.25		VAT-Exempted	47.25	\N	2017-05-31 11:45:55.082466	2017-05-31 11:45:55.082466
1348	96	4	343	4.0	17.53		VAT-Inclusive	70.1	\N	2017-05-31 11:47:39.350098	2017-05-31 11:47:39.350098
1351	75	9	343	4.0	239.25		VAT-Inclusive	957.0	\N	2017-05-31 11:49:35.847021	2017-05-31 11:49:35.847021
1352	122	8	343	1.0	1932.00	Mop Bucket	VAT-Inclusive	1932.0	\N	2017-05-31 11:49:58.671075	2017-05-31 11:49:58.671075
1357	9	1	346	20.2	151.00		VAT-Exempted	3050.2	\N	2017-05-31 12:14:31.997733	2017-05-31 12:14:31.997733
1358	24	1	347	17.7	55.93		VAT-Inclusive	990.0	\N	2017-05-31 12:21:53.452566	2017-05-31 12:21:53.452566
1361	95	8	347	96.0	16.94		VAT-Inclusive	1626.66	\N	2017-05-31 12:26:51.658168	2017-05-31 12:26:51.658168
1265	20	1	329	0.1	180.00		VAT-Exempted	18.0	\N	2017-05-27 08:01:42.748149	2017-05-27 08:01:42.748149
1267	32	1	329	3.0	60.00		VAT-Exempted	180.0	\N	2017-05-27 08:04:34.415172	2017-05-27 08:04:34.415172
1269	30	8	329	15.0	20.00		VAT-Exempted	300.0	\N	2017-05-27 08:08:36.496291	2017-05-27 08:08:36.496291
1274	8	1	330	20.56	179.00		VAT-Exempted	3680.24	\N	2017-05-27 08:27:21.916661	2017-05-27 08:27:21.916661
1275	5	1	332	31.21	298.14		VAT-Inclusive	9304.95	\N	2017-05-27 08:34:18.094389	2017-05-27 08:34:18.094389
1280	121	8	333	1.0	168.30	Trashliner	VAT-Inclusive	168.3	\N	2017-05-27 11:19:30.515727	2017-05-27 11:19:30.515727
1306	58	1	333	1.0	359.00		VAT-Inclusive	359.0	\N	2017-05-27 12:02:04.422812	2017-05-27 12:02:04.422812
1307	137	8	334	14.0	50.00		VAT-Exempted	700.0	\N	2017-05-27 12:05:11.840899	2017-05-27 12:05:11.840899
1310	137	8	335	7.0	50.00	Che,  Rodel, Renz, Santos, Sharlaine, Jom, Erlyn	VAT-Exempted	350.0	\N	2017-05-27 12:14:20.361211	2017-05-27 12:14:20.361211
1328	34	1	341	2.0	83.00		VAT-Exempted	166.0	\N	2017-05-28 08:29:28.554276	2017-05-28 08:29:28.554276
1336	124	8	343	1.0	1060.00	Tube Ice	VAT-Inclusive	1060.0	\N	2017-05-31 11:41:17.207574	2017-05-31 11:41:17.207574
1349	71	12	343	14.08	15.31		VAT-Inclusive	215.6	\N	2017-05-31 11:48:11.298834	2017-05-31 11:48:11.298834
1354	130	8	345	1.0	120.00	Printing of inventory sheet	VAT-Inclusive	120.0	\N	2017-05-31 11:53:17.810277	2017-05-31 11:53:17.810277
1355	137	8	345	1.0	700.00	Myrtle 10am, Lou 9am, Sharlaine 11-3/5-9, Jerlyn 4pm, Cherilyn 4pm, Rodel 9am, Renz 9am, Mico 11-3/5-9, Santos 5pm, Alvin 5pm, Jom 10am, Erlyn 10am	VAT-Exempted	700.0	\N	2017-05-31 11:54:43.097094	2017-05-31 11:54:43.097094
1356	122	8	345	1.0	198.00	Dishwashing liquid and powder detergent	VAT-Inclusive	198.0	\N	2017-05-31 11:55:20.081619	2017-05-31 11:55:20.081619
1359	19	6	347	4.0	55.00		VAT-Inclusive	220.0	\N	2017-05-31 12:22:48.648454	2017-05-31 12:22:48.648454
1362	13	1	347	1.0	600.00		VAT-Inclusive	600.0	\N	2017-05-31 12:27:49.448749	2017-05-31 12:27:49.448749
1363	16	4	347	20.0	42.50		VAT-Inclusive	850.0	\N	2017-05-31 12:28:50.991142	2017-05-31 12:28:50.991142
1364	26	1	348	12.27	283.97		VAT-Inclusive	3484.34	\N	2017-05-31 12:35:13.997207	2017-05-31 12:35:13.997207
1365	36	1	349	3.0	45.00		VAT-Exempted	135.0	\N	2017-05-31 12:39:27.076539	2017-05-31 12:39:27.076539
1366	34	1	349	2.0	120.00		VAT-Exempted	240.0	\N	2017-05-31 12:40:32.322634	2017-05-31 12:40:32.322634
1367	32	1	349	3.0	60.00		VAT-Exempted	180.0	\N	2017-05-31 12:41:38.726417	2017-05-31 12:41:38.726417
1368	33	1	349	0.3	240.00		VAT-Exempted	72.0	\N	2017-05-31 12:42:29.110134	2017-05-31 12:42:29.110134
1369	22	1	349	0.5	55.00		VAT-Exempted	27.5	\N	2017-05-31 12:43:33.808108	2017-05-31 12:43:33.808108
1370	30	8	349	20.0	15.00		VAT-Exempted	300.0	\N	2017-05-31 12:44:18.366631	2017-05-31 12:44:18.366631
1371	20	1	349	0.1	180.00		VAT-Exempted	18.0	\N	2017-05-31 12:45:51.377026	2017-05-31 12:45:51.377026
1372	27	1	349	0.5	190.00		VAT-Exempted	95.0	\N	2017-05-31 12:46:43.396825	2017-05-31 12:46:43.396825
1373	27	1	349	0.5	190.00		VAT-Exempted	95.0	\N	2017-05-31 12:46:43.495533	2017-05-31 12:46:43.495533
1374	61	1	349	25.0	44.00		VAT-Exempted	1100.0	\N	2017-05-31 12:47:36.836121	2017-05-31 12:47:36.836121
1375	21	1	349	4.0	45.00		VAT-Exempted	180.0	\N	2017-05-31 12:49:00.412397	2017-05-31 12:49:00.412397
1376	39	2	350	50.0	55.36		VAT-Exclusive	2767.86	\N	2017-05-31 12:54:10.769021	2017-05-31 12:54:10.769021
1377	46	2	350	8.0	165.18		VAT-Exclusive	1321.43	\N	2017-05-31 12:55:55.586425	2017-05-31 12:55:55.586425
1378	47	2	350	60.0	46.88		VAT-Exclusive	2812.5	\N	2017-05-31 12:57:24.266095	2017-05-31 12:57:24.266095
1379	64	5	350	1.0	468.75		VAT-Exclusive	468.75	\N	2017-05-31 12:58:56.883116	2017-05-31 12:58:56.883116
1380	68	5	350	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-05-31 13:00:18.768852	2017-05-31 13:00:18.768852
1381	66	6	350	1.0	848.21		VAT-Exclusive	848.21	\N	2017-05-31 13:01:22.562451	2017-05-31 13:01:22.562451
1382	69	6	350	4.0	196.43		VAT-Exclusive	785.71	\N	2017-05-31 13:02:40.17904	2017-05-31 13:02:40.17904
1383	70	6	350	2.0	241.07		VAT-Exclusive	482.14	\N	2017-05-31 13:03:47.600755	2017-05-31 13:03:47.600755
1384	80	2	350	2.0	171.88		VAT-Exclusive	343.75	\N	2017-05-31 13:05:45.769628	2017-05-31 13:05:45.769628
1385	38	6	350	4.0	111.61		VAT-Exclusive	446.44	\N	2017-05-31 13:07:41.82146	2017-05-31 13:07:41.82146
1388	42	8	351	20.0	4.50		VAT-Inclusive	90.0	\N	2017-05-31 13:14:27.981282	2017-05-31 13:14:27.981282
1390	44	8	351	50.0	4.60		VAT-Inclusive	230.0	\N	2017-05-31 13:17:10.086465	2017-05-31 13:17:10.086465
1391	43	8	351	20.0	6.60		VAT-Inclusive	132.0	\N	2017-05-31 13:18:23.967815	2017-05-31 13:18:23.967815
1392	9	1	352	30.7	151.00		VAT-Exempted	4635.7	\N	2017-05-31 13:21:49.162487	2017-05-31 13:21:49.162487
1393	36	1	353	2.0	45.00		VAT-Exempted	90.0	\N	2017-05-31 13:27:12.41218	2017-05-31 13:27:12.41218
1394	32	1	353	6.0	60.00		VAT-Exempted	360.0	\N	2017-05-31 13:28:31.529104	2017-05-31 13:28:31.529104
1395	34	1	353	2.0	120.00		VAT-Exempted	240.0	\N	2017-05-31 13:29:26.658123	2017-05-31 13:29:26.658123
1396	31	1	353	0.5	120.00		VAT-Exempted	60.0	\N	2017-05-31 13:30:37.241071	2017-05-31 13:30:37.241071
1398	33	1	353	0.2	240.00		VAT-Exempted	48.0	\N	2017-05-31 13:32:55.22249	2017-05-31 13:32:55.22249
1399	21	1	353	4.0	45.00		VAT-Exempted	180.0	\N	2017-05-31 13:33:48.194098	2017-05-31 13:33:48.194098
1400	23	1	353	0.1	550.00		VAT-Exempted	55.0	\N	2017-05-31 13:34:26.279317	2017-05-31 13:34:26.279317
1401	22	1	353	0.5	55.00		VAT-Exempted	27.5	\N	2017-05-31 13:35:27.405812	2017-05-31 13:35:27.405812
1402	121	8	354	1.0	850.00	Buffalos Greaseproof Liner	VAT-Exclusive	850.0	\N	2017-05-31 19:37:01.753244	2017-05-31 19:37:01.753244
1403	97	9	355	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-05-31 19:39:22.403935	2017-05-31 19:39:22.403935
1404	123	8	356	1.0	1950.00	June Log books	VAT-Inclusive	1950.0	\N	2017-05-31 19:41:37.16315	2017-05-31 19:41:37.16315
1405	134	8	357	1.0	530.00	Champion Dad Poster	VAT-Inclusive	530.0	\N	2017-05-31 19:43:07.205033	2017-05-31 19:43:07.205033
1406	131	8	345	1.0	80.00	Fare for buying paper cups and butters	VAT-Exempted	80.0	\N	2017-06-01 02:38:08.421251	2017-06-01 02:38:08.421251
1407	121	8	345	1.0	862.50	500 pcs paper cup	VAT-Inclusive	862.5	\N	2017-06-01 02:38:30.066072	2017-06-01 02:38:30.066072
1408	10	1	345	2.92	165.39		VAT-Inclusive	482.95	\N	2017-06-01 02:39:02.805657	2017-06-01 02:39:02.805657
1409	11	1	345	2.6	289.50		VAT-Inclusive	752.7	\N	2017-06-01 02:39:24.072084	2017-06-01 02:39:24.072084
1410	18	5	358	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-06-03 09:06:19.674146	2017-06-03 09:06:19.674146
1411	44	8	359	75.0	4.72		VAT-Inclusive	354.0	\N	2017-06-03 09:10:58.955435	2017-06-03 09:10:58.955435
1412	33	1	360	0.3	240.00		VAT-Exempted	72.0	\N	2017-06-03 09:14:33.135167	2017-06-03 09:14:33.135167
1413	32	1	360	4.0	60.00		VAT-Exempted	240.0	\N	2017-06-03 09:15:57.027231	2017-06-03 09:15:57.027231
1414	21	1	360	4.0	45.00		VAT-Exempted	180.0	\N	2017-06-03 09:17:22.340327	2017-06-03 09:17:22.340327
1415	27	1	360	0.5	190.00		VAT-Exempted	95.0	\N	2017-06-03 09:18:35.431958	2017-06-03 09:18:35.431958
1416	20	1	360	0.1	180.00		VAT-Exempted	18.0	\N	2017-06-03 09:20:42.481159	2017-06-03 09:20:42.481159
1417	30	8	360	20.0	10.00		VAT-Exempted	200.0	\N	2017-06-03 09:22:11.535871	2017-06-03 09:22:11.535871
1418	34	1	360	3.0	120.00		VAT-Exempted	360.0	\N	2017-06-03 09:23:26.0039	2017-06-03 09:23:26.0039
1419	61	1	360	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-03 09:25:34.765215	2017-06-03 09:25:34.765215
1420	94	1	361	14.85	130.00		VAT-Inclusive	1930.5	\N	2017-06-03 09:29:42.043865	2017-06-03 09:29:42.043865
1421	26	1	362	12.27	284.00		VAT-Inclusive	3484.68	\N	2017-06-03 09:34:02.46521	2017-06-03 09:34:02.46521
1422	9	1	363	4.8	151.00		VAT-Exempted	724.8	\N	2017-06-03 09:38:39.14106	2017-06-03 09:38:39.14106
1423	5	1	364	9.59	298.14		VAT-Inclusive	2859.16	\N	2017-06-03 09:43:38.875632	2017-06-03 09:43:38.875632
1425	37	8	365	180.0	3.86		VAT-Exclusive	695.1	\N	2017-06-03 09:47:45.658826	2017-06-03 09:47:45.658826
1426	83	1	365	0.5	639.14		VAT-Exclusive	319.57	\N	2017-06-03 09:50:06.258061	2017-06-03 09:50:06.258061
1440	5	1	369	20.33	298.14		VAT-Inclusive	6061.19	\N	2017-06-03 10:21:13.038009	2017-06-03 10:21:13.038009
1441	40	1	370	19.2	112.50		VAT-Inclusive	2160.0	\N	2017-06-03 10:24:54.756225	2017-06-03 10:24:54.756225
1442	57	6	370	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-06-03 10:26:36.768394	2017-06-03 10:26:36.768394
1447	13	1	370	1.0	600.00		VAT-Inclusive	600.0	\N	2017-06-03 10:34:40.640614	2017-06-03 10:34:40.640614
1452	124	8	371	11.0	120.00		VAT-Inclusive	1320.0	\N	2017-06-03 11:08:22.582772	2017-06-03 11:08:22.582772
1454	130	8	371	1.0	25.00	Print of PCF	VAT-Inclusive	25.0	\N	2017-06-03 11:11:46.835629	2017-06-03 11:11:46.835629
1460	137	8	372	14.0	50.00		VAT-Exempted	700.0	\N	2017-06-03 11:20:54.217544	2017-06-03 11:20:54.217544
1464	131	8	372	1.0	100.00	Landmark to S1 Market Soda	VAT-Inclusive	100.0	\N	2017-06-03 11:25:04.964368	2017-06-03 11:25:04.964368
1468	121	8	372	1.0	570.00	260cc and 520 Lids	VAT-Inclusive	570.0	\N	2017-06-03 11:28:45.520574	2017-06-03 11:28:45.520574
1472	137	8	373	7.0	50.00		VAT-Exempted	350.0	\N	2017-06-03 15:44:02.980618	2017-06-03 15:44:02.980618
1473	131	8	373	1.0	92.00	Landmark to S1 for Open Market	VAT-Inclusive	92.0	\N	2017-06-03 15:44:42.674932	2017-06-03 15:44:42.674932
1474	49	6	373	4.0	222.00		VAT-Inclusive	888.0	\N	2017-06-03 15:46:32.577713	2017-06-03 15:46:32.577713
1475	48	1	373	1.0	149.75		VAT-Inclusive	149.75	\N	2017-06-03 15:50:58.251303	2017-06-03 15:50:58.251303
1478	92	1	373	2.0	47.25		VAT-Inclusive	94.5	\N	2017-06-03 15:55:56.095157	2017-06-03 15:55:56.095157
1480	74	12	373	28.8	8.97		VAT-Inclusive	258.3	\N	2017-06-03 16:00:34.475648	2017-06-03 16:00:34.475648
1481	10	1	373	2.25	165.11		VAT-Inclusive	371.5	\N	2017-06-03 16:01:29.300531	2017-06-03 16:01:29.300531
1483	73	12	373	41.76	10.65		VAT-Inclusive	444.6	\N	2017-06-03 16:03:42.079775	2017-06-03 16:03:42.079775
1485	59	1	373	0.12	363.75		VAT-Inclusive	43.65	\N	2017-06-03 16:07:21.04148	2017-06-03 16:07:21.04148
1486	93	1	373	1.0	55.65		VAT-Inclusive	55.65	\N	2017-06-03 16:11:55.276207	2017-06-03 16:11:55.276207
1488	104	9	375	48.0	28.00		VAT-Inclusive	1344.0	\N	2017-06-04 10:59:22.528492	2017-06-04 10:59:22.528492
1489	103	9	375	120.0	30.63		VAT-Inclusive	3675.0	\N	2017-06-04 11:00:07.202384	2017-06-04 11:00:07.202384
1503	23	1	378	0.1	418.00		VAT-Exempted	41.8	\N	2017-06-04 11:24:29.102932	2017-06-04 11:24:29.102932
1508	34	1	380	2.0	93.00		VAT-Exempted	186.0	\N	2017-06-06 09:44:33.975027	2017-06-06 09:44:33.975027
1510	22	1	380	0.25	48.00		VAT-Exempted	12.0	\N	2017-06-06 09:45:23.781508	2017-06-06 09:45:23.781508
1515	39	2	383	50.0	55.36		VAT-Exclusive	2767.86	\N	2017-06-06 10:00:29.715168	2017-06-06 10:00:29.715168
1521	70	6	383	2.0	241.07		VAT-Exclusive	482.14	\N	2017-06-06 10:06:02.419579	2017-06-06 10:06:02.419579
1533	61	1	387	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-06 10:28:50.077071	2017-06-06 10:28:50.077071
1430	96	4	365	16.0	11.97		VAT-Exclusive	191.58	\N	2017-06-03 09:56:24.989627	2017-06-03 09:56:24.989627
1432	76	4	365	72.0	15.83		VAT-Exclusive	1139.46	\N	2017-06-03 10:00:28.363245	2017-06-03 10:00:28.363245
1443	19	6	370	12.0	55.00		VAT-Inclusive	660.0	\N	2017-06-03 10:27:50.464162	2017-06-03 10:27:50.464162
1445	1	1	370	6.0	195.00		VAT-Exempted	1170.0	\N	2017-06-03 10:30:56.226808	2017-06-03 10:30:56.226808
1446	95	8	370	96.0	16.94		VAT-Inclusive	1626.66	\N	2017-06-03 10:33:38.105275	2017-06-03 10:33:38.105275
1449	16	4	370	16.0	42.50		VAT-Inclusive	680.0	\N	2017-06-03 10:37:35.834173	2017-06-03 10:37:35.834173
1451	86	1	371	0.7	1023.36		VAT-Inclusive	716.35	\N	2017-06-03 11:03:31.834057	2017-06-03 11:03:31.834057
1458	131	8	371	1.0	380.00	LES to S1 transfer wings	VAT-Inclusive	380.0	\N	2017-06-03 11:16:38.890828	2017-06-03 11:16:38.890828
1459	122	8	371	1.0	90.00	joy	VAT-Inclusive	90.0	\N	2017-06-03 11:17:35.077957	2017-06-03 11:17:35.077957
1461	130	8	372	3.0	27.00	Print of Communication Handouts	VAT-Inclusive	81.0	\N	2017-06-03 11:22:08.181477	2017-06-03 11:22:08.181477
1463	131	8	372	1.0	380.00	LES to S1 Transfer Wings	VAT-Inclusive	380.0	\N	2017-06-03 11:24:17.685465	2017-06-03 11:24:17.685465
1466	122	8	372	1.0	36.00	Joy	VAT-Inclusive	36.0	\N	2017-06-03 11:27:12.75971	2017-06-03 11:27:12.75971
1471	130	8	372	1.0	83.00	battery for weighing scale	VAT-Inclusive	83.0	\N	2017-06-03 11:32:49.967313	2017-06-03 11:32:49.967313
1482	58	1	373	0.5	359.00		VAT-Inclusive	179.5	\N	2017-06-03 16:02:36.262877	2017-06-03 16:02:36.262877
1493	122	8	377	7.0	88.00		VAT-Inclusive	616.0	\N	2017-06-04 11:10:22.242369	2017-06-04 11:10:22.242369
1494	122	8	377	2.0	16.00		VAT-Inclusive	32.0	\N	2017-06-04 11:11:01.461739	2017-06-04 11:11:01.461739
1495	122	8	377	3.0	18.00		VAT-Inclusive	54.0	\N	2017-06-04 11:11:40.169869	2017-06-04 11:11:40.169869
1497	123	8	377	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-04 11:12:59.591452	2017-06-04 11:12:59.591452
1498	123	8	377	1.0	15.00		VAT-Inclusive	15.0	\N	2017-06-04 11:13:35.625011	2017-06-04 11:13:35.625011
1499	32	1	378	3.0	62.00		VAT-Exempted	186.0	\N	2017-06-04 11:17:31.622766	2017-06-04 11:17:31.622766
1501	27	1	378	0.5	173.00		VAT-Exempted	86.5	\N	2017-06-04 11:19:07.873425	2017-06-04 11:19:07.873425
1504	35	1	378	0.25	169.00		VAT-Exempted	42.25	\N	2017-06-04 11:25:22.541511	2017-06-04 11:25:22.541511
1507	36	1	380	2.0	53.00		VAT-Exempted	106.0	\N	2017-06-06 09:43:34.933988	2017-06-06 09:43:34.933988
1511	21	1	380	7.0	56.00		VAT-Exempted	392.0	\N	2017-06-06 09:46:03.617462	2017-06-06 09:46:03.617462
1513	8	1	381	20.5	179.00		VAT-Exempted	3669.5	\N	2017-06-06 09:50:50.374869	2017-06-06 09:50:50.374869
1517	64	5	383	2.0	468.75		VAT-Exclusive	937.5	\N	2017-06-06 10:03:05.061305	2017-06-06 10:03:05.061305
1524	77	9	385	2.0	214.29		VAT-Exclusive	428.57	\N	2017-06-06 10:14:02.600719	2017-06-06 10:14:02.600719
1527	32	1	387	5.0	60.00		VAT-Exempted	300.0	\N	2017-06-06 10:21:10.866084	2017-06-06 10:21:10.866084
1528	21	1	387	3.0	45.00		VAT-Exempted	135.0	\N	2017-06-06 10:22:39.170373	2017-06-06 10:22:39.170373
1428	86	1	365	1.0	736.00		VAT-Exclusive	736.0	\N	2017-06-03 09:53:48.132962	2017-06-03 09:53:48.132962
1431	62	1	365	2.0	32.28		VAT-Exclusive	64.56	\N	2017-06-03 09:58:48.910357	2017-06-03 09:58:48.910357
1435	21	1	366	3.0	45.00		VAT-Exempted	135.0	\N	2017-06-03 10:05:56.207294	2017-06-03 10:05:56.207294
1448	17	7	370	2.0	165.00		VAT-Inclusive	330.0	\N	2017-06-03 10:36:11.458407	2017-06-03 10:36:11.458407
1456	121	8	371	1.0	1534.00	8oz cups and Paper Towels	VAT-Inclusive	1534.0	\N	2017-06-03 11:14:59.11027	2017-06-03 11:14:59.11027
1462	131	8	372	1.0	40.00	Shaw to S1 Fare for buying Restaurant Supplies	VAT-Inclusive	40.0	\N	2017-06-03 11:23:32.314019	2017-06-03 11:23:32.314019
1467	99	7	372	36.0	21.00	24 cans Pepsi Reg\r\n12 cans Pepsi max	VAT-Inclusive	756.0	\N	2017-06-03 11:28:04.926242	2017-06-03 11:28:04.926242
1469	11	2	372	5.28	151.14		VAT-Inclusive	798.0	\N	2017-06-03 11:29:59.802989	2017-06-03 11:29:59.802989
1470	10	2	372	5.94	86.36		VAT-Inclusive	513.0	\N	2017-06-03 11:30:39.656045	2017-06-03 11:30:39.656045
1477	41	12	373	21.0	8.00		VAT-Inclusive	168.0	\N	2017-06-03 15:55:09.073249	2017-06-03 15:55:09.073249
1487	121	8	374	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-06-04 10:53:53.499723	2017-06-04 10:53:53.499723
1490	121	8	376	5348.0	1.00		VAT-Inclusive	5348.0	\N	2017-06-04 11:03:45.656973	2017-06-04 11:03:45.656973
1496	123	8	377	2.0	25.00		VAT-Inclusive	50.0	\N	2017-06-04 11:12:23.936595	2017-06-04 11:12:23.936595
1512	9	1	381	80.5	151.00		VAT-Exempted	12155.5	\N	2017-06-06 09:49:39.746648	2017-06-06 09:49:39.746648
1516	47	2	383	60.0	46.88		VAT-Exclusive	2812.5	\N	2017-06-06 10:01:56.243064	2017-06-06 10:01:56.243064
1519	68	5	383	2.0	580.36		VAT-Exclusive	1160.71	\N	2017-06-06 10:04:07.065759	2017-06-06 10:04:07.065759
1525	15	13	386	7.0	530.00		VAT-Inclusive	3710.0	\N	2017-06-06 10:18:36.370477	2017-06-06 10:18:36.370477
1532	34	1	387	1.0	120.00		VAT-Exempted	120.0	\N	2017-06-06 10:28:07.633658	2017-06-06 10:28:07.633658
1429	75	9	365	10.0	203.46		VAT-Exclusive	2034.64	\N	2017-06-03 09:55:10.447876	2017-06-03 09:55:10.447876
1433	32	1	366	3.0	60.00		VAT-Exempted	180.0	\N	2017-06-03 10:03:56.522014	2017-06-03 10:03:56.522014
1434	61	1	366	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-03 10:04:51.758487	2017-06-03 10:04:51.758487
1436	30	8	366	20.0	15.00		VAT-Exempted	300.0	\N	2017-06-03 10:07:05.850652	2017-06-03 10:07:05.850652
1437	7	1	367	24.0	220.00		VAT-Exempted	5280.0	\N	2017-06-03 10:11:36.85906	2017-06-03 10:11:36.85906
1439	9	1	368	19.2	151.00		VAT-Exempted	2899.2	\N	2017-06-03 10:16:08.440435	2017-06-03 10:16:08.440435
1444	53	5	370	3.0	300.00		VAT-Inclusive	900.0	\N	2017-06-03 10:29:38.021447	2017-06-03 10:29:38.021447
1453	130	8	371	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-06-03 11:09:40.51941	2017-06-03 11:09:40.51941
1455	137	8	371	12.0	50.00		VAT-Exempted	600.0	\N	2017-06-03 11:13:10.957421	2017-06-03 11:13:10.957421
1457	122	8	371	1.0	124.00	Bleach, Pwder and Joy	VAT-Inclusive	124.0	\N	2017-06-03 11:15:37.156767	2017-06-03 11:15:37.156767
1476	11	1	373	2.0	289.50		VAT-Inclusive	579.0	\N	2017-06-03 15:53:40.337562	2017-06-03 15:53:40.337562
1484	72	6	373	1.0	36.75		VAT-Inclusive	36.75	\N	2017-06-03 16:04:19.997651	2017-06-03 16:04:19.997651
1491	122	8	377	1.0	125.00		VAT-Inclusive	125.0	\N	2017-06-04 11:09:17.458115	2017-06-04 11:09:17.458115
1492	122	8	377	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-04 11:09:45.75267	2017-06-04 11:09:45.75267
1500	36	1	378	3.0	53.00		VAT-Exempted	159.0	\N	2017-06-04 11:18:19.126315	2017-06-04 11:18:19.126315
1502	33	1	378	0.3	168.00		VAT-Exempted	50.4	\N	2017-06-04 11:23:27.02195	2017-06-04 11:23:27.02195
1505	9	1	379	22.52	151.00		VAT-Exempted	3400.52	\N	2017-06-04 11:28:30.844587	2017-06-04 11:28:30.844587
1506	36	1	380	2.0	53.00		VAT-Exempted	106.0	\N	2017-06-06 09:43:34.730066	2017-06-06 09:43:34.730066
1509	34	1	380	2.0	93.00		VAT-Exempted	186.0	\N	2017-06-06 09:44:36.601345	2017-06-06 09:44:36.601345
1514	56	1	382	125.0	93.00		VAT-Inclusive	11625.0	\N	2017-06-06 09:54:52.282299	2017-06-06 09:54:52.282299
1518	64	5	383	2.0	468.75		VAT-Exclusive	937.5	\N	2017-06-06 10:03:05.083442	2017-06-06 10:03:05.083442
1520	69	6	383	12.0	196.43		VAT-Exclusive	2357.14	\N	2017-06-06 10:05:09.606887	2017-06-06 10:05:09.606887
1522	38	6	383	6.0	111.61		VAT-Exclusive	669.65	\N	2017-06-06 10:07:37.844755	2017-06-06 10:07:37.844755
1523	5	1	384	9.76	298.14		VAT-Inclusive	2909.85	\N	2017-06-06 10:11:37.833177	2017-06-06 10:11:37.833177
1526	36	1	387	3.0	45.00		VAT-Exempted	135.0	\N	2017-06-06 10:20:31.591124	2017-06-06 10:20:31.591124
1529	23	1	387	0.1	700.00		VAT-Exempted	70.0	\N	2017-06-06 10:23:25.670547	2017-06-06 10:23:25.670547
1530	33	1	387	0.2	240.00		VAT-Exempted	48.0	\N	2017-06-06 10:25:36.34576	2017-06-06 10:25:36.34576
1531	30	8	387	15.0	20.00		VAT-Exempted	300.0	\N	2017-06-06 10:27:00.911608	2017-06-06 10:27:00.911608
1534	137	8	388	7.0	50.00	Jerlyn, Erlyn, Jom, Sharlaine, Myrtle, Alvin, Renz	VAT-Exempted	350.0	\N	2017-06-07 08:42:50.295419	2017-06-07 08:42:50.295419
1535	130	8	389	1.0	54.00	Photocopy of FOH Manuals	VAT-Inclusive	54.0	\N	2017-06-07 08:44:33.797169	2017-06-07 08:44:33.797169
1536	137	8	389	16.0	50.00		VAT-Exempted	800.0	\N	2017-06-07 08:45:05.467394	2017-06-07 08:45:05.467394
1537	130	8	389	1.0	35.00	Biogesic	VAT-Inclusive	35.0	\N	2017-06-07 08:46:30.56361	2017-06-07 08:46:30.56361
1538	124	8	389	4.0	120.00		VAT-Inclusive	480.0	\N	2017-06-07 08:47:04.013248	2017-06-07 08:47:04.013248
1539	123	8	389	1.0	1400.00	Printer Ribbon	VAT-Inclusive	1400.0	\N	2017-06-07 08:47:50.732543	2017-06-07 08:47:50.732543
1540	130	8	389	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-06-07 08:49:29.981633	2017-06-07 08:49:29.981633
1541	10	2	390	17.33	76.75		VAT-Inclusive	1330.0	\N	2017-06-07 08:53:57.785547	2017-06-07 08:53:57.785547
1542	11	2	390	16.28	138.88		VAT-Inclusive	2261.0	\N	2017-06-07 08:54:54.179118	2017-06-07 08:54:54.179118
1543	131	8	390	1.0	92.00	SM to S1 market butter	VAT-Inclusive	92.0	\N	2017-06-07 08:55:44.782183	2017-06-07 08:55:44.782183
1544	131	8	390	1.0	350.00	LES to S1 Borrow pork butt	VAT-Inclusive	350.0	\N	2017-06-07 08:56:25.964083	2017-06-07 08:56:25.964083
1545	137	8	390	13.0	50.00		VAT-Exempted	650.0	\N	2017-06-07 08:56:58.749548	2017-06-07 08:56:58.749548
1546	124	8	390	3.0	130.00		VAT-Inclusive	390.0	\N	2017-06-07 08:57:46.509084	2017-06-07 08:57:46.509084
1547	137	8	391	15.0	50.00		VAT-Exempted	750.0	\N	2017-06-07 09:00:14.933284	2017-06-07 09:00:14.933284
1548	124	8	391	9.0	120.00		VAT-Inclusive	1080.0	\N	2017-06-07 09:01:31.567709	2017-06-07 09:01:31.567709
1549	122	8	391	3.0	88.00	Microfiber Towels	VAT-Inclusive	264.0	\N	2017-06-07 09:02:15.769027	2017-06-07 09:02:15.769027
1550	122	8	391	1.0	399.00	Glade Autospray	VAT-Inclusive	399.0	\N	2017-06-07 09:03:01.300942	2017-06-07 09:03:01.300942
1551	123	8	391	1.0	14.25	1/4 paper pad	VAT-Inclusive	14.25	\N	2017-06-07 09:03:38.649198	2017-06-07 09:03:38.649198
1552	42	8	255	10.0	4.50		VAT-Inclusive	45.0	\N	2017-06-07 10:27:27.099945	2017-06-07 10:27:27.099945
1553	42	8	359	20.0	4.50		VAT-Inclusive	90.0	\N	2017-06-07 10:28:43.70123	2017-06-07 10:28:43.70123
1554	9	1	393	80.7	151.00		VAT-Exempted	12185.7	\N	2017-06-07 11:28:12.834253	2017-06-07 11:28:12.834253
1555	8	1	393	20.4	179.00		VAT-Exempted	3651.6	\N	2017-06-07 11:29:13.699556	2017-06-07 11:29:13.699556
1556	32	1	394	6.0	62.00		VAT-Exempted	372.0	\N	2017-06-07 11:31:52.479443	2017-06-07 11:31:52.479443
1557	33	1	394	0.3	168.00		VAT-Exempted	50.4	\N	2017-06-07 11:32:44.087832	2017-06-07 11:32:44.087832
1559	30	8	394	1.5	108.00		VAT-Exempted	162.0	\N	2017-06-07 11:34:20.873863	2017-06-07 11:34:20.873863
1560	34	1	394	3.0	93.00		VAT-Exempted	279.0	\N	2017-06-07 11:35:23.396372	2017-06-07 11:35:23.396372
1561	36	1	394	3.0	53.00		VAT-Exempted	159.0	\N	2017-06-07 11:36:30.856643	2017-06-07 11:36:30.856643
1562	21	1	394	6.0	56.00		VAT-Exempted	336.0	\N	2017-06-07 11:37:23.332039	2017-06-07 11:37:23.332039
1563	22	1	394	0.5	48.00		VAT-Exempted	24.0	\N	2017-06-07 11:38:22.543586	2017-06-07 11:38:22.543586
1564	27	1	394	0.5	163.00		VAT-Exempted	81.5	\N	2017-06-07 11:39:16.343075	2017-06-07 11:39:16.343075
1565	121	8	395	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-06-07 15:31:21.956931	2017-06-07 15:31:21.956931
1566	122	8	396	1.0	125.00		VAT-Inclusive	125.0	\N	2017-06-07 15:34:06.598024	2017-06-07 15:34:06.598024
1567	122	8	396	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-07 15:34:46.456517	2017-06-07 15:34:46.456517
1568	122	8	396	8.0	88.00		VAT-Inclusive	704.0	\N	2017-06-07 15:35:48.314134	2017-06-07 15:35:48.314134
1569	122	8	396	2.0	16.00		VAT-Inclusive	32.0	\N	2017-06-07 15:37:56.799364	2017-06-07 15:37:56.799364
1570	122	8	396	3.0	18.00		VAT-Inclusive	54.0	\N	2017-06-07 15:38:38.614187	2017-06-07 15:38:38.614187
1571	123	8	396	1.0	25.00		VAT-Inclusive	25.0	\N	2017-06-07 15:39:15.076787	2017-06-07 15:39:15.076787
1572	123	8	396	1.0	15.00		VAT-Inclusive	15.0	\N	2017-06-07 15:39:47.060405	2017-06-07 15:39:47.060405
1573	121	8	397	1.0	9090.50		VAT-Inclusive	9090.5	\N	2017-06-07 15:42:48.038241	2017-06-07 15:42:48.038241
1574	51	1	398	72.0	40.70		VAT-Exclusive	2930.4	\N	2017-06-07 16:11:43.955839	2017-06-07 16:11:43.955839
1577	98	9	399	24.0	8.11		VAT-Exclusive	194.65	\N	2017-06-07 16:29:12.604177	2017-06-07 16:29:12.604177
1578	99	7	399	192.0	17.41		VAT-Exclusive	3342.85	\N	2017-06-07 16:30:27.873548	2017-06-07 16:30:27.873548
1579	97	9	400	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-06-07 16:33:12.561828	2017-06-07 16:33:12.561828
1580	5	1	401	19.72	298.14		VAT-Inclusive	5879.32	\N	2017-06-09 19:17:22.628619	2017-06-09 19:17:22.628619
1581	6	1	401	10.2	283.36		VAT-Inclusive	2890.27	\N	2017-06-09 19:18:13.750567	2017-06-09 19:18:13.750567
1582	4	1	401	6.0	285.00		VAT-Inclusive	1710.0	\N	2017-06-09 19:19:52.88844	2017-06-09 19:19:52.88844
1583	104	9	402	72.0	28.00		VAT-Inclusive	2016.0	\N	2017-06-09 19:22:57.938285	2017-06-09 19:22:57.938285
1584	103	9	402	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-06-09 19:24:01.646842	2017-06-09 19:24:01.646842
1585	4	1	403	4.0	380.00		VAT-Inclusive	1520.0	\N	2017-06-09 19:27:20.615262	2017-06-09 19:27:20.615262
1586	100	9	404	120.0	32.50		VAT-Inclusive	3900.0	\N	2017-06-09 19:30:37.428427	2017-06-09 19:30:37.428427
1590	30	8	405	15.0	20.00		VAT-Exempted	300.0	\N	2017-06-10 09:11:32.844036	2017-06-10 09:11:32.844036
1600	21	1	406	5.0	45.00		VAT-Exempted	225.0	\N	2017-06-10 09:22:39.927505	2017-06-10 09:22:39.927505
1603	9	1	408	60.0	151.00		VAT-Exempted	9060.0	\N	2017-06-10 10:19:23.132719	2017-06-10 10:19:23.132719
1605	42	8	409	10.0	4.50		VAT-Inclusive	45.0	\N	2017-06-10 10:23:08.024514	2017-06-10 10:23:08.024514
1611	122	8	411	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-10 10:31:38.001624	2017-06-10 10:31:38.001624
1613	122	8	411	3.0	18.00		VAT-Inclusive	54.0	\N	2017-06-10 10:33:20.986042	2017-06-10 10:33:20.986042
1620	40	1	415	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-06-10 10:53:42.488377	2017-06-10 10:53:42.488377
1625	17	7	415	3.0	165.00		VAT-Inclusive	495.0	\N	2017-06-10 10:57:46.28671	2017-06-10 10:57:46.28671
1626	16	4	415	16.0	42.50		VAT-Inclusive	680.0	\N	2017-06-10 10:58:27.134252	2017-06-10 10:58:27.134252
1630	123	8	416	1.0	11.00	Marker	VAT-Inclusive	11.0	\N	2017-06-11 06:40:47.742006	2017-06-11 06:40:47.742006
1632	129	8	416	3.0	1000.00	Aircon Cleaning Labor	VAT-Inclusive	3000.0	\N	2017-06-11 06:42:13.414516	2017-06-11 06:42:13.414516
1636	130	8	416	1.0	200.00	Transmittal	VAT-Inclusive	200.0	\N	2017-06-11 06:48:05.256764	2017-06-11 06:48:05.256764
1640	122	8	417	2.0	89.00	Joy	VAT-Inclusive	178.0	\N	2017-06-11 07:00:58.803338	2017-06-11 07:00:58.803338
1642	137	8	418	7.0	50.00	Jerlyn, Miko, Renz, Jethro, Lou, Rodel, Don renz	VAT-Exempted	350.0	\N	2017-06-11 07:06:05.233798	2017-06-11 07:06:05.233798
1648	33	1	420	0.3	198.00		VAT-Exempted	59.4	\N	2017-06-11 09:31:24.176822	2017-06-11 09:31:24.176822
1649	23	1	420	0.2	518.00		VAT-Exempted	103.6	\N	2017-06-11 09:32:33.087688	2017-06-11 09:32:33.087688
1652	22	1	420	0.25	48.00		VAT-Exempted	12.0	\N	2017-06-11 09:34:21.338129	2017-06-11 09:34:21.338129
1655	39	2	423	40.0	55.36		VAT-Exclusive	2214.29	\N	2017-06-14 11:20:53.644127	2017-06-14 11:20:53.644127
1656	46	2	423	16.0	165.18		VAT-Exclusive	2642.86	\N	2017-06-14 11:22:07.209931	2017-06-14 11:22:07.209931
1661	80	2	423	4.0	171.88		VAT-Exclusive	687.5	\N	2017-06-14 11:28:43.363394	2017-06-14 11:28:43.363394
1664	9	1	425	70.4	151.00		VAT-Exempted	10630.4	\N	2017-06-14 11:37:43.170484	2017-06-14 11:37:43.170484
1669	21	1	429	4.0	63.00		VAT-Exempted	252.0	\N	2017-06-14 11:48:59.108454	2017-06-14 11:48:59.108454
1670	22	1	429	0.25	63.00		VAT-Exempted	15.75	\N	2017-06-14 11:50:08.24523	2017-06-14 11:50:08.24523
1677	123	8	430	15.0	38.00		VAT-Inclusive	570.0	\N	2017-06-14 12:01:33.260732	2017-06-14 12:01:33.260732
1678	137	8	431	7.0	50.00	Myrtle, Jerlyn, Rodel, Don renz, Renz, Jethro, Santos	VAT-Exempted	350.0	\N	2017-06-14 14:37:34.401605	2017-06-14 14:37:34.401605
1682	124	8	432	11.0	120.00		VAT-Inclusive	1320.0	\N	2017-06-14 14:44:00.205205	2017-06-14 14:44:00.205205
1689	41	12	433	21.0	10.93		VAT-Inclusive	229.5	\N	2017-06-14 15:00:47.200646	2017-06-14 15:00:47.200646
1690	49	6	433	3.0	227.50		VAT-Inclusive	682.5	\N	2017-06-14 15:01:23.092251	2017-06-14 15:01:23.092251
1691	73	12	433	43.68	10.41		VAT-Inclusive	454.5	\N	2017-06-14 15:02:21.991783	2017-06-14 15:02:21.991783
1692	74	12	433	70.08	7.90		VAT-Inclusive	553.5	\N	2017-06-14 15:03:32.906246	2017-06-14 15:03:32.906246
1700	121	8	434	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-06-15 08:57:18.595854	2017-06-15 08:57:18.595854
1701	104	9	435	48.0	28.00		VAT-Inclusive	1344.0	\N	2017-06-15 09:55:12.356983	2017-06-15 09:55:12.356983
1702	103	9	435	96.0	30.63		VAT-Inclusive	2940.0	\N	2017-06-15 09:56:16.385628	2017-06-15 09:56:16.385628
1704	121	8	436	1.0	613.50	Spatula and Sanitizer Spray	VAT-Inclusive	613.5	\N	2017-06-15 18:04:05.453872	2017-06-15 18:04:05.453872
1706	130	8	436	1.0	15.00	Print of PCF	VAT-Inclusive	15.0	\N	2017-06-15 18:05:10.590951	2017-06-15 18:05:10.590951
1715	34	1	437	2.0	120.00		VAT-Exempted	240.0	\N	2017-06-15 18:18:22.231166	2017-06-15 18:18:22.231166
1718	61	1	437	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-15 18:19:56.068446	2017-06-15 18:19:56.068446
1719	9	1	438	70.56	151.00		VAT-Exempted	10654.56	\N	2017-06-15 18:22:34.512813	2017-06-15 18:22:34.512813
1721	21	1	439	8.0	45.00		VAT-Exempted	360.0	\N	2017-06-17 09:33:19.684184	2017-06-17 09:33:19.684184
1587	101	9	404	120.0	49.58		VAT-Inclusive	5950.0	\N	2017-06-09 19:31:25.345231	2017-06-09 19:31:25.345231
1598	34	1	406	1.0	120.00		VAT-Exempted	120.0	\N	2017-06-10 09:21:28.023326	2017-06-10 09:21:28.023326
1599	36	1	406	2.0	45.00		VAT-Exempted	90.0	\N	2017-06-10 09:22:00.510825	2017-06-10 09:22:00.510825
1606	44	8	409	75.0	4.60		VAT-Inclusive	345.0	\N	2017-06-10 10:24:44.251756	2017-06-10 10:24:44.251756
1614	122	8	411	1.0	190.00		VAT-Inclusive	190.0	\N	2017-06-10 10:34:23.67869	2017-06-10 10:34:23.67869
1616	123	8	411	2.0	15.00		VAT-Inclusive	30.0	\N	2017-06-10 10:35:36.416853	2017-06-10 10:35:36.416853
1619	24	1	414	20.4	70.59		VAT-Inclusive	1440.0	\N	2017-06-10 10:50:12.161123	2017-06-10 10:50:12.161123
1622	1	1	415	4.0	195.00		VAT-Exempted	780.0	\N	2017-06-10 10:54:57.404029	2017-06-10 10:54:57.404029
1623	95	8	415	72.0	16.94		VAT-Inclusive	1220.0	\N	2017-06-10 10:56:23.348713	2017-06-10 10:56:23.348713
1631	122	8	416	1.0	20.00	Broomstick	VAT-Inclusive	20.0	\N	2017-06-11 06:41:32.42622	2017-06-11 06:41:32.42622
1645	32	1	420	5.0	48.00		VAT-Exempted	240.0	\N	2017-06-11 09:27:15.634276	2017-06-11 09:27:15.634276
1650	20	1	420	0.1	98.00		VAT-Exempted	9.8	\N	2017-06-11 09:32:59.399756	2017-06-11 09:32:59.399756
1651	27	1	420	0.5	158.00		VAT-Exempted	79.0	\N	2017-06-11 09:33:45.89517	2017-06-11 09:33:45.89517
1653	134	8	421	1.0	530.00	Food Panda Tarpauline	VAT-Inclusive	530.0	\N	2017-06-11 09:38:03.442056	2017-06-11 09:38:03.442056
1660	69	6	423	6.0	196.43		VAT-Exclusive	1178.57	\N	2017-06-14 11:27:28.222872	2017-06-14 11:27:28.222872
1671	34	1	429	2.0	93.00		VAT-Exempted	186.0	\N	2017-06-14 11:50:58.873989	2017-06-14 11:50:58.873989
1672	23	1	429	0.1	518.00		VAT-Exempted	51.8	\N	2017-06-14 11:52:04.271525	2017-06-14 11:52:04.271525
1674	32	1	429	3.0	62.00		VAT-Exempted	186.0	\N	2017-06-14 11:54:23.547508	2017-06-14 11:54:23.547508
1680	130	8	432	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-06-14 14:42:18.357261	2017-06-14 14:42:18.357261
1683	123	8	433	2.0	26.50	Special Paper for LSM	VAT-Inclusive	53.0	\N	2017-06-14 14:47:59.289873	2017-06-14 14:47:59.289873
1684	48	1	433	1.0	182.50		VAT-Inclusive	182.5	\N	2017-06-14 14:51:17.699523	2017-06-14 14:51:17.699523
1685	37	8	433	120.0	4.88		VAT-Inclusive	585.0	\N	2017-06-14 14:56:05.554167	2017-06-14 14:56:05.554167
1696	122	8	433	1.0	250.00	 Hand Sanitizer	VAT-Inclusive	250.0	\N	2017-06-14 15:07:51.735567	2017-06-14 15:07:51.735567
1698	130	8	433	1.0	50.00	acetone	VAT-Inclusive	50.0	\N	2017-06-14 15:11:17.571472	2017-06-14 15:11:17.571472
1699	137	8	433	12.0	50.00	Che, Jerlyn, Lou, Sharlaine, Mau, Rodel, Renz, Mico, Santos, Alvin, Danna	VAT-Exempted	600.0	\N	2017-06-14 15:19:11.901209	2017-06-14 15:19:11.901209
1710	124	8	436	6.0	130.00		VAT-Inclusive	780.0	\N	2017-06-15 18:08:09.463702	2017-06-15 18:08:09.463702
1717	32	1	437	3.0	60.00		VAT-Exempted	180.0	\N	2017-06-15 18:19:29.135101	2017-06-15 18:19:29.135101
1588	33	1	405	0.3	240.00		VAT-Exempted	72.0	\N	2017-06-10 09:10:26.278504	2017-06-10 09:10:26.278504
1589	20	1	405	0.1	170.00		VAT-Exempted	17.0	\N	2017-06-10 09:11:02.819302	2017-06-10 09:11:02.819302
1593	27	1	406	0.5	170.00		VAT-Exempted	85.0	\N	2017-06-10 09:17:13.330792	2017-06-10 09:17:13.330792
1594	23	1	406	0.1	700.00		VAT-Exempted	70.0	\N	2017-06-10 09:17:57.954829	2017-06-10 09:17:57.954829
1596	31	1	406	1.0	130.00		VAT-Exempted	130.0	\N	2017-06-10 09:19:41.164097	2017-06-10 09:19:41.164097
1602	8	1	407	15.18	179.00		VAT-Exempted	2717.22	\N	2017-06-10 09:27:01.534023	2017-06-10 09:27:01.534023
1609	26	1	410	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-06-10 10:28:29.867972	2017-06-10 10:28:29.867972
1610	122	8	411	1.0	125.00		VAT-Inclusive	125.0	\N	2017-06-10 10:30:51.859897	2017-06-10 10:30:51.859897
1612	122	8	411	8.0	88.00		VAT-Inclusive	704.0	\N	2017-06-10 10:32:14.783663	2017-06-10 10:32:14.783663
1615	123	8	411	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-10 10:35:07.349943	2017-06-10 10:35:07.349943
1621	53	5	415	4.0	300.00		VAT-Inclusive	1200.0	\N	2017-06-10 10:54:13.535633	2017-06-10 10:54:13.535633
1627	137	8	416	14.0	50.00		VAT-Exempted	700.0	\N	2017-06-11 06:39:04.130229	2017-06-11 06:39:04.130229
1634	10	2	416	23.76	65.03		VAT-Exclusive	1545.0	\N	2017-06-11 06:46:05.098822	2017-06-11 06:46:05.098822
1639	137	8	417	15.0	50.00		VAT-Exempted	750.0	\N	2017-06-11 06:59:08.418972	2017-06-11 06:59:08.418972
1641	122	8	417	1.0	25.00	Bleach	VAT-Inclusive	25.0	\N	2017-06-11 07:02:38.180636	2017-06-11 07:02:38.180636
1643	137	8	419	4.0	50.00	Che, Alvin, Sharlaine, Miko	VAT-Exempted	200.0	\N	2017-06-11 07:08:28.330534	2017-06-11 07:08:28.330534
1644	21	1	420	3.0	58.00		VAT-Exempted	174.0	\N	2017-06-11 09:26:43.694883	2017-06-11 09:26:43.694883
1647	36	1	420	3.0	53.00		VAT-Exempted	159.0	\N	2017-06-11 09:29:35.105014	2017-06-11 09:29:35.105014
1654	61	1	422	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-12 10:03:09.647794	2017-06-12 10:03:09.647794
1665	8	1	425	30.14	179.00		VAT-Exempted	5395.06	\N	2017-06-14 11:38:50.266183	2017-06-14 11:38:50.266183
1667	2	1	428	10.0	300.00		VAT-Inclusive	3000.0	\N	2017-06-14 11:45:51.008633	2017-06-14 11:45:51.008633
1668	27	1	429	0.25	158.00		VAT-Exempted	39.5	\N	2017-06-14 11:48:16.202873	2017-06-14 11:48:16.202873
1675	30	8	429	8.0	10.13		VAT-Exempted	81.0	\N	2017-06-14 11:55:37.034053	2017-06-14 11:55:37.034053
1679	130	8	431	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-06-14 14:38:15.019619	2017-06-14 14:38:15.019619
1686	93	1	433	2.0	54.00		VAT-Inclusive	108.0	\N	2017-06-14 14:58:07.342537	2017-06-14 14:58:07.342537
1687	76	4	433	28.0	17.88		VAT-Inclusive	500.5	\N	2017-06-14 14:59:19.682614	2017-06-14 14:59:19.682614
1693	55	12	433	7.0	20.93		VAT-Inclusive	146.5	\N	2017-06-14 15:04:06.195556	2017-06-14 15:04:06.195556
1694	122	8	433	1.0	147.00	Powder, joy, bleach	VAT-Inclusive	147.0	\N	2017-06-14 15:05:17.717463	2017-06-14 15:05:17.717463
1695	131	8	433	1.0	92.00	Sm to S1 For Open  Market	VAT-Inclusive	92.0	\N	2017-06-14 15:07:06.436719	2017-06-14 15:07:06.436719
1703	134	8	436	30.0	21.33	Print of Voucher for LSM	VAT-Inclusive	640.0	\N	2017-06-15 18:02:22.061096	2017-06-15 18:02:22.061096
1705	121	8	436	1.0	150.00	520 Lids	VAT-Inclusive	150.0	\N	2017-06-15 18:04:42.023174	2017-06-15 18:04:42.023174
1708	131	8	436	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-06-15 18:06:44.426459	2017-06-15 18:06:44.426459
1709	122	8	436	1.0	104.00	Joy and powder	VAT-Inclusive	104.0	\N	2017-06-15 18:07:19.46101	2017-06-15 18:07:19.46101
1711	131	8	436	1.0	120.00	Sm to S1 open Market Restaurant supplies	VAT-Inclusive	120.0	\N	2017-06-15 18:09:38.383942	2017-06-15 18:09:38.383942
1712	137	8	436	15.0	50.00	Don Renz, Jethro, Sharlaine, Jerlyn, Miko, Alvin, Rodel, Santos, Maureen, danna, Cherilou, Renz, Che	VAT-Exempted	750.0	\N	2017-06-15 18:14:56.428524	2017-06-15 18:14:56.428524
1713	33	1	437	0.2	250.00		VAT-Exempted	50.0	\N	2017-06-15 18:17:03.475019	2017-06-15 18:17:03.475019
1714	36	1	437	2.0	45.00		VAT-Exempted	90.0	\N	2017-06-15 18:17:47.507339	2017-06-15 18:17:47.507339
1591	61	1	405	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-10 09:12:47.374327	2017-06-10 09:12:47.374327
1592	61	1	406	15.0	44.00		VAT-Exempted	660.0	\N	2017-06-10 09:15:55.992212	2017-06-10 09:15:55.992212
1595	33	1	406	0.1	240.00		VAT-Exempted	24.0	\N	2017-06-10 09:18:36.672577	2017-06-10 09:18:36.672577
1597	32	1	406	5.0	60.00		VAT-Exempted	300.0	\N	2017-06-10 09:20:40.648724	2017-06-10 09:20:40.648724
1601	9	1	407	30.24	151.00		VAT-Exempted	4566.24	\N	2017-06-10 09:25:43.37222	2017-06-10 09:25:43.37222
1604	8	1	408	20.4	179.00		VAT-Exempted	3651.6	\N	2017-06-10 10:20:17.981474	2017-06-10 10:20:17.981474
1607	43	8	409	10.0	13.20		VAT-Inclusive	132.0	\N	2017-06-10 10:25:18.204012	2017-06-10 10:25:18.204012
1608	25	1	410	10.0	75.00		VAT-Inclusive	750.0	\N	2017-06-10 10:27:31.535317	2017-06-10 10:27:31.535317
1617	121	8	412	1.0	5655.50		VAT-Inclusive	5655.5	\N	2017-06-10 10:44:48.058219	2017-06-10 10:44:48.058219
1618	7	1	413	24.0	220.00		VAT-Exempted	5280.0	\N	2017-06-10 10:46:46.61459	2017-06-10 10:46:46.61459
1624	13	1	415	2.0	600.00		VAT-Inclusive	1200.0	\N	2017-06-10 10:57:18.2312	2017-06-10 10:57:18.2312
1628	124	8	416	3.0	120.00		VAT-Inclusive	360.0	\N	2017-06-11 06:39:47.315529	2017-06-11 06:39:47.315529
1629	130	8	416	1.0	20.00	Print of PCF	VAT-Inclusive	20.0	\N	2017-06-11 06:40:12.622542	2017-06-11 06:40:12.622542
1635	11	2	416	42.24	114.04		VAT-Exclusive	4817.14	\N	2017-06-11 06:46:58.686271	2017-06-11 06:46:58.686271
1637	137	8	416	1.0	4260.42	Employee Benefits - Medical bill of Erlyn Hermoguez  due to Hyperventilation while on duty	VAT-Inclusive	4260.42	\N	2017-06-11 06:54:33.141013	2017-06-11 06:54:33.141013
1638	129	8	417	1.0	500.00	Repair of Speakers	VAT-Inclusive	500.0	\N	2017-06-11 06:58:35.482382	2017-06-11 06:58:35.482382
1646	34	1	420	3.0	88.00		VAT-Exempted	264.0	\N	2017-06-11 09:27:45.038286	2017-06-11 09:27:45.038286
1657	47	2	423	70.0	46.88		VAT-Exclusive	3281.25	\N	2017-06-14 11:23:44.697547	2017-06-14 11:23:44.697547
1658	64	5	423	1.0	468.75		VAT-Exclusive	468.75	\N	2017-06-14 11:24:41.158781	2017-06-14 11:24:41.158781
1659	68	5	423	4.0	580.36		VAT-Exclusive	2321.43	\N	2017-06-14 11:25:53.461272	2017-06-14 11:25:53.461272
1662	38	6	423	8.0	111.61		VAT-Exclusive	892.85	\N	2017-06-14 11:30:03.811189	2017-06-14 11:30:03.811189
1663	97	9	424	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-06-14 11:34:03.200431	2017-06-14 11:34:03.200431
1666	15	13	426	6.0	530.00		VAT-Inclusive	3180.0	\N	2017-06-14 11:41:42.869815	2017-06-14 11:41:42.869815
1673	36	1	429	2.0	53.00		VAT-Exempted	106.0	\N	2017-06-14 11:53:35.903279	2017-06-14 11:53:35.903279
1681	137	8	432	13.0	50.00	Jerlyn, Sharlaine, Renz, Lou, che, Jethro, Mau, Rodel, renz, Miko, Santos, Alvin	VAT-Exempted	650.0	\N	2017-06-14 14:43:36.639643	2017-06-14 14:43:36.639643
1688	92	1	433	2.0	46.00		VAT-Inclusive	92.0	\N	2017-06-14 14:59:56.287977	2017-06-14 14:59:56.287977
1707	58	1	436	1.0	290.00		VAT-Inclusive	290.0	\N	2017-06-15 18:06:02.295133	2017-06-15 18:06:02.295133
1716	27	1	437	0.25	160.00		VAT-Exempted	40.0	\N	2017-06-15 18:18:53.112697	2017-06-15 18:18:53.112697
1720	8	1	438	30.28	179.00		VAT-Exempted	5420.12	\N	2017-06-15 18:23:31.227328	2017-06-15 18:23:31.227328
1722	32	1	439	6.0	60.00		VAT-Exempted	360.0	\N	2017-06-17 09:33:59.216075	2017-06-17 09:33:59.216075
1723	34	1	439	3.0	120.00		VAT-Exempted	360.0	\N	2017-06-17 09:34:57.483074	2017-06-17 09:34:57.483074
1724	36	1	439	2.0	45.00		VAT-Exempted	90.0	\N	2017-06-17 09:36:16.532535	2017-06-17 09:36:16.532535
1725	22	1	439	0.5	55.00		VAT-Exempted	27.5	\N	2017-06-17 09:37:12.237614	2017-06-17 09:37:12.237614
1726	20	1	439	0.1	170.00		VAT-Exempted	17.0	\N	2017-06-17 09:38:23.412685	2017-06-17 09:38:23.412685
1727	33	1	439	0.2	250.00		VAT-Exempted	50.0	\N	2017-06-17 09:39:13.787703	2017-06-17 09:39:13.787703
1728	27	1	439	0.5	160.00		VAT-Exempted	80.0	\N	2017-06-17 09:40:12.367834	2017-06-17 09:40:12.367834
1729	23	1	439	0.1	700.00		VAT-Exempted	70.0	\N	2017-06-17 09:41:24.582364	2017-06-17 09:41:24.582364
1730	30	8	439	20.0	20.00		VAT-Exempted	400.0	\N	2017-06-17 09:42:12.38087	2017-06-17 09:42:12.38087
1731	61	1	439	15.0	44.00		VAT-Exempted	660.0	\N	2017-06-17 09:42:59.098213	2017-06-17 09:42:59.098213
1732	61	1	439	15.0	44.00		VAT-Exempted	660.0	\N	2017-06-17 09:42:59.240767	2017-06-17 09:42:59.240767
1733	9	1	440	34.4	151.00		VAT-Exempted	5194.4	\N	2017-06-17 09:46:41.601352	2017-06-17 09:46:41.601352
1734	8	1	440	20.3	179.00		VAT-Exempted	3633.7	\N	2017-06-17 09:47:40.395374	2017-06-17 09:47:40.395374
1735	18	5	441	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-06-17 09:49:45.023634	2017-06-17 09:49:45.023634
1736	43	8	442	30.0	6.60		VAT-Inclusive	198.0	\N	2017-06-17 09:52:41.037158	2017-06-17 09:52:41.037158
1737	44	8	442	50.0	4.60		VAT-Inclusive	230.0	\N	2017-06-17 09:54:08.990878	2017-06-17 09:54:08.990878
1738	42	8	442	20.0	4.50		VAT-Inclusive	90.0	\N	2017-06-17 09:54:56.923453	2017-06-17 09:54:56.923453
1739	6	1	443	20.28	283.36		VAT-Inclusive	5746.54	\N	2017-06-17 09:57:58.381294	2017-06-17 09:57:58.381294
1740	5	1	443	19.66	298.14		VAT-Inclusive	5861.43	\N	2017-06-17 09:58:44.043345	2017-06-17 09:58:44.043345
1741	24	1	444	40.8	70.59		VAT-Inclusive	2880.0	\N	2017-06-17 10:02:19.405225	2017-06-17 10:02:19.405225
1742	40	1	444	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-06-17 10:04:32.926506	2017-06-17 10:04:32.926506
1743	57	6	444	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-06-17 10:06:32.439166	2017-06-17 10:06:32.439166
1744	53	5	444	3.0	300.00		VAT-Inclusive	900.0	\N	2017-06-17 10:07:31.626813	2017-06-17 10:07:31.626813
1745	1	1	444	6.0	195.00		VAT-Exempted	1170.0	\N	2017-06-17 10:08:53.955956	2017-06-17 10:08:53.955956
1746	95	8	444	96.0	16.94		VAT-Inclusive	1626.66	\N	2017-06-17 10:11:28.591263	2017-06-17 10:11:28.591263
1747	12	1	444	3.46	700.00		VAT-Inclusive	2422.0	\N	2017-06-17 10:13:54.001681	2017-06-17 10:13:54.001681
1748	13	1	444	1.0	600.00		VAT-Inclusive	600.0	\N	2017-06-17 10:14:48.470435	2017-06-17 10:14:48.470435
1749	16	4	444	16.0	42.50		VAT-Inclusive	680.0	\N	2017-06-17 10:15:53.294795	2017-06-17 10:15:53.294795
1750	121	8	445	2000.0	0.85		VAT-Exclusive	1700.0	\N	2017-06-17 11:22:03.227664	2017-06-17 11:22:03.227664
1751	122	8	446	1.0	125.00		VAT-Inclusive	125.0	\N	2017-06-17 11:23:55.361864	2017-06-17 11:23:55.361864
1752	122	8	446	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-17 11:24:19.127777	2017-06-17 11:24:19.127777
1753	122	8	446	10.0	88.00		VAT-Inclusive	880.0	\N	2017-06-17 11:24:52.868466	2017-06-17 11:24:52.868466
1754	122	8	446	2.0	16.00		VAT-Inclusive	32.0	\N	2017-06-17 11:25:26.519675	2017-06-17 11:25:26.519675
1755	122	8	446	2.0	18.00		VAT-Inclusive	36.0	\N	2017-06-17 11:26:01.20949	2017-06-17 11:26:01.20949
1756	122	8	446	1.0	190.00		VAT-Inclusive	190.0	\N	2017-06-17 11:27:26.828431	2017-06-17 11:27:26.828431
1757	122	8	446	2.0	60.00		VAT-Inclusive	120.0	\N	2017-06-17 11:28:10.545756	2017-06-17 11:28:10.545756
1758	123	8	446	2.0	25.00		VAT-Inclusive	50.0	\N	2017-06-17 11:28:54.193631	2017-06-17 11:28:54.193631
1759	123	8	446	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-17 11:29:29.30541	2017-06-17 11:29:29.30541
1760	123	8	446	2.0	15.00		VAT-Inclusive	30.0	\N	2017-06-17 11:29:54.440649	2017-06-17 11:29:54.440649
1761	121	8	447	1.0	8082.00		VAT-Inclusive	8082.0	\N	2017-06-17 11:31:33.195958	2017-06-17 11:31:33.195958
1762	131	8	449	1.0	112.00	Sm to S1 Open Market	VAT-Inclusive	112.0	\N	2017-06-18 08:56:26.279824	2017-06-18 08:56:26.279824
1763	137	8	449	14.0	50.00	Che, Jerlyn,  Lou, Sharlaine, Don Renz, Jethro, Rodel, Renz, Miko, Santos, Alvin, Danna	VAT-Exempted	700.0	\N	2017-06-18 08:58:36.420934	2017-06-18 08:58:36.420934
1766	123	8	449	3.0	15.00	Petty cash Voucher	VAT-Inclusive	45.0	\N	2017-06-18 09:05:39.026259	2017-06-18 09:05:39.026259
1767	121	8	449	1.0	259.00	Plastic Spoon, Fork,  Paper bag	VAT-Inclusive	259.0	\N	2017-06-18 09:08:33.547811	2017-06-18 09:08:33.547811
1768	123	8	449	1.0	700.00	Journal Paper	VAT-Inclusive	700.0	\N	2017-06-18 09:09:18.229819	2017-06-18 09:09:18.229819
1769	122	8	449	1.0	249.00	Joy and Powder	VAT-Inclusive	249.0	\N	2017-06-18 09:10:52.692411	2017-06-18 09:10:52.692411
1770	122	8	449	1.0	1120.00	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-06-18 09:12:10.596384	2017-06-18 09:12:10.596384
1771	137	8	450	10.0	50.00	Jerlyn, Lou, Sharlaine, Don renz, Jethro, Maureen, Rodel, Renz, Alvin, Danna	VAT-Exempted	500.0	\N	2017-06-18 09:22:28.819902	2017-06-18 09:22:28.819902
1774	32	1	452	3.0	62.00		VAT-Exempted	186.0	\N	2017-06-18 15:10:56.4598	2017-06-18 15:10:56.4598
1781	47	2	454	60.0	46.88		VAT-Exclusive	2812.5	\N	2017-06-21 08:39:24.975623	2017-06-21 08:39:24.975623
1793	23	1	459	0.1	700.00		VAT-Exempted	70.0	\N	2017-06-21 09:02:51.911775	2017-06-21 09:02:51.911775
1801	31	1	459	0.38	160.00		VAT-Exempted	60.8	\N	2017-06-21 12:07:39.271813	2017-06-21 12:07:39.271813
1805	35	1	459	0.25	180.00		VAT-Exempted	45.0	\N	2017-06-21 12:11:30.696948	2017-06-21 12:11:30.696948
1808	25	1	461	10.0	75.00		VAT-Inclusive	750.0	\N	2017-06-21 12:21:21.575573	2017-06-21 12:21:21.575573
1811	82	1	462	1.0	513.02		VAT-Inclusive	513.02	\N	2017-06-21 12:27:42.191605	2017-06-21 12:27:42.191605
1817	42	8	465	20.0	4.50		VAT-Inclusive	90.0	\N	2017-06-21 12:38:53.905324	2017-06-21 12:38:53.905324
1824	34	1	469	2.0	120.00		VAT-Exempted	240.0	\N	2017-06-21 12:51:59.828687	2017-06-21 12:51:59.828687
1825	32	1	469	3.0	60.00		VAT-Exempted	180.0	\N	2017-06-21 12:52:35.807972	2017-06-21 12:52:35.807972
1827	30	8	469	10.0	20.00		VAT-Exempted	200.0	\N	2017-06-21 12:53:55.912418	2017-06-21 12:53:55.912418
1833	104	9	472	72.0	28.00		VAT-Inclusive	2016.0	\N	2017-06-21 16:51:20.120801	2017-06-21 16:51:20.120801
1844	36	1	475	3.0	40.00		VAT-Exempted	120.0	\N	2017-06-23 08:22:43.424238	2017-06-23 08:22:43.424238
1847	27	1	475	0.5	140.00		VAT-Exempted	70.0	\N	2017-06-23 08:25:34.573205	2017-06-23 08:25:34.573205
1850	124	8	476	9.0	120.00		VAT-Inclusive	1080.0	\N	2017-06-23 09:51:07.030354	2017-06-23 09:51:07.030354
1851	131	8	476	1.0	105.00	Office to S1 for Documents	VAT-Inclusive	105.0	\N	2017-06-23 09:52:18.73782	2017-06-23 09:52:18.73782
1853	130	8	476	1.0	10.00	Print of PCF	VAT-Inclusive	10.0	\N	2017-06-23 09:53:20.509203	2017-06-23 09:53:20.509203
1855	99	7	477	3.0	24.00	3 Pepsi Reg.	VAT-Inclusive	72.0	\N	2017-06-23 09:56:19.665693	2017-06-23 09:56:19.665693
1856	49	6	477	3.0	198.00		VAT-Inclusive	594.0	\N	2017-06-23 09:57:04.098192	2017-06-23 09:57:04.098192
1858	73	12	477	43.68	10.18		VAT-Inclusive	444.6	\N	2017-06-23 09:59:37.375802	2017-06-23 09:59:37.375802
1864	71	12	477	7.04	15.31		VAT-Inclusive	107.8	\N	2017-06-23 10:04:28.900522	2017-06-23 10:04:28.900522
1867	131	8	477	1.0	92.00	Landmark to S1 Open Market	VAT-Inclusive	92.0	\N	2017-06-23 10:09:36.953973	2017-06-23 10:09:36.953973
1878	124	8	479	1.0	88.00		VAT-Inclusive	88.0	\N	2017-06-23 10:44:41.600225	2017-06-23 10:44:41.600225
1881	130	8	479	1.0	100.00	Transmittal\r\n	VAT-Inclusive	100.0	\N	2017-06-23 10:47:05.592194	2017-06-23 10:47:05.592194
1885	122	8	480	1.0	89.00	Joy	VAT-Inclusive	89.0	\N	2017-06-23 11:03:37.382165	2017-06-23 11:03:37.382165
1894	123	8	482	2.0	35.00		VAT-Inclusive	70.0	\N	2017-06-23 19:35:24.784013	2017-06-23 19:35:24.784013
1899	33	1	485	0.2	280.00		VAT-Exempted	56.0	\N	2017-06-24 10:27:51.06614	2017-06-24 10:27:51.06614
1900	20	1	485	0.1	150.00		VAT-Exempted	15.0	\N	2017-06-24 10:28:50.839648	2017-06-24 10:28:50.839648
1903	25	1	486	10.0	75.00		VAT-Inclusive	750.0	\N	2017-06-24 10:33:58.41208	2017-06-24 10:33:58.41208
1916	32	1	492	4.0	60.00		VAT-Exempted	240.0	\N	2017-06-27 08:43:49.142784	2017-06-27 08:43:49.142784
1772	137	8	451	7.0	50.00	Danna,  Miko, Lou, Jethro, Che, Santos, Sharlaine	VAT-Exempted	350.0	\N	2017-06-18 09:27:49.010181	2017-06-18 09:27:49.010181
1776	33	1	452	0.1	268.00		VAT-Exempted	26.8	\N	2017-06-18 15:12:00.735721	2017-06-18 15:12:00.735721
1780	46	2	454	4.0	165.18		VAT-Exclusive	660.71	\N	2017-06-21 08:38:17.484006	2017-06-21 08:38:17.484006
1788	38	6	454	6.0	111.61		VAT-Exclusive	669.64	\N	2017-06-21 08:45:15.352443	2017-06-21 08:45:15.352443
1795	36	1	459	2.0	45.00		VAT-Exempted	90.0	\N	2017-06-21 09:04:29.97845	2017-06-21 09:04:29.97845
1797	27	1	459	0.5	160.00		VAT-Exempted	80.0	\N	2017-06-21 12:02:31.460613	2017-06-21 12:02:31.460613
1802	21	1	459	4.0	45.00		VAT-Exempted	180.0	\N	2017-06-21 12:08:43.911856	2017-06-21 12:08:43.911856
1803	20	1	459	0.1	170.00		VAT-Exempted	17.0	\N	2017-06-21 12:09:40.685181	2017-06-21 12:09:40.685181
1812	9	1	463	70.3	151.00		VAT-Exempted	10615.0	\N	2017-06-21 12:30:59.556087	2017-06-21 12:30:59.556087
1813	8	1	463	30.44	179.00		VAT-Exempted	5448.76	\N	2017-06-21 12:31:52.275621	2017-06-21 12:31:52.275621
1818	43	8	465	30.0	6.60		VAT-Inclusive	198.0	\N	2017-06-21 12:39:41.103528	2017-06-21 12:39:41.103528
1819	44	8	465	75.0	4.72		VAT-Inclusive	354.0	\N	2017-06-21 12:40:18.419685	2017-06-21 12:40:18.419685
1822	56	1	468	125.0	93.00		VAT-Inclusive	11625.0	\N	2017-06-21 12:48:59.279498	2017-06-21 12:48:59.279498
1828	22	1	469	0.25	50.00		VAT-Exempted	12.5	\N	2017-06-21 12:54:43.280187	2017-06-21 12:54:43.280187
1839	33	1	475	0.3	280.00		VAT-Exempted	84.0	\N	2017-06-23 08:18:40.973082	2017-06-23 08:18:40.973082
1857	74	12	477	70.08	6.94		VAT-Inclusive	486.3	\N	2017-06-23 09:58:48.932868	2017-06-23 09:58:48.932868
1860	93	1	477	2.0	55.65		VAT-Inclusive	111.3	\N	2017-06-23 10:01:03.610598	2017-06-23 10:01:03.610598
1876	137	8	479	13.0	50.00	Che, Lou, Jethro, Mau, Rodel, Dana, Renz, Alvin, Jerlyn, Sharlaine, Miko, Santos	VAT-Exempted	650.0	\N	2017-06-23 10:41:50.136343	2017-06-23 10:41:50.136343
1877	122	8	479	1.0	46.00	Bleach	VAT-Inclusive	46.0	\N	2017-06-23 10:42:16.578977	2017-06-23 10:42:16.578977
1884	124	8	480	13.0	120.00		VAT-Inclusive	1560.0	\N	2017-06-23 11:02:28.423794	2017-06-23 11:02:28.423794
1886	131	8	480	1.0	140.00	LES to S1 borrow Waffle Cut	VAT-Inclusive	140.0	\N	2017-06-23 11:04:24.428035	2017-06-23 11:04:24.428035
1887	129	8	480	1.0	6000.00	Labor and Materials for Fresh air Repair and  Cleaning	VAT-Inclusive	6000.0	\N	2017-06-23 11:06:04.33956	2017-06-23 11:06:04.33956
1889	122	8	482	1.0	125.00		VAT-Inclusive	125.0	\N	2017-06-23 19:30:51.411431	2017-06-23 19:30:51.411431
1895	123	8	482	1.0	15.00		VAT-Inclusive	15.0	\N	2017-06-23 19:35:54.611023	2017-06-23 19:35:54.611023
1902	31	1	485	0.5	180.00		VAT-Exempted	90.0	\N	2017-06-24 10:30:17.584322	2017-06-24 10:30:17.584322
1905	9	1	487	58.24	149.00		VAT-Exempted	8677.76	\N	2017-06-24 10:38:12.79269	2017-06-24 10:38:12.79269
1907	134	8	488	1.0	1460.00	National Wing Day	VAT-Inclusive	1460.0	\N	2017-06-25 06:57:17.378354	2017-06-25 06:57:17.378354
1909	58	1	489	3.0	290.00		VAT-Inclusive	870.0	\N	2017-06-25 07:07:13.299249	2017-06-25 07:07:13.299249
1911	4	1	470	11.5	310.22		VAT-Inclusive	3567.49	\N	2017-06-25 10:59:00.935723	2017-06-25 10:59:00.935723
1914	137	8	491	4.0	50.00	Sharlaine, Che, Miko, Renz	VAT-Exempted	200.0	\N	2017-06-25 14:46:15.450805	2017-06-25 14:46:15.450805
1917	33	1	492	0.3	280.00		VAT-Exempted	84.0	\N	2017-06-27 08:44:27.941098	2017-06-27 08:44:27.941098
1919	34	1	492	1.0	120.00		VAT-Exempted	120.0	\N	2017-06-27 08:51:10.378858	2017-06-27 08:51:10.378858
1921	39	2	493	35.0	55.36		VAT-Exclusive	1937.5	\N	2017-06-27 08:57:41.935136	2017-06-27 08:57:41.935136
1773	36	1	452	3.0	53.00		VAT-Exempted	159.0	\N	2017-06-18 15:10:30.174391	2017-06-18 15:10:30.174391
1775	30	8	452	8.0	8.17		VAT-Exempted	65.37	\N	2017-06-18 15:11:34.574496	2017-06-18 15:11:34.574496
1777	8	2	363	44.13	81.37		VAT-Exempted	3590.74	\N	2017-06-18 15:53:56.897181	2017-06-18 15:53:56.897181
1782	64	5	454	1.0	468.75		VAT-Exclusive	468.75	\N	2017-06-21 08:40:25.901592	2017-06-21 08:40:25.901592
1786	69	6	454	12.0	196.43		VAT-Exclusive	2357.15	\N	2017-06-21 08:43:29.498854	2017-06-21 08:43:29.498854
1787	70	6	454	2.0	241.07		VAT-Exclusive	482.14	\N	2017-06-21 08:44:25.061541	2017-06-21 08:44:25.061541
1790	77	9	456	2.0	214.29		VAT-Exclusive	428.57	\N	2017-06-21 08:53:09.238988	2017-06-21 08:53:09.238988
1796	34	1	459	3.0	120.00		VAT-Exempted	360.0	\N	2017-06-21 12:00:58.834855	2017-06-21 12:00:58.834855
1807	14	1	461	1.0	270.00		VAT-Inclusive	270.0	\N	2017-06-21 12:20:16.25355	2017-06-21 12:20:16.25355
1809	26	1	461	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-06-21 12:23:00.426537	2017-06-21 12:23:00.426537
1815	36	1	464	2.0	53.00		VAT-Exempted	106.0	\N	2017-06-21 12:35:22.847869	2017-06-21 12:35:22.847869
1820	9	1	467	34.14	149.00		VAT-Exempted	5086.86	\N	2017-06-21 12:45:22.073165	2017-06-21 12:45:22.073165
1823	21	1	469	5.0	55.00		VAT-Exempted	275.0	\N	2017-06-21 12:51:06.191737	2017-06-21 12:51:06.191737
1832	97	9	471	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-06-21 16:48:56.309927	2017-06-21 16:48:56.309927
1834	103	9	472	120.0	30.63		VAT-Inclusive	3675.0	\N	2017-06-21 16:52:48.069933	2017-06-21 16:52:48.069933
1836	32	1	474	3.0	57.00		VAT-Exempted	171.0	\N	2017-06-23 08:14:22.83417	2017-06-23 08:14:22.83417
1837	33	1	474	0.2	268.00		VAT-Exempted	53.6	\N	2017-06-23 08:15:16.593871	2017-06-23 08:15:16.593871
1841	32	1	475	6.0	60.00		VAT-Exempted	360.0	\N	2017-06-23 08:20:34.704728	2017-06-23 08:20:34.704728
1845	34	1	475	1.5	120.00		VAT-Exempted	180.0	\N	2017-06-23 08:23:55.04209	2017-06-23 08:23:55.04209
1852	130	8	476	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-06-23 09:52:46.665217	2017-06-23 09:52:46.665217
1861	92	1	477	3.0	47.25		VAT-Inclusive	141.75	\N	2017-06-23 10:01:26.457645	2017-06-23 10:01:26.457645
1862	76	4	477	52.0	17.73		VAT-Inclusive	921.7	\N	2017-06-23 10:02:16.692417	2017-06-23 10:02:16.692417
1865	41	12	477	42.0	8.00		VAT-Inclusive	336.0	\N	2017-06-23 10:06:42.6066	2017-06-23 10:06:42.6066
1868	137	8	477	13.0	50.00	Rodel, Alvin, Dana, Renz, Che, Lou, Jethro, Mau, Sharlaine, Jerlyn, Miko, Santos	VAT-Exempted	650.0	\N	2017-06-23 10:10:48.178917	2017-06-23 10:10:48.178917
1870	134	8	478	1.0	2220.00	Print  and Photocopy of LSM Voucher and Certificate	VAT-Inclusive	2220.0	\N	2017-06-23 10:29:02.885741	2017-06-23 10:29:02.885741
1871	122	8	478	1.0	60.00	detergent powder	VAT-Inclusive	60.0	\N	2017-06-23 10:31:33.776557	2017-06-23 10:31:33.776557
1872	137	8	478	14.0	50.00	Myrtle, Che, Rodel, Lou, Jethro, Mau, Renz, Alvin, Dana, sharlaine, Jerlyn, Miko, Santos	VAT-Exempted	700.0	\N	2017-06-23 10:34:15.595981	2017-06-23 10:34:15.595981
1874	131	8	478	1.0	51.00	G5 to S1 Borrow bacon	VAT-Inclusive	51.0	\N	2017-06-23 10:35:56.659311	2017-06-23 10:35:56.659311
1875	131	8	479	1.0	55.00	Guadalupe to S1 Open Market Restaurant Supplies	VAT-Inclusive	55.0	\N	2017-06-23 10:39:58.495401	2017-06-23 10:39:58.495401
1879	121	8	479	1.0	725.00	Paper bag and Lids	VAT-Inclusive	725.0	\N	2017-06-23 10:45:28.573966	2017-06-23 10:45:28.573966
1880	122	8	479	1.0	170.00	Broom	VAT-Inclusive	170.0	\N	2017-06-23 10:46:12.595867	2017-06-23 10:46:12.595867
1883	137	8	480	14.0	50.00	Lou, Alvin, Che, Rodel, Miko, Santos, Jerlyn, Sharlaine, Dana, Jethro, Mau, Renz	VAT-Exempted	700.0	\N	2017-06-23 10:53:28.004878	2017-06-23 10:53:28.004878
1893	123	8	482	1.0	25.00		VAT-Inclusive	25.0	\N	2017-06-23 19:34:18.678864	2017-06-23 19:34:18.678864
1906	8	1	487	3.4	179.00		VAT-Exempted	608.6	\N	2017-06-24 10:39:48.473457	2017-06-24 10:39:48.473457
1922	46	2	493	4.0	165.18		VAT-Exclusive	660.71	\N	2017-06-27 08:58:52.145976	2017-06-27 08:58:52.145976
1923	47	2	493	40.0	46.88		VAT-Exclusive	1875.0	\N	2017-06-27 09:00:05.384192	2017-06-27 09:00:05.384192
1779	39	2	454	55.0	55.36		VAT-Exclusive	3044.65	\N	2017-06-21 08:36:30.59429	2017-06-21 08:36:30.59429
1789	67	5	455	1.0	758.93		VAT-Exclusive	758.93	\N	2017-06-21 08:48:29.951275	2017-06-21 08:48:29.951275
1791	67	5	457	1.0	758.93		VAT-Exclusive	758.93	\N	2017-06-21 08:56:33.096766	2017-06-21 08:56:33.096766
1792	7	1	458	24.0	220.00		VAT-Exempted	5280.0	\N	2017-06-21 09:00:02.850674	2017-06-21 09:00:02.850674
1794	32	1	459	3.0	60.00		VAT-Exempted	180.0	\N	2017-06-21 09:03:39.171885	2017-06-21 09:03:39.171885
1798	33	1	459	0.2	250.00		VAT-Exempted	50.0	\N	2017-06-21 12:03:27.567405	2017-06-21 12:03:27.567405
1804	61	1	459	30.0	45.00		VAT-Exempted	1350.0	\N	2017-06-21 12:10:39.546927	2017-06-21 12:10:39.546927
1806	94	1	460	14.85	116.07		VAT-Inclusive	1723.66	\N	2017-06-21 12:16:14.172353	2017-06-21 12:16:14.172353
1810	37	8	462	180.0	3.86		VAT-Inclusive	695.0	\N	2017-06-21 12:26:47.723117	2017-06-21 12:26:47.723117
1814	21	1	464	5.0	59.00		VAT-Exempted	295.0	\N	2017-06-21 12:34:45.870615	2017-06-21 12:34:45.870615
1816	30	8	464	8.0	8.58		VAT-Exempted	68.6	\N	2017-06-21 12:36:39.316741	2017-06-21 12:36:39.316741
1821	8	1	467	30.14	179.00		VAT-Exempted	5395.06	\N	2017-06-21 12:46:19.566061	2017-06-21 12:46:19.566061
1826	36	1	469	2.0	40.00		VAT-Exempted	80.0	\N	2017-06-21 12:53:16.889645	2017-06-21 12:53:16.889645
1829	27	1	469	0.25	140.00		VAT-Exempted	35.0	\N	2017-06-21 12:55:24.169613	2017-06-21 12:55:24.169613
1830	61	1	469	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-21 12:56:06.434652	2017-06-21 12:56:06.434652
1831	5	1	470	28.5	298.14		VAT-Inclusive	8496.99	\N	2017-06-21 12:58:41.264338	2017-06-21 12:58:41.264338
1835	99	7	473	120.0	17.41		VAT-Exclusive	2089.28	\N	2017-06-21 16:55:58.690985	2017-06-21 16:55:58.690985
1840	30	8	475	20.0	15.00		VAT-Exempted	300.0	\N	2017-06-23 08:19:44.456516	2017-06-23 08:19:44.456516
1842	22	1	475	0.25	50.00		VAT-Exempted	12.5	\N	2017-06-23 08:21:42.619226	2017-06-23 08:21:42.619226
1846	23	1	475	0.1	700.00		VAT-Exempted	70.0	\N	2017-06-23 08:24:40.704715	2017-06-23 08:24:40.704715
1848	61	1	475	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-23 08:26:26.203733	2017-06-23 08:26:26.203733
1849	137	8	476	14.0	50.00	Lou, Che, Jethro, Mau, Rodel, Renz, Dana, Alvin, Jerlyn, Eugene, Miko, Santos. 	VAT-Exempted	700.0	\N	2017-06-23 09:50:30.946975	2017-06-23 09:50:30.946975
1854	131	8	476	1.0	53.00	G5 to S1 borrow Cheese Sauce	VAT-Inclusive	53.0	\N	2017-06-23 09:54:18.055713	2017-06-23 09:54:18.055713
1859	72	6	477	1.0	36.75		VAT-Inclusive	36.75	\N	2017-06-23 10:00:20.569714	2017-06-23 10:00:20.569714
1863	55	12	477	7.0	18.63		VAT-Inclusive	130.4	\N	2017-06-23 10:03:11.002864	2017-06-23 10:03:11.002864
1866	10	2	477	20.3	75.03		VAT-Inclusive	1523.15	\N	2017-06-23 10:09:00.251762	2017-06-23 10:09:00.251762
1869	130	8	477	1.0	145.00	Print of Handouts and build Cards for Roll Out	VAT-Inclusive	145.0	\N	2017-06-23 10:13:10.435635	2017-06-23 10:13:10.435635
1873	123	8	478	1.0	136.00	Scotch tape and double Sided tape	VAT-Inclusive	136.0	\N	2017-06-23 10:34:56.977355	2017-06-23 10:34:56.977355
1882	130	8	479	1.0	120.00	Lamination Of Build Cards	VAT-Inclusive	120.0	\N	2017-06-23 10:48:27.209076	2017-06-23 10:48:27.209076
1888	121	8	481	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-06-23 19:28:25.440064	2017-06-23 19:28:25.440064
1890	122	8	482	1.0	290.00		VAT-Inclusive	290.0	\N	2017-06-23 19:32:26.562333	2017-06-23 19:32:26.562333
1891	122	8	482	1.0	35.00		VAT-Inclusive	35.0	\N	2017-06-23 19:32:57.307144	2017-06-23 19:32:57.307144
1892	122	8	482	7.0	88.00		VAT-Inclusive	616.0	\N	2017-06-23 19:33:28.080689	2017-06-23 19:33:28.080689
1896	121	8	483	1.0	5769.00		VAT-Inclusive	5769.0	\N	2017-06-23 19:38:02.619105	2017-06-23 19:38:02.619105
1897	94	1	484	14.85	116.09		VAT-Inclusive	1724.0	\N	2017-06-24 10:24:36.866456	2017-06-24 10:24:36.866456
1898	30	8	485	20.0	20.00		VAT-Exempted	400.0	\N	2017-06-24 10:26:59.13156	2017-06-24 10:26:59.13156
1904	26	1	486	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-06-24 10:35:03.62981	2017-06-24 10:35:03.62981
1908	137	8	489	7.0	50.00	Jerlyn, Rodel, Alvin, Dana, Jethro, Maureen, Lou	VAT-Exempted	350.0	\N	2017-06-25 07:03:03.736918	2017-06-25 07:03:03.736918
1910	131	8	489	1.0	106.00	S1 to LES Transfer Wings	VAT-Inclusive	106.0	\N	2017-06-25 07:09:59.581842	2017-06-25 07:09:59.581842
1912	9	1	490	12.16	149.00		VAT-Exempted	1811.84	\N	2017-06-25 11:10:47.607647	2017-06-25 11:10:47.607647
1913	8	1	490	24.9	179.00		VAT-Exempted	4457.1	\N	2017-06-25 11:11:23.500722	2017-06-25 11:11:23.500722
1915	76	4	491	16.0	17.90		VAT-Inclusive	286.4	\N	2017-06-25 14:46:49.45425	2017-06-25 14:46:49.45425
1918	61	1	492	30.0	44.00		VAT-Exempted	1320.0	\N	2017-06-27 08:45:18.254108	2017-06-27 08:45:18.254108
1920	30	8	492	20.0	10.00		VAT-Exempted	200.0	\N	2017-06-27 08:51:55.958886	2017-06-27 08:51:55.958886
1924	64	5	493	1.0	468.75		VAT-Exclusive	468.75	\N	2017-06-27 09:01:06.150259	2017-06-27 09:01:06.150259
1925	68	5	493	3.0	580.36		VAT-Exclusive	1741.07	\N	2017-06-27 09:02:05.194844	2017-06-27 09:02:05.194844
1926	69	6	493	8.0	196.43		VAT-Exclusive	1571.43	\N	2017-06-27 09:03:05.236469	2017-06-27 09:03:05.236469
1927	80	2	493	2.0	171.88		VAT-Exclusive	343.75	\N	2017-06-27 09:04:29.867276	2017-06-27 09:04:29.867276
1929	67	5	495	1.0	758.93		VAT-Exclusive	758.93	\N	2017-06-27 09:10:26.19673	2017-06-27 09:10:26.19673
1930	32	1	496	1.0	57.00		VAT-Exempted	57.0	\N	2017-06-27 09:12:52.937116	2017-06-27 09:12:52.937116
1931	34	1	496	1.0	73.00		VAT-Exempted	73.0	\N	2017-06-27 09:14:07.315504	2017-06-27 09:14:07.315504
1932	36	1	496	1.0	29.00		VAT-Exempted	29.0	\N	2017-06-27 09:15:06.485412	2017-06-27 09:15:06.485412
1933	27	1	496	1.0	103.00		VAT-Exempted	103.0	\N	2017-06-27 09:15:57.054823	2017-06-27 09:15:57.054823
1934	97	9	497	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-06-28 17:28:07.282806	2017-06-28 17:28:07.282806
1935	121	8	498	1.0	2150.25		VAT-Inclusive	2150.25	\N	2017-06-28 17:31:56.657639	2017-06-28 17:31:56.657639
1936	122	8	499	1.0	1417.00		VAT-Inclusive	1417.0	\N	2017-06-28 17:35:57.914377	2017-06-28 17:35:57.914377
1937	123	8	499	1.0	196.00		VAT-Inclusive	196.0	\N	2017-06-28 17:36:47.077415	2017-06-28 17:36:47.077415
1938	104	9	500	96.0	28.00		VAT-Inclusive	2688.0	\N	2017-06-28 17:40:04.614471	2017-06-28 17:40:04.614471
1939	103	9	500	120.0	30.63		VAT-Inclusive	3675.0	\N	2017-06-28 17:40:42.142841	2017-06-28 17:40:42.142841
1940	137	8	501	9.0	50.00		VAT-Exempted	450.0	\N	2017-06-30 13:42:58.031271	2017-06-30 13:42:58.031271
1941	130	8	501	1.0	38.00	Print of PCF	VAT-Inclusive	38.0	\N	2017-06-30 13:43:42.782942	2017-06-30 13:43:42.782942
1942	121	8	501	1.0	305.00	Plastic Spoon, Fork, Knife	VAT-Inclusive	305.0	\N	2017-06-30 13:44:27.428231	2017-06-30 13:44:27.428231
1943	122	8	501	1.0	15.00	Powder	VAT-Inclusive	15.0	\N	2017-06-30 13:45:21.407332	2017-06-30 13:45:21.407332
1944	131	8	502	1.0	50.00	Guadalupe to S1 Market Restaurant Supplies	VAT-Inclusive	50.0	\N	2017-06-30 13:47:56.225925	2017-06-30 13:47:56.225925
1945	121	8	502	1.0	794.00	520 Lids, 80ml Lids, 260lids, #8 and #16	VAT-Inclusive	794.0	\N	2017-06-30 13:49:33.604143	2017-06-30 13:49:33.604143
1946	124	8	502	8.0	120.00		VAT-Inclusive	960.0	\N	2017-06-30 13:50:07.917566	2017-06-30 13:50:07.917566
1947	137	8	502	11.0	50.00		VAT-Exempted	550.0	\N	2017-06-30 13:50:35.365337	2017-06-30 13:50:35.365337
1948	130	8	502	1.0	160.35	Sucktion Hook, and table stopper	VAT-Inclusive	160.35	\N	2017-06-30 13:51:32.40032	2017-06-30 13:51:32.40032
1949	130	8	502	2.0	125.00	Transmittal and Payslip	VAT-Inclusive	250.0	\N	2017-06-30 13:52:05.06148	2017-06-30 13:52:05.06148
1950	123	8	502	3.0	23.75	Log Notebooks	VAT-Inclusive	71.25	\N	2017-06-30 13:53:09.263917	2017-06-30 13:53:09.263917
1951	122	8	502	1.0	30.00	powder	VAT-Inclusive	30.0	\N	2017-06-30 13:57:26.198867	2017-06-30 13:57:26.198867
1952	17	7	503	1.0	241.00		VAT-Inclusive	241.0	\N	2017-06-30 14:01:21.194536	2017-06-30 14:01:21.194536
1953	74	12	503	23.36	6.94		VAT-Inclusive	162.1	\N	2017-06-30 14:04:48.37602	2017-06-30 14:04:48.37602
1954	49	6	503	2.0	198.00		VAT-Inclusive	396.0	\N	2017-06-30 14:05:34.248351	2017-06-30 14:05:34.248351
1955	37	8	503	60.0	4.33		VAT-Inclusive	259.5	\N	2017-06-30 14:06:07.138779	2017-06-30 14:06:07.138779
1958	131	8	503	1.0	92.00	SM to  S1 Open market	VAT-Inclusive	92.0	\N	2017-06-30 14:10:14.422591	2017-06-30 14:10:14.422591
1960	124	8	503	3.0	120.00		VAT-Inclusive	360.0	\N	2017-06-30 14:15:19.06772	2017-06-30 14:15:19.06772
1963	137	8	504	13.0	50.00		VAT-Exempted	650.0	\N	2017-06-30 14:22:18.805553	2017-06-30 14:22:18.805553
1969	121	8	504	1.0	581.50	8oz cups	VAT-Inclusive	581.5	\N	2017-06-30 14:26:57.753023	2017-06-30 14:26:57.753023
1976	121	8	505	1.0	609.50	8oz cups	VAT-Inclusive	609.5	\N	2017-06-30 14:39:24.773741	2017-06-30 14:39:24.773741
1977	123	8	505	1.0	500.00	Flash drive	VAT-Inclusive	500.0	\N	2017-06-30 14:39:56.420212	2017-06-30 14:39:56.420212
1978	131	8	505	1.0	200.00	LES to S1 Transfer wings	VAT-Inclusive	200.0	\N	2017-06-30 14:40:28.469342	2017-06-30 14:40:28.469342
1982	21	1	506	7.0	50.00		VAT-Exempted	350.0	\N	2017-06-30 14:44:02.281191	2017-06-30 14:44:02.281191
1984	22	1	506	0.25	50.00		VAT-Exempted	12.5	\N	2017-06-30 14:44:44.170336	2017-06-30 14:44:44.170336
1987	32	1	507	6.0	60.00		VAT-Exempted	360.0	\N	2017-06-30 14:47:26.379847	2017-06-30 14:47:26.379847
1994	22	1	507	0.25	50.00		VAT-Exempted	12.5	\N	2017-06-30 14:50:33.663776	2017-06-30 14:50:33.663776
2003	7	1	512	24.0	220.00		VAT-Exempted	5280.0	\N	2017-06-30 15:03:58.743665	2017-06-30 15:03:58.743665
2004	97	9	513	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-06-30 15:06:19.242146	2017-06-30 15:06:19.242146
2005	105	9	514	24.0	90.00		VAT-Inclusive	2160.0	\N	2017-06-30 19:23:22.92038	2017-06-30 19:23:22.92038
2009	109	12	514	60.0	5.83		VAT-Inclusive	350.0	\N	2017-06-30 19:27:44.9718	2017-06-30 19:27:44.9718
2023	137	8	517	6.0	50.00		VAT-Exempted	300.0	\N	2017-07-02 09:43:08.323715	2017-07-02 09:43:08.323715
2032	53	5	517	1.0	648.00		VAT-Inclusive	648.0	\N	2017-07-02 10:04:59.980927	2017-07-02 10:04:59.980927
2035	37	8	517	120.0	4.33		VAT-Inclusive	519.0	\N	2017-07-02 10:13:52.059712	2017-07-02 10:13:52.059712
2044	8	1	520	18.24	179.00		VAT-Exempted	3264.96	\N	2017-07-02 11:29:12.819653	2017-07-02 11:29:12.819653
2046	3	1	521	7.0	340.00		VAT-Inclusive	2380.0	\N	2017-07-02 11:31:06.060111	2017-07-02 11:31:06.060111
2050	97	9	523	18.0	274.00		VAT-Inclusive	4932.0	\N	2017-07-04 18:47:13.55711	2017-07-04 18:47:13.55711
2054	121	8	526	1.0	6769.00		VAT-Inclusive	6769.0	\N	2017-07-04 18:59:29.494876	2017-07-04 18:59:29.494876
2056	122	8	527	1.0	738.00		VAT-Inclusive	738.0	\N	2017-07-04 19:05:02.175994	2017-07-04 19:05:02.175994
2066	73	12	528	41.76	10.63		VAT-Inclusive	443.7	\N	2017-07-05 10:40:51.275225	2017-07-05 10:40:51.275225
2067	92	1	528	1.0	46.20		VAT-Inclusive	46.2	\N	2017-07-05 10:41:32.261306	2017-07-05 10:41:32.261306
2070	10	2	528	7.43	75.00		VAT-Inclusive	557.25	\N	2017-07-05 10:49:23.840118	2017-07-05 10:49:23.840118
2073	131	8	528	1.0	108.00	LES to S1(borrow cheese sauce)\r\n	VAT-Inclusive	108.0	\N	2017-07-05 10:53:49.70628	2017-07-05 10:53:49.70628
2075	131	8	528	1.0	110.00	LES to S1(transfer small wares)	VAT-Inclusive	110.0	\N	2017-07-05 10:56:49.590629	2017-07-05 10:56:49.590629
2081	137	8	530	11.0	50.00	Che,Sha,Lou ,Mau,Rodel,Santos,Dana,Jethro,Je,Alvin and Miko	VAT-Exempted	550.0	\N	2017-07-05 11:14:04.972551	2017-07-05 11:14:04.972551
2083	130	8	530	1.0	83.00	Battery for Weighing Scale	VAT-Inclusive	83.0	\N	2017-07-05 11:16:59.973127	2017-07-05 11:16:59.973127
2084	130	8	530	1.0	25.00	Print  of Delivery Summary	VAT-Inclusive	25.0	\N	2017-07-05 11:17:59.578188	2017-07-05 11:17:59.578188
2085	6	1	531	10.04	365.00		VAT-Inclusive	3664.6	\N	2017-07-05 12:14:45.164549	2017-07-05 12:14:45.164549
2086	4	1	531	5.0	285.00		VAT-Inclusive	1425.0	\N	2017-07-05 12:17:10.768851	2017-07-05 12:17:10.768851
2087	4	1	531	2.5	380.00		VAT-Inclusive	950.0	\N	2017-07-05 12:17:39.134914	2017-07-05 12:17:39.134914
2088	36	1	532	3.0	50.00		VAT-Exempted	150.0	\N	2017-07-05 12:20:14.162183	2017-07-05 12:20:14.162183
2091	33	1	532	0.2	280.00		VAT-Exempted	56.0	\N	2017-07-05 12:23:49.31624	2017-07-05 12:23:49.31624
2095	61	1	532	25.0	44.00		VAT-Exempted	1100.0	\N	2017-07-05 12:26:16.053852	2017-07-05 12:26:16.053852
2100	26	1	534	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-07-05 12:39:38.90043	2017-07-05 12:39:38.90043
2102	9	1	536	80.42	149.00		VAT-Exempted	11982.58	\N	2017-07-05 12:45:21.634138	2017-07-05 12:45:21.634138
2108	64	5	537	1.0	468.75		VAT-Exclusive	468.75	\N	2017-07-05 12:54:27.015496	2017-07-05 12:54:27.015496
2115	87	1	538	1.0	1060.57		VAT-Exclusive	1060.57	\N	2017-07-05 13:04:57.015743	2017-07-05 13:04:57.015743
2117	96	4	538	16.0	12.21		VAT-Exclusive	195.41	\N	2017-07-05 13:06:24.030633	2017-07-05 13:06:24.030633
2119	77	9	539	3.0	214.29		VAT-Exclusive	642.86	\N	2017-07-05 13:11:30.628845	2017-07-05 13:11:30.628845
2131	22	1	541	0.25	50.00		VAT-Exempted	12.5	\N	2017-07-05 13:26:59.834278	2017-07-05 13:26:59.834278
2133	5	1	542	29.48	380.00		VAT-Inclusive	11202.4	\N	2017-07-05 13:32:04.781933	2017-07-05 13:32:04.781933
2136	4	1	542	2.5	380.00		VAT-Inclusive	950.0	\N	2017-07-05 13:34:39.926165	2017-07-05 13:34:39.926165
2137	3	1	542	1.0	340.00		VAT-Inclusive	340.0	\N	2017-07-05 13:35:29.380608	2017-07-05 13:35:29.380608
2141	23	1	543	0.1	650.00		VAT-Exempted	65.0	\N	2017-07-05 13:42:05.268376	2017-07-05 13:42:05.268376
2142	36	1	543	2.0	45.00		VAT-Exempted	90.0	\N	2017-07-05 13:43:15.011931	2017-07-05 13:43:15.011931
1956	10	2	503	9.9	75.05		VAT-Inclusive	743.0	\N	2017-06-30 14:07:17.87516	2017-06-30 14:07:17.87516
1959	137	8	503	11.0	50.00		VAT-Exempted	550.0	\N	2017-06-30 14:10:51.180645	2017-06-30 14:10:51.180645
1967	131	8	504	1.0	50.00	Guadalupe to S1 market Restaurant Supplies	VAT-Inclusive	50.0	\N	2017-06-30 14:25:33.380774	2017-06-30 14:25:33.380774
1968	131	8	504	1.0	120.00	LES to S1 Borrow Bacon, LNT and F10	VAT-Inclusive	120.0	\N	2017-06-30 14:26:24.259982	2017-06-30 14:26:24.259982
1970	131	8	505	1.0	100.00	Sm to S1 Open market	VAT-Inclusive	100.0	\N	2017-06-30 14:31:23.18414	2017-06-30 14:31:23.18414
1972	33	11	505	7.32	35.25		VAT-Exempted	258.0	\N	2017-06-30 14:35:11.746631	2017-06-30 14:35:11.746631
1979	137	8	505	1.0	165.00	Snacks for Partners	VAT-Inclusive	165.0	\N	2017-06-30 14:40:55.640288	2017-06-30 14:40:55.640288
1983	61	1	506	25.0	44.00		VAT-Exempted	1100.0	\N	2017-06-30 14:44:24.923129	2017-06-30 14:44:24.923129
1985	30	8	506	10.0	20.00		VAT-Exempted	200.0	\N	2017-06-30 14:45:03.104688	2017-06-30 14:45:03.104688
1990	30	8	507	20.0	20.00		VAT-Exempted	400.0	\N	2017-06-30 14:48:31.708981	2017-06-30 14:48:31.708981
1996	27	1	507	1.0	120.00		VAT-Exempted	120.0	\N	2017-06-30 14:54:11.280816	2017-06-30 14:54:11.280816
1997	25	1	508	20.0	75.00		VAT-Inclusive	1500.0	\N	2017-06-30 14:56:07.390252	2017-06-30 14:56:07.390252
2000	18	5	510	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-06-30 14:59:32.907806	2017-06-30 14:59:32.907806
2008	113	12	514	112.0	11.16		VAT-Inclusive	1250.0	\N	2017-06-30 19:26:40.869641	2017-06-30 19:26:40.869641
2010	115	12	514	24.0	7.08		VAT-Inclusive	170.0	\N	2017-06-30 19:28:22.938946	2017-06-30 19:28:22.938946
2013	116	12	514	32.0	31.25		VAT-Inclusive	1000.0	\N	2017-06-30 19:30:08.335503	2017-06-30 19:30:08.335503
2014	117	12	514	32.0	32.81		VAT-Inclusive	1050.0	\N	2017-06-30 19:31:03.4676	2017-06-30 19:31:03.4676
2015	118	12	514	32.0	21.88		VAT-Inclusive	700.0	\N	2017-06-30 19:31:29.287125	2017-06-30 19:31:29.287125
2021	9	1	517	8.43	167.69		VAT-Exempted	1413.64	\N	2017-07-02 09:41:13.111526	2017-07-02 09:41:13.111526
2027	95	8	517	18.0	14.67		VAT-Inclusive	264.0	\N	2017-07-02 09:49:18.402601	2017-07-02 09:49:18.402601
2029	17	7	517	3.0	242.00		VAT-Inclusive	726.0	\N	2017-07-02 09:51:40.629947	2017-07-02 09:51:40.629947
2036	137	8	518	6.0	50.00		VAT-Exempted	300.0	\N	2017-07-02 10:16:11.838662	2017-07-02 10:16:11.838662
2037	131	8	518	1.0	140.00	LES to S1 Transfer Liquors	VAT-Inclusive	140.0	\N	2017-07-02 10:17:56.401033	2017-07-02 10:17:56.401033
2039	21	1	519	3.0	50.00		VAT-Exempted	150.0	\N	2017-07-02 11:23:58.629318	2017-07-02 11:23:58.629318
2041	27	1	519	0.5	120.00		VAT-Exempted	60.0	\N	2017-07-02 11:24:43.190444	2017-07-02 11:24:43.190444
2058	137	8	528	11.0	50.00	Sharlaine, Che, Lou, Mau, Dana, Santos, Rodel, Jerlyn, Jethro, Alvin, Miko	VAT-Exempted	550.0	\N	2017-07-05 10:20:00.195693	2017-07-05 10:20:00.195693
2063	72	6	528	1.0	36.75		VAT-Inclusive	36.75	\N	2017-07-05 10:29:21.541991	2017-07-05 10:29:21.541991
2068	48	1	528	0.6	161.75		VAT-Inclusive	97.05	\N	2017-07-05 10:42:57.754084	2017-07-05 10:42:57.754084
2072	130	8	528	1.0	50.00	Photocopy of Prep sheet	VAT-Inclusive	50.0	\N	2017-07-05 10:52:19.755558	2017-07-05 10:52:19.755558
2076	121	8	529	1.0	2425.00	Food Pans and Flat lids	VAT-Inclusive	2425.0	\N	2017-07-05 11:02:28.077193	2017-07-05 11:02:28.077193
2078	130	8	529	1.0	950.00	Laminate of Buid Cards and Cleaning Schedule Board	VAT-Inclusive	950.0	\N	2017-07-05 11:06:25.676172	2017-07-05 11:06:25.676172
2079	124	8	529	3.0	120.00		VAT-Inclusive	360.0	\N	2017-07-05 11:07:23.570283	2017-07-05 11:07:23.570283
2080	137	8	529	12.0	50.00	Che,Sha,Lou,Dana,Mau,Santos,Rodel,Jethro,Jerlyn,Alvin,Miko,and Rr	VAT-Exempted	600.0	\N	2017-07-05 11:09:36.316527	2017-07-05 11:09:36.316527
2103	8	1	536	29.88	179.00		VAT-Exempted	5348.52	\N	2017-07-05 12:47:22.566363	2017-07-05 12:47:22.566363
2104	39	2	537	55.0	55.36		VAT-Exclusive	3044.64	\N	2017-07-05 12:50:48.597772	2017-07-05 12:50:48.597772
2107	63	6	537	1.0	257.15		VAT-Exclusive	257.15	\N	2017-07-05 12:53:40.321176	2017-07-05 12:53:40.321176
2122	40	1	540	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-07-05 13:17:20.747339	2017-07-05 13:17:20.747339
2126	95	8	540	120.0	16.94		VAT-Inclusive	2033.33	\N	2017-07-05 13:21:31.552995	2017-07-05 13:21:31.552995
2127	1	1	540	8.0	195.00		VAT-Exempted	1560.0	\N	2017-07-05 13:22:11.96771	2017-07-05 13:22:11.96771
2129	32	1	541	4.0	60.00		VAT-Exempted	240.0	\N	2017-07-05 13:25:54.182247	2017-07-05 13:25:54.182247
2132	33	1	541	0.3	240.00		VAT-Exempted	72.0	\N	2017-07-05 13:30:29.33763	2017-07-05 13:30:29.33763
2134	6	1	542	20.24	365.00		VAT-Inclusive	7387.6	\N	2017-07-05 13:32:52.699148	2017-07-05 13:32:52.699148
2139	20	1	543	0.1	130.00		VAT-Exempted	13.0	\N	2017-07-05 13:40:22.566653	2017-07-05 13:40:22.566653
1957	11	2	503	10.12	131.59		VAT-Inclusive	1331.7	\N	2017-06-30 14:08:38.467699	2017-06-30 14:08:38.467699
1961	130	8	503	1.0	50.00	photocopy of Clearance form, Prep sheet and Exit interview form	VAT-Inclusive	50.0	\N	2017-06-30 14:16:41.295055	2017-06-30 14:16:41.295055
1965	131	8	504	1.0	150.00	LESto S1 Borrow Wings	VAT-Inclusive	150.0	\N	2017-06-30 14:23:44.31542	2017-06-30 14:23:44.31542
1966	130	8	504	1.0	100.00	Transmittal\r\n	VAT-Inclusive	100.0	\N	2017-06-30 14:24:27.417541	2017-06-30 14:24:27.417541
1981	34	1	506	2.0	120.00		VAT-Exempted	240.0	\N	2017-06-30 14:43:47.240693	2017-06-30 14:43:47.240693
1986	61	1	507	20.0	44.00		VAT-Exempted	880.0	\N	2017-06-30 14:47:03.653335	2017-06-30 14:47:03.653335
1988	36	1	507	3.0	50.00		VAT-Exempted	150.0	\N	2017-06-30 14:47:44.599351	2017-06-30 14:47:44.599351
1991	33	1	507	0.3	280.00		VAT-Exempted	84.0	\N	2017-06-30 14:48:58.531686	2017-06-30 14:48:58.531686
1993	20	1	507	0.1	150.00		VAT-Exempted	15.0	\N	2017-06-30 14:49:46.637771	2017-06-30 14:49:46.637771
2001	9	1	511	8.3	149.00		VAT-Exempted	1236.7	\N	2017-06-30 15:01:47.987143	2017-06-30 15:01:47.987143
2006	106	9	514	24.0	70.00		VAT-Inclusive	1680.0	\N	2017-06-30 19:23:53.907226	2017-06-30 19:23:53.907226
2007	112	12	514	120.0	3.54		VAT-Inclusive	425.0	\N	2017-06-30 19:26:00.3945	2017-06-30 19:26:00.3945
2017	123	8	515	1.0	610.00		VAT-Inclusive	610.0	\N	2017-07-01 17:50:36.222134	2017-07-01 17:50:36.222134
2018	121	8	516	1.0	6473.00		VAT-Inclusive	6473.0	\N	2017-07-01 17:57:59.942764	2017-07-01 17:57:59.942764
2020	131	8	517	1.0	120.00	Megamall to S1 Borrow Bacon	VAT-Inclusive	120.0	\N	2017-07-02 09:39:50.998848	2017-07-02 09:39:50.998848
2024	122	8	517	1.0	30.00	powder	VAT-Inclusive	30.0	\N	2017-07-02 09:43:36.88782	2017-07-02 09:43:36.88782
2025	131	8	517	1.0	155.00	S1  to SM SM to S1 Open market wings	VAT-Inclusive	155.0	\N	2017-07-02 09:45:34.845204	2017-07-02 09:45:34.845204
2034	11	2	517	6.6	131.59		VAT-Inclusive	868.5	\N	2017-07-02 10:11:57.992085	2017-07-02 10:11:57.992085
2038	130	8	518	1.0	45.00	Print of Job hazzard and delivery Summary	VAT-Inclusive	45.0	\N	2017-07-02 10:19:13.070207	2017-07-02 10:19:13.070207
2042	61	1	519	15.0	44.00		VAT-Exempted	660.0	\N	2017-07-02 11:25:44.106981	2017-07-02 11:25:44.106981
2043	9	1	520	61.78	149.00		VAT-Exempted	9205.22	\N	2017-07-02 11:28:42.197711	2017-07-02 11:28:42.197711
2049	42	8	522	20.0	4.50		VAT-Inclusive	90.0	\N	2017-07-02 11:48:08.647152	2017-07-02 11:48:08.647152
2055	121	8	527	1.0	2350.00		VAT-Inclusive	2350.0	\N	2017-07-04 19:02:49.554337	2017-07-04 19:02:49.554337
2057	124	8	528	9.0	120.00		VAT-Inclusive	1080.0	\N	2017-07-05 10:17:42.429757	2017-07-05 10:17:42.429757
2059	131	8	528	1.0	108.00	LES to S1(borrow Fry Batter)	VAT-Inclusive	108.0	\N	2017-07-05 10:22:51.080733	2017-07-05 10:22:51.080733
2062	49	6	528	3.0	198.00		VAT-Inclusive	594.0	\N	2017-07-05 10:27:53.570756	2017-07-05 10:27:53.570756
2069	33	11	528	3.52	9.59		VAT-Exempted	33.75	\N	2017-07-05 10:46:37.212075	2017-07-05 10:46:37.212075
2071	11	2	528	6.6	131.59		VAT-Inclusive	868.5	\N	2017-07-05 10:51:00.187076	2017-07-05 10:51:00.187076
2093	32	1	532	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-05 12:24:56.287617	2017-07-05 12:24:56.287617
2094	22	1	532	0.25	50.00		VAT-Exempted	12.5	\N	2017-07-05 12:25:30.49288	2017-07-05 12:25:30.49288
2099	25	1	534	10.0	75.00		VAT-Inclusive	750.0	\N	2017-07-05 12:38:54.8603	2017-07-05 12:38:54.8603
2101	94	1	535	11.0	130.00		VAT-Inclusive	1430.0	\N	2017-07-05 12:42:43.013507	2017-07-05 12:42:43.013507
2109	69	6	537	12.0	196.43		VAT-Exclusive	2357.15	\N	2017-07-05 12:55:11.052119	2017-07-05 12:55:11.052119
2110	80	2	537	4.0	171.88		VAT-Exclusive	687.5	\N	2017-07-05 12:56:07.169864	2017-07-05 12:56:07.169864
2111	38	6	537	10.0	111.61		VAT-Exclusive	1116.06	\N	2017-07-05 12:57:25.212547	2017-07-05 12:57:25.212547
2116	88	1	538	1.0	464.50		VAT-Exclusive	464.5	\N	2017-07-05 13:05:37.656145	2017-07-05 13:05:37.656145
2130	21	1	541	3.0	50.00		VAT-Exempted	150.0	\N	2017-07-05 13:26:23.792868	2017-07-05 13:26:23.792868
2135	4	1	542	5.0	285.00		VAT-Inclusive	1425.0	\N	2017-07-05 13:33:32.023294	2017-07-05 13:33:32.023294
2140	32	1	543	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-05 13:41:08.335429	2017-07-05 13:41:08.335429
1962	131	8	504	1.0	100.00	G5 to S1 Borrow Cheese sauce	VAT-Inclusive	100.0	\N	2017-06-30 14:21:59.454711	2017-06-30 14:21:59.454711
1964	124	8	504	3.0	120.00		VAT-Inclusive	360.0	\N	2017-06-30 14:22:50.855088	2017-06-30 14:22:50.855088
1971	137	8	505	14.0	50.00		VAT-Exempted	700.0	\N	2017-06-30 14:31:45.508127	2017-06-30 14:31:45.508127
1975	121	8	505	4.0	113.90	Trash Liner	VAT-Inclusive	455.6	\N	2017-06-30 14:38:18.416914	2017-06-30 14:38:18.416914
1980	36	1	506	3.0	50.00		VAT-Exempted	150.0	\N	2017-06-30 14:43:24.805945	2017-06-30 14:43:24.805945
1989	34	1	507	2.5	120.00		VAT-Exempted	300.0	\N	2017-06-30 14:48:10.196392	2017-06-30 14:48:10.196392
1992	23	1	507	0.1	700.00		VAT-Exempted	70.0	\N	2017-06-30 14:49:19.328845	2017-06-30 14:49:19.328845
1995	21	1	507	7.0	50.00		VAT-Exempted	350.0	\N	2017-06-30 14:52:58.257716	2017-06-30 14:52:58.257716
1998	26	1	508	12.27	142.00		VAT-Inclusive	1742.34	\N	2017-06-30 14:56:36.585645	2017-06-30 14:56:36.585645
1999	5	1	509	39.7	298.14		VAT-Inclusive	11836.16	\N	2017-06-30 14:58:11.514293	2017-06-30 14:58:11.514293
2002	8	1	511	11.5	179.00		VAT-Exempted	2058.5	\N	2017-06-30 15:02:26.100798	2017-06-30 15:02:26.100798
2011	111	12	514	120.0	14.58		VAT-Inclusive	1750.0	\N	2017-06-30 19:29:08.44991	2017-06-30 19:29:08.44991
2012	114	12	514	22.4	22.32		VAT-Inclusive	500.0	\N	2017-06-30 19:29:40.887932	2017-06-30 19:29:40.887932
2016	122	8	515	1.0	1840.00		VAT-Inclusive	1840.0	\N	2017-07-01 17:49:03.726842	2017-07-01 17:49:03.726842
2019	131	8	517	1.0	107.00	LES to S1 Borrow Cheese Sauce	VAT-Inclusive	107.0	\N	2017-07-02 09:38:27.742748	2017-07-02 09:38:27.742748
2022	131	8	517	1.0	112.00	Landmark to S1 Open Market	VAT-Inclusive	112.0	\N	2017-07-02 09:42:15.376457	2017-07-02 09:42:15.376457
2030	10	2	517	7.43	75.00		VAT-Inclusive	557.25	\N	2017-07-02 09:53:04.191968	2017-07-02 09:53:04.191968
2040	32	1	519	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-02 11:24:14.812294	2017-07-02 11:24:14.812294
2045	6	1	521	10.01	365.36		VAT-Inclusive	3657.3	\N	2017-07-02 11:30:38.612794	2017-07-02 11:30:38.612794
2047	44	8	522	50.0	4.60		VAT-Inclusive	230.0	\N	2017-07-02 11:47:23.69082	2017-07-02 11:47:23.69082
2048	43	8	522	30.0	6.60		VAT-Inclusive	198.0	\N	2017-07-02 11:47:47.555505	2017-07-02 11:47:47.555505
2051	121	8	524	2000.0	0.85		VAT-Exclusive	1700.0	\N	2017-07-04 18:53:37.401137	2017-07-04 18:53:37.401137
2052	121	8	524	2000.0	0.95		VAT-Exclusive	1900.0	\N	2017-07-04 18:54:15.55011	2017-07-04 18:54:15.55011
2053	123	8	525	1.0	2330.00		VAT-Inclusive	2330.0	\N	2017-07-04 18:56:48.23637	2017-07-04 18:56:48.23637
2060	130	8	528	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-05 10:23:54.53323	2017-07-05 10:23:54.53323
2061	130	8	528	1.0	20.00	Print of PCF	VAT-Inclusive	20.0	\N	2017-07-05 10:25:21.632549	2017-07-05 10:25:21.632549
2064	74	12	528	46.72	6.94		VAT-Inclusive	324.2	\N	2017-07-05 10:33:00.045081	2017-07-05 10:33:00.045081
2065	16	4	528	8.0	85.80		VAT-Inclusive	686.4	\N	2017-07-05 10:37:57.008012	2017-07-05 10:37:57.008012
2074	131	8	528	1.0	112.00	S1 to Landmark to S1(open market)	VAT-Inclusive	112.0	\N	2017-07-05 10:55:37.241668	2017-07-05 10:55:37.241668
2082	124	8	530	3.0	120.00		VAT-Inclusive	360.0	\N	2017-07-05 11:14:47.454946	2017-07-05 11:14:47.454946
2089	34	1	532	3.0	120.00		VAT-Exempted	360.0	\N	2017-07-05 12:22:09.180211	2017-07-05 12:22:09.180211
2090	21	1	532	4.0	50.00		VAT-Exempted	200.0	\N	2017-07-05 12:22:50.64155	2017-07-05 12:22:50.64155
2092	30	8	532	15.0	20.00		VAT-Exempted	300.0	\N	2017-07-05 12:24:18.707448	2017-07-05 12:24:18.707448
2096	28	1	532	0.1	300.00		VAT-Exempted	30.0	\N	2017-07-05 12:27:34.744765	2017-07-05 12:27:34.744765
2105	46	2	537	6.0	165.18		VAT-Exclusive	991.07	\N	2017-07-05 12:51:44.304045	2017-07-05 12:51:44.304045
2106	47	2	537	80.0	46.88		VAT-Exclusive	3750.0	\N	2017-07-05 12:52:46.878169	2017-07-05 12:52:46.878169
2114	37	8	538	180.0	3.86		VAT-Exclusive	695.1	\N	2017-07-05 13:03:56.77422	2017-07-05 13:03:56.77422
2118	76	4	538	72.0	16.14		VAT-Exclusive	1161.72	\N	2017-07-05 13:07:40.230094	2017-07-05 13:07:40.230094
2121	24	1	540	35.4	55.93		VAT-Inclusive	1980.0	\N	2017-07-05 13:15:59.242449	2017-07-05 13:15:59.242449
2123	19	6	540	12.0	55.00		VAT-Inclusive	660.0	\N	2017-07-05 13:18:25.764618	2017-07-05 13:18:25.764618
2124	53	5	540	2.0	300.00		VAT-Inclusive	600.0	\N	2017-07-05 13:19:08.565854	2017-07-05 13:19:08.565854
2128	13	1	540	1.0	600.00		VAT-Inclusive	600.0	\N	2017-07-05 13:22:40.144619	2017-07-05 13:22:40.144619
2138	21	1	543	3.0	50.00		VAT-Exempted	150.0	\N	2017-07-05 13:38:05.746394	2017-07-05 13:38:05.746394
2143	36	1	543	2.0	45.00		VAT-Exempted	90.0	\N	2017-07-05 13:45:27.923153	2017-07-05 13:45:27.923153
2144	34	1	543	1.0	100.00		VAT-Exempted	100.0	\N	2017-07-05 13:46:31.840514	2017-07-05 13:46:31.840514
2145	29	8	543	15.0	20.00		VAT-Exempted	300.0	\N	2017-07-05 13:47:37.864893	2017-07-05 13:47:37.864893
2146	61	1	543	25.0	45.00		VAT-Exempted	1125.0	\N	2017-07-05 13:48:20.570752	2017-07-05 13:48:20.570752
2147	9	1	544	78.5	149.00		VAT-Exempted	11696.5	\N	2017-07-05 13:51:16.288891	2017-07-05 13:51:16.288891
2148	8	1	544	30.0	179.00		VAT-Exempted	5370.0	\N	2017-07-05 13:52:01.245912	2017-07-05 13:52:01.245912
2149	40	1	545	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-07-05 13:55:37.717159	2017-07-05 13:55:37.717159
2150	57	6	545	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-07-05 13:56:17.049521	2017-07-05 13:56:17.049521
2151	95	8	545	144.0	16.94		VAT-Inclusive	2439.99	\N	2017-07-05 13:56:54.418993	2017-07-05 13:56:54.418993
2152	17	7	545	4.0	165.00		VAT-Inclusive	660.0	\N	2017-07-05 13:57:34.77512	2017-07-05 13:57:34.77512
2153	18	5	546	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-07-05 13:59:42.769919	2017-07-05 13:59:42.769919
2154	97	9	547	18.0	274.00		VAT-Inclusive	4932.0	\N	2017-07-05 19:37:14.02952	2017-07-05 19:37:14.02952
2155	100	9	548	120.0	32.50		VAT-Inclusive	3900.0	\N	2017-07-05 19:42:52.525767	2017-07-05 19:42:52.525767
2156	101	9	548	48.0	44.17		VAT-Inclusive	2120.0	\N	2017-07-05 19:46:06.685437	2017-07-05 19:46:06.685437
2157	99	7	549	96.0	19.50		VAT-Inclusive	1872.0	\N	2017-07-05 19:50:28.052677	2017-07-05 19:50:28.052677
2158	21	1	550	3.0	50.00		VAT-Exempted	150.0	\N	2017-07-08 10:49:24.804999	2017-07-08 10:49:24.804999
2159	32	1	550	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-08 10:50:00.50791	2017-07-08 10:50:00.50791
2160	34	1	550	1.0	100.00		VAT-Exempted	100.0	\N	2017-07-08 10:51:06.740422	2017-07-08 10:51:06.740422
2161	36	1	550	2.0	45.00		VAT-Exempted	90.0	\N	2017-07-08 10:51:49.737501	2017-07-08 10:51:49.737501
2162	27	1	550	0.5	120.00		VAT-Exempted	60.0	\N	2017-07-08 10:52:30.508478	2017-07-08 10:52:30.508478
2163	30	8	550	10.0	20.00		VAT-Exempted	200.0	\N	2017-07-08 10:53:07.599369	2017-07-08 10:53:07.599369
2164	61	1	550	15.0	44.00		VAT-Exempted	660.0	\N	2017-07-08 10:53:48.020914	2017-07-08 10:53:48.020914
2165	94	1	551	16.5	130.00		VAT-Inclusive	2145.0	\N	2017-07-08 11:01:07.888936	2017-07-08 11:01:07.888936
2166	33	1	552	0.3	240.00		VAT-Exempted	72.0	\N	2017-07-08 11:04:55.645938	2017-07-08 11:04:55.645938
2167	32	1	552	4.0	60.00		VAT-Exempted	240.0	\N	2017-07-08 11:05:32.358243	2017-07-08 11:05:32.358243
2168	34	1	552	1.5	100.00		VAT-Exempted	150.0	\N	2017-07-08 11:06:23.462767	2017-07-08 11:06:23.462767
2169	36	1	552	1.0	45.00		VAT-Exempted	45.0	\N	2017-07-08 11:06:59.676527	2017-07-08 11:06:59.676527
2170	35	1	552	0.1	130.00		VAT-Exempted	13.0	\N	2017-07-08 11:08:14.251101	2017-07-08 11:08:14.251101
2171	22	1	552	0.5	50.00		VAT-Exempted	25.0	\N	2017-07-08 11:08:57.880569	2017-07-08 11:08:57.880569
2172	21	1	552	3.0	50.00		VAT-Exempted	150.0	\N	2017-07-08 11:09:33.501847	2017-07-08 11:09:33.501847
2173	26	1	553	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-07-08 11:16:22.377477	2017-07-08 11:16:22.377477
2174	2	1	554	10.0	300.00		VAT-Inclusive	3000.0	\N	2017-07-08 11:18:53.342743	2017-07-08 11:18:53.342743
2175	5	1	554	29.43	380.00		VAT-Inclusive	11183.4	\N	2017-07-08 11:19:58.285882	2017-07-08 11:19:58.285882
2176	4	1	554	8.0	285.00		VAT-Inclusive	2280.0	\N	2017-07-08 11:21:21.121477	2017-07-08 11:21:21.121477
2177	4	1	554	2.5	380.00		VAT-Inclusive	950.0	\N	2017-07-08 11:22:02.706513	2017-07-08 11:22:02.706513
2178	9	1	555	80.46	149.00		VAT-Exempted	11988.54	\N	2017-07-08 11:25:22.523053	2017-07-08 11:25:22.523053
2185	42	8	558	20.0	4.50		VAT-Inclusive	90.0	\N	2017-07-09 09:41:11.66288	2017-07-09 09:41:11.66288
2189	130	8	559	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-09 09:44:11.207835	2017-07-09 09:44:11.207835
2191	130	8	559	1.0	10.00	Print of PCF	VAT-Inclusive	10.0	\N	2017-07-09 09:45:16.584131	2017-07-09 09:45:16.584131
2194	123	8	559	1.0	69.50	Double Sided tape	VAT-Inclusive	69.5	\N	2017-07-09 09:50:37.867688	2017-07-09 09:50:37.867688
2196	10	2	559	2.97	75.05		VAT-Inclusive	222.9	\N	2017-07-09 09:57:17.046202	2017-07-09 09:57:17.046202
2199	131	8	559	1.0	220.00	LES to S1 Pick up Cheese Sauce	VAT-Inclusive	220.0	\N	2017-07-09 10:01:00.30456	2017-07-09 10:01:00.30456
2202	137	8	560	14.0	50.00		VAT-Exempted	700.0	\N	2017-07-09 10:08:26.648451	2017-07-09 10:08:26.648451
2204	130	8	560	1.0	70.00	Battery	VAT-Inclusive	70.0	\N	2017-07-09 10:10:00.364311	2017-07-09 10:10:00.364311
2205	123	8	560	1.0	65.00	Bond Paper and staple wire	VAT-Inclusive	65.0	\N	2017-07-09 10:10:56.777864	2017-07-09 10:10:56.777864
2206	137	8	561	6.0	50.00		VAT-Exempted	300.0	\N	2017-07-09 10:12:24.038996	2017-07-09 10:12:24.038996
2210	122	8	561	1.0	20.00	Powder	VAT-Inclusive	20.0	\N	2017-07-09 10:18:42.162542	2017-07-09 10:18:42.162542
2212	137	8	562	5.0	50.00	Sha, Che,  Alvin, Santos, Jethro	VAT-Exempted	250.0	\N	2017-07-09 10:23:31.971065	2017-07-09 10:23:31.971065
2216	130	8	563	1.0	30.00	Print of PCF, Schedule and Delivery Summary	VAT-Inclusive	30.0	\N	2017-07-10 09:49:00.818675	2017-07-10 09:49:00.818675
2218	9	1	564	54.14	149.00		VAT-Exempted	8066.86	\N	2017-07-10 10:12:53.941714	2017-07-10 10:12:53.941714
2222	39	2	565	55.0	64.73		VAT-Exclusive	3560.27	\N	2017-07-10 10:21:51.310013	2017-07-10 10:21:51.310013
2226	80	2	565	4.0	186.07		VAT-Exclusive	744.28	\N	2017-07-10 10:38:12.03236	2017-07-10 10:38:12.03236
2231	33	1	566	0.3	240.00		VAT-Exempted	72.0	\N	2017-07-10 10:47:28.160766	2017-07-10 10:47:28.160766
2234	34	1	566	2.0	100.00		VAT-Exempted	200.0	\N	2017-07-10 10:49:44.483674	2017-07-10 10:49:44.483674
2239	31	1	566	0.5	120.00		VAT-Exempted	60.0	\N	2017-07-10 10:54:08.570865	2017-07-10 10:54:08.570865
2244	36	1	569	2.0	40.00		VAT-Exempted	80.0	\N	2017-07-11 09:19:20.804609	2017-07-11 09:19:20.804609
2246	34	1	569	1.0	80.00		VAT-Exempted	80.0	\N	2017-07-11 09:20:43.204235	2017-07-11 09:20:43.204235
2247	21	1	569	3.0	55.00		VAT-Exempted	165.0	\N	2017-07-11 09:21:24.926362	2017-07-11 09:21:24.926362
2258	16	4	571	32.0	42.50		VAT-Inclusive	1360.0	\N	2017-07-11 09:39:28.152712	2017-07-11 09:39:28.152712
2260	56	1	572	125.0	93.00		VAT-Inclusive	11625.0	\N	2017-07-11 10:39:55.687435	2017-07-11 10:39:55.687435
2267	130	8	574	1.0	151.00	Photocopy of FOH Manuals and Pre Employment Requirements Forms	VAT-Inclusive	151.0	\N	2017-07-12 11:54:25.809779	2017-07-12 11:54:25.809779
2269	26	1	575	36.81	142.00		VAT-Inclusive	5227.02	\N	2017-07-12 12:42:26.588088	2017-07-12 12:42:26.588088
2276	32	1	578	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-12 12:58:19.030556	2017-07-12 12:58:19.030556
2279	33	1	578	0.2	220.00		VAT-Exempted	44.0	\N	2017-07-12 13:00:44.198132	2017-07-12 13:00:44.198132
2285	121	8	582	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-07-12 15:32:55.160126	2017-07-12 15:32:55.160126
2287	34	1	583	2.0	80.00		VAT-Exempted	160.0	\N	2017-07-14 10:57:30.091847	2017-07-14 10:57:30.091847
2289	21	1	583	3.0	55.00		VAT-Exempted	165.0	\N	2017-07-14 10:59:17.00973	2017-07-14 10:59:17.00973
2291	33	1	583	0.1	220.00		VAT-Exempted	22.0	\N	2017-07-14 11:00:45.605251	2017-07-14 11:00:45.605251
2293	4	1	584	4.0	285.00		VAT-Inclusive	1140.0	\N	2017-07-14 11:04:39.964662	2017-07-14 11:04:39.964662
2299	30	8	585	15.0	20.00		VAT-Exempted	300.0	\N	2017-07-14 11:11:07.099438	2017-07-14 11:11:07.099438
2302	28	1	585	0.1	230.00		VAT-Exempted	23.0	\N	2017-07-14 11:14:33.208138	2017-07-14 11:14:33.208138
2309	21	1	587	3.0	55.00		VAT-Exempted	165.0	\N	2017-07-15 07:56:10.940477	2017-07-15 07:56:10.940477
2316	43	8	591	30.0	6.60		VAT-Inclusive	198.0	\N	2017-07-16 09:56:55.015961	2017-07-16 09:56:55.015961
2322	122	8	592	1.0	122.00	joy and Powder	VAT-Inclusive	122.0	\N	2017-07-16 10:05:12.427884	2017-07-16 10:05:12.427884
2327	73	12	592	29.12	10.16		VAT-Inclusive	295.8	\N	2017-07-16 10:20:35.160564	2017-07-16 10:20:35.160564
2330	45	12	592	12.93	16.08		VAT-Inclusive	207.9	\N	2017-07-16 10:22:08.357353	2017-07-16 10:22:08.357353
2332	49	6	592	3.0	198.00		VAT-Inclusive	594.0	\N	2017-07-16 10:23:16.15121	2017-07-16 10:23:16.15121
2333	93	1	592	2.0	54.60		VAT-Inclusive	109.2	\N	2017-07-16 10:24:01.042705	2017-07-16 10:24:01.042705
2335	131	8	592	1.0	112.00	Landmark to S1 Open Market	VAT-Inclusive	112.0	\N	2017-07-16 10:25:04.788955	2017-07-16 10:25:04.788955
2342	131	8	593	1.0	80.00	Guada to S1 Market Restaurant Supplies	VAT-Inclusive	80.0	\N	2017-07-16 10:29:52.109274	2017-07-16 10:29:52.109274
2343	130	8	594	1.0	100.00	Print and Laminate  Chart	VAT-Inclusive	100.0	\N	2017-07-16 10:31:55.492025	2017-07-16 10:31:55.492025
2347	137	8	595	6.0	50.00		VAT-Exempted	300.0	\N	2017-07-16 10:34:33.875121	2017-07-16 10:34:33.875121
2348	67	5	596	1.0	768.88		VAT-Exclusive	768.88	\N	2017-07-19 08:45:37.874123	2017-07-19 08:45:37.874123
2350	39	2	597	100.0	64.73		VAT-Exclusive	6473.21	\N	2017-07-19 08:51:58.702304	2017-07-19 08:51:58.702304
2352	46	2	597	6.0	173.44		VAT-Exclusive	1040.63	\N	2017-07-19 08:53:48.845003	2017-07-19 08:53:48.845003
2354	63	6	597	1.0	270.00		VAT-Exclusive	270.0	\N	2017-07-19 08:55:37.032468	2017-07-19 08:55:37.032468
2355	64	5	597	3.0	506.25		VAT-Exclusive	1518.75	\N	2017-07-19 08:56:47.198756	2017-07-19 08:56:47.198756
2362	18	5	598	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-07-19 10:28:19.357327	2017-07-19 10:28:19.357327
2365	53	5	599	5.0	300.00		VAT-Inclusive	1500.0	\N	2017-07-19 10:34:21.937511	2017-07-19 10:34:21.937511
2366	1	1	599	8.0	195.00		VAT-Exempted	1560.0	\N	2017-07-19 10:36:02.242596	2017-07-19 10:36:02.242596
2378	36	1	601	3.0	40.00		VAT-Exempted	120.0	\N	2017-07-19 10:56:32.483919	2017-07-19 10:56:32.483919
2381	30	8	601	10.0	15.00		VAT-Exempted	150.0	\N	2017-07-19 10:58:53.179342	2017-07-19 10:58:53.179342
2179	8	1	555	40.24	179.00		VAT-Exempted	7202.96	\N	2017-07-08 11:27:25.546028	2017-07-08 11:27:25.546028
2183	44	8	558	50.0	4.60		VAT-Inclusive	230.0	\N	2017-07-09 09:40:32.837766	2017-07-09 09:40:32.837766
2184	43	8	558	30.0	6.60		VAT-Inclusive	198.0	\N	2017-07-09 09:40:55.656828	2017-07-09 09:40:55.656828
2186	137	8	559	13.0	50.00		VAT-Exempted	650.0	\N	2017-07-09 09:42:48.574046	2017-07-09 09:42:48.574046
2190	122	8	559	1.0	88.00	Handsoap	VAT-Inclusive	88.0	\N	2017-07-09 09:44:43.776176	2017-07-09 09:44:43.776176
2195	121	8	559	2.0	379.75	Measuring Cups and Kitchen Digital Timer	VAT-Inclusive	759.5	\N	2017-07-09 09:51:40.071884	2017-07-09 09:51:40.071884
2207	122	8	561	2.0	89.00	Joy	VAT-Inclusive	178.0	\N	2017-07-09 10:14:39.767027	2017-07-09 10:14:39.767027
2208	129	8	561	2.0	107.00	Bulb for Kitchen	VAT-Inclusive	214.0	\N	2017-07-09 10:17:20.141433	2017-07-09 10:17:20.141433
2217	137	8	563	11.0	50.00	Che, Sha, Lou, Maureen, Santos, Rodel,Dana ,Jethro,Jerlyn,Alvin and Miko	VAT-Exempted	550.0	\N	2017-07-10 09:52:26.027071	2017-07-10 09:52:26.027071
2219	8	1	564	30.1	179.00		VAT-Exempted	5388.0	\N	2017-07-10 10:14:41.730968	2017-07-10 10:14:41.730968
2238	20	1	566	0.1	130.00		VAT-Exempted	13.0	\N	2017-07-10 10:53:14.357846	2017-07-10 10:53:14.357846
2241	7	1	567	24.0	220.00		VAT-Exempted	5280.0	\N	2017-07-11 09:08:50.670471	2017-07-11 09:08:50.670471
2245	32	1	569	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-11 09:20:00.535764	2017-07-11 09:20:00.535764
2250	61	1	569	25.0	50.00		VAT-Exempted	1250.0	\N	2017-07-11 09:23:48.003116	2017-07-11 09:23:48.003116
2253	40	1	571	19.2	112.50		VAT-Inclusive	2160.0	\N	2017-07-11 09:35:37.315279	2017-07-11 09:35:37.315279
2255	1	1	571	8.0	195.00		VAT-Exempted	1560.0	\N	2017-07-11 09:37:43.471721	2017-07-11 09:37:43.471721
2257	13	1	571	1.0	600.00		VAT-Inclusive	600.0	\N	2017-07-11 09:38:37.428375	2017-07-11 09:38:37.428375
2259	24	1	571	35.4	55.93		VAT-Inclusive	1980.0	\N	2017-07-11 10:34:04.489739	2017-07-11 10:34:04.489739
2265	122	8	573	1.0	20.00	Powder	VAT-Inclusive	20.0	\N	2017-07-12 11:51:33.982186	2017-07-12 11:51:33.982186
2268	130	8	574	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-07-12 11:54:53.209773	2017-07-12 11:54:53.209773
2274	21	1	578	3.0	55.00		VAT-Exempted	165.0	\N	2017-07-12 12:57:03.129781	2017-07-12 12:57:03.129781
2280	22	1	578	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-12 13:01:35.995775	2017-07-12 13:01:35.995775
2281	99	7	579	96.0	17.41		VAT-Exclusive	1671.44	\N	2017-07-12 15:13:35.465413	2017-07-12 15:13:35.465413
2282	99	7	580	120.0	17.41		VAT-Exclusive	2089.3	\N	2017-07-12 15:16:14.924719	2017-07-12 15:16:14.924719
2296	21	1	585	4.0	55.00		VAT-Exempted	220.0	\N	2017-07-14 11:08:58.162026	2017-07-14 11:08:58.162026
2297	32	1	585	4.0	60.00		VAT-Exempted	240.0	\N	2017-07-14 11:09:34.078371	2017-07-14 11:09:34.078371
2304	9	1	586	80.22	149.00		VAT-Exempted	11952.78	\N	2017-07-14 11:21:28.295165	2017-07-14 11:21:28.295165
2307	34	1	587	1.0	80.00		VAT-Exempted	80.0	\N	2017-07-15 07:53:57.209075	2017-07-15 07:53:57.209075
2310	20	1	587	0.1	120.00		VAT-Exempted	12.0	\N	2017-07-15 07:56:49.12641	2017-07-15 07:56:49.12641
2317	44	8	591	50.0	4.60		VAT-Inclusive	230.0	\N	2017-07-16 09:57:35.894711	2017-07-16 09:57:35.894711
2324	121	8	592	500.0	1.73	8oz paper cups	VAT-Inclusive	862.5	\N	2017-07-16 10:11:39.513214	2017-07-16 10:11:39.513214
2326	48	1	592	1.2	161.75		VAT-Inclusive	194.1	\N	2017-07-16 10:19:56.779661	2017-07-16 10:19:56.779661
2328	55	12	592	7.0	18.63		VAT-Inclusive	130.4	\N	2017-07-16 10:20:56.825266	2017-07-16 10:20:56.825266
2337	121	8	593	1.0	1260.00	Cups and Take out boxes	VAT-Inclusive	1260.0	\N	2017-07-16 10:27:12.564274	2017-07-16 10:27:12.564274
2341	122	8	593	1.0	118.00	joy and Powder	VAT-Inclusive	118.0	\N	2017-07-16 10:29:13.425115	2017-07-16 10:29:13.425115
2346	122	8	595	1.0	26.00	Joy	VAT-Inclusive	26.0	\N	2017-07-16 10:34:17.273668	2017-07-16 10:34:17.273668
2349	77	9	596	1.0	225.00		VAT-Exclusive	225.0	\N	2017-07-19 08:46:31.515917	2017-07-19 08:46:31.515917
2356	68	5	597	2.0	609.38		VAT-Exclusive	1218.75	\N	2017-07-19 08:57:50.650934	2017-07-19 08:57:50.650934
2357	69	6	597	20.0	222.14		VAT-Exclusive	4442.86	\N	2017-07-19 08:59:43.671623	2017-07-19 08:59:43.671623
2373	12	1	599	3.38	699.17		VAT-Inclusive	2363.2	\N	2017-07-19 10:46:44.887097	2017-07-19 10:46:44.887097
2379	21	1	601	3.0	55.00		VAT-Exempted	165.0	\N	2017-07-19 10:57:07.179596	2017-07-19 10:57:07.179596
2181	104	9	557	96.0	28.00		VAT-Inclusive	2688.0	\N	2017-07-08 15:43:41.721826	2017-07-08 15:43:41.721826
2182	103	9	557	120.0	30.63		VAT-Inclusive	3675.0	\N	2017-07-08 15:44:34.850739	2017-07-08 15:44:34.850739
2197	11	2	559	8.8	131.59		VAT-Inclusive	1158.0	\N	2017-07-09 09:57:46.692509	2017-07-09 09:57:46.692509
2201	10	2	560	23.76	65.03		VAT-Exclusive	1545.0	\N	2017-07-09 10:07:48.916997	2017-07-09 10:07:48.916997
2203	130	8	560	1.0	165.00	Print of BOH Manuals	VAT-Inclusive	165.0	\N	2017-07-09 10:09:08.710832	2017-07-09 10:09:08.710832
2213	122	8	563	2.0	26.00	Joy Antibac 	VAT-Inclusive	52.0	\N	2017-07-10 09:42:54.602981	2017-07-10 09:42:54.602981
2215	130	8	563	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-10 09:47:24.656492	2017-07-10 09:47:24.656492
2221	46	2	565	6.0	173.44		VAT-Exclusive	1040.63	\N	2017-07-10 10:19:50.511807	2017-07-10 10:19:50.511807
2225	70	6	565	1.0	246.07		VAT-Exclusive	246.07	\N	2017-07-10 10:35:35.915417	2017-07-10 10:35:35.915417
2228	21	1	566	6.0	50.00		VAT-Exempted	300.0	\N	2017-07-10 10:45:30.254878	2017-07-10 10:45:30.254878
2235	32	1	566	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-10 10:50:20.390323	2017-07-10 10:50:20.390323
2236	30	8	566	15.0	28.00		VAT-Exempted	420.0	\N	2017-07-10 10:51:31.837663	2017-07-10 10:51:31.837663
2237	27	1	566	0.25	120.00		VAT-Exempted	30.0	\N	2017-07-10 10:52:34.122437	2017-07-10 10:52:34.122437
2240	61	1	566	25.0	44.00		VAT-Exempted	1100.0	\N	2017-07-10 10:55:03.633731	2017-07-10 10:55:03.633731
2249	22	1	569	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-11 09:23:01.830924	2017-07-11 09:23:01.830924
2251	27	1	569	1.0	100.00		VAT-Exempted	100.0	\N	2017-07-11 09:29:21.912514	2017-07-11 09:29:21.912514
2254	53	5	571	5.0	300.00		VAT-Inclusive	1500.0	\N	2017-07-11 09:36:33.253638	2017-07-11 09:36:33.253638
2262	137	8	573	11.0	50.00		VAT-Exempted	550.0	\N	2017-07-12 11:48:26.366665	2017-07-12 11:48:26.366665
2263	50	1	573	0.44	414.77		VAT-Inclusive	182.5	\N	2017-07-12 11:50:18.401751	2017-07-12 11:50:18.401751
2266	137	8	574	11.0	50.00		VAT-Exempted	550.0	\N	2017-07-12 11:53:24.865064	2017-07-12 11:53:24.865064
2271	8	1	576	30.1	179.00		VAT-Exempted	5387.9	\N	2017-07-12 12:50:45.308968	2017-07-12 12:50:45.308968
2272	9	1	576	80.3	149.00		VAT-Exempted	11964.7	\N	2017-07-12 12:51:40.803299	2017-07-12 12:51:40.803299
2277	36	1	578	3.0	40.00		VAT-Exempted	120.0	\N	2017-07-12 12:59:31.192902	2017-07-12 12:59:31.192902
2278	23	1	578	0.1	380.00		VAT-Exempted	38.0	\N	2017-07-12 13:00:13.12574	2017-07-12 13:00:13.12574
2283	121	8	581	1.0	5701.00		VAT-Inclusive	5701.0	\N	2017-07-12 15:19:45.631971	2017-07-12 15:19:45.631971
2288	30	8	583	15.0	20.00		VAT-Exempted	300.0	\N	2017-07-14 10:58:21.970218	2017-07-14 10:58:21.970218
2290	22	1	583	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-14 11:00:05.862181	2017-07-14 11:00:05.862181
2298	34	1	585	1.0	80.00		VAT-Exempted	80.0	\N	2017-07-14 11:10:14.438543	2017-07-14 11:10:14.438543
2301	33	1	585	0.2	220.00		VAT-Exempted	44.0	\N	2017-07-14 11:12:26.592364	2017-07-14 11:12:26.592364
2303	61	1	585	20.0	45.00		VAT-Exempted	900.0	\N	2017-07-14 11:15:40.185685	2017-07-14 11:15:40.185685
2306	32	1	587	4.0	60.00		VAT-Exempted	240.0	\N	2017-07-15 07:53:12.792967	2017-07-15 07:53:12.792967
2315	42	8	591	10.0	4.50		VAT-Inclusive	45.0	\N	2017-07-16 09:56:36.628742	2017-07-16 09:56:36.628742
2318	124	8	592	6.0	120.00		VAT-Inclusive	720.0	\N	2017-07-16 10:00:14.449712	2017-07-16 10:00:14.449712
2320	50	1	592	0.44	414.77		VAT-Inclusive	182.5	\N	2017-07-16 10:01:10.335677	2017-07-16 10:01:10.335677
2321	131	8	592	1.0	180.00	LES to S1 Pick up 4GAL  from Abmarac	VAT-Inclusive	180.0	\N	2017-07-16 10:03:56.747427	2017-07-16 10:03:56.747427
2331	71	12	592	7.74	13.93		VAT-Inclusive	107.8	\N	2017-07-16 10:22:44.705498	2017-07-16 10:22:44.705498
2334	92	1	592	2.0	46.20		VAT-Exempted	92.4	\N	2017-07-16 10:24:27.61045	2017-07-16 10:24:27.61045
2336	41	12	592	42.0	11.38		VAT-Inclusive	478.0	\N	2017-07-16 10:25:36.231734	2017-07-16 10:25:36.231734
2338	123	8	593	1.0	700.00	Journal Paper	VAT-Inclusive	700.0	\N	2017-07-16 10:27:38.392026	2017-07-16 10:27:38.392026
2340	124	8	593	4.0	120.00		VAT-Inclusive	480.0	\N	2017-07-16 10:28:23.349978	2017-07-16 10:28:23.349978
2345	121	8	594	1.0	92.50	Trash Liner	VAT-Inclusive	92.5	\N	2017-07-16 10:32:54.176633	2017-07-16 10:32:54.176633
2353	47	2	597	180.0	53.35		VAT-Exclusive	9602.68	\N	2017-07-19 08:54:50.675926	2017-07-19 08:54:50.675926
2358	70	6	597	1.0	246.07		VAT-Exclusive	246.07	\N	2017-07-19 10:20:36.668583	2017-07-19 10:20:36.668583
2359	80	2	597	6.0	186.07		VAT-Exclusive	1116.43	\N	2017-07-19 10:22:42.381454	2017-07-19 10:22:42.381454
2360	38	6	597	20.0	119.53		VAT-Exclusive	2390.62	\N	2017-07-19 10:23:42.280978	2017-07-19 10:23:42.280978
2367	95	8	599	144.0	16.94		VAT-Inclusive	2439.99	\N	2017-07-19 10:38:14.490119	2017-07-19 10:38:14.490119
2370	17	7	599	2.0	165.00		VAT-Inclusive	330.0	\N	2017-07-19 10:42:40.870458	2017-07-19 10:42:40.870458
2372	16	4	599	5.0	170.00		VAT-Inclusive	850.0	\N	2017-07-19 10:43:31.891144	2017-07-19 10:43:31.891144
2374	25	1	600	10.0	27.00		VAT-Inclusive	270.0	\N	2017-07-19 10:50:12.411304	2017-07-19 10:50:12.411304
2375	26	1	600	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-07-19 10:51:47.008719	2017-07-19 10:51:47.008719
2187	122	8	559	4.0	280.00	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-07-09 09:43:13.338363	2017-07-09 09:43:13.338363
2188	124	8	559	3.0	120.00		VAT-Inclusive	360.0	\N	2017-07-09 09:43:38.797033	2017-07-09 09:43:38.797033
2192	10	2	559	6.93	86.36		VAT-Inclusive	598.5	\N	2017-07-09 09:46:18.987503	2017-07-09 09:46:18.987503
2198	131	8	559	1.0	90.00	Landmark to S1 Open market butter and timer	VAT-Inclusive	90.0	\N	2017-07-09 09:58:54.685005	2017-07-09 09:58:54.685005
2200	11	2	560	42.24	114.04		VAT-Exclusive	4817.14	\N	2017-07-09 10:06:52.353764	2017-07-09 10:06:52.353764
2209	53	5	561	1.0	466.55		VAT-Inclusive	466.55	\N	2017-07-09 10:18:08.860453	2017-07-09 10:18:08.860453
2211	131	8	561	1.0	90.00	Landmark to S1  Open Market	VAT-Inclusive	90.0	\N	2017-07-09 10:21:03.066243	2017-07-09 10:21:03.066243
2223	47	2	565	80.0	53.35		VAT-Exclusive	4267.86	\N	2017-07-10 10:22:58.60066	2017-07-10 10:22:58.60066
2224	69	6	565	12.0	222.14		VAT-Exclusive	2665.71	\N	2017-07-10 10:29:26.605393	2017-07-10 10:29:26.605393
2227	38	6	565	10.0	119.53		VAT-Exclusive	1195.31	\N	2017-07-10 10:40:18.74912	2017-07-10 10:40:18.74912
2232	23	1	566	0.1	650.00		VAT-Exempted	65.0	\N	2017-07-10 10:48:09.793051	2017-07-10 10:48:09.793051
2233	36	1	566	2.0	45.00		VAT-Exempted	90.0	\N	2017-07-10 10:48:46.771937	2017-07-10 10:48:46.771937
2242	5	1	568	18.97	385.00		VAT-Inclusive	7303.45	\N	2017-07-11 09:12:37.768562	2017-07-11 09:12:37.768562
2243	30	8	569	15.0	15.00		VAT-Exempted	225.0	\N	2017-07-11 09:16:55.403117	2017-07-11 09:16:55.403117
2261	124	8	573	12.0	120.00		VAT-Inclusive	1440.0	\N	2017-07-12 11:48:02.526238	2017-07-12 11:48:02.526238
2264	49	6	573	1.0	198.00		VAT-Inclusive	198.0	\N	2017-07-12 11:51:12.372073	2017-07-12 11:51:12.372073
2273	7	1	577	24.0	220.00		VAT-Exempted	5280.0	\N	2017-07-12 12:55:33.707958	2017-07-12 12:55:33.707958
2284	122	8	581	1.0	388.00		VAT-Inclusive	388.0	\N	2017-07-12 15:20:33.40724	2017-07-12 15:20:33.40724
2286	32	1	583	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-14 10:56:27.83433	2017-07-14 10:56:27.83433
2292	61	1	583	20.0	45.00		VAT-Exempted	900.0	\N	2017-07-14 11:01:26.120883	2017-07-14 11:01:26.120883
2294	4	1	584	6.0	380.00		VAT-Inclusive	2280.0	\N	2017-07-14 11:05:28.834699	2017-07-14 11:05:28.834699
2295	3	1	584	1.0	340.00		VAT-Inclusive	340.0	\N	2017-07-14 11:06:08.441343	2017-07-14 11:06:08.441343
2300	22	1	585	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-14 11:11:48.408583	2017-07-14 11:11:48.408583
2305	8	1	586	40.23	179.00		VAT-Exempted	7201.17	\N	2017-07-14 11:24:13.776032	2017-07-14 11:24:13.776032
2308	33	1	587	0.2	220.00		VAT-Exempted	44.0	\N	2017-07-15 07:55:16.679479	2017-07-15 07:55:16.679479
2311	122	8	588	1.0	712.00		VAT-Inclusive	712.0	\N	2017-07-15 13:29:39.497039	2017-07-15 13:29:39.497039
2312	123	8	588	1.0	90.00		VAT-Inclusive	90.0	\N	2017-07-15 13:30:23.276326	2017-07-15 13:30:23.276326
2313	121	8	589	1.0	5250.50		VAT-Inclusive	5250.5	\N	2017-07-15 13:35:19.990584	2017-07-15 13:35:19.990584
2314	99	7	590	120.0	17.41		VAT-Exclusive	2089.3	\N	2017-07-15 13:39:25.914894	2017-07-15 13:39:25.914894
2319	137	8	592	13.0	50.00		VAT-Exempted	650.0	\N	2017-07-16 10:00:35.93457	2017-07-16 10:00:35.93457
2323	130	8	592	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-16 10:05:38.195481	2017-07-16 10:05:38.195481
2325	74	12	592	70.08	6.94		VAT-Inclusive	486.3	\N	2017-07-16 10:19:27.389105	2017-07-16 10:19:27.389105
2329	50	11	592	63.36	5.47		VAT-Inclusive	346.5	\N	2017-07-16 10:21:33.753473	2017-07-16 10:21:33.753473
2339	137	8	593	14.0	50.00		VAT-Exempted	700.0	\N	2017-07-16 10:28:00.147322	2017-07-16 10:28:00.147322
2344	137	8	594	6.0	50.00		VAT-Exempted	300.0	\N	2017-07-16 10:32:19.898752	2017-07-16 10:32:19.898752
2363	24	1	599	35.4	55.93		VAT-Inclusive	1980.0	\N	2017-07-19 10:31:01.128274	2017-07-19 10:31:01.128274
2364	40	1	599	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-07-19 10:33:40.634638	2017-07-19 10:33:40.634638
2369	13	1	599	2.0	600.00		VAT-Inclusive	1200.0	\N	2017-07-19 10:41:56.107772	2017-07-19 10:41:56.107772
2376	35	1	601	0.25	140.00		VAT-Exempted	35.0	\N	2017-07-19 10:55:16.020006	2017-07-19 10:55:16.020006
2377	34	1	601	2.0	80.00		VAT-Exempted	160.0	\N	2017-07-19 10:55:59.999615	2017-07-19 10:55:59.999615
2380	22	1	601	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-19 10:57:55.68071	2017-07-19 10:57:55.68071
2382	32	1	601	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-19 10:59:36.686056	2017-07-19 10:59:36.686056
2384	28	1	601	0.1	230.00		VAT-Exempted	23.0	\N	2017-07-19 11:00:34.717118	2017-07-19 11:00:34.717118
2385	27	1	601	0.5	100.00		VAT-Exempted	50.0	\N	2017-07-19 11:01:18.219611	2017-07-19 11:01:18.219611
2387	61	1	601	25.0	44.00		VAT-Exempted	1100.0	\N	2017-07-19 11:04:03.353275	2017-07-19 11:04:03.353275
2388	21	1	602	3.0	58.00		VAT-Exempted	174.0	\N	2017-07-19 11:07:23.654222	2017-07-19 11:07:23.654222
2389	32	1	602	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-19 11:07:59.356155	2017-07-19 11:07:59.356155
2390	36	1	602	3.0	40.00		VAT-Exempted	120.0	\N	2017-07-19 11:08:32.250874	2017-07-19 11:08:32.250874
2391	34	1	602	1.5	90.00		VAT-Exempted	135.0	\N	2017-07-19 11:10:23.317028	2017-07-19 11:10:23.317028
2392	22	1	602	1.0	55.00		VAT-Exempted	55.0	\N	2017-07-19 11:11:35.858478	2017-07-19 11:11:35.858478
2393	33	1	602	0.3	220.00		VAT-Exempted	66.0	\N	2017-07-19 11:12:12.229628	2017-07-19 11:12:12.229628
2394	27	1	602	0.5	100.00		VAT-Exempted	50.0	\N	2017-07-19 11:13:02.94328	2017-07-19 11:13:02.94328
2395	61	1	602	20.0	50.00		VAT-Exempted	1000.0	\N	2017-07-19 11:13:48.09507	2017-07-19 11:13:48.09507
2396	30	8	602	20.0	15.00		VAT-Exempted	300.0	\N	2017-07-19 11:15:49.467317	2017-07-19 11:15:49.467317
2397	32	1	603	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-19 11:18:49.059903	2017-07-19 11:18:49.059903
2398	21	1	603	3.0	58.00		VAT-Exempted	174.0	\N	2017-07-19 11:19:28.667236	2017-07-19 11:19:28.667236
2400	33	1	603	0.2	200.00		VAT-Exempted	40.0	\N	2017-07-19 11:20:20.799111	2017-07-19 11:20:20.799111
2401	23	1	603	0.1	380.00		VAT-Exempted	38.0	\N	2017-07-19 11:21:15.300777	2017-07-19 11:21:15.300777
2402	9	1	604	80.1	149.00		VAT-Exempted	11934.9	\N	2017-07-19 11:24:33.423298	2017-07-19 11:24:33.423298
2403	8	1	604	40.6	179.00		VAT-Exempted	7267.4	\N	2017-07-19 11:25:20.493796	2017-07-19 11:25:20.493796
2405	83	1	605	0.5	639.14		VAT-Inclusive	319.57	\N	2017-07-19 11:29:25.828634	2017-07-19 11:29:25.828634
2406	75	9	605	5.0	203.46		VAT-Inclusive	1017.32	\N	2017-07-19 11:30:52.600381	2017-07-19 11:30:52.600381
2407	96	4	605	16.0	12.21		VAT-Inclusive	195.41	\N	2017-07-19 11:32:39.186764	2017-07-19 11:32:39.186764
2409	37	8	606	180.0	3.86		VAT-Inclusive	695.1	\N	2017-07-19 11:36:08.817755	2017-07-19 11:36:08.817755
2410	90	1	606	1.0	1168.25		VAT-Inclusive	1168.25	\N	2017-07-19 11:37:47.842659	2017-07-19 11:37:47.842659
2411	7	1	607	24.0	220.00		VAT-Exempted	5280.0	\N	2017-07-19 11:40:44.715107	2017-07-19 11:40:44.715107
2412	25	1	608	10.0	75.00		VAT-Inclusive	750.0	\N	2017-07-19 11:43:37.60563	2017-07-19 11:43:37.60563
2413	26	1	608	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-07-19 11:44:42.173766	2017-07-19 11:44:42.173766
2414	24	1	609	17.7	55.93		VAT-Inclusive	990.0	\N	2017-07-19 11:47:58.921572	2017-07-19 11:47:58.921572
2415	40	1	609	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-07-19 11:49:12.155187	2017-07-19 11:49:12.155187
2416	53	5	609	2.0	300.00		VAT-Inclusive	600.0	\N	2017-07-19 11:49:45.853988	2017-07-19 11:49:45.853988
2417	1	1	609	8.0	195.00		VAT-Exempted	1560.0	\N	2017-07-19 11:50:27.37141	2017-07-19 11:50:27.37141
2418	95	8	609	144.0	16.94		VAT-Inclusive	2439.99	\N	2017-07-19 11:51:32.075156	2017-07-19 11:51:32.075156
2419	137	8	610	13.0	50.00	Che, Rodel,Mau,Jethro, Nichols,Alvin,Santos,Dana,Marvin,Miko,Jerlyn,Lou and Berna	VAT-Exempted	650.0	\N	2017-07-19 12:01:30.141516	2017-07-19 12:01:30.141516
2420	131	8	610	1.0	136.00	Les to S1( Pik up of Cheese Sauce)	VAT-Inclusive	136.0	\N	2017-07-19 12:03:25.83879	2017-07-19 12:03:25.83879
2421	131	8	610	1.0	190.00	Les to S1(Transfer Batter Station)	VAT-Inclusive	190.0	\N	2017-07-19 12:04:43.743581	2017-07-19 12:04:43.743581
2422	130	8	610	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-19 12:05:37.301353	2017-07-19 12:05:37.301353
2425	131	8	610	1.0	160.00	Kalookan to S1(Transfer Uniforms)	VAT-Inclusive	160.0	\N	2017-07-19 12:09:46.869131	2017-07-19 12:09:46.869131
2428	33	1	610	0.16	537.00	Parsley(16g)	VAT-Exempted	85.92	\N	2017-07-19 12:34:03.122129	2017-07-19 12:34:03.122129
2430	137	8	611	14.0	50.00	Che, Sha,Maureen,Jethro,Nico,Rodel,Dana,Santos,Marvin,Jerlyn,Lou,Alvin,Mico and Berna	VAT-Exempted	700.0	\N	2017-07-19 12:39:28.759438	2017-07-19 12:39:28.759438
2431	124	8	611	4.0	22.00	Tube Ice	VAT-Inclusive	88.0	\N	2017-07-19 12:40:31.210491	2017-07-19 12:40:31.210491
2432	121	8	611	250.0	1.40	250 Pieces(260 cups)	VAT-Inclusive	350.0	\N	2017-07-19 12:42:10.530616	2017-07-19 12:42:10.530616
2434	129	8	612	3.0	1000.00	Aircon Cleaning	VAT-Inclusive	3000.0	\N	2017-07-19 12:48:16.953328	2017-07-19 12:48:16.953328
2436	124	8	612	4.0	120.00	Tube  Ice	VAT-Inclusive	480.0	\N	2017-07-19 12:52:20.537569	2017-07-19 12:52:20.537569
2438	122	8	612	4.0	280.00	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-07-19 12:57:41.082383	2017-07-19 12:57:41.082383
2439	97	9	613	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-07-19 15:23:32.057721	2017-07-19 15:23:32.057721
2450	27	1	617	0.25	100.00		VAT-Exempted	25.0	\N	2017-07-22 05:37:03.828303	2017-07-22 05:37:03.828303
2454	32	1	619	4.0	60.00		VAT-Exempted	240.0	\N	2017-07-22 05:46:06.068535	2017-07-22 05:46:06.068535
2458	34	1	619	1.0	90.00		VAT-Exempted	90.0	\N	2017-07-22 05:48:13.52835	2017-07-22 05:48:13.52835
2459	30	8	619	20.0	15.00		VAT-Exempted	300.0	\N	2017-07-22 05:48:58.239849	2017-07-22 05:48:58.239849
2469	22	1	621	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-22 06:01:01.962481	2017-07-22 06:01:01.962481
2483	137	8	627	14.0	57.14	Che,Sha,Rodel,Dana,Mico,Marvin,Santos,Maureen,Jethro,Jerlyn,Berna,Alvin,Mico and Lou	VAT-Exempted	800.0	\N	2017-07-23 12:33:51.857017	2017-07-23 12:33:51.857017
2485	131	8	627	1.0	200.00	Pasig To S1(Fair for Buying Restaurant Supplies)	VAT-Inclusive	200.0	\N	2017-07-23 12:37:53.786544	2017-07-23 12:37:53.786544
2487	130	8	627	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-23 12:40:31.322786	2017-07-23 12:40:31.322786
2499	137	8	628	14.0	60.71	Che,sha,Maureen,Jerlyn,Nico,Mico,Santos,Dana,Rodel,Marvin,Lou,Jethro,Berna and Alvin	VAT-Exempted	850.0	\N	2017-07-23 13:22:44.425592	2017-07-23 13:22:44.425592
2500	124	8	628	4.0	120.00	Tube Ice	VAT-Inclusive	480.0	\N	2017-07-23 13:23:42.092119	2017-07-23 13:23:42.092119
2510	55	12	629	7.0	18.63		VAT-Inclusive	130.4	\N	2017-07-23 13:59:00.512102	2017-07-23 13:59:00.512102
2512	45	12	629	12.0	17.33		VAT-Inclusive	207.9	\N	2017-07-23 14:06:25.661184	2017-07-23 14:06:25.661184
2520	137	8	629	8.0	50.00	Sha,NIco,Lou,Dana,Marvin,Rodel,Santos and Jerlyn	VAT-Exempted	400.0	\N	2017-07-23 14:18:54.288657	2017-07-23 14:18:54.288657
2528	37	8	629	60.0	4.33		VAT-Inclusive	259.5	\N	2017-07-23 15:03:40.132924	2017-07-23 15:03:40.132924
2531	20	1	631	0.15	130.00		VAT-Exempted	19.5	\N	2017-07-26 06:42:57.311375	2017-07-26 06:42:57.311375
2533	32	1	631	6.0	60.00		VAT-Exempted	360.0	\N	2017-07-26 06:43:40.023887	2017-07-26 06:43:40.023887
2535	33	1	631	1.0	200.00		VAT-Exempted	200.0	\N	2017-07-26 06:44:18.447296	2017-07-26 06:44:18.447296
2542	8	1	632	30.22	179.00		VAT-Exempted	5409.38	\N	2017-07-26 06:55:10.112989	2017-07-26 06:55:10.112989
2543	97	9	633	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-07-26 07:06:43.416559	2017-07-26 07:06:43.416559
2546	57	6	635	17.0	88.24		VAT-Inclusive	1500.0	\N	2017-07-26 07:29:50.133601	2017-07-26 07:29:50.133601
2553	26	1	637	12.27	142.00		VAT-Inclusive	1742.34	\N	2017-07-26 07:39:18.432602	2017-07-26 07:39:18.432602
2558	2	1	641	10.0	300.00		VAT-Inclusive	3000.0	\N	2017-07-26 07:53:03.872897	2017-07-26 07:53:03.872897
2561	39	2	642	55.0	64.73		VAT-Exclusive	3560.27	\N	2017-07-26 08:00:05.549185	2017-07-26 08:00:05.549185
2565	68	5	642	2.0	609.38		VAT-Exclusive	1218.75	\N	2017-07-26 08:06:01.571075	2017-07-26 08:06:01.571075
2566	69	6	642	10.0	222.14		VAT-Exclusive	2221.43	\N	2017-07-26 08:06:32.946842	2017-07-26 08:06:32.946842
2573	97	9	646	18.0	274.00		VAT-Inclusive	4932.0	\N	2017-07-26 08:22:00.368195	2017-07-26 08:22:00.368195
2575	9	1	648	70.0	149.00		VAT-Exempted	10430.0	\N	2017-07-26 08:26:15.888303	2017-07-26 08:26:15.888303
2576	8	1	648	30.02	179.00		VAT-Exempted	5373.58	\N	2017-07-26 08:27:13.380774	2017-07-26 08:27:13.380774
2584	131	8	653	1.0	158.00	Megamall to S1(Transfer of Ice Cream)	VAT-Inclusive	158.0	\N	2017-07-26 10:56:11.549074	2017-07-26 10:56:11.549074
2586	130	8	653	2.0	7.50	Print of PCf and Weekly Schedule	VAT-Inclusive	15.0	\N	2017-07-26 10:58:41.434468	2017-07-26 10:58:41.434468
2592	137	8	654	1.0	1996.00	Che,Sha,Maureen,Jenn,Arianne,Rodel,Lou,Nico,Jethro,Jerlyn,Berna,Alvin,Mico and Santos	VAT-Exempted	1996.0	\N	2017-07-26 11:11:11.767063	2017-07-26 11:11:11.767063
2594	130	8	654	1.0	200.00	LES tO S1 (Borrow Fry Batter)	VAT-Inclusive	200.0	\N	2017-07-26 11:13:34.794659	2017-07-26 11:13:34.794659
2595	137	8	654	1.0	34.00	Mediplast(1Box)	VAT-Inclusive	34.0	\N	2017-07-26 11:14:54.984095	2017-07-26 11:14:54.984095
2596	124	8	655	12.0	120.00	Tube Ice 	VAT-Inclusive	1440.0	\N	2017-07-26 11:17:46.554767	2017-07-26 11:17:46.554767
2598	137	8	655	13.0	50.00	Che,Sha,Lou,Maureen,Nico,Rodel,Mico,Dana,Jethro,Jerlyn,Santos,Alvin and Berna	VAT-Exempted	650.0	\N	2017-07-26 11:20:48.380855	2017-07-26 11:20:48.380855
2602	131	8	655	1.0	85.00	Glorietta To S1(Borrow Shortening)	VAT-Inclusive	85.0	\N	2017-07-26 11:26:24.377461	2017-07-26 11:26:24.377461
2611	33	1	657	0.3	200.00		VAT-Exempted	60.0	\N	2017-07-29 07:10:28.760388	2017-07-29 07:10:28.760388
2614	5	1	658	28.84	385.00		VAT-Inclusive	11103.4	\N	2017-07-29 07:18:30.806901	2017-07-29 07:18:30.806901
2616	4	1	658	2.0	285.00		VAT-Inclusive	570.0	\N	2017-07-29 07:20:20.625601	2017-07-29 07:20:20.625601
2617	44	8	659	50.0	4.60		VAT-Inclusive	230.0	\N	2017-07-29 07:24:04.225285	2017-07-29 07:24:04.225285
2621	4	1	661	0.5	285.00		VAT-Inclusive	142.5	\N	2017-07-29 07:34:20.160818	2017-07-29 07:34:20.160818
2622	33	1	662	0.1	118.00		VAT-Exempted	11.8	\N	2017-07-29 07:38:45.920359	2017-07-29 07:38:45.920359
2623	32	1	662	5.0	55.00		VAT-Exempted	275.0	\N	2017-07-29 07:39:25.893666	2017-07-29 07:39:25.893666
2636	47	2	665	60.0	53.35		VAT-Exclusive	3200.89	\N	2017-07-29 07:59:47.021814	2017-07-29 07:59:47.021814
2423	124	8	610	1.0	66.00	Tube Ice 	VAT-Inclusive	66.0	\N	2017-07-19 12:07:08.395769	2017-07-19 12:07:08.395769
2424	122	8	610	1.0	52.00	Joy(85ML)	VAT-Inclusive	52.0	\N	2017-07-19 12:08:21.844134	2017-07-19 12:08:21.844134
2440	121	8	614	1.0	3645.00		VAT-Inclusive	3645.0	\N	2017-07-19 15:25:51.533216	2017-07-19 15:25:51.533216
2441	122	8	614	1.0	1291.00		VAT-Inclusive	1291.0	\N	2017-07-19 15:27:12.794351	2017-07-19 15:27:12.794351
2444	121	8	616	1.0	2760.00		VAT-Inclusive	2760.0	\N	2017-07-19 15:33:39.382861	2017-07-19 15:33:39.382861
2445	122	8	616	1.0	509.00		VAT-Inclusive	509.0	\N	2017-07-19 15:34:27.833293	2017-07-19 15:34:27.833293
2448	34	1	617	1.5	90.00		VAT-Exempted	135.0	\N	2017-07-22 05:35:37.131461	2017-07-22 05:35:37.131461
2449	61	1	617	30.0	44.00		VAT-Exempted	1320.0	\N	2017-07-22 05:36:20.372768	2017-07-22 05:36:20.372768
2451	28	1	617	0.1	240.00		VAT-Exempted	24.0	\N	2017-07-22 05:38:04.75348	2017-07-22 05:38:04.75348
2455	36	1	619	3.0	40.00		VAT-Exempted	120.0	\N	2017-07-22 05:46:42.521354	2017-07-22 05:46:42.521354
2463	61	1	619	15.0	44.00		VAT-Exempted	660.0	\N	2017-07-22 05:52:08.240029	2017-07-22 05:52:08.240029
2464	9	1	620	70.62	149.00		VAT-Exempted	10522.38	\N	2017-07-22 05:55:43.012203	2017-07-22 05:55:43.012203
2467	33	1	621	0.2	200.00		VAT-Exempted	40.0	\N	2017-07-22 05:59:38.076123	2017-07-22 05:59:38.076123
2468	21	1	621	3.0	58.00		VAT-Exempted	174.0	\N	2017-07-22 06:00:18.106942	2017-07-22 06:00:18.106942
2492	130	8	627	1.0	10.00	Print of PCF and Photocopy of FOH training Calendar	VAT-Inclusive	10.0	\N	2017-07-23 12:56:54.380483	2017-07-23 12:56:54.380483
2494	92	2	627	2.2	21.00	Brown Sugar(1kg)	VAT-Exempted	46.2	\N	2017-07-23 13:07:53.811356	2017-07-23 13:07:53.811356
2501	131	8	628	1.0	400.00	Quipo to S1(Market Restaurant Supplies)	VAT-Inclusive	400.0	\N	2017-07-23 13:25:40.938939	2017-07-23 13:25:40.938939
2503	131	8	629	1.0	112.00	Landmark to S1(Open Market/Rodel)	VAT-Inclusive	112.0	\N	2017-07-23 13:35:21.169674	2017-07-23 13:35:21.169674
2507	73	12	629	72.8	10.18		VAT-Inclusive	741.0	\N	2017-07-23 13:50:13.506787	2017-07-23 13:50:13.506787
2508	72	6	629	1.0	36.75		VAT-Inclusive	36.75	\N	2017-07-23 13:51:37.619064	2017-07-23 13:51:37.619064
2513	93	2	629	2.2	24.82		VAT-Inclusive	54.6	\N	2017-07-23 14:08:01.422694	2017-07-23 14:08:01.422694
2517	41	12	629	42.0	11.38		VAT-Inclusive	478.0	\N	2017-07-23 14:15:04.61259	2017-07-23 14:15:04.61259
2521	130	8	629	1.0	83.00	Battery	VAT-Inclusive	83.0	\N	2017-07-23 14:19:31.76564	2017-07-23 14:19:31.76564
2522	137	8	630	7.0	50.00	Che,Sha,Alvin,Mico,Jethro,Berna and Mau	VAT-Exempted	350.0	\N	2017-07-23 14:22:33.007552	2017-07-23 14:22:33.007552
2527	129	8	630	1.0	70.00	White Cement for drainage	VAT-Inclusive	70.0	\N	2017-07-23 14:27:50.63989	2017-07-23 14:27:50.63989
2539	31	1	631	0.9	120.00		VAT-Exempted	108.0	\N	2017-07-26 06:49:36.01774	2017-07-26 06:49:36.01774
2541	9	1	632	70.1	149.00		VAT-Exempted	10444.9	\N	2017-07-26 06:54:42.801492	2017-07-26 06:54:42.801492
2547	1	1	635	8.0	195.00		VAT-Exempted	1560.0	\N	2017-07-26 07:30:26.920712	2017-07-26 07:30:26.920712
2548	25	1	635	20.0	75.00		VAT-Inclusive	1500.0	\N	2017-07-26 07:32:37.090538	2017-07-26 07:32:37.090538
2551	7	1	636	24.0	220.00		VAT-Exempted	5280.0	\N	2017-07-26 07:36:11.162385	2017-07-26 07:36:11.162385
2552	25	1	637	20.0	75.00		VAT-Inclusive	1500.0	\N	2017-07-26 07:38:41.315027	2017-07-26 07:38:41.315027
2563	47	2	642	80.0	53.35		VAT-Exclusive	4267.86	\N	2017-07-26 08:02:57.857517	2017-07-26 08:02:57.857517
2564	63	6	642	2.0	270.00		VAT-Exclusive	540.0	\N	2017-07-26 08:05:10.854198	2017-07-26 08:05:10.854198
2567	70	6	642	1.0	246.07		VAT-Exclusive	246.07	\N	2017-07-26 08:08:23.626608	2017-07-26 08:08:23.626608
2571	9	1	644	51.68	149.00		VAT-Exempted	7700.32	\N	2017-07-26 08:17:12.582483	2017-07-26 08:17:12.582483
2578	106	9	649	24.0	70.00		VAT-Inclusive	1680.0	\N	2017-07-26 08:31:05.632797	2017-07-26 08:31:05.632797
2606	36	1	657	5.0	40.00		VAT-Exempted	200.0	\N	2017-07-29 07:06:03.485946	2017-07-29 07:06:03.485946
2608	21	1	657	4.0	55.00		VAT-Exempted	220.0	\N	2017-07-29 07:07:42.889227	2017-07-29 07:07:42.889227
2618	43	8	659	30.0	6.60		VAT-Inclusive	198.0	\N	2017-07-29 07:25:00.049552	2017-07-29 07:25:00.049552
2625	21	1	662	5.0	49.00		VAT-Exempted	245.0	\N	2017-07-29 07:40:50.420181	2017-07-29 07:40:50.420181
2628	9	1	663	75.0	149.00		VAT-Exempted	11175.0	\N	2017-07-29 07:47:33.136096	2017-07-29 07:47:33.136096
2631	30	8	664	15.0	12.00		VAT-Exempted	180.0	\N	2017-07-29 07:52:48.905916	2017-07-29 07:52:48.905916
2633	21	1	664	2.0	55.00		VAT-Exempted	110.0	\N	2017-07-29 07:54:02.20365	2017-07-29 07:54:02.20365
2634	28	1	664	0.1	260.00		VAT-Exempted	26.0	\N	2017-07-29 07:54:51.542042	2017-07-29 07:54:51.542042
2426	130	8	610	4.0	32.00	Chetos (60g)-Sir RR	VAT-Inclusive	128.0	\N	2017-07-19 12:11:24.237558	2017-07-19 12:11:24.237558
2429	124	8	611	8.0	135.00	Tube Ice	VAT-Inclusive	1080.0	\N	2017-07-19 12:36:34.094773	2017-07-19 12:36:34.094773
2433	121	8	612	1.0	4895.00	Food Processor	VAT-Inclusive	4895.0	\N	2017-07-19 12:44:36.020317	2017-07-19 12:44:36.020317
2435	137	8	612	14.0	50.00	Che,Sha,Maureen,Rodel,Santos,Dana,Jethro,Nico,Jerlyn,Mico,Alvin,Berna,Lou and Marvin	VAT-Exempted	700.0	\N	2017-07-19 12:50:58.995377	2017-07-19 12:50:58.995377
2443	121	8	615	1.0	6416.25		VAT-Inclusive	6416.25	\N	2017-07-19 15:31:02.560221	2017-07-19 15:31:02.560221
2447	32	1	617	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-22 05:34:54.003868	2017-07-22 05:34:54.003868
2452	33	1	617	0.1	200.00		VAT-Exempted	20.0	\N	2017-07-22 05:38:39.452586	2017-07-22 05:38:39.452586
2453	56	1	618	125.0	93.00		VAT-Inclusive	11625.0	\N	2017-07-22 05:43:01.422484	2017-07-22 05:43:01.422484
2457	21	1	619	4.0	58.00		VAT-Exempted	232.0	\N	2017-07-22 05:47:32.886487	2017-07-22 05:47:32.886487
2460	23	1	619	0.1	380.00		VAT-Exempted	38.0	\N	2017-07-22 05:50:36.942879	2017-07-22 05:50:36.942879
2462	27	1	619	0.5	100.00		VAT-Exempted	50.0	\N	2017-07-22 05:51:34.81812	2017-07-22 05:51:34.81812
2466	32	1	621	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-22 05:59:01.472008	2017-07-22 05:59:01.472008
2470	121	8	622	2000.0	0.85		VAT-Exclusive	1700.0	\N	2017-07-22 09:28:21.728558	2017-07-22 09:28:21.728558
2472	103	9	623	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-07-22 09:54:49.160504	2017-07-22 09:54:49.160504
2474	134	8	625	1.0	1060.00	A stand Board	VAT-Inclusive	1060.0	\N	2017-07-22 12:06:32.247055	2017-07-22 12:06:32.247055
2475	134	8	626	1.0	19000.00	Menu and Tent cards	VAT-Inclusive	19000.0	\N	2017-07-22 12:08:10.052927	2017-07-22 12:08:10.052927
2484	124	8	627	4.0	120.00	Tube Ice	VAT-Inclusive	480.0	\N	2017-07-23 12:34:47.323234	2017-07-23 12:34:47.323234
2486	131	8	627	1.0	160.00	LES to S1(Pick up Liquors)	VAT-Inclusive	160.0	\N	2017-07-23 12:39:53.382651	2017-07-23 12:39:53.382651
2489	123	8	627	1.0	52.00	Double Adhesive Tape	VAT-Inclusive	52.0	\N	2017-07-23 12:45:03.016565	2017-07-23 12:45:03.016565
2490	10	2	627	9.9	75.05	Buttercup(20pcs)	VAT-Inclusive	743.0	\N	2017-07-23 12:50:01.353072	2017-07-23 12:50:01.353072
2495	131	8	627	1.0	78.00	Landmark to S1 (Open Market	VAT-Inclusive	78.0	\N	2017-07-23 13:09:10.814006	2017-07-23 13:09:10.814006
2497	130	8	628	1.0	104.00	7up 2L	VAT-Inclusive	104.0	\N	2017-07-23 13:17:55.086173	2017-07-23 13:17:55.086173
2498	121	8	628	1.0	7860.00	Fryer Basket,Spoon and Fork, Pitcher and Pan	VAT-Inclusive	7860.0	\N	2017-07-23 13:19:09.911804	2017-07-23 13:19:09.911804
2502	76	4	628	20.0	18.08	Tomato Sauce	VAT-Inclusive	361.5	\N	2017-07-23 13:28:11.194511	2017-07-23 13:28:11.194511
2509	76	4	629	24.0	18.08		VAT-Inclusive	433.8	\N	2017-07-23 13:57:13.560585	2017-07-23 13:57:13.560585
2514	92	2	629	4.4	21.00		VAT-Exempted	92.4	\N	2017-07-23 14:09:19.850307	2017-07-23 14:09:19.850307
2515	50	11	629	98.56	3.98		VAT-Inclusive	392.7	\N	2017-07-23 14:11:08.630171	2017-07-23 14:11:08.630171
2518	10	2	629	23.76	65.03		VAT-Exclusive	1545.0	\N	2017-07-23 14:16:37.697292	2017-07-23 14:16:37.697292
2523	121	8	630	1.0	260.00	260 cups and Fedon(2pcs)	VAT-Inclusive	260.0	\N	2017-07-23 14:23:42.827278	2017-07-23 14:23:42.827278
2524	122	8	630	2.0	89.00	Joy	VAT-Inclusive	178.0	\N	2017-07-23 14:24:42.642665	2017-07-23 14:24:42.642665
2525	131	8	630	1.0	65.00	Glorietta to S1(Pickup of Ice cream)	VAT-Inclusive	65.0	\N	2017-07-23 14:25:42.157866	2017-07-23 14:25:42.157866
2526	124	8	630	2.0	22.00	Tube ice(2kg)	VAT-Inclusive	44.0	\N	2017-07-23 14:26:29.593716	2017-07-23 14:26:29.593716
2530	27	1	631	2.0	100.00		VAT-Exempted	200.0	\N	2017-07-26 06:42:31.63714	2017-07-26 06:42:31.63714
2532	34	1	631	2.5	90.00		VAT-Exempted	225.0	\N	2017-07-26 06:43:20.324821	2017-07-26 06:43:20.324821
2544	94	1	634	27.5	130.00		VAT-Inclusive	3575.0	\N	2017-07-26 07:25:00.633276	2017-07-26 07:25:00.633276
2549	13	1	635	1.0	600.00		VAT-Inclusive	600.0	\N	2017-07-26 07:33:04.930599	2017-07-26 07:33:04.930599
2554	99	7	638	48.0	17.41	2 case Pepsi Reg	VAT-Exclusive	835.71	\N	2017-07-26 07:43:16.629469	2017-07-26 07:43:16.629469
2555	98	9	638	24.0	8.11		VAT-Exclusive	194.65	\N	2017-07-26 07:43:44.383686	2017-07-26 07:43:44.383686
2557	121	8	640	1.0	3868.00		VAT-Inclusive	3868.0	\N	2017-07-26 07:51:01.79782	2017-07-26 07:51:01.79782
2559	4	1	641	6.0	285.00	Bacon bits	VAT-Inclusive	1710.0	\N	2017-07-26 07:54:15.396208	2017-07-26 07:54:15.396208
2560	4	1	641	4.0	380.00	Country style	VAT-Inclusive	1520.0	\N	2017-07-26 07:55:03.856459	2017-07-26 07:55:03.856459
2562	46	2	642	4.0	173.44		VAT-Exclusive	693.75	\N	2017-07-26 08:01:45.65356	2017-07-26 08:01:45.65356
2572	18	5	645	7.0	450.00		VAT-Inclusive	3150.0	\N	2017-07-26 08:19:12.918841	2017-07-26 08:19:12.918841
2574	123	8	647	1.0	1950.00	Books For August	VAT-Inclusive	1950.0	\N	2017-07-26 08:23:17.72168	2017-07-26 08:23:17.72168
2577	105	9	649	24.0	90.00		VAT-Inclusive	2160.0	\N	2017-07-26 08:29:47.911386	2017-07-26 08:29:47.911386
2580	121	8	651	1.0	6329.50		VAT-Inclusive	6329.5	\N	2017-07-26 08:38:07.681104	2017-07-26 08:38:07.681104
2582	68	5	652	2.0	609.38		VAT-Exclusive	1218.75	\N	2017-07-26 10:50:27.918651	2017-07-26 10:50:27.918651
2583	131	8	653	1.0	185.00	Delivery Fee foe Uniform	VAT-Inclusive	185.0	\N	2017-07-26 10:55:10.836989	2017-07-26 10:55:10.836989
2585	122	8	653	2.0	45.95	Albatross 2 Pcs	VAT-Inclusive	91.9	\N	2017-07-26 10:57:28.048275	2017-07-26 10:57:28.048275
2588	124	8	653	6.0	120.00	Tube Ice 	VAT-Inclusive	720.0	\N	2017-07-26 11:02:03.981085	2017-07-26 11:02:03.981085
2597	137	8	655	1.0	1000.00	Snacks for Wing Day	VAT-Inclusive	1000.0	\N	2017-07-26 11:18:56.747538	2017-07-26 11:18:56.747538
2599	51	11	655	105.6	4.17		VAT-Inclusive	440.0	\N	2017-07-26 11:22:38.364675	2017-07-26 11:22:38.364675
2604	121	8	656	2000.0	0.85		VAT-Exclusive	1700.0	\N	2017-07-26 21:01:53.476213	2017-07-26 21:01:53.476213
2605	61	1	657	30.0	45.00		VAT-Exempted	1350.0	\N	2017-07-29 07:05:24.771393	2017-07-29 07:05:24.771393
2610	27	1	657	0.5	95.00		VAT-Exempted	47.5	\N	2017-07-29 07:09:33.026937	2017-07-29 07:09:33.026937
2612	22	1	657	0.25	55.00		VAT-Exempted	13.75	\N	2017-07-29 07:11:31.264676	2017-07-29 07:11:31.264676
2613	30	8	657	20.0	15.00		VAT-Exempted	300.0	\N	2017-07-29 07:12:09.386703	2017-07-29 07:12:09.386703
2615	6	1	658	10.14	370.00		VAT-Inclusive	3751.8	\N	2017-07-29 07:19:17.795043	2017-07-29 07:19:17.795043
2619	56	1	660	125.0	93.00		VAT-Inclusive	11625.0	\N	2017-07-29 07:29:51.536838	2017-07-29 07:29:51.536838
2620	5	1	661	18.8	385.00		VAT-Inclusive	7238.0	\N	2017-07-29 07:33:41.544812	2017-07-29 07:33:41.544812
2629	33	1	664	0.3	200.00		VAT-Exempted	60.0	\N	2017-07-29 07:51:23.519256	2017-07-29 07:51:23.519256
2632	32	1	664	4.0	60.00		VAT-Exempted	240.0	\N	2017-07-29 07:53:22.620608	2017-07-29 07:53:22.620608
2635	20	1	664	0.1	150.00		VAT-Exempted	15.0	\N	2017-07-29 07:55:32.19583	2017-07-29 07:55:32.19583
2437	131	8	612	1.0	112.00	Landmark to S1	VAT-Inclusive	112.0	\N	2017-07-19 12:53:34.955525	2017-07-19 12:53:34.955525
2442	123	8	614	1.0	85.00		VAT-Inclusive	85.0	\N	2017-07-19 15:27:47.441421	2017-07-19 15:27:47.441421
2446	21	1	617	3.0	58.00		VAT-Exempted	174.0	\N	2017-07-22 05:34:20.973839	2017-07-22 05:34:20.973839
2465	8	1	620	40.64	179.00		VAT-Exempted	7274.56	\N	2017-07-22 05:56:35.37002	2017-07-22 05:56:35.37002
2471	104	9	623	96.0	28.00		VAT-Inclusive	2688.0	\N	2017-07-22 09:31:47.456068	2017-07-22 09:31:47.456068
2473	123	8	624	1.0	1390.00	Order Slip and Check out Forms	VAT-Inclusive	1390.0	\N	2017-07-22 12:04:00.906447	2017-07-22 12:04:00.906447
2493	121	8	627	1.0	3500.00	Mixing Bowl,Fry Pan,Bread Tong,Measuring Spoon,Cabbage shredder,dipper Handle and Food Pan	VAT-Inclusive	3500.0	\N	2017-07-23 13:02:51.620631	2017-07-23 13:02:51.620631
2496	131	8	628	1.0	350.00	LES to S1(Pickup of 1case cheese sauce and 200 pcs of 260 cups)	VAT-Inclusive	350.0	\N	2017-07-23 13:13:33.357452	2017-07-23 13:13:33.357452
2505	49	6	629	5.0	198.00		VAT-Inclusive	990.0	\N	2017-07-23 13:40:06.918837	2017-07-23 13:40:06.918837
2506	74	12	629	46.72	6.94		VAT-Inclusive	324.2	\N	2017-07-23 13:48:57.836662	2017-07-23 13:48:57.836662
2511	48	11	629	35.2	4.60		VAT-Inclusive	161.75	\N	2017-07-23 14:04:16.625077	2017-07-23 14:04:16.625077
2516	71	12	629	7.04	17.74		VAT-Inclusive	124.9	\N	2017-07-23 14:13:49.562834	2017-07-23 14:13:49.562834
2519	11	2	629	21.12	114.04		VAT-Exclusive	2408.57	\N	2017-07-23 14:17:15.381347	2017-07-23 14:17:15.381347
2529	36	1	631	7.0	40.00		VAT-Exempted	280.0	\N	2017-07-26 06:42:11.617942	2017-07-26 06:42:11.617942
2534	23	1	631	0.2	380.00		VAT-Exempted	76.0	\N	2017-07-26 06:44:00.104086	2017-07-26 06:44:00.104086
2536	21	1	631	6.0	58.00		VAT-Exempted	348.0	\N	2017-07-26 06:44:52.875798	2017-07-26 06:44:52.875798
2537	35	1	631	0.15	160.00		VAT-Exempted	24.0	\N	2017-07-26 06:46:07.535668	2017-07-26 06:46:07.535668
2538	30	8	631	50.0	15.00		VAT-Exempted	750.0	\N	2017-07-26 06:46:39.80278	2017-07-26 06:46:39.80278
2540	61	1	631	75.0	44.00		VAT-Exempted	3300.0	\N	2017-07-26 06:49:58.090673	2017-07-26 06:49:58.090673
2545	40	1	635	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-07-26 07:28:36.807825	2017-07-26 07:28:36.807825
2550	17	7	635	3.0	165.00		VAT-Inclusive	495.0	\N	2017-07-26 07:34:03.916668	2017-07-26 07:34:03.916668
2556	122	8	639	1.0	696.00		VAT-Inclusive	696.0	\N	2017-07-26 07:47:14.287956	2017-07-26 07:47:14.287956
2568	38	6	642	10.0	119.53		VAT-Exclusive	1195.31	\N	2017-07-26 08:10:04.526563	2017-07-26 08:10:04.526563
2569	67	5	643	1.0	796.88		VAT-Exclusive	796.88	\N	2017-07-26 08:13:25.644085	2017-07-26 08:13:25.644085
2570	77	9	643	1.0	225.00		VAT-Exclusive	225.0	\N	2017-07-26 08:14:02.000268	2017-07-26 08:14:02.000268
2579	122	8	650	1.0	916.00		VAT-Inclusive	916.0	\N	2017-07-26 08:33:38.919204	2017-07-26 08:33:38.919204
2581	64	5	652	2.0	506.25		VAT-Exclusive	1012.5	\N	2017-07-26 10:45:19.374877	2017-07-26 10:45:19.374877
2587	58	11	653	35.2	8.24	Chilli Paste	VAT-Inclusive	290.0	\N	2017-07-26 11:01:02.79659	2017-07-26 11:01:02.79659
2589	137	8	653	15.0	50.00	Cheryline,Sharlaine,Alvin,Rodel,Lou, Dana,Maureen,Nico,Arianne,Jenn,Mico,Santos,Jethro,Jerlyn and Berna	VAT-Exempted	750.0	\N	2017-07-26 11:04:36.490716	2017-07-26 11:04:36.490716
2590	130	8	653	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-26 11:05:16.584919	2017-07-26 11:05:16.584919
2591	130	8	653	5.0	205.00	Magnetic Card	VAT-Inclusive	1025.0	\N	2017-07-26 11:07:03.032771	2017-07-26 11:07:03.032771
2593	121	8	654	2.0	250.00	Latex Gloves	VAT-Inclusive	500.0	\N	2017-07-26 11:12:10.616393	2017-07-26 11:12:10.616393
2600	131	8	655	1.0	75.00	Rustan's to S1(Jerlyn Market)	VAT-Inclusive	75.0	\N	2017-07-26 11:23:52.466705	2017-07-26 11:23:52.466705
2601	122	8	655	1.0	89.00	Joy Dishwashing Liquid	VAT-Inclusive	89.0	\N	2017-07-26 11:25:39.096279	2017-07-26 11:25:39.096279
2603	33	11	655	1.41	56.74		VAT-Exempted	80.0	\N	2017-07-26 11:30:32.645238	2017-07-26 11:30:32.645238
2607	34	1	657	2.0	120.00		VAT-Exempted	240.0	\N	2017-07-29 07:06:52.452239	2017-07-29 07:06:52.452239
2609	32	1	657	6.0	60.00		VAT-Exempted	360.0	\N	2017-07-29 07:08:46.677487	2017-07-29 07:08:46.677487
2624	34	1	662	2.0	88.00		VAT-Exempted	176.0	\N	2017-07-29 07:40:03.673183	2017-07-29 07:40:03.673183
2630	34	1	664	1.5	120.00		VAT-Exempted	180.0	\N	2017-07-29 07:52:13.023403	2017-07-29 07:52:13.023403
2637	131	8	666	1.0	112.00	Glorietta to S1(Rodel Market)	VAT-Inclusive	112.0	\N	2017-07-30 07:53:38.97028	2017-07-30 07:53:38.97028
2638	121	8	666	1.0	1016.98	Squeeze Bottle,Strainer and Timer	VAT-Inclusive	1016.98	\N	2017-07-30 07:57:10.649589	2017-07-30 07:57:10.649589
2640	74	12	666	38.4	8.97		VAT-Inclusive	344.4	\N	2017-07-30 08:03:19.247466	2017-07-30 08:03:19.247466
2641	49	6	666	3.0	198.00		VAT-Inclusive	594.0	\N	2017-07-30 08:04:22.620289	2017-07-30 08:04:22.620289
2642	76	4	666	32.0	18.08		VAT-Inclusive	578.4	\N	2017-07-30 08:06:41.543631	2017-07-30 08:06:41.543631
2643	10	2	666	4.46	74.97		VAT-Inclusive	334.35	\N	2017-07-30 08:10:39.813751	2017-07-30 08:10:39.813751
2644	137	8	666	1.0	26.00	Mediplast Banaid	VAT-Inclusive	26.0	\N	2017-07-30 08:12:01.986093	2017-07-30 08:12:01.986093
2645	137	8	666	13.0	57.69	Che, Maureen,Lou,Nico,Sha,Rodel,Mico,Dana,Je,Jethro,Alvin,Santos and Berna	VAT-Exempted	750.0	\N	2017-07-30 08:13:56.236176	2017-07-30 08:13:56.236176
2646	124	8	666	4.0	120.00		VAT-Inclusive	480.0	\N	2017-07-30 08:14:24.257616	2017-07-30 08:14:24.257616
2647	131	8	666	1.0	210.00	LES to S1(Pickup of Riblets,Wing flour,Fry Batter,Butter Cheese sauce and Pulled Pork)	VAT-Inclusive	210.0	\N	2017-07-30 08:17:51.880388	2017-07-30 08:17:51.880388
2648	51	11	666	31.68	4.17		VAT-Inclusive	132.0	\N	2017-07-30 08:19:39.168856	2017-07-30 08:19:39.168856
2649	51	11	666	42.24	4.17		VAT-Inclusive	176.0	\N	2017-07-30 08:20:49.913155	2017-07-30 08:20:49.913155
2650	132	8	666	1.0	230.00	National Wing Day Shirt(Berna)	VAT-Inclusive	230.0	\N	2017-07-30 08:22:09.111887	2017-07-30 08:22:09.111887
2651	130	8	666	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-30 08:22:44.85544	2017-07-30 08:22:44.85544
2652	130	8	666	1.0	30.00	Print of PCF and Delivery Summary	VAT-Inclusive	30.0	\N	2017-07-30 08:23:37.328146	2017-07-30 08:23:37.328146
2653	131	8	667	1.0	200.00	LES to S1(Transfer of Cheese Sauce and Liquors)	VAT-Inclusive	200.0	\N	2017-07-30 08:26:08.185901	2017-07-30 08:26:08.185901
2654	121	8	667	1.0	250.00	8oz(250pcs)	VAT-Inclusive	250.0	\N	2017-07-30 08:26:46.456229	2017-07-30 08:26:46.456229
2655	17	7	667	1.0	219.00		VAT-Inclusive	219.0	\N	2017-07-30 08:27:47.399334	2017-07-30 08:27:47.399334
2656	122	8	667	1.0	89.00	Joy Dishwashing Liquid	VAT-Inclusive	89.0	\N	2017-07-30 08:28:36.696691	2017-07-30 08:28:36.696691
2657	131	8	667	1.0	78.00	Glorietta to S1(Rodel Market)	VAT-Inclusive	78.0	\N	2017-07-30 08:29:27.096389	2017-07-30 08:29:27.096389
2658	137	8	667	13.0	61.54	Che,Sha,Lou,Maureen,Berna,Rodel Nico,Mico,Santos,Jethro,Jerlyn,Alvin and Dana 	VAT-Exempted	800.0	\N	2017-07-30 08:31:29.812719	2017-07-30 08:31:29.812719
2659	124	8	667	5.0	120.00	Tube ice 	VAT-Inclusive	600.0	\N	2017-07-30 08:32:11.150733	2017-07-30 08:32:11.150733
2660	51	11	667	105.6	4.02		VAT-Inclusive	425.0	\N	2017-07-30 08:33:17.182089	2017-07-30 08:33:17.182089
2661	130	8	667	1.0	355.00	Battery	VAT-Inclusive	355.0	\N	2017-07-30 08:33:52.069869	2017-07-30 08:33:52.069869
2662	130	8	667	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-07-30 08:34:27.956471	2017-07-30 08:34:27.956471
2663	121	8	668	1.0	172.50	8OZ cup	VAT-Inclusive	172.5	\N	2017-07-30 08:36:35.467477	2017-07-30 08:36:35.467477
2664	130	8	668	1.0	20.00	Landmark to S1(Santos Market)	VAT-Inclusive	20.0	\N	2017-07-30 08:37:38.935228	2017-07-30 08:37:38.935228
2665	122	8	668	1.0	89.00	Joy Dishwashing Liquid	VAT-Inclusive	89.0	\N	2017-07-30 08:38:19.918529	2017-07-30 08:38:19.918529
2666	130	8	668	1.0	189.00	LES to S1(Pickup of Cooler)	VAT-Inclusive	189.0	\N	2017-07-30 08:43:45.599931	2017-07-30 08:43:45.599931
2668	131	8	668	1.0	200.00	Quezon City to S1(Wing flour 30 pcks)	VAT-Inclusive	200.0	\N	2017-07-30 08:46:16.417878	2017-07-30 08:46:16.417878
2675	11	2	668	4.4	131.59		VAT-Inclusive	579.0	\N	2017-07-30 09:04:53.086622	2017-07-30 09:04:53.086622
2681	130	8	670	2.0	17.50	Print of PCF and Weekly Schedule	VAT-Inclusive	35.0	\N	2017-07-31 11:12:37.166665	2017-07-31 11:12:37.166665
2684	33	1	671	0.3	200.00		VAT-Exempted	60.0	\N	2017-07-31 12:03:20.090983	2017-07-31 12:03:20.090983
2687	32	1	671	3.0	60.00		VAT-Exempted	180.0	\N	2017-07-31 12:09:08.220883	2017-07-31 12:09:08.220883
2691	103	9	673	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-07-31 12:24:04.168225	2017-07-31 12:24:04.168225
2694	37	8	674	60.0	4.63		VAT-Inclusive	278.0	\N	2017-08-02 10:39:16.409674	2017-08-02 10:39:16.409674
2700	130	8	674	1.0	120.00	Battery	VAT-Inclusive	120.0	\N	2017-08-02 11:06:36.442349	2017-08-02 11:06:36.442349
2704	137	8	674	13.0	50.00	Che,Sharlaine,Maurenn,Lou,Dana,Rodel,Berna,Jethro,Je,Santos,Nico,Mico,Alvin	VAT-Exempted	650.0	\N	2017-08-02 11:16:50.986774	2017-08-02 11:16:50.986774
2706	47	2	676	60.0	53.35		VAT-Exclusive	3200.89	\N	2017-08-02 12:41:41.997317	2017-08-02 12:41:41.997317
2717	36	1	680	3.0	40.00		VAT-Exempted	120.0	\N	2017-08-05 05:26:44.573821	2017-08-05 05:26:44.573821
2718	34	1	680	3.0	120.00		VAT-Exempted	360.0	\N	2017-08-05 05:27:25.028916	2017-08-05 05:27:25.028916
2720	33	1	680	0.2	300.00		VAT-Exempted	60.0	\N	2017-08-05 05:29:07.661486	2017-08-05 05:29:07.661486
2721	21	1	680	3.0	50.00		VAT-Exempted	150.0	\N	2017-08-05 05:29:50.943476	2017-08-05 05:29:50.943476
2743	33	1	688	0.1	300.00		VAT-Exempted	30.0	\N	2017-08-05 06:02:20.477817	2017-08-05 06:02:20.477817
2747	6	1	690	10.08	370.00		VAT-Inclusive	3729.6	\N	2017-08-05 06:09:36.298446	2017-08-05 06:09:36.298446
2748	4	1	690	3.0	285.00		VAT-Inclusive	855.0	\N	2017-08-05 06:10:11.800825	2017-08-05 06:10:11.800825
2749	53	5	679	3.0	300.00		VAT-Inclusive	900.0	\N	2017-08-05 06:14:54.232852	2017-08-05 06:14:54.232852
2754	33	1	692	0.2	300.00		VAT-Exempted	60.0	\N	2017-08-05 06:26:12.582589	2017-08-05 06:26:12.582589
2758	34	1	692	2.0	120.00		VAT-Exempted	240.0	\N	2017-08-05 06:31:36.175763	2017-08-05 06:31:36.175763
2761	44	8	693	75.0	4.60		VAT-Inclusive	345.0	\N	2017-08-05 06:37:44.013295	2017-08-05 06:37:44.013295
2762	42	8	693	10.0	4.50		VAT-Inclusive	45.0	\N	2017-08-05 06:38:45.998582	2017-08-05 06:38:45.998582
2766	33	1	694	0.1	300.00		VAT-Exempted	30.0	\N	2017-08-05 06:44:56.181876	2017-08-05 06:44:56.181876
2771	34	1	696	1.0	120.00		VAT-Exempted	120.0	\N	2017-08-05 06:57:50.958731	2017-08-05 06:57:50.958731
2787	55	12	701	6.6	19.76		VAT-Inclusive	130.4	\N	2017-08-06 08:27:27.355177	2017-08-06 08:27:27.355177
2792	121	8	701	1.0	242.54	Colander and Strainer	VAT-Inclusive	242.54	\N	2017-08-06 08:36:37.046274	2017-08-06 08:36:37.046274
2802	10	2	701	2.97	75.05		VAT-Inclusive	222.9	\N	2017-08-06 08:55:36.89544	2017-08-06 08:55:36.89544
2809	130	8	701	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-08-06 09:02:44.068747	2017-08-06 09:02:44.068747
2811	123	8	701	1.0	52.00	Double Adhesive Tape	VAT-Inclusive	52.0	\N	2017-08-06 09:05:17.405659	2017-08-06 09:05:17.405659
2812	130	8	701	1.0	10.00	Print of PCF	VAT-Inclusive	10.0	\N	2017-08-06 09:05:50.713069	2017-08-06 09:05:50.713069
2819	121	8	703	4.0	70.00	260 Cups(200pcs)	VAT-Inclusive	280.0	\N	2017-08-06 09:23:17.256207	2017-08-06 09:23:17.256207
2820	130	8	703	1.0	50.00	Print of Inventory Sheet	VAT-Inclusive	50.0	\N	2017-08-06 09:23:58.732871	2017-08-06 09:23:58.732871
2822	121	8	704	1.0	172.00	Disposable Knife and Fork	VAT-Inclusive	172.0	\N	2017-08-06 09:29:12.480867	2017-08-06 09:29:12.480867
2829	32	2	705	4.4	27.27		VAT-Exempted	120.0	\N	2017-08-06 09:39:42.635005	2017-08-06 09:39:42.635005
2669	131	8	668	1.0	50.00	LES to Solaris(Alvin Market)	VAT-Inclusive	50.0	\N	2017-07-30 08:47:30.404675	2017-07-30 08:47:30.404675
2672	137	8	669	6.0	50.00	Che,Sha,Berna,Alvin,Mico and Jethro	VAT-Exempted	300.0	\N	2017-07-30 08:55:35.010439	2017-07-30 08:55:35.010439
2677	121	8	668	1.0	2559.75	cooler	VAT-Inclusive	2559.75	\N	2017-07-30 10:51:40.859888	2017-07-30 10:51:40.859888
2682	34	1	671	3.0	120.00		VAT-Exempted	360.0	\N	2017-07-31 12:02:05.303596	2017-07-31 12:02:05.303596
2690	104	9	673	72.0	28.00		VAT-Inclusive	2016.0	\N	2017-07-31 12:23:12.226565	2017-07-31 12:23:12.226565
2692	11	2	674	6.16	131.59		VAT-Inclusive	810.6	\N	2017-08-02 10:35:58.661966	2017-08-02 10:35:58.661966
2693	10	2	674	6.93	75.05		VAT-Inclusive	520.1	\N	2017-08-02 10:37:11.223237	2017-08-02 10:37:11.223237
2695	124	8	674	10.0	120.00		VAT-Inclusive	1200.0	\N	2017-08-02 10:40:07.3659	2017-08-02 10:40:07.3659
2698	48	11	674	14.08	4.51		VAT-Inclusive	63.5	\N	2017-08-02 10:43:31.699323	2017-08-02 10:43:31.699323
2699	130	8	674	1.0	135.00	Print of Employees Evalution form and Photocopy of FOHBOH Exam	VAT-Inclusive	135.0	\N	2017-08-02 10:46:44.410116	2017-08-02 10:46:44.410116
2705	39	2	676	70.0	64.73		VAT-Exclusive	4531.25	\N	2017-08-02 12:37:02.714059	2017-08-02 12:37:02.714059
2712	24	1	679	17.7	55.93		VAT-Inclusive	990.0	\N	2017-08-02 13:02:54.527052	2017-08-02 13:02:54.527052
2716	32	1	680	5.0	60.00		VAT-Exempted	300.0	\N	2017-08-05 05:26:08.88411	2017-08-05 05:26:08.88411
2723	61	1	680	20.0	50.00		VAT-Exempted	1000.0	\N	2017-08-05 05:31:17.422158	2017-08-05 05:31:17.422158
2726	26	1	683	24.54	142.00		VAT-Inclusive	3484.68	\N	2017-08-05 05:39:42.343966	2017-08-05 05:39:42.343966
2728	95	8	684	108.0	16.94		VAT-Inclusive	1830.0	\N	2017-08-05 05:43:39.869834	2017-08-05 05:43:39.869834
2729	13	1	684	1.0	600.00		VAT-Inclusive	600.0	\N	2017-08-05 05:44:14.358228	2017-08-05 05:44:14.358228
2730	3	1	685	1.0	340.00		VAT-Inclusive	340.0	\N	2017-08-05 05:47:10.396316	2017-08-05 05:47:10.396316
2733	4	1	685	3.0	285.00		VAT-Inclusive	855.0	\N	2017-08-05 05:49:38.603981	2017-08-05 05:49:38.603981
2734	9	1	686	50.38	149.00		VAT-Exempted	7506.62	\N	2017-08-05 05:52:46.999431	2017-08-05 05:52:46.999431
2738	9	1	687	40.0	149.00		VAT-Exempted	5960.0	\N	2017-08-05 05:57:15.584831	2017-08-05 05:57:15.584831
2745	8	1	689	20.18	179.00		VAT-Exempted	3612.22	\N	2017-08-05 06:06:06.503546	2017-08-05 06:06:06.503546
2746	5	1	690	28.66	385.00		VAT-Inclusive	11034.1	\N	2017-08-05 06:08:46.291847	2017-08-05 06:08:46.291847
2752	9	1	691	30.14	149.00		VAT-Exempted	4490.86	\N	2017-08-05 06:22:35.128943	2017-08-05 06:22:35.128943
2755	27	1	692	0.5	95.00		VAT-Exempted	47.5	\N	2017-08-05 06:27:12.475007	2017-08-05 06:27:12.475007
2764	21	1	694	5.0	50.00		VAT-Exempted	250.0	\N	2017-08-05 06:43:42.000818	2017-08-05 06:43:42.000818
2770	36	1	696	2.0	40.00		VAT-Exempted	80.0	\N	2017-08-05 06:57:00.317144	2017-08-05 06:57:00.317144
2773	121	8	697	1000.0	0.85		VAT-Exclusive	850.0	\N	2017-08-05 07:57:24.670677	2017-08-05 07:57:24.670677
2775	123	8	698	1.0	150.00		VAT-Inclusive	150.0	\N	2017-08-05 08:02:50.635046	2017-08-05 08:02:50.635046
2777	129	8	699	1.0	2900.00		VAT-Inclusive	2900.0	\N	2017-08-05 08:06:59.671623	2017-08-05 08:06:59.671623
2779	107	12	700	384.0	4.28		VAT-Inclusive	1644.0	\N	2017-08-05 09:08:35.994565	2017-08-05 09:08:35.994565
2782	49	6	701	3.0	198.00		VAT-Inclusive	594.0	\N	2017-08-06 08:12:35.331812	2017-08-06 08:12:35.331812
2783	92	2	701	4.4	21.00		VAT-Exempted	92.4	\N	2017-08-06 08:13:46.845624	2017-08-06 08:13:46.845624
2788	71	12	701	7.04	15.31		VAT-Inclusive	107.8	\N	2017-08-06 08:29:13.619307	2017-08-06 08:29:13.619307
2797	10	2	701	23.76	65.03		VAT-Exclusive	1545.0	\N	2017-08-06 08:46:42.4529	2017-08-06 08:46:42.4529
2803	137	8	701	13.0	57.69	Che,Sharlaine,lou,Maureen,Nico,Berna,Jerlyn,Jethro,Santos,Rodel,Alvin,Mico and Dana	VAT-Exempted	750.0	\N	2017-08-06 08:57:57.660725	2017-08-06 08:57:57.660725
2808	121	8	701	2.0	75.00	520 Lids(2packs)	VAT-Inclusive	150.0	\N	2017-08-06 09:02:17.587556	2017-08-06 09:02:17.587556
2810	123	8	701	2.0	36.00	Adhesive Tape	VAT-Inclusive	72.0	\N	2017-08-06 09:04:05.11073	2017-08-06 09:04:05.11073
2817	124	8	703	3.0	120.00	Tube Ice	VAT-Inclusive	360.0	\N	2017-08-06 09:20:43.9385	2017-08-06 09:20:43.9385
2818	137	8	703	7.0	50.00	Jerlyn, Lou,Berna,Dana,Maureen,Santos and Rodel	VAT-Exempted	350.0	\N	2017-08-06 09:22:10.94624	2017-08-06 09:22:10.94624
2821	137	8	704	6.0	50.00	Che,Sharlaine,Nico,Alvin,Mico and Jethro	VAT-Exempted	300.0	\N	2017-08-06 09:26:19.968831	2017-08-06 09:26:19.968831
2826	33	11	705	10.56	8.52		VAT-Exempted	90.0	\N	2017-08-06 09:37:32.264206	2017-08-06 09:37:32.264206
2827	27	2	705	1.1	43.18		VAT-Exempted	47.5	\N	2017-08-06 09:38:28.220966	2017-08-06 09:38:28.220966
2670	137	8	668	7.0	50.00	Dana,Jerlyn,Maureen,Nico,Rodel,Je and Santos	VAT-Exempted	350.0	\N	2017-07-30 08:51:47.231756	2017-07-30 08:51:47.231756
2671	121	8	669	1.0	455.60	8OZ CUP	VAT-Inclusive	455.6	\N	2017-07-30 08:54:20.806879	2017-07-30 08:54:20.806879
2673	122	8	669	1.0	89.00	Joy (250ML)	VAT-Inclusive	89.0	\N	2017-07-30 08:56:12.268345	2017-07-30 08:56:12.268345
2674	122	8	669	1.0	26.00	Joy(85ml)	VAT-Inclusive	26.0	\N	2017-07-30 08:56:52.407735	2017-07-30 08:56:52.407735
2676	10	2	668	4.95	75.05		VAT-Inclusive	371.5	\N	2017-07-30 09:05:56.197732	2017-07-30 09:05:56.197732
2680	122	8	670	1.0	89.00	Joy(250ml)	VAT-Inclusive	89.0	\N	2017-07-31 11:11:33.9422	2017-07-31 11:11:33.9422
2685	27	1	671	0.5	95.00		VAT-Exempted	47.5	\N	2017-07-31 12:04:14.532096	2017-07-31 12:04:14.532096
2686	21	1	671	3.0	55.00		VAT-Exempted	165.0	\N	2017-07-31 12:05:23.034176	2017-07-31 12:05:23.034176
2688	22	1	671	0.5	55.00		VAT-Exempted	27.5	\N	2017-07-31 12:09:54.258937	2017-07-31 12:09:54.258937
2697	122	8	674	1.0	73.25		VAT-Inclusive	73.25	\N	2017-08-02 10:42:06.106636	2017-08-02 10:42:06.106636
2702	137	8	675	13.0	50.00	Che,Sharlaine,Maureen,Berna,Lou,Rodel,Alvin,Dana,je,Jethro,Nico,Mico and Santos	VAT-Exempted	650.0	\N	2017-08-02 11:12:22.050135	2017-08-02 11:12:22.050135
2707	64	5	676	2.0	506.25		VAT-Exclusive	1012.5	\N	2017-08-02 12:44:59.610514	2017-08-02 12:44:59.610514
2708	68	5	676	3.0	609.38		VAT-Exclusive	1828.13	\N	2017-08-02 12:52:13.129152	2017-08-02 12:52:13.129152
2715	19	6	679	2.0	55.00		VAT-Inclusive	110.0	\N	2017-08-02 13:05:09.079028	2017-08-02 13:05:09.079028
2719	27	1	680	0.5	95.00		VAT-Exempted	47.5	\N	2017-08-05 05:28:26.276294	2017-08-05 05:28:26.276294
2724	47	2	681	60.0	53.35		VAT-Exclusive	3200.89	\N	2017-08-05 05:34:34.501252	2017-08-05 05:34:34.501252
2727	1	1	684	8.0	195.00		VAT-Exempted	1560.0	\N	2017-08-05 05:42:04.313602	2017-08-05 05:42:04.313602
2732	6	1	685	10.12	370.00		VAT-Inclusive	3744.4	\N	2017-08-05 05:48:51.419188	2017-08-05 05:48:51.419188
2739	8	1	687	15.0	179.00		VAT-Exempted	2685.0	\N	2017-08-05 05:58:13.868035	2017-08-05 05:58:13.868035
2742	21	1	688	2.0	50.00		VAT-Exempted	100.0	\N	2017-08-05 06:01:35.583579	2017-08-05 06:01:35.583579
2750	17	7	679	5.0	308.00		VAT-Inclusive	1540.0	\N	2017-08-05 06:15:39.836313	2017-08-05 06:15:39.836313
2759	30	8	692	15.0	15.00		VAT-Exempted	225.0	\N	2017-08-05 06:32:44.998287	2017-08-05 06:32:44.998287
2760	61	1	692	20.0	45.00		VAT-Exempted	900.0	\N	2017-08-05 06:33:37.333271	2017-08-05 06:33:37.333271
2767	61	1	694	15.0	45.00		VAT-Exempted	675.0	\N	2017-08-05 06:45:36.677129	2017-08-05 06:45:36.677129
2768	9	1	695	50.0	149.00		VAT-Exempted	7450.0	\N	2017-08-05 06:52:51.436773	2017-08-05 06:52:51.436773
2776	121	8	698	1.0	4575.00		VAT-Inclusive	4575.0	\N	2017-08-05 08:03:38.001206	2017-08-05 08:03:38.001206
2784	93	2	701	4.4	24.82		VAT-Inclusive	109.2	\N	2017-08-06 08:15:05.650601	2017-08-06 08:15:05.650601
2785	41	12	701	38.08	8.69		VAT-Inclusive	330.8	\N	2017-08-06 08:16:40.418692	2017-08-06 08:16:40.418692
2789	48	11	701	49.28	4.60		VAT-Inclusive	226.45	\N	2017-08-06 08:31:00.353244	2017-08-06 08:31:00.353244
2794	131	8	701	1.0	120.00	Landmark to S1( Rodel Open Market)	VAT-Inclusive	120.0	\N	2017-08-06 08:38:55.724971	2017-08-06 08:38:55.724971
2795	123	8	701	3.0	27.83	White Board Marker	VAT-Inclusive	83.5	\N	2017-08-06 08:39:35.471003	2017-08-06 08:39:35.471003
2796	122	8	701	6.0	186.67	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-08-06 08:41:33.748995	2017-08-06 08:41:33.748995
2798	11	2	701	21.12	114.04		VAT-Exclusive	2408.57	\N	2017-08-06 08:47:31.894916	2017-08-06 08:47:31.894916
2799	76	4	701	12.0	18.08		VAT-Inclusive	216.9	\N	2017-08-06 08:50:15.836788	2017-08-06 08:50:15.836788
2800	93	2	701	2.2	24.82		VAT-Inclusive	54.6	\N	2017-08-06 08:51:11.039381	2017-08-06 08:51:11.039381
2801	11	2	701	3.52	131.59		VAT-Inclusive	463.2	\N	2017-08-06 08:53:29.320708	2017-08-06 08:53:29.320708
2805	124	8	701	4.0	120.00		VAT-Inclusive	480.0	\N	2017-08-06 08:59:31.409174	2017-08-06 08:59:31.409174
2814	124	8	702	5.0	120.00	Tube Ice	VAT-Inclusive	600.0	\N	2017-08-06 09:14:26.63197	2017-08-06 09:14:26.63197
2823	122	8	704	2.0	26.00	Joy 85ml	VAT-Inclusive	52.0	\N	2017-08-06 09:29:41.977536	2017-08-06 09:29:41.977536
2825	22	2	705	1.1	36.36		VAT-Exempted	40.0	\N	2017-08-06 09:36:02.801002	2017-08-06 09:36:02.801002
2830	30	8	705	20.0	15.00		VAT-Exempted	300.0	\N	2017-08-06 09:40:19.483705	2017-08-06 09:40:19.483705
2832	21	2	705	4.4	22.73		VAT-Exempted	100.0	\N	2017-08-06 09:42:17.565552	2017-08-06 09:42:17.565552
2678	137	8	670	13.0	50.00	Che,Sharlaine,lou,Maureen,Berna,Santos,Alvin,Mico,Nico,Dana,Jethro and Jerlyn	VAT-Exempted	650.0	\N	2017-07-31 11:09:55.018877	2017-07-31 11:09:55.018877
2679	130	8	670	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-07-31 11:10:50.130145	2017-07-31 11:10:50.130145
2683	36	1	671	3.0	40.00		VAT-Exempted	120.0	\N	2017-07-31 12:02:39.398382	2017-07-31 12:02:39.398382
2689	9	1	672	19.2	149.00		VAT-Exempted	2860.8	\N	2017-07-31 12:18:44.762943	2017-07-31 12:18:44.762943
2701	122	8	674	1.0	89.00	Joy	VAT-Inclusive	89.0	\N	2017-08-02 11:07:14.035822	2017-08-02 11:07:14.035822
2703	124	8	675	4.0	120.00		VAT-Inclusive	480.0	\N	2017-08-02 11:13:04.736482	2017-08-02 11:13:04.736482
2709	70	6	676	1.0	246.06		VAT-Exclusive	246.06	\N	2017-08-02 12:53:13.86815	2017-08-02 12:53:13.86815
2710	77	9	678	3.0	225.00		VAT-Exclusive	675.0	\N	2017-08-02 12:58:46.411184	2017-08-02 12:58:46.411184
2711	67	5	678	1.0	796.88		VAT-Exclusive	796.88	\N	2017-08-02 12:59:42.474542	2017-08-02 12:59:42.474542
2713	40	1	679	9.6	112.50		VAT-Inclusive	1080.0	\N	2017-08-02 13:04:20.068275	2017-08-02 13:04:20.068275
2722	20	1	680	0.1	180.00		VAT-Exempted	18.0	\N	2017-08-05 05:30:33.201225	2017-08-05 05:30:33.201225
2725	18	5	682	5.0	450.00		VAT-Inclusive	2250.0	\N	2017-08-05 05:37:19.138283	2017-08-05 05:37:19.138283
2731	5	1	685	19.91	385.00		VAT-Inclusive	7665.35	\N	2017-08-05 05:47:59.877229	2017-08-05 05:47:59.877229
2737	8	1	686	12.62	179.00		VAT-Exempted	2258.98	\N	2017-08-05 05:53:50.73365	2017-08-05 05:53:50.73365
2740	23	1	688	0.1	300.00		VAT-Exempted	30.0	\N	2017-08-05 06:00:07.775136	2017-08-05 06:00:07.775136
2741	32	1	688	3.0	60.00		VAT-Exempted	180.0	\N	2017-08-05 06:00:44.835876	2017-08-05 06:00:44.835876
2744	9	1	689	49.88	149.00		VAT-Exempted	7432.12	\N	2017-08-05 06:05:21.519884	2017-08-05 06:05:21.519884
2751	16	4	679	20.0	42.50		VAT-Inclusive	850.0	\N	2017-08-05 06:17:15.527086	2017-08-05 06:17:15.527086
2753	32	1	692	4.0	60.00		VAT-Exempted	240.0	\N	2017-08-05 06:25:07.596648	2017-08-05 06:25:07.596648
2756	23	1	692	0.1	300.00		VAT-Exempted	30.0	\N	2017-08-05 06:29:00.055414	2017-08-05 06:29:00.055414
2757	36	1	692	3.0	40.00		VAT-Exempted	120.0	\N	2017-08-05 06:29:40.466498	2017-08-05 06:29:40.466498
2763	43	8	693	10.0	6.60		VAT-Inclusive	66.0	\N	2017-08-05 06:39:26.306316	2017-08-05 06:39:26.306316
2765	22	1	694	0.25	80.00		VAT-Exempted	20.0	\N	2017-08-05 06:44:22.500324	2017-08-05 06:44:22.500324
2769	33	1	696	0.2	200.00		VAT-Exempted	40.0	\N	2017-08-05 06:55:59.407415	2017-08-05 06:55:59.407415
2772	32	1	696	2.0	60.00		VAT-Exempted	120.0	\N	2017-08-05 06:58:27.850426	2017-08-05 06:58:27.850426
2774	122	8	698	1.0	1021.00		VAT-Inclusive	1021.0	\N	2017-08-05 08:00:27.909544	2017-08-05 08:00:27.909544
2778	97	9	700	6.0	274.00		VAT-Inclusive	1644.0	\N	2017-08-05 09:06:24.038046	2017-08-05 09:06:24.038046
2780	74	12	701	38.4	8.97		VAT-Inclusive	344.4	\N	2017-08-06 08:03:31.294528	2017-08-06 08:03:31.294528
2786	73	12	701	43.68	10.18		VAT-Inclusive	444.6	\N	2017-08-06 08:18:30.56696	2017-08-06 08:18:30.56696
2790	76	4	701	16.0	18.08		VAT-Inclusive	289.2	\N	2017-08-06 08:34:40.05969	2017-08-06 08:34:40.05969
2793	131	8	701	1.0	50.00	Glorietta to S1(Alvin Market)	VAT-Inclusive	50.0	\N	2017-08-06 08:37:29.736396	2017-08-06 08:37:29.736396
2804	123	8	701	1.0	700.00	Journal(1Box)	VAT-Inclusive	700.0	\N	2017-08-06 08:58:57.152611	2017-08-06 08:58:57.152611
2806	121	8	701	1.0	250.00	Gloves(1Box)	VAT-Inclusive	250.0	\N	2017-08-06 09:00:07.1282	2017-08-06 09:00:07.1282
2807	130	8	701	1.0	243.00	Print and Lamination of Recipe Book	VAT-Inclusive	243.0	\N	2017-08-06 09:01:20.145857	2017-08-06 09:01:20.145857
2813	137	8	702	13.0	61.54	Che,Sharlaine,Lou.Maureen,Alvin,Berna,Rodel,Dana,Jerlyn,Jethro,Nico,Mico and Santos	VAT-Exempted	800.0	\N	2017-08-06 09:13:50.54334	2017-08-06 09:13:50.54334
2815	129	8	702	1.0	300.00	Repairs of Laptop Charger	VAT-Inclusive	300.0	\N	2017-08-06 09:16:42.369518	2017-08-06 09:16:42.369518
2816	137	8	703	1.0	26.00	1 Box Mediplast Banaid	VAT-Inclusive	26.0	\N	2017-08-06 09:20:09.538752	2017-08-06 09:20:09.538752
2824	130	8	704	1.0	220.00	Katipunan to S1(Transfer of Wing Flour)	VAT-Inclusive	220.0	\N	2017-08-06 09:32:44.874249	2017-08-06 09:32:44.874249
2831	61	2	705	33.0	20.45		VAT-Exempted	675.0	\N	2017-08-06 09:41:30.051267	2017-08-06 09:41:30.051267
2833	130	8	706	1.0	15.00	Photocopy of Job Hazard for Cleaning of Exhaust	VAT-Inclusive	15.0	\N	2017-08-09 07:29:10.657847	2017-08-09 07:29:10.657847
2834	137	8	706	13.0	50.00	Che,Sharlaine,Maureen,Lou,Berna,Rodel,Alvin,Dana,Mico,Nico,Jerlyn,Jethro and Santos	VAT-Exempted	650.0	\N	2017-08-09 07:30:59.381317	2017-08-09 07:30:59.381317
2835	124	8	706	4.0	120.00	Tube Ice	VAT-Inclusive	480.0	\N	2017-08-09 07:31:44.372797	2017-08-09 07:31:44.372797
2836	58	1	706	1.0	290.00		VAT-Inclusive	290.0	\N	2017-08-09 07:38:28.930312	2017-08-09 07:38:28.930312
2837	130	8	706	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-08-09 07:39:13.139622	2017-08-09 07:39:13.139622
2839	122	8	706	2.0	89.00	Joy(250ml)	VAT-Inclusive	178.0	\N	2017-08-09 07:40:54.998675	2017-08-09 07:40:54.998675
2840	130	8	706	1.0	15.00	Print of PCF and Weekly Schedule	VAT-Inclusive	15.0	\N	2017-08-09 07:41:43.225149	2017-08-09 07:41:43.225149
2841	137	8	707	13.0	50.00	Che,Sharlaine,Berna,Lou,Maureen,Rodel,Alvin,Mico,Nico,Santos,Jethro,Jerlyn and Dana	VAT-Exempted	650.0	\N	2017-08-09 07:45:14.301733	2017-08-09 07:45:14.301733
2842	121	8	707	1.0	620.00	260cups and 8oz	VAT-Inclusive	620.0	\N	2017-08-09 07:46:21.0534	2017-08-09 07:46:21.0534
2847	124	8	707	4.0	120.00	Tube Ice	VAT-Inclusive	480.0	\N	2017-08-09 07:47:34.945218	2017-08-09 07:47:34.945218
2848	122	8	707	1.0	89.00	Joy 250ml	VAT-Inclusive	89.0	\N	2017-08-09 07:48:21.294435	2017-08-09 07:48:21.294435
2849	122	8	707	1.0	45.00	Joy 45ml	VAT-Inclusive	45.0	\N	2017-08-09 07:48:51.519025	2017-08-09 07:48:51.519025
2850	131	8	707	1.0	20.00	Guadalupe to S1(Santos Market)	VAT-Inclusive	20.0	\N	2017-08-09 07:49:40.814636	2017-08-09 07:49:40.814636
2851	137	8	707	1.0	26.00	Mediplast (1Box)	VAT-Inclusive	26.0	\N	2017-08-09 07:50:28.588529	2017-08-09 07:50:28.588529
2852	137	8	708	13.0	50.00	Che,Sharlaine,Maureen,Lou,Berna,Rodel,Dana,Alvin,Jethro,Jerlyn,Santos,Mico and Nico	VAT-Exempted	650.0	\N	2017-08-09 07:53:43.242074	2017-08-09 07:53:43.242074
2853	124	8	708	4.0	120.00	Tube Ice	VAT-Inclusive	480.0	\N	2017-08-09 07:54:19.164003	2017-08-09 07:54:19.164003
2854	37	8	708	2.0	37.00		VAT-Inclusive	74.0	\N	2017-08-09 07:55:22.383407	2017-08-09 07:55:22.383407
2855	37	8	708	1.0	37.00		VAT-Inclusive	37.0	\N	2017-08-09 07:56:15.942011	2017-08-09 07:56:15.942011
2858	121	8	709	1.0	4678.00		VAT-Inclusive	4678.0	\N	2017-08-09 08:37:58.96411	2017-08-09 08:37:58.96411
2862	122	8	709	1.0	899.00		VAT-Inclusive	899.0	\N	2017-08-09 08:39:34.064391	2017-08-09 08:39:34.064391
2865	123	8	709	1.0	120.00		VAT-Inclusive	120.0	\N	2017-08-09 08:40:31.16914	2017-08-09 08:40:31.16914
2866	99	7	710	1.0	1404.00	Pepsi Max(24cans)Pepsi Reg(48cans)	VAT-Exclusive	1404.0	\N	2017-08-09 09:04:49.79122	2017-08-09 09:04:49.79122
2867	121	8	711	1.0	952.00	Buffalos Liner	VAT-Inclusive	952.0	\N	2017-08-09 09:07:04.725848	2017-08-09 09:07:04.725848
2868	103	9	712	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-08-09 09:13:02.271719	2017-08-09 09:13:02.271719
2869	104	9	712	96.0	28.00		VAT-Inclusive	2688.0	\N	2017-08-09 09:13:52.622736	2017-08-09 09:13:52.622736
2870	32	2	713	11.0	27.27		VAT-Exempted	300.0	\N	2017-08-09 09:18:21.158626	2017-08-09 09:18:21.158626
2871	34	1	713	2.0	120.00		VAT-Exempted	240.0	\N	2017-08-09 09:19:54.375607	2017-08-09 09:19:54.375607
2872	36	1	713	2.0	40.00		VAT-Exempted	80.0	\N	2017-08-09 09:20:47.29114	2017-08-09 09:20:47.29114
2876	137	8	716	13.0	57.69	Che,Maureen,Sharlaine,Lou,Jerlyn,Alvin,Dana,Berna,Jethro,Santos Miko,Nico and Rodel	VAT-Exempted	750.0	\N	2017-08-12 07:59:30.815372	2017-08-12 07:59:30.815372
2877	131	8	716	1.0	25.00	Guadalupe to S1 (Market Restaurant Supplies)	VAT-Inclusive	25.0	\N	2017-08-12 08:08:45.587616	2017-08-12 08:08:45.587616
2878	130	8	716	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-08-12 08:09:19.273638	2017-08-12 08:09:19.273638
2879	124	8	716	4.0	120.00		VAT-Inclusive	480.0	\N	2017-08-12 08:10:15.489248	2017-08-12 08:10:15.489248
2883	121	8	717	1.0	870.00	260 cups(6packs),8oz(6packs) and 520 lids(2pcks)	VAT-Inclusive	870.0	\N	2017-08-12 09:22:31.797916	2017-08-12 09:22:31.797916
2885	124	8	717	5.0	120.00		VAT-Inclusive	600.0	\N	2017-08-12 09:25:11.273411	2017-08-12 09:25:11.273411
2886	131	8	717	1.0	145.00	Guadalupe to S1(santos market)	VAT-Inclusive	145.0	\N	2017-08-12 09:29:38.776484	2017-08-12 09:29:38.776484
2889	130	8	717	1.0	60.00	Print of Training Agreement	VAT-Inclusive	60.0	\N	2017-08-12 09:35:17.288598	2017-08-12 09:35:17.288598
2893	99	7	719	120.0	19.50	Pepsi Reg(48cans)Max(24cans)Mountain Dew(24cans)and Mug (24cans)	VAT-Inclusive	2340.0	\N	2017-08-12 10:08:49.60943	2017-08-12 10:08:49.60943
2896	137	8	721	12.0	50.00	Che,Sharlaine,Maureen,Lou,Niko,Rodel,Mico,Dana,Santos,Berna,Alvin and  Jethro	VAT-Exempted	600.0	\N	2017-08-19 10:46:05.885743	2017-08-19 10:46:05.885743
2898	122	8	721	1.0	178.00	Joy	VAT-Inclusive	178.0	\N	2017-08-19 10:58:35.180976	2017-08-19 10:58:35.180976
2902	137	8	722	12.0	50.00	Che,Lou,Maureen,Niko,Mico,Rodel,Dana,Alvin,sha,Santos,Berna and Jethro	VAT-Exempted	600.0	\N	2017-08-19 11:21:17.158672	2017-08-19 11:21:17.158672
2906	130	8	722	1.0	150.00	Payslip	VAT-Inclusive	150.0	\N	2017-08-19 11:27:11.647749	2017-08-19 11:27:11.647749
2908	122	8	722	1.0	50.00	Dust pan	VAT-Inclusive	50.0	\N	2017-08-19 11:28:58.043168	2017-08-19 11:28:58.043168
2880	121	8	716	1.0	222.00	Plastic Spoon and 520 lids	VAT-Inclusive	222.0	\N	2017-08-12 09:16:13.623473	2017-08-12 09:16:13.623473
2881	121	8	716	1.0	105.00	Flourescent	VAT-Inclusive	105.0	\N	2017-08-12 09:16:55.880311	2017-08-12 09:16:55.880311
2892	122	8	718	1.0	89.00	Joy(250ml)	VAT-Inclusive	89.0	\N	2017-08-12 09:43:33.494559	2017-08-12 09:43:33.494559
2897	124	8	721	4.0	120.00		VAT-Inclusive	480.0	\N	2017-08-19 10:55:46.051403	2017-08-19 10:55:46.051403
2910	131	8	722	1.0	20.00	Landmark to S1(Rodel Market)\r\n	VAT-Inclusive	20.0	\N	2017-08-19 11:38:11.904513	2017-08-19 11:38:11.904513
2882	122	8	716	1.0	25.00	Stick broom	VAT-Inclusive	25.0	\N	2017-08-12 09:17:41.338467	2017-08-12 09:17:41.338467
2887	121	8	717	1.0	144.00	Plastic Spoon and Fork	VAT-Inclusive	144.0	\N	2017-08-12 09:30:15.170641	2017-08-12 09:30:15.170641
2888	131	8	717	1.0	92.00	Rustan's to S1(Rodel Market)	VAT-Inclusive	92.0	\N	2017-08-12 09:31:08.347896	2017-08-12 09:31:08.347896
2890	130	8	717	1.0	160.00	Grab Payment (Cheetos Shirt)	VAT-Inclusive	160.0	\N	2017-08-12 09:37:03.857527	2017-08-12 09:37:03.857527
2894	122	8	720	1.0	637.00		VAT-Inclusive	637.0	\N	2017-08-12 10:16:19.582818	2017-08-12 10:16:19.582818
2899	122	8	721	1.0	89.00	Joy	VAT-Inclusive	89.0	\N	2017-08-19 10:59:12.402167	2017-08-19 10:59:12.402167
2900	130	8	721	1.0	45.00	Print of Time Sheet,Schedule And Drugtest Agreement	VAT-Inclusive	45.0	\N	2017-08-19 11:00:34.120693	2017-08-19 11:00:34.120693
2901	130	8	721	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-08-19 11:01:25.695896	2017-08-19 11:01:25.695896
2905	122	8	722	2.0	100.00	Joy Antibac	VAT-Inclusive	200.0	\N	2017-08-19 11:23:58.854253	2017-08-19 11:23:58.854253
2884	137	8	717	12.0	62.50	Che,Sharlaine,Lou,Maureen,Berna,Jethro,Nico,Mico,Santos,Alvin,Dana and Rodel	VAT-Exempted	750.0	\N	2017-08-12 09:24:35.019088	2017-08-12 09:24:35.019088
2891	137	8	718	5.0	60.00	Rodel,Dana,Maureen,Berna and Sharlaine	VAT-Exempted	300.0	\N	2017-08-12 09:42:58.35468	2017-08-12 09:42:58.35468
2895	123	8	720	1.0	160.00		VAT-Inclusive	160.0	\N	2017-08-12 10:16:56.766426	2017-08-12 10:16:56.766426
2903	124	8	722	5.0	120.00		VAT-Inclusive	600.0	\N	2017-08-19 11:22:16.413996	2017-08-19 11:22:16.413996
2904	121	8	722	1.0	372.00	520 Lids and Fork(4packs)	VAT-Inclusive	372.0	\N	2017-08-19 11:23:09.341822	2017-08-19 11:23:09.341822
2907	122	8	722	1.0	50.00	Bleach	VAT-Inclusive	50.0	\N	2017-08-19 11:28:24.398468	2017-08-19 11:28:24.398468
2909	131	8	722	1.0	20.00	Guadalupe to S1(Market of Restaurant Supplies)	VAT-Inclusive	20.0	\N	2017-08-19 11:30:39.370297	2017-08-19 11:30:39.370297
2911	124	8	723	3.0	120.00		VAT-Inclusive	360.0	\N	2017-08-19 12:03:11.176344	2017-08-19 12:03:11.176344
2912	137	8	723	7.0	50.00	Rodel,Sharlaine,Dana,Nico,Berna, Maureen and Santos	VAT-Inclusive	350.0	\N	2017-08-19 12:04:31.231527	2017-08-19 12:04:31.231527
2913	130	8	723	1.0	80.00	Photocopy of  Inventory Form	VAT-Inclusive	80.0	\N	2017-08-19 12:05:23.779282	2017-08-19 12:05:23.779282
2914	122	8	724	1.0	1165.00		VAT-Inclusive	1165.0	\N	2017-08-19 12:12:36.002579	2017-08-19 12:12:36.002579
2915	49	6	725	3.0	198.00		VAT-Inclusive	594.0	\N	2017-08-21 07:59:15.843454	2017-08-21 07:59:15.843454
2916	137	8	725	8.0	50.00	Rodel,Alvin,Lou,Maureen,Sharlaine,Jethro,Mico and Santos	VAT-Exempted	400.0	\N	2017-08-21 08:01:56.777472	2017-08-21 08:01:56.777472
2917	131	8	725	1.0	102.00	Landmark to S1 (Rodel Market)	VAT-Inclusive	102.0	\N	2017-08-21 08:04:43.966547	2017-08-21 08:04:43.966547
2918	100	9	727	120.0	32.50		VAT-Inclusive	3900.0	\N	2017-08-23 13:09:34.527762	2017-08-23 13:09:34.527762
2919	121	8	728	1000.0	0.95	Buffalos Liner	VAT-Inclusive	952.0	\N	2017-08-23 13:15:21.532467	2017-08-23 13:15:21.532467
2920	121	8	729	1.0	1220.00	Paper Towel and Pet Cup	VAT-Inclusive	1220.0	\N	2017-08-23 13:17:19.680306	2017-08-23 13:17:19.680306
2921	99	7	730	1.0	1404.00	Pepsi Reg & Mountain Dew	VAT-Inclusive	1404.0	\N	2017-08-23 13:19:55.672876	2017-08-23 13:19:55.672876
2922	104	9	731	48.0	28.00		VAT-Inclusive	1344.0	\N	2017-08-23 13:59:45.908544	2017-08-23 13:59:45.908544
2923	103	9	731	144.0	30.63		VAT-Inclusive	4410.0	\N	2017-08-23 14:00:27.641863	2017-08-23 14:00:27.641863
2924	97	9	732	12.0	274.00		VAT-Inclusive	3288.0	\N	2017-08-23 14:03:29.703826	2017-08-23 14:03:29.703826
2925	124	8	733	5.0	120.00		VAT-Inclusive	600.0	\N	2017-08-29 14:30:26.161531	2017-08-29 14:30:26.161531
2926	121	8	733	1.0	5071.00	Microwave	VAT-Inclusive	5071.0	\N	2017-08-29 14:31:38.623945	2017-08-29 14:31:38.623945
2927	37	8	733	12.0	6.17		VAT-Inclusive	74.0	\N	2017-08-29 14:32:29.067331	2017-08-29 14:32:29.067331
2928	137	8	733	8.0	50.00	Jerlyn,Sharlaine,Mico,Santos,Berna,Dana and Rodel	VAT-Exempted	400.0	\N	2017-08-29 14:34:55.1882	2017-08-29 14:34:55.1882
2929	131	8	733	1.0	102.00	SM Makati to Solaris(buy Microwave)	VAT-Inclusive	102.0	\N	2017-08-29 14:36:04.217685	2017-08-29 14:36:04.217685
2930	130	8	733	1.0	100.00	Transmittal\r\n	VAT-Inclusive	100.0	\N	2017-08-29 14:53:28.088651	2017-08-29 14:53:28.088651
2931	123	8	733	1.0	36.00	Scotch Tape\r\n	VAT-Inclusive	36.0	\N	2017-08-29 14:54:14.185341	2017-08-29 14:54:14.185341
2932	137	8	735	13.0	50.00	Che,Jerlyn,Sharlaine,Dana,Mico,Santos,Nico,Berna,Maureen,alvin,Jethro and Lou	VAT-Exempted	650.0	\N	2017-09-09 10:56:48.84112	2017-09-09 10:56:48.84112
2933	130	8	735	1.0	90.00	Band aid	VAT-Inclusive	90.0	\N	2017-09-09 10:57:32.506661	2017-09-09 10:57:32.506661
2934	124	8	735	4.0	120.00		VAT-Inclusive	480.0	\N	2017-09-09 10:59:11.047563	2017-09-09 10:59:11.047563
2935	130	8	735	1.0	80.00	Laminate of Recipe Book	VAT-Inclusive	80.0	\N	2017-09-09 10:59:47.472424	2017-09-09 10:59:47.472424
2936	137	8	736	12.0	54.17	Che,Jerlyn,Dana,Lou,Maureen,Berna,Jethro,Nicols,Sha,Rodel,Alvin,and Mico	VAT-Exempted	650.0	\N	2017-09-09 11:04:43.861244	2017-09-09 11:04:43.861244
2937	124	8	736	4.0	120.00		VAT-Inclusive	480.0	\N	2017-09-09 11:25:59.025473	2017-09-09 11:25:59.025473
2938	130	1	736	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-09-09 11:31:00.742883	2017-09-09 11:31:00.742883
2939	122	8	736	3.0	89.00	Joy	VAT-Inclusive	267.0	\N	2017-09-09 11:33:43.104772	2017-09-09 11:33:43.104772
2940	131	8	736	1.0	107.00	LES to S1 (Borrow Cheese Sauce)	VAT-Inclusive	107.0	\N	2017-09-09 11:34:41.882636	2017-09-09 11:34:41.882636
2941	121	8	736	1.0	59.00	Trashliner	VAT-Inclusive	59.0	\N	2017-09-09 11:36:05.186593	2017-09-09 11:36:05.186593
2942	137	8	737	7.0	50.00	Sharlaine,Lou,Rodel,Maureen,Dana,Santos, and Nichols	VAT-Exempted	350.0	\N	2017-09-09 11:50:55.93856	2017-09-09 11:50:55.93856
2943	130	8	737	1.0	155.00	MMB to S1 (Borrow crinkle Fries) 	VAT-Inclusive	155.0	\N	2017-09-09 11:52:45.735218	2017-09-09 11:52:45.735218
2944	130	8	737	1.0	119.00	LES to S1 (Borrow Homestyle sauce)	VAT-Inclusive	119.0	\N	2017-09-09 11:57:16.992999	2017-09-09 11:57:16.992999
2945	122	8	737	1.0	28.00	Powder	VAT-Inclusive	28.0	\N	2017-09-09 12:00:51.968906	2017-09-09 12:00:51.968906
2946	121	8	738	1.0	518.00	Trashliner,Knife and fork	VAT-Inclusive	518.0	\N	2017-09-09 12:05:17.317453	2017-09-09 12:05:17.317453
2947	123	8	738	1.0	55.00	Masking Tape and Scotch Tape	VAT-Inclusive	55.0	\N	2017-09-09 12:06:14.813631	2017-09-09 12:06:14.813631
2948	103	9	739	24.0	30.63		VAT-Inclusive	735.0	\N	2017-09-09 12:13:24.06448	2017-09-09 12:13:24.06448
2949	104	9	739	96.0	28.00		VAT-Inclusive	2688.0	\N	2017-09-09 12:14:03.072585	2017-09-09 12:14:03.072585
2950	122	8	740	1.0	1120.00	Oven Cleaner	VAT-Inclusive	1120.0	\N	2017-09-16 12:53:13.400953	2017-09-16 12:53:13.400953
2951	137	8	740	7.0	50.00	Rodel,Sharlaine,Maureen,Lou,Santos,Miko and Nico	VAT-Exempted	350.0	\N	2017-09-16 12:54:17.035968	2017-09-16 12:54:17.035968
2952	122	8	740	1.0	200.00	Mop	VAT-Inclusive	200.0	\N	2017-09-16 12:54:45.091939	2017-09-16 12:54:45.091939
2953	130	8	740	1.0	95.00	Steel Brush	VAT-Inclusive	95.0	\N	2017-09-16 12:55:20.904427	2017-09-16 12:55:20.904427
2954	122	8	740	1.0	89.00	Joy	VAT-Inclusive	89.0	\N	2017-09-16 12:55:46.356351	2017-09-16 12:55:46.356351
2955	131	8	740	1.0	40.00	LES to S1(Borrow Fry Batter)	VAT-Inclusive	40.0	\N	2017-09-16 12:56:49.700153	2017-09-16 12:56:49.700153
2956	137	8	741	13.0	50.00	Che,Sharlaine,Jerlyn,Maureen,Berna,Nico,Miko,Jethro,Santos,Dana,Alvin,Lou and Rodel	VAT-Exempted	650.0	\N	2017-09-16 13:00:11.787376	2017-09-16 13:00:11.787376
2957	121	8	741	1.0	220.00	520 cups(100pcs)	VAT-Inclusive	220.0	\N	2017-09-16 13:00:51.021693	2017-09-16 13:00:51.021693
2958	131	8	741	1.0	80.00	Glorietta to S1(Market of Butter)	VAT-Inclusive	80.0	\N	2017-09-16 13:01:42.72749	2017-09-16 13:01:42.72749
2959	131	8	741	1.0	20.00	Guadalupe To S1(Market of Restaurant Supplies)	VAT-Inclusive	20.0	\N	2017-09-16 13:02:40.96075	2017-09-16 13:02:40.96075
2960	130	8	741	1.0	100.00	Transmittal	VAT-Inclusive	100.0	\N	2017-09-16 13:03:05.12319	2017-09-16 13:03:05.12319
2961	130	8	741	1.0	70.00	Print of Evaluation Form	VAT-Inclusive	70.0	\N	2017-09-16 13:03:46.078068	2017-09-16 13:03:46.078068
2962	124	8	741	5.0	120.00	Tube Ice	VAT-Inclusive	600.0	\N	2017-09-16 13:04:25.550634	2017-09-16 13:04:25.550634
\.


--
-- Name: purchase_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('purchase_items_id_seq', 2962, true);


--
-- Data for Name: purchase_order_items; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY purchase_order_items (id, item_id, unit_id, purchase_order_id, quantity, price_selected, remarks, created_at, updated_at) FROM stdin;
1	64	5	1	1.0	\N		2017-09-04 02:11:28.599039	2017-09-04 02:11:28.599039
2	65	5	1	1.0	\N		2017-09-04 02:11:38.840645	2017-09-04 02:11:38.840645
3	67	5	1	1.0	\N		2017-09-04 02:11:57.604356	2017-09-04 02:11:57.604356
\.


--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('purchase_order_items_id_seq', 3, true);


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY purchase_orders (id, client_id, brand_id, branch_id, po_date, pr_date, po_number, pr_number, remarks, terms, status, supplier_id, created_at, updated_at) FROM stdin;
1	\N	\N	\N	\N	2017-09-04	\N	PRN-0000002	\N	\N	Notified	5	2017-09-04 02:10:59.542901	2017-09-04 02:13:40.507808
\.


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('purchase_orders_id_seq', 1, true);


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY purchases (id, client_id, brand_id, branch_id, supplier_id, purchase_date, invoice_number, user_created_by_id, user_modified_by_id, created_at, updated_at) FROM stdin;
1	\N	6	6	4	2016-08-15	00934	8	\N	2016-08-22 08:55:44.115866	2016-08-22 08:55:44.115866
2	\N	6	6	4	2016-08-22	99844	8	\N	2016-08-22 08:56:44.228274	2016-08-22 08:56:44.228274
14	\N	2	10	27	2017-03-07	88906	20	\N	2017-03-30 09:44:27.356254	2017-03-30 09:44:27.356254
15	\N	2	10	27	2017-03-11	89024	20	\N	2017-03-30 09:46:45.383224	2017-03-30 09:46:45.383224
16	\N	2	10	16	2017-03-13	11360	20	\N	2017-03-30 09:50:41.478682	2017-03-30 09:50:41.478682
17	\N	2	10	23	2017-03-13	51507	20	\N	2017-03-30 09:51:40.378003	2017-03-30 09:51:40.378003
18	\N	2	10	13	2017-03-13	1100106713	20	\N	2017-03-30 09:53:31.633904	2017-03-30 09:53:31.633904
19	\N	2	10	13	2017-03-13	1100106714	20	\N	2017-03-30 09:55:53.595151	2017-03-30 09:55:53.595151
20	\N	2	10	7	2017-03-13	75689	20	\N	2017-03-30 09:57:38.741946	2017-03-30 09:57:38.741946
21	\N	2	10	8	2017-03-13	83533	20	\N	2017-03-30 10:01:55.366097	2017-03-30 10:01:55.366097
22	\N	2	10	11	2017-03-13	439796	20	\N	2017-03-30 10:03:22.986816	2017-03-30 10:03:22.986816
23	\N	2	10	18	2017-03-13	0175478	20	\N	2017-03-30 10:13:21.905552	2017-03-30 10:13:21.905552
24	\N	2	10	18	2017-03-13	0175479	20	\N	2017-03-30 10:20:48.813604	2017-03-30 10:20:48.813604
25	\N	2	10	18	2017-03-09	0175316	20	\N	2017-03-30 10:25:02.494799	2017-03-30 10:25:02.494799
26	\N	2	10	18	2017-03-09	0175315	20	\N	2017-03-30 10:28:42.848463	2017-03-30 10:28:42.848463
27	\N	2	10	18	2017-03-06	0174992	20	\N	2017-03-30 10:32:09.284685	2017-03-30 10:32:09.284685
28	\N	2	10	18	2017-03-06	0174993	20	\N	2017-03-30 10:42:58.016395	2017-03-30 10:42:58.016395
29	\N	2	10	17	2017-03-09	12033	20	\N	2017-03-30 10:47:20.402663	2017-03-30 10:47:20.402663
30	\N	2	10	13	2017-03-06	110105617	20	\N	2017-03-30 10:48:58.944625	2017-03-30 10:48:58.944625
31	\N	2	10	13	2017-03-07	1100105711	20	\N	2017-03-30 10:51:17.513024	2017-03-30 10:51:17.513024
32	\N	2	10	13	2017-03-08	1100105927	20	\N	2017-03-30 10:53:22.981473	2017-03-30 10:53:22.981473
34	\N	2	10	13	2017-03-10	1100106272	20	\N	2017-03-30 10:56:11.996125	2017-03-30 10:56:11.996125
35	\N	2	10	13	2017-03-09	1100106099	20	\N	2017-03-30 10:58:04.848418	2017-03-30 10:58:04.848418
36	\N	2	10	13	2017-03-11	1100106384	20	\N	2017-03-30 11:04:13.717279	2017-03-30 11:04:13.717279
37	\N	2	10	13	2017-03-12	1100106487	20	\N	2017-03-30 11:05:39.921209	2017-03-30 11:05:39.921209
38	\N	2	10	7	2017-03-10	75475	20	\N	2017-03-30 11:08:08.601099	2017-03-30 11:08:08.601099
39	\N	2	10	25	2017-03-06	37339	20	\N	2017-03-30 11:27:51.266016	2017-03-30 11:27:51.266016
40	\N	2	10	6	2017-03-06	1626	20	\N	2017-03-30 11:29:06.112149	2017-03-30 11:29:06.112149
41	\N	2	10	5	2017-03-06	1073	20	\N	2017-03-30 11:35:40.329509	2017-03-30 11:35:40.329509
42	\N	2	10	24	2017-03-06	0200649	20	\N	2017-03-30 11:37:03.439946	2017-03-30 11:37:03.439946
43	\N	2	10	9	2017-03-06	752068	20	\N	2017-03-30 11:39:56.650112	2017-03-30 11:39:56.650112
44	\N	2	10	11	2017-03-06	438112	20	\N	2017-03-30 11:45:18.34435	2017-03-30 11:45:18.34435
45	\N	2	10	22	2017-03-07	120001014500	20	\N	2017-03-30 11:58:56.027629	2017-03-30 11:58:56.027629
46	\N	2	10	10	2017-03-09	143454	20	\N	2017-03-30 12:04:11.503787	2017-03-30 12:04:11.503787
47	\N	2	10	11	2017-03-10	439357	20	\N	2017-03-30 12:05:10.653839	2017-03-30 12:05:10.653839
48	\N	2	10	6	2017-03-27	1712	20	\N	2017-03-30 12:10:56.484505	2017-03-30 12:10:56.484505
49	\N	2	10	13	2017-03-27	1100108758	20	\N	2017-03-30 12:20:47.220123	2017-03-30 12:20:47.220123
51	\N	2	10	7	2017-03-27	77252	20	\N	2017-03-30 12:23:26.311487	2017-03-30 12:23:26.311487
53	\N	2	10	18	2017-03-27	0176518	20	\N	2017-03-30 12:26:42.081103	2017-03-30 12:26:42.081103
54	\N	2	10	11	2017-03-27	443517	20	\N	2017-03-30 12:37:30.948917	2017-03-30 12:37:30.948917
55	\N	2	10	10	2017-03-27	145586	20	\N	2017-03-30 12:44:42.54236	2017-03-30 12:44:42.54236
56	\N	2	10	13	2017-03-20	1100107740	20	\N	2017-03-30 12:45:47.649621	2017-03-30 12:45:47.649621
57	\N	2	10	13	2017-03-21	1100107866	20	\N	2017-03-30 12:49:39.721692	2017-03-30 12:49:39.721692
58	\N	2	10	13	2017-03-22	1100108066	20	\N	2017-03-30 12:52:33.57377	2017-03-30 12:52:33.57377
59	\N	2	10	13	2017-03-23	1100108254	20	\N	2017-03-30 12:53:51.02434	2017-03-30 12:53:51.02434
60	\N	2	10	13	2017-03-25	1100108505	20	\N	2017-03-30 12:56:11.224491	2017-03-30 12:56:11.224491
61	\N	2	10	13	2017-03-18	1100107479	20	\N	2017-03-30 12:59:26.494508	2017-03-30 12:59:26.494508
62	\N	2	10	13	2017-03-17	1100107275	20	\N	2017-03-30 13:03:44.769505	2017-03-30 13:03:44.769505
63	\N	2	10	13	2017-03-15	1100107045	20	\N	2017-03-30 13:06:53.987487	2017-03-30 13:06:53.987487
64	\N	2	10	13	2017-03-14	1100106882	20	\N	2017-03-30 13:12:17.771787	2017-03-30 13:12:17.771787
65	\N	2	10	6	2017-03-13	1655	20	\N	2017-03-30 13:16:35.811229	2017-03-30 13:16:35.811229
66	\N	2	10	19	2017-03-15	4959	20	\N	2017-03-30 13:21:36.831884	2017-03-30 13:21:36.831884
67	\N	2	10	19	2017-03-15	4964	20	\N	2017-03-30 13:23:00.629855	2017-03-30 13:23:00.629855
68	\N	2	10	22	2017-03-16	12001017421	20	\N	2017-03-30 13:29:37.732413	2017-03-30 13:29:37.732413
69	\N	2	10	7	2017-03-16	76062	20	\N	2017-03-30 13:36:55.031277	2017-03-30 13:36:55.031277
70	\N	2	10	25	2017-03-17	37491	20	\N	2017-03-30 13:40:47.294039	2017-03-30 13:40:47.294039
71	\N	2	10	18	2017-03-17	0175837	20	\N	2017-03-30 13:41:58.0503	2017-03-30 13:41:58.0503
72	\N	2	10	6	2017-03-18	1677	20	\N	2017-03-30 14:02:49.035214	2017-03-30 14:02:49.035214
73	\N	2	10	11	2017-03-19	441498	20	\N	2017-03-30 14:09:46.315979	2017-03-30 14:09:46.315979
74	\N	2	10	6	2017-03-20	1676	20	\N	2017-03-30 14:28:00.129963	2017-03-30 14:28:00.129963
75	\N	2	10	23	2017-03-20	51766	20	\N	2017-03-30 14:31:46.436891	2017-03-30 14:31:46.436891
76	\N	2	10	25	2017-03-20	37536	20	\N	2017-03-30 14:32:47.500157	2017-03-30 14:32:47.500157
77	\N	2	10	18	2017-03-20	0175975	20	\N	2017-03-30 14:33:56.821043	2017-03-30 14:33:56.821043
78	\N	2	10	18	2017-03-20	0175976	20	\N	2017-03-30 14:36:52.951622	2017-03-30 14:36:52.951622
79	\N	2	10	10	2017-03-20	144677	20	\N	2017-03-30 14:39:05.334207	2017-03-30 14:39:05.334207
80	\N	2	10	11	2017-03-20	441766	20	\N	2017-03-30 14:40:25.296487	2017-03-30 14:40:25.296487
81	\N	2	10	9	2017-03-20	754603	20	\N	2017-03-30 14:47:04.604273	2017-03-30 14:47:04.604273
82	\N	2	10	18	2017-03-21	0176110	20	\N	2017-03-31 12:32:31.186643	2017-03-31 12:32:31.186643
83	\N	2	10	23	2017-03-22	0405	20	\N	2017-03-31 12:43:01.902654	2017-03-31 12:43:01.902654
84	\N	2	10	23	2017-03-24	0423	20	\N	2017-03-31 12:47:57.237348	2017-03-31 12:47:57.237348
85	\N	2	10	18	2017-03-22	0176232	20	\N	2017-03-31 12:50:38.876781	2017-03-31 12:50:38.876781
86	\N	2	10	18	2017-03-22	0176231	20	\N	2017-03-31 12:58:23.436661	2017-03-31 12:58:23.436661
87	\N	2	10	11	2017-03-22	442456	20	\N	2017-03-31 13:04:41.301513	2017-03-31 13:04:41.301513
88	\N	2	10	26	2017-03-23	130554	20	\N	2017-03-31 13:12:11.876049	2017-03-31 13:12:11.876049
89	\N	2	10	26	2017-03-22	13053	20	\N	2017-03-31 13:14:34.679636	2017-03-31 13:14:34.679636
90	\N	2	10	21	2017-03-23	3311	20	\N	2017-03-31 13:19:43.136633	2017-03-31 13:19:43.136633
91	\N	2	10	19	2017-03-05	15171	20	\N	2017-03-31 13:22:45.360294	2017-03-31 13:22:45.360294
92	\N	2	10	19	2017-03-06	15114	20	\N	2017-03-31 13:24:46.644106	2017-03-31 13:24:46.644106
93	\N	2	10	19	2017-03-02	4907	20	\N	2017-03-31 13:25:58.997753	2017-03-31 13:25:58.997753
94	\N	2	10	19	2017-03-07	4706	20	\N	2017-03-31 13:27:27.368662	2017-03-31 13:27:27.368662
96	\N	2	10	19	2017-03-22	11425	20	\N	2017-03-31 13:30:32.145101	2017-03-31 13:30:32.145101
97	\N	2	13	16	2017-04-01	11474	21	\N	2017-04-04 07:29:05.588224	2017-04-04 07:29:05.588224
98	\N	2	13	11	2017-04-01	445502	21	\N	2017-04-04 07:31:38.479267	2017-04-04 07:31:38.479267
99	\N	2	13	18	2017-04-01	0176951	21	\N	2017-04-04 07:47:58.7226	2017-04-04 07:47:58.7226
100	\N	2	13	18	2017-04-01	0176952	21	\N	2017-04-04 07:49:36.461475	2017-04-04 07:49:36.461475
102	\N	2	13	6	2017-04-03	1731	21	\N	2017-04-04 07:56:33.035119	2017-04-04 07:56:33.035119
101	\N	2	13	26	2017-04-03	13621	21	21	2017-04-04 07:51:11.346128	2017-04-04 07:55:02.638127
103	\N	2	13	5	2017-04-03	1181	21	\N	2017-04-04 08:16:06.71538	2017-04-04 08:16:06.71538
104	\N	2	13	7	2017-04-03	78889	21	\N	2017-04-04 08:17:55.259485	2017-04-04 08:17:55.259485
105	\N	2	13	23	2017-04-03	52376	21	\N	2017-04-04 08:37:48.930708	2017-04-04 08:37:48.930708
106	\N	2	13	9	2017-04-03	757137	21	\N	2017-04-04 08:43:27.105222	2017-04-04 08:43:27.105222
107	\N	2	13	8	2017-04-03	0079375	21	\N	2017-04-04 08:47:43.657048	2017-04-04 08:47:43.657048
109	\N	2	13	26	2017-04-04	13622	21	\N	2017-04-04 08:59:45.090814	2017-04-04 08:59:45.090814
110	\N	2	13	29	2017-04-03	S104032017	21	\N	2017-04-05 10:25:17.643475	2017-04-05 10:25:17.643475
111	\N	2	13	29	2017-04-04	S104042017	21	\N	2017-04-05 10:44:55.635928	2017-04-05 10:44:55.635928
118	\N	2	13	27	2017-04-05	89808	21	\N	2017-04-05 11:44:06.138413	2017-04-05 11:44:06.138413
120	\N	2	13	29	2017-04-07	S104072017	21	\N	2017-04-09 07:05:31.864327	2017-04-09 07:05:31.864327
121	\N	2	13	29	2017-04-08	S104082017	21	\N	2017-04-09 07:49:19.969738	2017-04-09 07:49:19.969738
122	\N	2	13	29	2017-04-09	S104092017	21	\N	2017-04-09 10:12:05.304286	2017-04-09 10:12:05.304286
123	\N	2	13	18	2017-04-08	0177497	21	\N	2017-04-09 10:54:33.214048	2017-04-09 10:54:33.214048
129	\N	2	13	22	2017-04-07	120001026561	21	\N	2017-04-09 11:49:54.182084	2017-04-09 11:49:54.182084
131	\N	2	13	25	2017-04-06	37762	21	\N	2017-04-09 11:59:13.308843	2017-04-09 11:59:13.308843
133	\N	2	13	29	2017-04-10	S104102017	21	\N	2017-04-12 09:04:25.568773	2017-04-12 09:04:25.568773
135	\N	2	13	29	2017-04-11	S104112017	21	\N	2017-04-12 09:05:27.90851	2017-04-12 09:05:27.90851
141	\N	2	13	13	2017-04-10	1100111016	21	\N	2017-04-16 07:52:18.830962	2017-04-16 07:52:18.830962
143	\N	2	13	5	2017-04-10	1219	21	\N	2017-04-16 08:09:22.662687	2017-04-16 08:09:22.662687
112	\N	2	13	29	2017-04-05	S104052017	21	\N	2017-04-05 10:50:13.068444	2017-04-05 10:50:13.068444
113	\N	2	13	30	2017-04-01	2940	21	\N	2017-04-05 11:14:05.429248	2017-04-05 11:14:05.429248
115	\N	2	13	17	2017-04-05	12249	21	\N	2017-04-05 11:29:51.548342	2017-04-05 11:29:51.548342
117	\N	2	13	11	2017-04-05	446417	21	\N	2017-04-05 11:37:33.796857	2017-04-05 11:37:33.796857
126	\N	2	13	26	2017-04-07	13624	21	\N	2017-04-09 11:20:21.371734	2017-04-09 11:20:21.371734
127	\N	2	13	21	2017-04-07	3372	21	\N	2017-04-09 11:46:04.113542	2017-04-09 11:46:04.113542
138	\N	2	13	19	2017-04-13	0332	21	\N	2017-04-16 07:47:21.187662	2017-04-16 07:47:21.187662
142	\N	2	13	6	2017-04-10	1769	21	\N	2017-04-16 07:54:18.929928	2017-04-16 07:54:18.929928
128	\N	2	13	13	2017-04-07	1100110523	21	\N	2017-04-09 11:47:21.002179	2017-04-09 11:47:21.002179
130	\N	2	13	26	2017-04-06	13623	21	\N	2017-04-09 11:54:14.491136	2017-04-09 11:54:14.491136
136	\N	2	13	29	2017-04-12	S104122017	21	\N	2017-04-12 09:05:40.518452	2017-04-12 09:05:40.518452
139	\N	2	13	19	2017-04-13	0252	21	\N	2017-04-16 07:49:33.807805	2017-04-16 07:49:33.807805
119	\N	2	13	29	2017-04-06	S104062017	21	\N	2017-04-09 06:52:44.123979	2017-04-09 06:52:44.123979
124	\N	2	13	18	2017-04-08	0177498	21	\N	2017-04-09 10:56:07.201241	2017-04-09 10:56:07.201241
125	\N	2	13	11	2017-04-08	447469	21	\N	2017-04-09 10:57:18.065491	2017-04-09 10:57:18.065491
132	\N	2	13	10	2017-04-06	147151	21	\N	2017-04-09 12:01:26.102831	2017-04-09 12:01:26.102831
137	\N	2	13	29	2017-04-15	S104152017	21	\N	2017-04-16 07:38:22.100804	2017-04-16 07:38:22.100804
140	\N	2	13	19	2017-04-13	0234	21	\N	2017-04-16 07:51:13.057069	2017-04-16 07:51:13.057069
144	\N	2	13	23	2017-04-10	52812	21	\N	2017-04-16 08:11:11.330682	2017-04-16 08:11:11.330682
145	\N	2	13	26	2017-04-10	13625	21	\N	2017-04-16 08:13:14.782188	2017-04-16 08:13:14.782188
146	\N	2	13	9	2017-04-10	758409	21	\N	2017-04-16 08:18:40.379637	2017-04-16 08:18:40.379637
147	\N	2	13	16	2017-04-10	11529	21	\N	2017-04-16 08:20:43.413928	2017-04-16 08:20:43.413928
148	\N	2	13	27	2017-04-11	89952	21	\N	2017-04-16 08:22:35.347315	2017-04-16 08:22:35.347315
149	\N	2	13	26	2017-04-11	13626	21	\N	2017-04-16 08:24:47.985201	2017-04-16 08:24:47.985201
150	\N	2	13	13	2017-04-12	1100111340	21	\N	2017-04-16 08:29:01.074351	2017-04-16 08:29:01.074351
151	\N	2	13	26	2017-04-12	13627	21	\N	2017-04-16 08:30:54.406832	2017-04-16 08:30:54.406832
152	\N	2	13	29	2017-04-16	S104162017	21	\N	2017-04-16 08:55:14.2073	2017-04-16 08:55:14.2073
153	\N	2	13	29	2017-04-17	S104172017	21	\N	2017-04-18 07:51:12.047858	2017-04-18 07:51:12.047858
154	\N	2	13	29	2017-04-18	S104182017	21	\N	2017-04-18 08:12:20.311856	2017-04-18 08:12:20.311856
155	\N	2	13	10	2017-04-17	148427	21	\N	2017-04-18 08:28:18.097513	2017-04-18 08:28:18.097513
156	\N	2	13	25	2017-04-17	37863	21	\N	2017-04-18 08:29:50.051831	2017-04-18 08:29:50.051831
157	\N	2	13	11	2017-04-17	449044	21	\N	2017-04-18 08:32:33.186429	2017-04-18 08:32:33.186429
158	\N	2	13	13	2017-04-17	1100111685	21	\N	2017-04-18 08:34:50.332864	2017-04-18 08:34:50.332864
160	\N	2	13	26	2017-04-17	13628	21	\N	2017-04-18 08:37:22.845045	2017-04-18 08:37:22.845045
161	\N	2	13	16	2017-04-17	11543	21	\N	2017-04-18 08:43:16.682035	2017-04-18 08:43:16.682035
162	\N	2	13	9	2017-04-18	759226	21	\N	2017-04-18 08:44:56.077919	2017-04-18 08:44:56.077919
163	\N	2	13	6	2017-04-18	1799	21	\N	2017-04-18 08:49:00.856385	2017-04-18 08:49:00.856385
164	\N	2	13	27	2017-04-18	90031	21	\N	2017-04-18 08:55:42.454751	2017-04-18 08:55:42.454751
165	\N	2	13	29	2017-04-19	S104192017	21	\N	2017-04-19 08:57:38.629092	2017-04-19 08:57:38.629092
166	\N	2	13	23	2017-04-18	53043	21	\N	2017-04-20 01:50:05.085781	2017-04-20 01:50:05.085781
167	\N	2	13	18	2017-04-18	0177925	21	\N	2017-04-20 01:50:36.775043	2017-04-20 01:50:36.775043
168	\N	2	13	13	2017-04-19	1100112104	21	\N	2017-04-20 02:07:44.733564	2017-04-20 02:07:44.733564
169	\N	2	13	26	2017-04-19	13629	21	\N	2017-04-20 02:20:49.810976	2017-04-20 02:20:49.810976
170	\N	2	13	11	2017-04-19	449663	21	\N	2017-04-20 02:24:17.71767	2017-04-20 02:24:17.71767
171	\N	2	13	22	2017-04-19	120001030445	21	\N	2017-04-20 02:27:45.114905	2017-04-20 02:27:45.114905
172	\N	2	13	32	2017-04-19	0388371	21	\N	2017-04-20 02:31:03.664428	2017-04-20 02:31:03.664428
173	\N	2	13	31	2017-04-18	508811157	21	\N	2017-04-20 02:35:11.486335	2017-04-20 02:35:11.486335
174	\N	2	13	29	2017-04-20	S104202017	21	\N	2017-04-20 10:34:02.577824	2017-04-20 10:34:02.577824
175	\N	2	13	6	2017-04-20	1811	21	\N	2017-04-21 01:29:32.186496	2017-04-21 01:29:32.186496
176	\N	2	13	23	2017-04-20	7442	21	\N	2017-04-21 01:30:35.218757	2017-04-21 01:30:35.218757
177	\N	2	13	13	2017-04-20	1100112204	21	\N	2017-04-21 01:31:52.485876	2017-04-21 01:31:52.485876
178	\N	2	13	7	2017-04-20	79743	21	\N	2017-04-21 01:33:15.332013	2017-04-21 01:33:15.332013
180	\N	2	13	26	2017-04-21	13630	21	\N	2017-04-22 10:27:37.088993	2017-04-22 10:27:37.088993
181	\N	2	13	7	2017-04-21	79949	21	\N	2017-04-22 10:38:25.604717	2017-04-22 10:38:25.604717
182	\N	2	13	18	2017-04-21	0178275	21	\N	2017-04-22 10:41:59.457709	2017-04-22 10:41:59.457709
183	\N	2	13	13	2017-04-22	1100112684	21	\N	2017-04-22 10:44:00.146137	2017-04-22 10:44:00.146137
184	\N	2	13	29	2017-04-21	S1042117	21	\N	2017-04-22 12:35:25.065726	2017-04-22 12:35:25.065726
185	\N	2	13	29	2017-04-22	S1042217	21	\N	2017-04-22 12:42:56.61002	2017-04-22 12:42:56.61002
186	\N	2	13	29	2017-04-23	S104232017	21	\N	2017-04-23 09:48:29.856401	2017-04-23 09:48:29.856401
187	\N	2	13	27	2017-04-23	90199	21	\N	2017-04-23 10:10:47.023738	2017-04-23 10:10:47.023738
188	\N	2	13	29	2017-04-24	S104242017	21	\N	2017-04-26 11:29:54.742895	2017-04-26 11:29:54.742895
189	\N	2	13	29	2017-04-25	S104252017	21	\N	2017-04-26 11:38:35.716285	2017-04-26 11:38:35.716285
190	\N	2	13	29	2017-04-26	S104262017	21	\N	2017-04-26 11:43:58.035481	2017-04-26 11:43:58.035481
191	\N	2	13	26	2017-04-28	13634	21	\N	2017-04-28 09:16:28.440123	2017-04-28 09:16:28.440123
192	\N	2	13	26	2017-04-23	13631	21	\N	2017-04-28 09:20:59.834024	2017-04-28 09:20:59.834024
193	\N	2	13	11	2017-04-26	451741	21	\N	2017-04-28 09:24:41.499676	2017-04-28 09:24:41.499676
194	\N	2	13	26	2017-04-26	13633	21	\N	2017-04-28 09:25:56.460484	2017-04-28 09:25:56.460484
195	\N	2	13	13	2017-04-26	1100113178	21	\N	2017-04-28 09:30:25.630753	2017-04-28 09:30:25.630753
196	\N	2	13	23	2017-04-26	7567	21	\N	2017-04-28 09:34:49.113568	2017-04-28 09:34:49.113568
197	\N	2	13	19	2017-04-26	0507	21	\N	2017-04-28 09:35:59.114443	2017-04-28 09:35:59.114443
198	\N	2	13	13	2017-04-27	1100113337	21	\N	2017-04-28 09:37:26.294738	2017-04-28 09:37:26.294738
199	\N	2	13	23	2017-04-25	53397	21	\N	2017-04-28 13:11:45.575118	2017-04-28 13:11:45.575118
200	\N	2	13	22	2017-04-25	120001032942	21	\N	2017-04-28 13:13:29.462725	2017-04-28 13:13:29.462725
201	\N	2	13	25	2017-04-25	37966	21	\N	2017-04-28 13:14:49.960214	2017-04-28 13:14:49.960214
202	\N	2	13	26	2017-04-25	13632	21	\N	2017-04-28 13:16:10.02325	2017-04-28 13:16:10.02325
203	\N	2	13	18	2017-04-24	0178360	21	\N	2017-04-28 13:20:41.591846	2017-04-28 13:20:41.591846
204	\N	2	13	18	2017-04-24	0178361	21	\N	2017-04-28 13:21:52.232508	2017-04-28 13:21:52.232508
205	\N	2	13	13	2017-04-24	1100112856	21	\N	2017-04-28 13:23:39.279017	2017-04-28 13:23:39.279017
206	\N	2	13	9	2017-04-24	760317	21	\N	2017-04-28 13:25:13.182987	2017-04-28 13:25:13.182987
207	\N	2	13	11	2017-04-24	451010	21	\N	2017-04-28 13:27:20.465793	2017-04-28 13:27:20.465793
208	\N	2	13	6	2017-04-24	1824	21	\N	2017-04-28 13:30:06.027267	2017-04-28 13:30:06.027267
209	\N	2	13	5	2017-04-24	1265	21	\N	2017-04-28 13:34:08.739265	2017-04-28 13:34:08.739265
210	\N	2	13	7	2017-04-24	80208	21	\N	2017-04-28 13:36:18.598082	2017-04-28 13:36:18.598082
211	\N	2	13	10	2017-04-24	149481	21	\N	2017-04-28 13:38:14.040617	2017-04-28 13:38:14.040617
212	\N	2	13	29	2017-04-27	S1042717	21	\N	2017-04-29 06:44:17.794393	2017-04-29 06:44:17.794393
213	\N	2	13	29	2017-04-28	S1042817	21	\N	2017-04-29 07:22:51.948784	2017-04-29 07:22:51.948784
214	\N	2	13	13	2017-04-29	1100113636	21	\N	2017-04-29 08:00:35.219373	2017-04-29 08:00:35.219373
215	\N	2	13	26	2017-04-29	13635	21	\N	2017-04-29 08:02:21.867171	2017-04-29 08:02:21.867171
216	\N	2	13	31	2017-04-29	508850500	21	\N	2017-04-29 08:10:15.044477	2017-04-29 08:10:15.044477
217	\N	2	13	31	2017-04-29	508850226	21	\N	2017-04-29 08:11:41.265471	2017-04-29 08:11:41.265471
218	\N	2	13	29	2017-04-29	S1042917	21	\N	2017-04-29 08:15:48.451148	2017-04-29 08:15:48.451148
219	\N	2	13	29	2017-04-30	S104302017	21	\N	2017-04-30 14:02:31.380415	2017-04-30 14:02:31.380415
220	\N	2	13	29	2017-05-01	S1050117	21	\N	2017-05-04 12:59:02.737485	2017-05-04 12:59:02.737485
221	\N	2	13	29	2017-05-02	S1050217	21	\N	2017-05-04 13:26:08.127418	2017-05-04 13:26:08.127418
222	\N	2	13	29	2017-05-03	S1050317	21	\N	2017-05-04 13:50:17.119511	2017-05-04 13:50:17.119511
223	\N	2	13	29	2017-05-04	S1050417	21	\N	2017-05-04 13:54:08.283501	2017-05-04 13:54:08.283501
224	\N	2	13	26	2017-05-01	13636	21	\N	2017-05-05 08:05:56.352951	2017-05-05 08:05:56.352951
225	\N	2	13	26	2017-05-02	13637	21	\N	2017-05-05 08:09:42.679896	2017-05-05 08:09:42.679896
226	\N	2	13	23	2017-05-02	53630	21	\N	2017-05-05 08:14:57.981797	2017-05-05 08:14:57.981797
227	\N	2	13	27	2017-05-02	90422	21	\N	2017-05-05 08:16:20.619668	2017-05-05 08:16:20.619668
228	\N	2	13	5	2017-05-02	1301	21	\N	2017-05-05 08:18:17.12277	2017-05-05 08:18:17.12277
229	\N	2	13	6	2017-05-02	1859	21	\N	2017-05-05 08:20:07.439251	2017-05-05 08:20:07.439251
230	\N	2	13	16	2017-05-02	11643	21	\N	2017-05-05 08:29:13.236223	2017-05-05 08:29:13.236223
231	\N	2	13	13	2017-05-02	1100113983	21	\N	2017-05-05 08:30:52.376512	2017-05-05 08:30:52.376512
232	\N	2	13	11	2017-05-02	453068	21	\N	2017-05-05 08:34:07.550613	2017-05-05 08:34:07.550613
233	\N	2	13	11	2017-05-02	452845	21	\N	2017-05-05 09:09:14.231853	2017-05-05 09:09:14.231853
241	\N	2	13	13	2017-05-04	1100114335	21	\N	2017-05-05 09:24:58.004371	2017-05-05 09:24:58.004371
247	\N	2	13	11	2017-05-08	454830	21	\N	2017-05-10 09:58:49.110454	2017-05-10 09:58:49.110454
250	\N	2	13	23	2017-05-08	53919	21	\N	2017-05-10 10:31:54.370287	2017-05-10 10:31:54.370287
254	\N	2	13	26	2017-05-09	13640	21	\N	2017-05-10 11:06:39.257622	2017-05-10 11:06:39.257622
257	\N	2	13	32	2017-05-10	0387123	21	\N	2017-05-10 12:05:40.035944	2017-05-10 12:05:40.035944
262	\N	2	13	29	2017-05-11	S1051117	21	\N	2017-05-13 11:38:02.379383	2017-05-13 11:38:02.379383
234	\N	2	13	9	2017-05-02	761329	21	\N	2017-05-05 09:12:43.584658	2017-05-05 09:12:43.584658
235	\N	2	13	10	2017-05-02	150611	21	\N	2017-05-05 09:15:34.577701	2017-05-05 09:15:34.577701
236	\N	2	13	18	2017-05-02	0178795	21	\N	2017-05-05 09:16:50.257501	2017-05-05 09:16:50.257501
237	\N	2	13	18	2017-05-02	0178796	21	\N	2017-05-05 09:18:29.052247	2017-05-05 09:18:29.052247
239	\N	2	13	18	2017-05-03	0179019	21	\N	2017-05-05 09:21:00.921507	2017-05-05 09:21:00.921507
246	\N	2	13	29	2017-05-09	S105092017	21	\N	2017-05-09 10:38:37.895837	2017-05-09 10:38:37.895837
249	\N	2	13	13	2017-05-08	1100114857	21	\N	2017-05-10 10:15:05.916736	2017-05-10 10:15:05.916736
265	\N	2	13	22	2017-05-11	120001039148	21	\N	2017-05-13 12:00:53.356086	2017-05-13 12:00:53.356086
267	\N	2	13	26	2017-05-12	13642	21	\N	2017-05-13 12:08:49.331829	2017-05-13 12:08:49.331829
269	\N	2	13	13	2017-05-13	1100115468	21	\N	2017-05-13 12:25:53.688099	2017-05-13 12:25:53.688099
238	\N	2	13	21	2017-05-03	3450	21	\N	2017-05-05 09:19:44.7027	2017-05-05 09:19:44.7027
240	\N	2	13	26	2017-05-04	13638	21	\N	2017-05-05 09:22:53.810127	2017-05-05 09:22:53.810127
243	\N	2	13	7	2017-05-05	81419	21	\N	2017-05-05 09:30:54.282653	2017-05-05 09:30:54.282653
244	\N	2	13	29	2017-05-05	S105052017	21	\N	2017-05-05 11:19:24.09256	2017-05-05 11:19:24.09256
245	\N	2	13	29	2017-05-08	S105082017	21	\N	2017-05-09 09:46:40.635576	2017-05-09 09:46:40.635576
251	\N	2	13	6	2017-05-08	1894	21	\N	2017-05-10 10:32:44.747714	2017-05-10 10:32:44.747714
252	\N	2	13	26	2017-05-08	13639	21	\N	2017-05-10 10:36:03.961678	2017-05-10 10:36:03.961678
253	\N	2	13	31	2017-05-09	508878092	21	\N	2017-05-10 11:04:38.94892	2017-05-10 11:04:38.94892
255	\N	2	13	27	2017-05-10	90650	21	\N	2017-05-10 11:29:48.079471	2017-05-10 11:29:48.079471
259	\N	2	13	18	2017-05-10	0179569	21	\N	2017-05-10 12:16:00.207033	2017-05-10 12:16:00.207033
260	\N	2	13	18	2017-05-10	0179565	21	\N	2017-05-10 12:18:21.814867	2017-05-10 12:18:21.814867
266	\N	2	13	9	2017-05-11	763318	21	\N	2017-05-13 12:06:43.498179	2017-05-13 12:06:43.498179
268	\N	2	13	19	2017-05-12	0810	21	\N	2017-05-13 12:22:02.749301	2017-05-13 12:22:02.749301
242	\N	2	13	11	2017-05-04	453842	21	\N	2017-05-05 09:28:11.23863	2017-05-05 09:28:11.23863
256	\N	2	13	26	2017-05-10	13641	21	\N	2017-05-10 11:31:20.693074	2017-05-10 11:31:20.693074
258	\N	2	13	33	2017-05-10	0061648	21	\N	2017-05-10 12:12:38.139326	2017-05-10 12:12:38.139326
261	\N	2	13	29	2017-05-10	S105102017	21	\N	2017-05-10 12:33:40.230392	2017-05-10 12:33:40.230392
263	\N	2	13	29	2017-05-12	S1051217	21	\N	2017-05-13 11:41:40.243124	2017-05-13 11:41:40.243124
264	\N	2	13	16	2017-05-11	11734	21	\N	2017-05-13 11:50:54.509006	2017-05-13 11:50:54.509006
270	\N	2	13	13	2017-05-13	1100115573	21	\N	2017-05-13 12:27:55.67672	2017-05-13 12:27:55.67672
272	\N	2	13	9	2017-05-13	763646	21	\N	2017-05-13 12:38:47.498028	2017-05-13 12:38:47.498028
273	\N	2	13	11	2017-05-13	456698	21	\N	2017-05-13 12:46:00.378306	2017-05-13 12:46:00.378306
274	\N	2	13	29	2017-05-13	S1051317	21	\N	2017-05-13 15:14:49.12484	2017-05-13 15:14:49.12484
275	\N	2	13	29	2017-05-14	S105142017	21	\N	2017-05-17 11:48:21.780721	2017-05-17 11:48:21.780721
276	\N	2	13	29	2017-05-15	S105152017	21	\N	2017-05-17 11:50:55.335828	2017-05-17 11:50:55.335828
277	\N	2	13	29	2017-05-16	S105162017	21	\N	2017-05-17 11:59:15.74382	2017-05-17 11:59:15.74382
278	\N	2	13	29	2017-05-17	S105172017	21	\N	2017-05-17 12:08:07.61404	2017-05-17 12:08:07.61404
279	\N	2	13	23	2017-05-15	7956	21	\N	2017-05-17 12:51:49.075654	2017-05-17 12:51:49.075654
280	\N	2	13	5	2017-05-15	1356	21	\N	2017-05-17 12:53:10.927446	2017-05-17 12:53:10.927446
281	\N	2	13	6	2017-05-15	1911	21	\N	2017-05-17 12:54:38.217955	2017-05-17 12:54:38.217955
282	\N	2	13	23	2017-05-15	54257	21	\N	2017-05-17 12:58:39.869125	2017-05-17 12:58:39.869125
283	\N	2	13	13	2017-05-15	1100115876	21	\N	2017-05-17 13:00:15.778449	2017-05-17 13:00:15.778449
284	\N	2	13	10	2017-05-15	152491	21	\N	2017-05-17 13:04:16.038122	2017-05-17 13:04:16.038122
285	\N	2	13	7	2017-05-15	82494	21	\N	2017-05-17 13:05:13.996283	2017-05-17 13:05:13.996283
286	\N	2	13	18	2017-05-15	0179833	21	\N	2017-05-17 13:06:10.394157	2017-05-17 13:06:10.394157
287	\N	2	13	18	2017-05-15	0179834	21	\N	2017-05-17 13:07:01.426103	2017-05-17 13:07:01.426103
288	\N	2	13	26	2017-05-16	13643	21	\N	2017-05-17 13:12:21.667631	2017-05-17 13:12:21.667631
289	\N	2	13	31	2017-05-16	508900656	21	\N	2017-05-17 13:17:21.612452	2017-05-17 13:17:21.612452
291	\N	2	13	25	2017-05-17	38202	21	\N	2017-05-17 13:25:09.141654	2017-05-17 13:25:09.141654
292	\N	2	13	19	2017-05-17	0875	21	\N	2017-05-17 13:26:29.155057	2017-05-17 13:26:29.155057
293	\N	2	13	13	2017-05-17	1100116148	21	\N	2017-05-17 13:27:25.313146	2017-05-17 13:27:25.313146
294	\N	2	13	26	2017-05-18	13644	21	\N	2017-05-21 08:20:23.090671	2017-05-21 08:20:23.090671
295	\N	2	13	26	2017-05-19	13646	21	\N	2017-05-21 08:37:37.142699	2017-05-21 08:37:37.142699
296	\N	2	13	23	2017-05-19	8091	21	\N	2017-05-21 09:02:52.020772	2017-05-21 09:02:52.020772
297	\N	2	13	27	2017-05-19	90894	21	\N	2017-05-21 09:07:56.99973	2017-05-21 09:07:56.99973
298	\N	2	13	9	2017-05-19	765576	21	\N	2017-05-21 09:15:05.765796	2017-05-21 09:15:05.765796
299	\N	2	13	13	2017-05-20	76289	21	\N	2017-05-21 09:26:17.745442	2017-05-21 09:26:17.745442
300	\N	2	13	11	2017-05-22	459263	21	\N	2017-05-22 09:05:25.73327	2017-05-22 09:05:25.73327
301	\N	2	13	13	2017-05-22	1100116716	21	\N	2017-05-22 09:37:31.542896	2017-05-22 09:37:31.542896
302	\N	2	13	26	2017-05-22	13647	21	\N	2017-05-22 09:43:06.470912	2017-05-22 09:43:06.470912
303	\N	2	13	6	2017-05-22	1934	21	\N	2017-05-22 10:01:11.006206	2017-05-22 10:01:11.006206
304	\N	2	13	29	2017-05-18	S105182017	21	\N	2017-05-23 02:27:55.578653	2017-05-23 02:27:55.578653
306	\N	2	13	29	2017-05-20	S105202017	21	\N	2017-05-23 02:40:08.876812	2017-05-23 02:40:08.876812
307	\N	2	13	29	2017-05-21	S105212017	21	\N	2017-05-23 02:45:55.754375	2017-05-23 02:45:55.754375
308	\N	2	13	29	2017-05-22	S105222017	21	\N	2017-05-23 02:48:17.791905	2017-05-23 02:48:17.791905
309	\N	2	13	23	2017-05-23	8141	21	\N	2017-05-23 10:53:37.715776	2017-05-23 10:53:37.715776
310	\N	2	13	21	2017-05-23	3530	21	\N	2017-05-23 10:59:58.423106	2017-05-23 10:59:58.423106
311	\N	2	13	26	2017-05-23	13648	21	\N	2017-05-23 11:08:45.911197	2017-05-23 11:08:45.911197
312	\N	2	13	29	2017-05-23	S105232017	21	\N	2017-05-24 08:00:07.342499	2017-05-24 08:00:07.342499
313	\N	2	13	29	2017-05-24	S105242017	21	\N	2017-05-24 08:05:06.479647	2017-05-24 08:05:06.479647
348	\N	2	13	9	2017-05-29	766129	21	\N	2017-05-31 12:32:14.288266	2017-05-31 12:32:14.288266
305	\N	2	13	29	2017-05-19	S105192017	21	21	2017-05-23 02:35:02.764415	2017-05-24 08:11:01.434456
314	\N	2	13	23	2017-05-22	54576	21	\N	2017-05-24 10:18:54.18135	2017-05-24 10:18:54.18135
315	\N	2	13	16	2017-05-22	11804	21	\N	2017-05-24 10:20:28.925358	2017-05-24 10:20:28.925358
316	\N	2	13	18	2017-05-22	0180306	21	\N	2017-05-24 10:22:14.749353	2017-05-24 10:22:14.749353
317	\N	2	13	18	2017-05-22	0180305	21	\N	2017-05-24 10:24:42.878968	2017-05-24 10:24:42.878968
318	\N	2	13	22	2017-05-23	120001044059	21	\N	2017-05-24 10:28:09.112249	2017-05-24 10:28:09.112249
319	\N	2	13	23	2017-05-24	8195	21	\N	2017-05-24 10:40:34.391498	2017-05-24 10:40:34.391498
320	\N	2	13	30	2017-05-24	3769	21	\N	2017-05-24 10:44:28.134182	2017-05-24 10:44:28.134182
321	\N	2	13	19	2017-05-24	0985	21	\N	2017-05-24 10:49:37.884951	2017-05-24 10:49:37.884951
322	\N	2	13	18	2017-05-24	0180568	21	\N	2017-05-24 10:50:30.483553	2017-05-24 10:50:30.483553
323	\N	2	13	13	2017-05-24	1100117129	21	\N	2017-05-24 10:52:01.381635	2017-05-24 10:52:01.381635
324	\N	2	13	30	2017-05-25	3814	21	\N	2017-05-27 07:14:00.529509	2017-05-27 07:14:00.529509
325	\N	2	13	13	2017-05-25	1100117182	21	\N	2017-05-27 07:28:44.538959	2017-05-27 07:28:44.538959
326	\N	2	13	10	2017-05-25	154008	21	\N	2017-05-27 07:36:52.361592	2017-05-27 07:36:52.361592
328	\N	2	13	34	2017-05-26	17016	21	\N	2017-05-27 07:46:40.429611	2017-05-27 07:46:40.429611
329	\N	2	13	30	2017-05-26	3786	21	\N	2017-05-27 07:55:40.552223	2017-05-27 07:55:40.552223
330	\N	2	13	13	2017-05-27	1100117439	21	\N	2017-05-27 08:19:08.832775	2017-05-27 08:19:08.832775
332	\N	2	13	23	2017-05-27	8264	21	\N	2017-05-27 08:30:46.961539	2017-05-27 08:30:46.961539
333	\N	2	13	29	2017-05-25	S1052517	21	\N	2017-05-27 11:15:06.858126	2017-05-27 11:15:06.858126
334	\N	2	13	29	2017-05-26	S1052617	21	\N	2017-05-27 12:03:16.881213	2017-05-27 12:03:16.881213
335	\N	2	13	29	2017-05-27	S1052717	21	\N	2017-05-27 12:11:05.853606	2017-05-27 12:11:05.853606
336	\N	2	13	31	2017-05-25	508930197	21	\N	2017-05-28 04:17:37.076676	2017-05-28 04:17:37.076676
339	\N	2	13	18	2017-05-27	0180745	21	\N	2017-05-28 04:47:43.925686	2017-05-28 04:47:43.925686
340	\N	2	13	18	2017-05-27	0180744	21	\N	2017-05-28 04:54:42.68461	2017-05-28 04:54:42.68461
341	\N	2	13	26	2017-05-28	13649	21	\N	2017-05-28 08:28:30.065808	2017-05-28 08:28:30.065808
342	\N	2	13	29	2017-05-28	S105282017	21	\N	2017-05-31 11:38:59.432134	2017-05-31 11:38:59.432134
343	\N	2	13	29	2017-05-29	S105292017	21	\N	2017-05-31 11:40:50.733674	2017-05-31 11:40:50.733674
344	\N	2	13	29	2017-05-30	S105302017	21	\N	2017-05-31 11:50:37.071673	2017-05-31 11:50:37.071673
345	\N	2	13	29	2017-05-31	S105312017	21	\N	2017-05-31 11:52:34.405615	2017-05-31 11:52:34.405615
346	\N	2	13	13	2017-05-29	1100117692	21	\N	2017-05-31 12:11:45.367907	2017-05-31 12:11:45.367907
347	\N	2	13	11	2017-05-29	461058	21	\N	2017-05-31 12:18:36.81398	2017-05-31 12:18:36.81398
349	\N	2	13	30	2017-05-30	3853	21	\N	2017-05-31 12:37:10.090166	2017-05-31 12:37:10.090166
350	\N	2	13	6	2017-05-30	1969	21	\N	2017-05-31 12:50:43.672743	2017-05-31 12:50:43.672743
351	\N	2	13	27	2017-05-30	91199	21	\N	2017-05-31 13:09:12.022322	2017-05-31 13:09:12.022322
352	\N	2	13	13	2017-05-31	1100117946	21	\N	2017-05-31 13:19:56.174602	2017-05-31 13:19:56.174602
353	\N	2	13	30	0017-05-31	3682	21	\N	2017-05-31 13:26:01.842397	2017-05-31 13:26:01.842397
354	\N	2	13	16	2017-05-31	11840	21	\N	2017-05-31 19:35:57.11455	2017-05-31 19:35:57.11455
355	\N	2	13	23	2017-05-29	54897	21	\N	2017-05-31 19:37:54.539076	2017-05-31 19:37:54.539076
356	\N	2	13	19	2017-05-31	1041	21	\N	2017-05-31 19:40:06.675562	2017-05-31 19:40:06.675562
357	\N	2	13	19	2017-05-31	0998	21	\N	2017-05-31 19:42:14.339598	2017-05-31 19:42:14.339598
358	\N	2	13	10	2017-06-01	154911	21	\N	2017-06-03 09:03:16.026738	2017-06-03 09:03:16.026738
359	\N	2	13	27	2017-06-01	91268	21	\N	2017-06-03 09:09:06.265332	2017-06-03 09:09:06.265332
360	\N	2	13	30	2017-06-01	3685	21	\N	2017-06-03 09:12:55.410311	2017-06-03 09:12:55.410311
361	\N	2	13	34	2017-06-01	17973	21	\N	2017-06-03 09:27:14.359996	2017-06-03 09:27:14.359996
362	\N	2	13	9	2017-06-02	766738	21	\N	2017-06-03 09:31:42.353116	2017-06-03 09:31:42.353116
363	\N	2	13	13	2017-06-02	1100118215	21	\N	2017-06-03 09:36:21.543047	2017-06-03 09:36:21.543047
366	\N	2	13	30	2017-06-02	3908	21	\N	2017-06-03 10:02:00.512281	2017-06-03 10:02:00.512281
367	\N	2	13	7	2017-06-02	84995	21	\N	2017-06-03 10:08:45.619701	2017-06-03 10:08:45.619701
368	\N	2	13	13	2017-06-03	1100118361	21	\N	2017-06-03 10:13:56.575858	2017-06-03 10:13:56.575858
372	\N	2	13	29	2017-06-02	S1060217	21	\N	2017-06-03 11:19:39.573074	2017-06-03 11:19:39.573074
373	\N	2	13	29	2017-06-03	S1060317	21	\N	2017-06-03 15:41:37.265549	2017-06-03 15:41:37.265549
375	\N	2	13	31	2017-06-02	508956407	21	\N	2017-06-04 10:57:21.323891	2017-06-04 10:57:21.323891
385	\N	2	13	5	2017-06-06	1447	21	\N	2017-06-06 10:12:34.928062	2017-06-06 10:12:34.928062
389	\N	2	13	29	2017-06-05	S1060517	21	\N	2017-06-07 08:43:34.042073	2017-06-07 08:43:34.042073
391	\N	2	13	29	2017-06-07	S1060717	21	\N	2017-06-07 08:59:21.645553	2017-06-07 08:59:21.645553
396	\N	2	13	18	2017-06-05	0181315	21	\N	2017-06-07 15:32:44.879148	2017-06-07 15:32:44.879148
399	\N	2	13	22	2017-06-06	120001049385	21	\N	2017-06-07 16:21:09.006714	2017-06-07 16:21:09.006714
403	\N	2	13	23	2017-06-08	8507	21	\N	2017-06-09 19:25:49.795007	2017-06-09 19:25:49.795007
406	\N	2	13	30	2017-06-09	3925	21	\N	2017-06-10 09:15:01.031118	2017-06-10 09:15:01.031118
414	\N	2	13	11	2017-06-10	464661	21	\N	2017-06-10 10:48:03.155139	2017-06-10 10:48:03.155139
418	\N	2	13	29	2017-06-10	S1061017	21	\N	2017-06-11 07:03:58.338476	2017-06-11 07:03:58.338476
364	\N	2	13	23	2017-06-02	8382	21	\N	2017-06-03 09:41:13.68491	2017-06-03 09:41:13.68491
365	\N	2	13	24	2017-06-02	0210782	21	\N	2017-06-03 09:44:59.965336	2017-06-03 09:44:59.965336
370	\N	2	13	11	2017-06-03	462659	21	\N	2017-06-03 10:22:23.727067	2017-06-03 10:22:23.727067
379	\N	2	13	13	2017-06-04	1100118487	21	\N	2017-06-04 11:26:56.701773	2017-06-04 11:26:56.701773
387	\N	2	13	30	2017-06-06	3887	21	\N	2017-06-06 10:19:32.449567	2017-06-06 10:19:32.449567
380	\N	2	13	26	2017-06-05	18801	21	21	2017-06-06 09:42:25.556243	2017-06-06 10:30:15.764418
388	\N	2	13	29	2017-06-04	S1060417	21	\N	2017-06-07 08:40:47.858896	2017-06-07 08:40:47.858896
400	\N	2	13	23	2017-06-06	55214	21	\N	2017-06-07 16:31:18.705484	2017-06-07 16:31:18.705484
402	\N	2	13	31	2017-06-08	508974597	21	\N	2017-06-09 19:21:30.072261	2017-06-09 19:21:30.072261
416	\N	2	13	29	2017-06-08	S1060817	21	\N	2017-06-11 06:37:45.687663	2017-06-11 06:37:45.687663
369	\N	2	13	23	2017-06-03	8392	21	\N	2017-06-03 10:17:40.685217	2017-06-03 10:17:40.685217
374	\N	2	13	16	2017-06-01	11875	21	\N	2017-06-04 10:51:59.083138	2017-06-04 10:51:59.083138
377	\N	2	13	18	2017-06-02	0181152	21	\N	2017-06-04 11:04:42.289776	2017-06-04 11:04:42.289776
378	\N	2	13	26	2017-06-04	13650	21	\N	2017-06-04 11:16:28.684643	2017-06-04 11:16:28.684643
382	\N	2	13	21	2017-06-06	3583	21	\N	2017-06-06 09:52:17.551435	2017-06-06 09:52:17.551435
384	\N	2	13	23	2017-06-06	8439	21	\N	2017-06-06 10:08:34.662158	2017-06-06 10:08:34.662158
386	\N	2	13	25	2017-06-06	38430	21	\N	2017-06-06 10:15:19.644711	2017-06-06 10:15:19.644711
390	\N	2	13	29	2017-06-06	S1060617	21	\N	2017-06-07 08:52:50.039822	2017-06-07 08:52:50.039822
393	\N	2	13	13	2017-06-07	1100118909	21	\N	2017-06-07 11:25:33.471794	2017-06-07 11:25:33.471794
394	\N	2	13	26	2017-06-07	18802	21	\N	2017-06-07 11:30:17.120364	2017-06-07 11:30:17.120364
405	\N	2	13	30	2017-06-08	3984	21	\N	2017-06-10 09:08:51.372303	2017-06-10 09:08:51.372303
408	\N	2	13	13	2017-06-10	1100119345	21	\N	2017-06-10 10:17:40.218964	2017-06-10 10:17:40.218964
409	\N	2	13	27	2017-06-10	91494	21	\N	2017-06-10 10:21:32.463089	2017-06-10 10:21:32.463089
410	\N	2	13	9	2017-06-10	768247	21	\N	2017-06-10 10:26:06.974686	2017-06-10 10:26:06.974686
411	\N	2	13	18	2017-06-10	0181765	21	\N	2017-06-10 10:29:20.540521	2017-06-10 10:29:20.540521
412	\N	2	13	18	2017-06-10	0181764	21	\N	2017-06-10 10:43:49.242187	2017-06-10 10:43:49.242187
415	\N	2	13	11	2017-06-10	464643	21	\N	2017-06-10 10:51:15.42424	2017-06-10 10:51:15.42424
417	\N	2	13	29	2017-06-09	S1060917	21	\N	2017-06-11 06:57:38.334613	2017-06-11 06:57:38.334613
371	\N	2	13	29	2017-06-01	S1060117	21	\N	2017-06-03 11:00:14.227965	2017-06-03 11:00:14.227965
376	\N	2	13	18	2017-06-02	0181151	21	\N	2017-06-04 11:01:04.476184	2017-06-04 11:01:04.476184
381	\N	2	13	13	2017-06-05	1100118625	21	\N	2017-06-06 09:47:50.077331	2017-06-06 09:47:50.077331
383	\N	2	13	6	2017-06-06	2002	21	\N	2017-06-06 09:56:23.483774	2017-06-06 09:56:23.483774
395	\N	2	13	16	2017-06-05	11892	21	\N	2017-06-07 15:29:44.336152	2017-06-07 15:29:44.336152
397	\N	2	13	18	2017-06-05	0181314	21	\N	2017-06-07 15:41:21.793081	2017-06-07 15:41:21.793081
398	\N	2	13	15	2017-06-07	5110075997	21	\N	2017-06-07 15:44:33.984951	2017-06-07 15:44:33.984951
401	\N	2	13	23	2017-06-07	8477	21	\N	2017-06-09 19:16:04.178191	2017-06-09 19:16:04.178191
404	\N	2	13	32	2017-06-08	0395465	21	\N	2017-06-09 19:29:00.261493	2017-06-09 19:29:00.261493
407	\N	2	13	13	2017-06-09	1100119168	21	\N	2017-06-10 09:24:00.582879	2017-06-10 09:24:00.582879
413	\N	2	13	7	2017-06-10	200303	21	\N	2017-06-10 10:45:47.458515	2017-06-10 10:45:47.458515
419	\N	2	13	29	2017-06-11	S1061117	21	\N	2017-06-11 07:06:44.324222	2017-06-11 07:06:44.324222
420	\N	2	13	26	2017-06-11	18803	21	\N	2017-06-11 09:25:36.825298	2017-06-11 09:25:36.825298
421	\N	2	13	19	2017-06-06	1148	21	\N	2017-06-11 09:36:39.265398	2017-06-11 09:36:39.265398
422	\N	2	13	30	2017-06-12	4051	21	\N	2017-06-12 10:01:56.426901	2017-06-12 10:01:56.426901
423	\N	2	13	6	2017-06-13	2030	21	\N	2017-06-14 11:17:20.637321	2017-06-14 11:17:20.637321
424	\N	2	13	23	2017-06-13	55492	21	\N	2017-06-14 11:31:16.897953	2017-06-14 11:31:16.897953
425	\N	2	13	13	2017-06-13	1100119641	21	\N	2017-06-14 11:35:31.62799	2017-06-14 11:35:31.62799
426	\N	2	13	25	2017-06-14	38522	21	\N	2017-06-14 11:40:05.032778	2017-06-14 11:40:05.032778
428	\N	2	13	23	2017-06-14	8617	21	\N	2017-06-14 11:44:11.671117	2017-06-14 11:44:11.671117
429	\N	2	13	26	2017-06-14	18804	21	\N	2017-06-14 11:46:50.624149	2017-06-14 11:46:50.624149
430	\N	2	13	19	2017-06-09	1304	21	\N	2017-06-14 11:56:44.990361	2017-06-14 11:56:44.990361
431	\N	2	13	29	2017-06-12	S1061217	21	\N	2017-06-14 14:36:03.499189	2017-06-14 14:36:03.499189
432	\N	2	13	29	2017-06-13	S1061317	21	\N	2017-06-14 14:41:30.435184	2017-06-14 14:41:30.435184
433	\N	2	13	29	2017-06-14	S1061417	21	\N	2017-06-14 14:46:53.811818	2017-06-14 14:46:53.811818
434	\N	2	13	16	2017-06-15	11952	21	\N	2017-06-15 08:54:31.935226	2017-06-15 08:54:31.935226
435	\N	2	13	31	2017-06-15	508995499	21	\N	2017-06-15 09:54:01.545163	2017-06-15 09:54:01.545163
436	\N	2	13	29	2017-06-15	S1061517	21	\N	2017-06-15 17:53:16.738503	2017-06-15 17:53:16.738503
437	\N	2	13	30	2017-06-15	4077	21	\N	2017-06-15 18:16:04.268899	2017-06-15 18:16:04.268899
438	\N	2	13	13	2017-06-15	1100119973	21	\N	2017-06-15 18:21:06.308133	2017-06-15 18:21:06.308133
439	\N	2	13	30	2017-06-16	4157	21	\N	2017-06-17 09:32:12.108838	2017-06-17 09:32:12.108838
440	\N	2	13	13	2017-06-17	1100120293	21	\N	2017-06-17 09:45:07.079161	2017-06-17 09:45:07.079161
441	\N	2	13	10	2017-06-17	157182	21	\N	2017-06-17 09:48:42.942914	2017-06-17 09:48:42.942914
442	\N	2	13	27	2017-06-17	91695	21	\N	2017-06-17 09:50:53.197751	2017-06-17 09:50:53.197751
443	\N	2	13	23	2017-06-17	8737	21	\N	2017-06-17 09:56:39.928219	2017-06-17 09:56:39.928219
444	\N	2	13	11	2017-06-17	466501	21	\N	2017-06-17 10:00:33.72773	2017-06-17 10:00:33.72773
445	\N	2	13	16	2017-06-17	11978	21	\N	2017-06-17 11:21:09.453765	2017-06-17 11:21:09.453765
446	\N	2	13	18	2017-06-17	0182273	21	\N	2017-06-17 11:22:53.862638	2017-06-17 11:22:53.862638
447	\N	2	13	18	2017-06-17	0182272	21	\N	2017-06-17 11:30:46.939873	2017-06-17 11:30:46.939873
449	\N	2	13	29	2017-06-16	S1061617	21	\N	2017-06-18 08:55:23.733313	2017-06-18 08:55:23.733313
450	\N	2	13	29	2017-06-17	S1061717	21	\N	2017-06-18 09:13:13.779359	2017-06-18 09:13:13.779359
451	\N	2	13	29	2017-06-18	S1061817	21	\N	2017-06-18 09:25:56.152999	2017-06-18 09:25:56.152999
452	\N	2	13	26	2017-06-18	18805	21	\N	2017-06-18 15:09:31.199141	2017-06-18 15:09:31.199141
454	\N	2	13	6	2017-06-19	2047	21	\N	2017-06-21 08:34:32.370897	2017-06-21 08:34:32.370897
455	\N	2	13	5	2017-06-19	01503	21	\N	2017-06-21 08:47:14.310575	2017-06-21 08:47:14.310575
456	\N	2	13	5	2017-06-19	1500	21	\N	2017-06-21 08:49:32.21453	2017-06-21 08:49:32.21453
457	\N	2	13	5	2017-06-19	1478	21	\N	2017-06-21 08:54:18.049225	2017-06-21 08:54:18.049225
458	\N	2	13	7	2017-06-19	201273	21	\N	2017-06-21 08:58:37.287737	2017-06-21 08:58:37.287737
459	\N	2	13	30	2017-06-20	4217	21	\N	2017-06-21 09:01:41.894133	2017-06-21 09:01:41.894133
460	\N	2	13	34	2017-06-19	17050	21	\N	2017-06-21 12:12:54.720731	2017-06-21 12:12:54.720731
461	\N	2	13	9	2017-06-19	769587	21	\N	2017-06-21 12:17:54.217522	2017-06-21 12:17:54.217522
462	\N	2	13	24	2017-06-19	0212836	21	\N	2017-06-21 12:24:04.680969	2017-06-21 12:24:04.680969
463	\N	2	13	13	2017-06-19	1100120440	21	\N	2017-06-21 12:29:12.226981	2017-06-21 12:29:12.226981
464	\N	2	13	26	2017-06-20	18806	21	\N	2017-06-21 12:33:43.308886	2017-06-21 12:33:43.308886
465	\N	2	13	27	2017-06-20	91742	21	\N	2017-06-21 12:37:38.764832	2017-06-21 12:37:38.764832
467	\N	2	13	13	2017-06-20	1100120600	21	\N	2017-06-21 12:42:47.799032	2017-06-21 12:42:47.799032
468	\N	2	13	21	2017-06-20	3634	21	\N	2017-06-21 12:47:20.051411	2017-06-21 12:47:20.051411
469	\N	2	13	30	2017-06-21	4241	21	\N	2017-06-21 12:50:00.443035	2017-06-21 12:50:00.443035
470	\N	2	13	23	2017-06-21	8813	21	\N	2017-06-21 12:56:53.055789	2017-06-21 12:56:53.055789
471	\N	2	13	23	2017-06-20	55840	21	\N	2017-06-21 16:47:08.768005	2017-06-21 16:47:08.768005
472	\N	2	13	31	2017-06-21	509014472	21	\N	2017-06-21 16:49:51.719218	2017-06-21 16:49:51.719218
473	\N	2	13	22	2017-06-21	120001056299	21	\N	2017-06-21 16:53:36.060266	2017-06-21 16:53:36.060266
474	\N	2	13	26	2017-06-22	18807	21	\N	2017-06-23 08:13:16.480611	2017-06-23 08:13:16.480611
475	\N	2	13	30	2017-06-23	4251	21	\N	2017-06-23 08:17:24.568209	2017-06-23 08:17:24.568209
476	\N	2	13	29	2017-06-19	S1061917	21	\N	2017-06-23 09:46:40.740681	2017-06-23 09:46:40.740681
477	\N	2	13	29	2017-06-20	S1062017	21	\N	2017-06-23 09:55:31.500609	2017-06-23 09:55:31.500609
478	\N	2	13	29	2017-06-21	S1062117	21	\N	2017-06-23 10:26:48.719469	2017-06-23 10:26:48.719469
479	\N	2	13	29	2017-06-22	S1062217	21	\N	2017-06-23 10:38:46.130328	2017-06-23 10:38:46.130328
480	\N	2	13	29	2017-06-23	S1062317	21	\N	2017-06-23 10:50:20.485601	2017-06-23 10:50:20.485601
481	\N	2	13	16	2017-06-22	12016	21	\N	2017-06-23 19:27:09.954082	2017-06-23 19:27:09.954082
482	\N	2	13	18	2017-06-23	0182694	21	\N	2017-06-23 19:29:59.695832	2017-06-23 19:29:59.695832
483	\N	2	13	18	2017-06-23	0182693	21	\N	2017-06-23 19:36:40.911746	2017-06-23 19:36:40.911746
484	\N	2	13	34	2017-06-24	17055	21	\N	2017-06-24 10:22:08.606761	2017-06-24 10:22:08.606761
485	\N	2	13	30	2017-06-24	4038	21	\N	2017-06-24 10:25:43.062267	2017-06-24 10:25:43.062267
486	\N	2	13	9	2017-06-24	770729	21	\N	2017-06-24 10:32:35.371302	2017-06-24 10:32:35.371302
487	\N	2	13	13	2017-06-24	1100121099	21	\N	2017-06-24 10:36:31.448032	2017-06-24 10:36:31.448032
488	\N	2	13	19	2017-06-23	1518	21	\N	2017-06-25 06:55:13.549286	2017-06-25 06:55:13.549286
489	\N	2	13	29	2017-06-24	S1062417	21	\N	2017-06-25 07:00:30.30851	2017-06-25 07:00:30.30851
490	\N	2	13	13	2017-06-25	1100121211	21	\N	2017-06-25 11:09:41.190002	2017-06-25 11:09:41.190002
491	\N	2	13	29	2017-06-25	S1062517	21	\N	2017-06-25 14:45:10.0077	2017-06-25 14:45:10.0077
492	\N	2	13	30	2017-06-26	4263	21	\N	2017-06-27 08:42:24.70872	2017-06-27 08:42:24.70872
493	\N	2	13	6	2017-06-27	2069	21	\N	2017-06-27 08:54:43.603635	2017-06-27 08:54:43.603635
494	\N	2	13	5	2017-06-27	01569	21	\N	2017-06-27 09:06:29.613237	2017-06-27 09:06:29.613237
495	\N	2	13	5	2017-06-27	1529	21	\N	2017-06-27 09:08:23.70015	2017-06-27 09:08:23.70015
496	\N	2	13	26	2017-06-27	18808	21	\N	2017-06-27 09:11:45.110262	2017-06-27 09:11:45.110262
497	\N	2	13	23	2017-06-27	56094	21	\N	2017-06-28 17:26:40.449118	2017-06-28 17:26:40.449118
498	\N	2	13	18	2017-06-28	0182935	21	\N	2017-06-28 17:28:59.821338	2017-06-28 17:28:59.821338
499	\N	2	13	18	2017-06-28	0182936	21	\N	2017-06-28 17:32:46.188411	2017-06-28 17:32:46.188411
500	\N	2	13	31	2017-06-28	509037015	21	\N	2017-06-28 17:37:48.913441	2017-06-28 17:37:48.913441
501	\N	2	13	29	2017-06-26	S1062617	21	\N	2017-06-30 13:42:15.635697	2017-06-30 13:42:15.635697
502	\N	2	13	29	2017-06-27	S1062717	21	\N	2017-06-30 13:46:41.885486	2017-06-30 13:46:41.885486
503	\N	2	13	29	2017-06-28	S1062817	21	\N	2017-06-30 13:59:02.446451	2017-06-30 13:59:02.446451
504	\N	2	13	29	2017-06-29	S1062917	21	\N	2017-06-30 14:17:42.419603	2017-06-30 14:17:42.419603
505	\N	2	13	29	2017-06-30	S1063017	21	\N	2017-06-30 14:28:03.811773	2017-06-30 14:28:03.811773
506	\N	2	13	30	2017-06-28	4190	21	\N	2017-06-30 14:42:54.286255	2017-06-30 14:42:54.286255
510	\N	2	13	10	2017-06-29	158653	21	\N	2017-06-30 14:59:03.830968	2017-06-30 14:59:03.830968
512	\N	2	13	7	2017-06-30	88342	21	\N	2017-06-30 15:03:11.22377	2017-06-30 15:03:11.22377
514	\N	2	13	8	2017-06-29	90057	21	\N	2017-06-30 19:20:59.41532	2017-06-30 19:20:59.41532
515	\N	2	13	18	2017-07-01	0183092	21	\N	2017-07-01 17:46:39.362364	2017-07-01 17:46:39.362364
521	\N	2	13	23	2017-07-01	9028	21	\N	2017-07-02 11:29:46.185565	2017-07-02 11:29:46.185565
522	\N	2	13	27	2017-07-02	92088	21	\N	2017-07-02 11:46:27.987166	2017-07-02 11:46:27.987166
523	\N	2	13	23	2017-07-03	56354	21	\N	2017-07-04 18:45:47.993985	2017-07-04 18:45:47.993985
524	\N	2	13	16	2017-07-03	12068	21	\N	2017-07-04 18:49:32.860613	2017-07-04 18:49:32.860613
525	\N	2	13	19	2017-07-04	1647	21	\N	2017-07-04 18:55:06.410942	2017-07-04 18:55:06.410942
526	\N	2	13	18	2017-07-04	0183329	21	\N	2017-07-04 18:57:42.73477	2017-07-04 18:57:42.73477
528	\N	2	13	29	2017-07-03	S1070317	21	\N	2017-07-05 10:13:19.895148	2017-07-05 10:13:19.895148
530	\N	2	13	29	2017-07-05	S1070517	21	\N	2017-07-05 11:11:40.141348	2017-07-05 11:11:40.141348
531	\N	2	13	23	2017-07-03	9058	21	\N	2017-07-05 12:12:34.583004	2017-07-05 12:12:34.583004
532	\N	2	13	30	2017-07-03	4367	21	\N	2017-07-05 12:19:14.183381	2017-07-05 12:19:14.183381
535	\N	2	13	34	2017-07-03	18470	21	\N	2017-07-05 12:40:52.206172	2017-07-05 12:40:52.206172
537	\N	2	13	6	2017-07-03	2097	21	\N	2017-07-05 12:48:25.439038	2017-07-05 12:48:25.439038
538	\N	2	13	24	2017-07-03	0214203	21	\N	2017-07-05 12:58:41.903415	2017-07-05 12:58:41.903415
539	\N	2	13	5	2017-07-03	01548	21	\N	2017-07-05 13:09:26.617819	2017-07-05 13:09:26.617819
540	\N	2	13	11	2017-07-03	470550	21	\N	2017-07-05 13:12:20.604082	2017-07-05 13:12:20.604082
541	\N	2	13	30	2017-07-04	4401	21	\N	2017-07-05 13:24:39.319461	2017-07-05 13:24:39.319461
542	\N	2	13	23	2017-07-04	9108	21	\N	2017-07-05 13:31:07.119295	2017-07-05 13:31:07.119295
543	\N	2	13	30	2017-07-05	4423	21	\N	2017-07-05 13:36:50.37815	2017-07-05 13:36:50.37815
544	\N	2	13	13	2017-07-05	1100122433	21	\N	2017-07-05 13:49:55.905439	2017-07-05 13:49:55.905439
546	\N	2	13	10	2017-07-05	159417	21	\N	2017-07-05 13:58:45.419382	2017-07-05 13:58:45.419382
549	\N	2	13	22	2017-07-05	120001061801	21	\N	2017-07-05 19:47:32.408315	2017-07-05 19:47:32.408315
550	\N	2	13	30	2017-07-06	4433	21	\N	2017-07-08 10:48:32.929905	2017-07-08 10:48:32.929905
553	\N	2	13	9	2017-07-07	773076	21	\N	2017-07-08 11:12:51.291743	2017-07-08 11:12:51.291743
558	\N	2	13	27	2017-07-09	92288	21	\N	2017-07-09 09:39:47.963041	2017-07-09 09:39:47.963041
559	\N	2	13	29	2017-07-06	S1070617	21	\N	2017-07-09 09:41:56.415778	2017-07-09 09:41:56.415778
560	\N	2	13	29	2017-07-07	S1070717	21	\N	2017-07-09 10:03:32.629052	2017-07-09 10:03:32.629052
562	\N	2	13	29	2017-07-09	S1070917	21	\N	2017-07-09 10:21:49.025093	2017-07-09 10:21:49.025093
564	\N	2	13	13	2017-07-10	1100123074	21	\N	2017-07-10 10:10:02.594845	2017-07-10 10:10:02.594845
568	\N	2	13	23	2017-07-11	9278	21	\N	2017-07-11 09:11:15.724049	2017-07-11 09:11:15.724049
571	\N	2	13	11	2017-07-11	472775	21	\N	2017-07-11 09:30:57.148807	2017-07-11 09:30:57.148807
579	\N	2	13	22	2017-07-10	120001063551	21	\N	2017-07-12 15:11:19.846064	2017-07-12 15:11:19.846064
580	\N	2	13	22	2017-07-11	120001063552	21	\N	2017-07-12 15:14:50.822199	2017-07-12 15:14:50.822199
583	\N	2	13	30	2017-07-13	4556	21	\N	2017-07-14 10:54:55.488658	2017-07-14 10:54:55.488658
584	\N	2	13	23	2017-07-13	9365	21	\N	2017-07-14 11:03:15.00002	2017-07-14 11:03:15.00002
585	\N	2	13	30	2017-07-14	4571	21	\N	2017-07-14 11:08:11.742304	2017-07-14 11:08:11.742304
593	\N	2	13	29	2017-07-14	S1071417	21	\N	2017-07-16 10:26:25.917355	2017-07-16 10:26:25.917355
594	\N	2	13	29	2017-07-15	S1071517	21	\N	2017-07-16 10:30:39.451415	2017-07-16 10:30:39.451415
595	\N	2	13	29	2017-07-16	S1071617	21	\N	2017-07-16 10:33:35.567263	2017-07-16 10:33:35.567263
597	\N	2	13	6	2017-07-17	2159	21	\N	2017-07-19 08:50:08.942418	2017-07-19 08:50:08.942418
598	\N	2	13	10	2017-07-17	160801	21	\N	2017-07-19 10:26:50.510333	2017-07-19 10:26:50.510333
507	\N	2	13	30	2017-06-29	4283	21	\N	2017-06-30 14:46:34.147757	2017-06-30 14:46:34.147757
508	\N	2	13	9	2017-06-29	771582	21	\N	2017-06-30 14:55:06.971714	2017-06-30 14:55:06.971714
509	\N	2	13	23	2017-06-29	8992	21	\N	2017-06-30 14:57:21.316604	2017-06-30 14:57:21.316604
511	\N	2	13	13	2017-06-30	1100121833	21	\N	2017-06-30 15:00:18.685472	2017-06-30 15:00:18.685472
513	\N	2	13	23	2017-06-29	56225	21	\N	2017-06-30 15:05:25.374254	2017-06-30 15:05:25.374254
516	\N	2	13	18	2017-07-01	0183091	21	\N	2017-07-01 17:53:42.893503	2017-07-01 17:53:42.893503
517	\N	2	13	29	2017-07-01	S1070117	21	\N	2017-07-02 09:35:58.739558	2017-07-02 09:35:58.739558
518	\N	2	13	29	2017-07-02	S1070217	21	\N	2017-07-02 10:14:37.630117	2017-07-02 10:14:37.630117
519	\N	2	13	30	2017-07-01	4316	21	\N	2017-07-02 11:23:22.475503	2017-07-02 11:23:22.475503
520	\N	2	13	13	2017-07-01	1100122026	21	\N	2017-07-02 11:27:38.274495	2017-07-02 11:27:38.274495
527	\N	2	13	18	2017-07-04	0183311	21	\N	2017-07-04 19:00:24.481348	2017-07-04 19:00:24.481348
529	\N	2	13	29	2017-07-04	S1070417	21	\N	2017-07-05 10:59:31.915634	2017-07-05 10:59:31.915634
534	\N	2	13	9	2017-07-03	772002	21	\N	2017-07-05 12:37:57.907563	2017-07-05 12:37:57.907563
536	\N	2	13	13	2017-07-03	1100122152	21	\N	2017-07-05 12:43:38.509174	2017-07-05 12:43:38.509174
545	\N	2	13	11	2017-07-05	471114	21	\N	2017-07-05 13:52:53.261443	2017-07-05 13:52:53.261443
547	\N	2	13	23	2017-07-05	56516	21	\N	2017-07-05 19:35:07.886637	2017-07-05 19:35:07.886637
548	\N	2	13	32	2017-07-05	464772	21	\N	2017-07-05 19:40:41.074869	2017-07-05 19:40:41.074869
551	\N	2	13	34	2017-07-06	18602	21	\N	2017-07-08 10:56:53.899952	2017-07-08 10:56:53.899952
552	\N	2	13	30	2017-07-07	4455	21	\N	2017-07-08 11:03:22.699597	2017-07-08 11:03:22.699597
554	\N	2	13	23	2017-07-07	9229	21	\N	2017-07-08 11:17:43.263051	2017-07-08 11:17:43.263051
555	\N	2	13	13	2017-07-07	1100122712	21	\N	2017-07-08 11:23:51.002629	2017-07-08 11:23:51.002629
557	\N	2	13	31	2017-07-07	509066263	21	\N	2017-07-08 15:42:29.437807	2017-07-08 15:42:29.437807
561	\N	2	13	29	2017-07-08	S1070817	21	\N	2017-07-09 10:11:48.938962	2017-07-09 10:11:48.938962
563	\N	2	13	29	2017-07-10	S1071017	21	\N	2017-07-10 09:39:40.538653	2017-07-10 09:39:40.538653
565	\N	2	13	6	2017-07-10	2133	21	\N	2017-07-10 10:16:06.109071	2017-07-10 10:16:06.109071
566	\N	2	13	30	2017-07-10	4480	21	\N	2017-07-10 10:42:49.991424	2017-07-10 10:42:49.991424
567	\N	2	13	7	2017-07-10	203751	21	\N	2017-07-11 09:07:31.874797	2017-07-11 09:07:31.874797
569	\N	2	13	30	2017-07-11	4372	21	\N	2017-07-11 09:13:58.955729	2017-07-11 09:13:58.955729
572	\N	2	13	21	2017-07-08	3686	21	\N	2017-07-11 10:39:09.506319	2017-07-11 10:39:09.506319
573	\N	2	13	29	2017-07-11	S1071117	21	\N	2017-07-12 11:47:14.802948	2017-07-12 11:47:14.802948
574	\N	2	13	29	2017-07-12	S1071217	21	\N	2017-07-12 11:52:46.903323	2017-07-12 11:52:46.903323
575	\N	2	13	9	2017-07-12	773607	21	\N	2017-07-12 12:40:18.543061	2017-07-12 12:40:18.543061
576	\N	2	13	13	2017-07-12	1100123366	21	\N	2017-07-12 12:43:29.084859	2017-07-12 12:43:29.084859
577	\N	2	13	7	2017-07-12	204017	21	\N	2017-07-12 12:53:43.794471	2017-07-12 12:53:43.794471
578	\N	2	13	30	2017-07-12	4496	21	\N	2017-07-12 12:56:06.413894	2017-07-12 12:56:06.413894
581	\N	2	13	18	2017-07-10	0183692	21	\N	2017-07-12 15:17:25.82327	2017-07-12 15:17:25.82327
582	\N	2	13	16	2017-07-12	12144	21	\N	2017-07-12 15:21:12.653736	2017-07-12 15:21:12.653736
586	\N	2	13	13	2017-07-14	1100123689	21	\N	2017-07-14 11:18:18.597154	2017-07-14 11:18:18.597154
587	\N	2	13	30	2017-07-15	4509	21	\N	2017-07-15 07:50:25.832978	2017-07-15 07:50:25.832978
588	\N	2	13	18	2017-07-14	0183777	21	\N	2017-07-15 13:27:41.295429	2017-07-15 13:27:41.295429
589	\N	2	13	18	2017-07-14	0183776	21	\N	2017-07-15 13:32:50.651635	2017-07-15 13:32:50.651635
590	\N	2	13	22	2017-07-15	120001065551	21	\N	2017-07-15 13:37:37.344351	2017-07-15 13:37:37.344351
591	\N	2	13	27	2017-07-16	92477	21	\N	2017-07-16 09:55:38.304133	2017-07-16 09:55:38.304133
592	\N	2	13	29	2017-07-13	S1071317	21	\N	2017-07-16 09:59:30.576045	2017-07-16 09:59:30.576045
596	\N	2	13	5	2017-07-17	1605	21	\N	2017-07-19 08:44:11.852341	2017-07-19 08:44:11.852341
599	\N	2	13	11	2017-07-17	474613	21	\N	2017-07-19 10:29:17.10402	2017-07-19 10:29:17.10402
600	\N	2	13	9	2017-07-17	774688	21	\N	2017-07-19 10:49:00.969755	2017-07-19 10:49:00.969755
601	\N	2	13	30	2017-07-17	4530	21	\N	2017-07-19 10:53:35.634164	2017-07-19 10:53:35.634164
602	\N	2	13	30	2017-07-18	4546	21	\N	2017-07-19 11:06:23.654455	2017-07-19 11:06:23.654455
603	\N	2	13	30	2017-07-19	4576	21	\N	2017-07-19 11:17:46.541585	2017-07-19 11:17:46.541585
604	\N	2	13	13	2017-07-19	1100124303	21	\N	2017-07-19 11:23:00.759791	2017-07-19 11:23:00.759791
605	\N	2	13	24	2017-07-19	215660	21	\N	2017-07-19 11:27:52.909972	2017-07-19 11:27:52.909972
606	\N	2	13	24	2017-07-19	215926	21	\N	2017-07-19 11:34:49.917777	2017-07-19 11:34:49.917777
607	\N	2	13	7	2017-07-19	204768	21	\N	2017-07-19 11:39:41.633925	2017-07-19 11:39:41.633925
608	\N	2	13	9	2017-07-19	775023	21	\N	2017-07-19 11:41:45.363818	2017-07-19 11:41:45.363818
609	\N	2	13	11	2017-07-19	475144	21	\N	2017-07-19 11:46:06.615537	2017-07-19 11:46:06.615537
635	\N	2	13	11	2017-07-24	476393	21	\N	2017-07-26 07:25:58.768871	2017-07-26 07:25:58.768871
610	\N	2	13	29	2017-07-17	S1071717	21	21	2017-07-19 11:55:58.684108	2017-07-19 11:57:20.513133
611	\N	2	13	29	2017-07-18	S1071817	21	\N	2017-07-19 12:19:10.057493	2017-07-19 12:19:10.057493
612	\N	2	13	29	2017-07-19	S1071917	21	\N	2017-07-19 12:43:18.875134	2017-07-19 12:43:18.875134
613	\N	2	13	23	2017-07-17	57007	21	\N	2017-07-19 15:21:52.315912	2017-07-19 15:21:52.315912
614	\N	2	13	18	2017-07-17	0184146	21	\N	2017-07-19 15:24:26.988285	2017-07-19 15:24:26.988285
615	\N	2	13	18	2017-07-17	0184145	21	\N	2017-07-19 15:29:41.82094	2017-07-19 15:29:41.82094
616	\N	2	13	18	2017-07-19	0184397	21	\N	2017-07-19 15:32:15.280332	2017-07-19 15:32:15.280332
617	\N	2	13	30	2017-07-20	4609	21	\N	2017-07-22 05:33:07.358673	2017-07-22 05:33:07.358673
618	\N	2	13	21	2017-07-20	3733	21	\N	2017-07-22 05:40:46.264819	2017-07-22 05:40:46.264819
619	\N	2	13	30	2017-07-21	4622	21	\N	2017-07-22 05:45:08.824995	2017-07-22 05:45:08.824995
620	\N	2	13	13	2017-07-21	1100124663	21	\N	2017-07-22 05:54:08.52336	2017-07-22 05:54:08.52336
621	\N	2	13	30	2017-07-22	4638	21	\N	2017-07-22 05:58:10.297828	2017-07-22 05:58:10.297828
622	\N	2	13	16	2017-07-20	12177	21	\N	2017-07-22 09:26:48.491694	2017-07-22 09:26:48.491694
623	\N	2	13	31	2017-07-20	509105524	21	\N	2017-07-22 09:30:02.869621	2017-07-22 09:30:02.869621
624	\N	2	13	19	2017-07-21	2145	21	\N	2017-07-22 12:03:07.426314	2017-07-22 12:03:07.426314
625	\N	2	13	19	2017-07-21	2164	21	\N	2017-07-22 12:05:16.279008	2017-07-22 12:05:16.279008
626	\N	2	13	19	2017-07-21	2144	21	\N	2017-07-22 12:06:58.107025	2017-07-22 12:06:58.107025
627	\N	2	13	29	2017-07-20	S1072017	21	\N	2017-07-23 12:15:54.603183	2017-07-23 12:15:54.603183
628	\N	2	13	29	2017-07-21	S1072117	21	\N	2017-07-23 13:11:02.508929	2017-07-23 13:11:02.508929
629	\N	2	13	29	2017-07-22	S1072217	21	\N	2017-07-23 13:33:20.110729	2017-07-23 13:33:20.110729
630	\N	2	13	29	2017-07-23	S1072317	21	\N	2017-07-23 14:21:00.621116	2017-07-23 14:21:00.621116
631	\N	2	13	30	2017-07-24	4649	21	\N	2017-07-26 06:41:27.490377	2017-07-26 06:41:27.490377
632	\N	2	13	13	2017-07-24	1100125075	21	\N	2017-07-26 06:51:38.385428	2017-07-26 06:51:38.385428
633	\N	2	13	23	2017-07-24	57257	21	\N	2017-07-26 06:55:47.506786	2017-07-26 06:55:47.506786
634	\N	2	13	34	2017-07-24	17085	21	\N	2017-07-26 07:21:00.365519	2017-07-26 07:21:00.365519
636	\N	2	13	7	2017-07-24	383	21	\N	2017-07-26 07:35:28.387575	2017-07-26 07:35:28.387575
637	\N	2	13	9	2017-07-24	775642	21	\N	2017-07-26 07:37:26.978171	2017-07-26 07:37:26.978171
638	\N	2	13	22	2017-07-24	120001069148	21	\N	2017-07-26 07:40:44.466182	2017-07-26 07:40:44.466182
639	\N	2	13	18	2017-07-24	0184624	21	\N	2017-07-26 07:45:17.280796	2017-07-26 07:45:17.280796
640	\N	2	13	18	2017-07-24	0184623	21	\N	2017-07-26 07:49:19.223766	2017-07-26 07:49:19.223766
641	\N	2	13	23	2017-07-25	9590	21	\N	2017-07-26 07:51:59.498359	2017-07-26 07:51:59.498359
642	\N	2	13	6	2017-07-25	2179	21	\N	2017-07-26 07:55:53.447402	2017-07-26 07:55:53.447402
643	\N	2	13	5	2017-07-25	01633	21	\N	2017-07-26 08:11:26.50082	2017-07-26 08:11:26.50082
644	\N	2	13	13	2017-07-25	1100125190	21	\N	2017-07-26 08:15:41.100669	2017-07-26 08:15:41.100669
645	\N	2	13	10	2017-07-25	161853	21	\N	2017-07-26 08:18:12.565658	2017-07-26 08:18:12.565658
646	\N	2	13	23	2017-07-26	57393	21	\N	2017-07-26 08:21:03.470527	2017-07-26 08:21:03.470527
647	\N	2	13	19	2017-07-26	2210	21	\N	2017-07-26 08:22:36.362297	2017-07-26 08:22:36.362297
648	\N	2	13	13	2017-07-26	1100125403	21	\N	2017-07-26 08:24:36.639692	2017-07-26 08:24:36.639692
649	\N	2	13	8	2017-07-26	0083627	21	\N	2017-07-26 08:28:29.88195	2017-07-26 08:28:29.88195
651	\N	2	13	18	2017-07-26	0184710	21	\N	2017-07-26 08:37:05.117936	2017-07-26 08:37:05.117936
673	\N	2	13	31	2017-07-31	509139625	21	\N	2017-07-31 12:21:01.5243	2017-07-31 12:21:01.5243
674	\N	2	13	29	2017-08-01	S1080117	21	\N	2017-08-02 10:32:16.156703	2017-08-02 10:32:16.156703
681	\N	2	13	6	2017-08-03	2221	21	\N	2017-08-05 05:33:20.188167	2017-08-05 05:33:20.188167
687	\N	2	13	13	2017-08-04	1100126697	21	\N	2017-08-05 05:55:22.627195	2017-08-05 05:55:22.627195
693	\N	2	13	27	2017-08-01	92887	21	\N	2017-08-05 06:36:20.387061	2017-08-05 06:36:20.387061
650	\N	2	13	18	2017-07-26	0184711	21	\N	2017-07-26 08:31:59.553427	2017-07-26 08:31:59.553427
652	\N	2	13	6	2017-07-12	2152	21	\N	2017-07-26 10:44:04.732272	2017-07-26 10:44:04.732272
656	\N	2	13	16	2017-07-26	12233	21	\N	2017-07-26 21:01:02.271536	2017-07-26 21:01:02.271536
657	\N	2	13	30	2017-07-27	4659	21	\N	2017-07-29 07:03:55.377029	2017-07-29 07:03:55.377029
661	\N	2	13	23	2017-07-28	9693	21	\N	2017-07-29 07:32:23.440074	2017-07-29 07:32:23.440074
662	\N	2	13	26	2017-07-28	18809	21	\N	2017-07-29 07:36:56.000871	2017-07-29 07:36:56.000871
663	\N	2	13	13	2017-07-28	1100125697	21	\N	2017-07-29 07:46:03.221801	2017-07-29 07:46:03.221801
671	\N	2	13	30	2017-07-31	4793	21	\N	2017-07-31 12:00:55.804137	2017-07-31 12:00:55.804137
679	\N	2	13	11	2017-08-01	478240	21	\N	2017-08-02 13:01:11.919966	2017-08-02 13:01:11.919966
682	\N	2	13	10	2017-08-03	162931	21	\N	2017-08-05 05:35:42.078981	2017-08-05 05:35:42.078981
686	\N	2	13	13	2017-08-03	1100126549	21	\N	2017-08-05 05:51:19.058879	2017-08-05 05:51:19.058879
694	\N	2	13	30	2017-08-02	4597	21	\N	2017-08-05 06:42:38.110418	2017-08-05 06:42:38.110418
653	\N	2	13	29	2017-07-24	S1072417	21	\N	2017-07-26 10:53:10.725987	2017-07-26 10:53:10.725987
654	\N	2	13	29	2017-07-25	S1072517	21	\N	2017-07-26 11:08:26.067719	2017-07-26 11:08:26.067719
664	\N	2	13	30	2017-07-29	4789	21	\N	2017-07-29 07:48:27.173536	2017-07-29 07:48:27.173536
665	\N	2	13	6	2017-07-29	2204	21	\N	2017-07-29 07:57:42.377669	2017-07-29 07:57:42.377669
666	\N	2	13	29	2017-07-27	S1072717	21	21	2017-07-30 07:52:04.408894	2017-07-30 10:52:28.39335
667	\N	2	13	29	2017-07-28	S1072817	21	21	2017-07-30 08:24:31.082277	2017-07-30 10:53:16.376766
668	\N	2	13	29	2017-07-29	S1072917	21	21	2017-07-30 08:35:35.207614	2017-07-30 10:53:50.517638
670	\N	2	13	29	2017-07-31	S1073117	21	\N	2017-07-31 11:06:32.054038	2017-07-31 11:06:32.054038
675	\N	2	13	29	2017-08-02	S1080217	21	\N	2017-08-02 11:09:06.688923	2017-08-02 11:09:06.688923
676	\N	2	13	6	2017-08-01	2200	21	\N	2017-08-02 12:32:26.361472	2017-08-02 12:32:26.361472
678	\N	2	13	5	2017-08-01	1644	21	\N	2017-08-02 12:56:56.383597	2017-08-02 12:56:56.383597
680	\N	2	13	30	2017-08-03	4811	21	\N	2017-08-05 05:24:59.955297	2017-08-05 05:24:59.955297
688	\N	2	13	30	2017-08-05	4903	21	\N	2017-08-05 05:59:21.686506	2017-08-05 05:59:21.686506
690	\N	2	13	23	2017-08-05	9897	21	\N	2017-08-05 06:07:28.484857	2017-08-05 06:07:28.484857
655	\N	2	13	29	2017-07-26	S1072617	21	\N	2017-07-26 11:15:57.416153	2017-07-26 11:15:57.416153
658	\N	2	13	23	2017-07-27	9681	21	\N	2017-07-29 07:15:17.089595	2017-07-29 07:15:17.089595
659	\N	2	13	27	2017-07-27	92774	21	\N	2017-07-29 07:22:42.718515	2017-07-29 07:22:42.718515
660	\N	2	13	21	2017-07-27	3759	21	\N	2017-07-29 07:26:27.462124	2017-07-29 07:26:27.462124
669	\N	2	13	29	2017-07-30	S1073017	21	21	2017-07-30 08:52:48.367051	2017-07-30 10:54:12.097988
672	\N	2	13	13	2017-07-31	1100126079	21	\N	2017-07-31 12:16:29.950563	2017-07-31 12:16:29.950563
683	\N	2	13	9	2017-08-03	777949	21	\N	2017-08-05 05:38:18.237235	2017-08-05 05:38:18.237235
684	\N	2	13	11	2017-08-03	479573	21	\N	2017-08-05 05:40:52.978355	2017-08-05 05:40:52.978355
685	\N	2	13	23	2017-08-03	9824	21	\N	2017-08-05 05:46:05.422746	2017-08-05 05:46:05.422746
689	\N	2	13	13	2017-08-05	1100126904	21	\N	2017-08-05 06:04:01.580836	2017-08-05 06:04:01.580836
691	\N	2	13	13	2017-08-01	1100126184	21	\N	2017-08-05 06:20:42.07415	2017-08-05 06:20:42.07415
692	\N	2	13	30	2017-08-01	4692	21	\N	2017-08-05 06:23:48.850754	2017-08-05 06:23:48.850754
695	\N	2	13	13	2017-08-02	1100126443	21	\N	2017-08-05 06:48:10.089039	2017-08-05 06:48:10.089039
696	\N	2	13	30	2017-07-25	4765	21	\N	2017-08-05 06:54:45.433449	2017-08-05 06:54:45.433449
697	\N	2	13	16	2017-08-03	12299	21	\N	2017-08-05 07:56:39.004975	2017-08-05 07:56:39.004975
698	\N	2	13	18	2017-08-03	0185377	21	\N	2017-08-05 07:58:32.540144	2017-08-05 07:58:32.540144
699	\N	2	13	10	2017-08-03	162939	21	\N	2017-08-05 08:05:02.415308	2017-08-05 08:05:02.415308
700	\N	2	13	23	2017-08-04	57792	21	\N	2017-08-05 08:59:56.152374	2017-08-05 08:59:56.152374
701	\N	2	13	29	2017-08-03	S1080317	21	\N	2017-08-06 07:53:05.101739	2017-08-06 07:53:05.101739
702	\N	2	13	29	2017-08-04	S1080417	21	\N	2017-08-06 09:11:39.697632	2017-08-06 09:11:39.697632
703	\N	2	13	29	2017-08-05	S1080517	21	\N	2017-08-06 09:18:23.137772	2017-08-06 09:18:23.137772
704	\N	2	13	29	2017-08-06	S1080617	21	\N	2017-08-06 09:24:58.114441	2017-08-06 09:24:58.114441
705	\N	2	13	30	2017-08-04	4865	21	\N	2017-08-06 09:34:03.183162	2017-08-06 09:34:03.183162
706	\N	2	13	29	2017-08-08	S1080717	21	\N	2017-08-09 07:27:20.991023	2017-08-09 07:27:20.991023
707	\N	2	13	29	2017-08-08	S1080817	21	\N	2017-08-09 07:42:54.427341	2017-08-09 07:42:54.427341
708	\N	2	13	29	2017-08-09	S1080917	21	\N	2017-08-09 07:51:27.890341	2017-08-09 07:51:27.890341
709	\N	2	13	18	2017-08-08	0185713	21	\N	2017-08-09 08:29:20.995244	2017-08-09 08:29:20.995244
710	\N	2	13	22	2017-08-07	120001074277	21	\N	2017-08-09 09:02:07.696604	2017-08-09 09:02:07.696604
711	\N	2	13	16	2017-08-08	12309	21	\N	2017-08-09 09:05:56.055234	2017-08-09 09:05:56.055234
712	\N	2	13	31	2017-08-08	509164954	21	\N	2017-08-09 09:09:55.551651	2017-08-09 09:09:55.551651
713	\N	2	13	30	2017-08-07	4918	21	\N	2017-08-09 09:16:24.079691	2017-08-09 09:16:24.079691
716	\N	2	13	29	2017-08-10	S1081017	21	\N	2017-08-12 07:51:05.453116	2017-08-12 07:51:05.453116
717	\N	2	13	29	2017-08-11	S1081117	21	\N	2017-08-12 09:20:41.100585	2017-08-12 09:20:41.100585
718	\N	2	13	29	2017-08-12	S1081217	21	\N	2017-08-12 09:40:23.158938	2017-08-12 09:40:23.158938
719	\N	2	13	22	2017-08-10	120001075443	21	\N	2017-08-12 10:05:30.640044	2017-08-12 10:05:30.640044
720	\N	2	13	18	2017-08-12	0186025	21	\N	2017-08-12 10:14:38.014827	2017-08-12 10:14:38.014827
721	\N	2	13	29	2017-08-17	S1081717	21	\N	2017-08-19 10:43:59.818188	2017-08-19 10:43:59.818188
722	\N	2	13	29	2017-08-18	S1081817	21	\N	2017-08-19 11:03:42.50928	2017-08-19 11:03:42.50928
723	\N	2	13	29	2017-08-19	S1081917	21	\N	2017-08-19 11:52:42.16205	2017-08-19 11:52:42.16205
724	\N	2	13	18	2017-08-19	0186633	21	\N	2017-08-19 12:09:33.971704	2017-08-19 12:09:33.971704
725	\N	2	13	29	2017-08-21	S1082117	21	\N	2017-08-21 07:57:21.212416	2017-08-21 07:57:21.212416
727	\N	2	13	32	2017-08-23	0380451	21	\N	2017-08-23 13:06:54.669804	2017-08-23 13:06:54.669804
728	\N	2	13	16	2017-08-22	12403	21	\N	2017-08-23 13:13:15.337387	2017-08-23 13:13:15.337387
729	\N	2	13	18	2017-08-23	0186861	21	\N	2017-08-23 13:16:17.934493	2017-08-23 13:16:17.934493
730	\N	2	13	22	2017-08-22	120001080092	21	\N	2017-08-23 13:18:18.06029	2017-08-23 13:18:18.06029
731	\N	2	13	31	2017-08-22	509210088	21	\N	2017-08-23 13:20:56.422011	2017-08-23 13:20:56.422011
732	\N	2	13	23	2017-08-22	58422	21	\N	2017-08-23 14:01:39.979759	2017-08-23 14:01:39.979759
733	\N	2	13	29	2017-08-28	S1082817	21	\N	2017-08-29 14:28:11.844862	2017-08-29 14:28:11.844862
734	\N	2	13	29	2017-08-29	S1082917	21	\N	2017-08-30 18:42:34.462508	2017-08-30 18:42:34.462508
735	\N	2	13	29	2017-09-08	S1090817	21	\N	2017-09-09 10:51:11.640565	2017-09-09 10:51:11.640565
736	\N	2	13	29	2017-09-07	S1090717	21	\N	2017-09-09 11:02:21.880531	2017-09-09 11:02:21.880531
737	\N	2	13	29	2017-09-09	S1090917	21	\N	2017-09-09 11:38:58.708175	2017-09-09 11:38:58.708175
738	\N	2	13	18	2017-09-08	0187975	21	\N	2017-09-09 12:04:00.128509	2017-09-09 12:04:00.128509
739	\N	2	13	31	2017-09-07	509262867	21	\N	2017-09-09 12:11:09.314248	2017-09-09 12:11:09.314248
740	\N	2	13	29	2017-09-16	S1091617	21	\N	2017-09-16 12:51:33.963378	2017-09-16 12:51:33.963378
741	\N	2	13	29	2017-09-14	S1091417	21	\N	2017-09-16 12:57:32.445728	2017-09-16 12:57:32.445728
742	\N	2	13	6	2017-09-20	2374	21	\N	2017-09-20 08:03:41.103496	2017-09-20 08:03:41.103496
\.


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('purchases_id_seq', 742, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY roles (id, client_id, name, description, role_level, created_at, updated_at) FROM stdin;
1	1	Company Administrator	Client Administrators have the full access to the whole company	client	2016-04-18 01:34:40.926634	2016-04-18 01:34:40.926634
2	1	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-04-18 01:34:41.102225	2016-04-18 01:34:41.102225
3	1	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-04-18 01:34:41.23164	2016-04-18 01:34:41.23164
4	2	Company Administrator	Client Administrators have the full access to the whole company	client	2016-05-05 00:55:58.350089	2016-05-05 00:55:58.350089
5	2	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-05-05 00:55:58.499306	2016-05-05 00:55:58.499306
6	2	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-05-05 00:55:58.622525	2016-05-05 00:55:58.622525
7	3	Company Administrator	Client Administrators have the full access to the whole company	client	2016-07-17 02:45:53.562382	2016-07-17 02:45:53.562382
8	3	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-07-17 02:45:53.703405	2016-07-17 02:45:53.703405
9	3	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-07-17 02:45:53.836536	2016-07-17 02:45:53.836536
10	4	Company Administrator	Client Administrators have the full access to the whole company	client	2016-08-06 10:57:34.425186	2016-08-06 10:57:34.425186
11	4	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-08-06 10:57:34.556445	2016-08-06 10:57:34.556445
12	4	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-08-06 10:57:34.675689	2016-08-06 10:57:34.675689
13	5	Company Administrator	Client Administrators have the full access to the whole company	client	2016-08-11 07:39:12.27044	2016-08-11 07:39:12.27044
14	5	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-08-11 07:39:12.399867	2016-08-11 07:39:12.399867
15	5	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-08-11 07:39:12.530652	2016-08-11 07:39:12.530652
16	6	Company Administrator	Client Administrators have the full access to the whole company	client	2016-08-13 08:30:25.66899	2016-08-13 08:30:25.66899
17	6	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-08-13 08:30:25.804341	2016-08-13 08:30:25.804341
18	6	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-08-13 08:30:25.92629	2016-08-13 08:30:25.92629
19	7	Company Administrator	Client Administrators have the full access to the whole company	client	2016-08-19 02:26:08.325394	2016-08-19 02:26:08.325394
20	7	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-08-19 02:26:08.466803	2016-08-19 02:26:08.466803
21	7	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-08-19 02:26:08.593184	2016-08-19 02:26:08.593184
22	8	Company Administrator	Client Administrators have the full access to the whole company	client	2016-08-24 05:28:22.967465	2016-08-24 05:28:22.967465
23	8	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-08-24 05:28:23.087267	2016-08-24 05:28:23.087267
24	8	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-08-24 05:28:23.207127	2016-08-24 05:28:23.207127
25	9	Company Administrator	Client Administrators have the full access to the whole company	client	2016-12-20 08:12:37.247404	2016-12-20 08:12:37.247404
26	9	Brand Administrator	Brand Administrators can manage the only brand assigned to them	brand	2016-12-20 08:12:38.115125	2016-12-20 08:12:38.115125
27	9	Branch Administrator	Branch Administrators can manage the only branch assigned to them	branch	2016-12-20 08:12:38.288774	2016-12-20 08:12:38.288774
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('roles_id_seq', 27, true);


--
-- Data for Name: sale_by_category_entries; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY sale_by_category_entries (id, sale_id, category_id, amount, date_created, client_id, brand_id, branch_id, subcategory_category_id, subcategory_id, created_at, updated_at) FROM stdin;
1	2	17	66962.00	\N	\N	\N	\N	\N	\N	2017-07-12 02:59:28.878395	2017-07-12 02:59:28.878395
2	2	16	66689.00	\N	\N	\N	\N	\N	\N	2017-07-12 02:59:28.90091	2017-07-12 02:59:28.90091
3	2	15	1227647.00	\N	\N	\N	\N	\N	\N	2017-07-12 02:59:28.904106	2017-07-12 02:59:28.904106
4	2	18	0.00	\N	\N	\N	\N	\N	\N	2017-07-12 02:59:28.912989	2017-07-12 02:59:28.912989
\.


--
-- Name: sale_by_category_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('sale_by_category_entries_id_seq', 4, true);


--
-- Data for Name: sale_by_settlement_entries; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY sale_by_settlement_entries (id, settlement_id, sale_id, brand_id, branch_id, date_created, client_id, amount, created_at, updated_at) FROM stdin;
\.


--
-- Name: sale_by_settlement_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('sale_by_settlement_entries_id_seq', 1, false);


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY sales (id, customer_count, transaction_count, branch_id, created_by_id, first_time_guest, repeat_guest, brand_id, delivery_transaction_count, credit_card_transaction_count, client_id, sale_date, delivery_sales, credit_card_sales, service_charge, gc_redeemed, cash_in_drawer, gc_sales, other_income, vat, shift_id, created_at, updated_at) FROM stdin;
1	3000	3000	6	\N	2400	600	\N	400	90	\N	2016-08-09	1800	4300	54	1200	10000	1600	8882	12	\N	2016-08-22 08:51:30.648929	2016-08-22 08:51:30.648929
2	5522	2371	13	\N	391	1980	\N	212	346	\N	2017-06-30	109199	330446	80000	0	1101652	0	0	100000	\N	2017-07-12 02:59:28.846015	2017-07-12 02:59:28.846015
\.


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('sales_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY schema_migrations (version) FROM stdin;
20151106005358
20151106023006
20151106023508
20151106023731
20151106023815
20151106023921
20151109030608
20151112030546
20151112030910
20151112031648
20151112031837
20151123021250
20151123032729
20151123045524
20151123050013
20151124054151
20151124072822
20151124073733
20151124075440
20151125050201
20151125055110
20151127010348
20151127015407
20151127043944
20151127044008
20151201052037
20151201072731
20151202010550
20151202011043
20151204010355
20151214015754
20151215072657
20160111043252
20160111043900
20160119015754
20160119053921
20160125003610
20160125010310
20160125010841
20160125011136
20160126004349
20160126061752
20160129052757
20160202024808
20160218051357
20170109021634
20170113032351
20170116025029
20170117030801
20170815060518
20170816015019
20170825053841
20170825054019
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY sections (id, page, created_at, updated_at, name) FROM stdin;
1	Company	2016-04-01 02:02:50.287846	2016-04-01 02:02:50.287846	clients
2	Brands	2016-04-01 02:02:50.34231	2016-04-01 02:02:50.34231	brands
3	Branches	2016-04-01 02:02:50.373293	2016-04-01 02:02:50.373293	branches
4	Permissions	2016-04-01 02:02:50.419776	2016-04-01 02:02:50.419776	permissions
5	Roles	2016-04-01 02:02:50.451651	2016-04-01 02:02:50.451651	roles
6	Users	2016-04-01 02:02:50.482459	2016-04-01 02:02:50.482459	users
7	Employees	2016-04-01 02:02:50.513665	2016-04-01 02:02:50.513665	employees
8	Settlements	2016-04-01 02:02:50.544814	2016-04-01 02:02:50.544814	settlements
9	Categories	2016-04-01 02:02:50.560311	2016-04-01 02:02:50.560311	categories
10	Subcategories	2016-04-01 02:02:50.575713	2016-04-01 02:02:50.575713	subcategories
11	Shifts	2016-04-01 02:02:50.591432	2016-04-01 02:02:50.591432	shifts
12	Sales	2016-04-01 02:02:50.606994	2016-04-01 02:02:50.606994	sales
13	Labor Hours	2016-04-01 02:02:50.638376	2016-04-01 02:02:50.638376	labor_hours
14	Units	2016-04-01 02:02:50.654029	2016-04-01 02:02:50.654029	units
15	Items	2016-04-01 02:02:50.670358	2016-04-01 02:02:50.670358	items
16	Inventories	2016-04-01 02:02:50.701199	2016-04-01 02:02:50.701199	inventories
17	Employee Types	2016-04-01 02:02:50.731997	2016-04-01 02:02:50.731997	employee_types
18	Conversions	2016-04-01 02:02:50.747498	2016-04-01 02:02:50.747498	conversions
19	Suppliers	2016-04-01 02:02:50.763175	2016-04-01 02:02:50.763175	suppliers
20	Purchases	2016-04-01 02:02:50.778984	2016-04-01 02:02:50.778984	purchases
21	Purchase Items	2016-04-01 02:02:50.794685	2016-04-01 02:02:50.794685	purchase_items
22	Settings	2016-04-01 02:02:50.826783	2016-04-01 02:02:50.826783	settings
23	Subscriptions	2016-04-01 02:02:50.85718	2016-04-01 02:02:50.85718	subscriptions
24	Bills	2016-04-01 02:02:50.888519	2016-04-01 02:02:50.888519	bills
\.


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('sections_id_seq', 24, true);


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY settings (id, theme, currency, language, created_at, updated_at, client_id) FROM stdin;
1	Default	Philippine Peso	English	2016-04-18 01:34:41.374807	2016-04-18 01:34:41.374807	1
2	Default	Philippine Peso	English	2016-05-05 00:55:58.749994	2016-05-05 00:55:58.749994	2
3	Default	Philippine Peso	English	2016-07-17 02:45:53.99321	2016-07-17 02:45:53.99321	3
4	Default	Philippine Peso	English	2016-08-06 10:57:34.799406	2016-08-06 10:57:34.799406	4
5	Default	Philippine Peso	English	2016-08-11 07:39:12.651724	2016-08-11 07:39:12.651724	5
6	Default	Philippine Peso	English	2016-08-13 08:30:26.042682	2016-08-13 08:30:26.042682	6
7	Default	Philippine Peso	English	2016-08-19 02:26:08.750745	2016-08-19 02:26:08.750745	7
8	Default	Philippine Peso	English	2016-08-24 05:28:23.324632	2016-08-24 05:28:23.324632	8
9	Default	Philippine Peso	English	2016-12-20 08:12:38.481585	2016-12-20 08:12:38.481585	9
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('settings_id_seq', 9, true);


--
-- Data for Name: settlements; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY settlements (id, name, is_complimentary, client_id, description, is_active, breadcrumbs, created_at, updated_at) FROM stdin;
\.


--
-- Name: settlements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('settlements_id_seq', 1, false);


--
-- Data for Name: shifts; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY shifts (id, name, brand_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('shifts_id_seq', 1, false);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY subscriptions (id, client_id, plan_id, start_date, end_date, status, paypal_customer_token, paypal_recurring_profile_token, paypal_email, paypal_payment_token, previous_payment, next_payment, branch_count, period, amount, outstanding_balance, created_at, updated_at) FROM stdin;
1	1	1	2016-04-18 01:35:36.030925	2016-06-17 01:35:36.03095	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-04-18 01:35:36.060333	2016-04-18 01:35:36.060333
2	2	1	2016-05-05 00:56:24.830428	2016-07-04 00:56:24.830452	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-05-05 00:56:24.862079	2016-05-05 00:56:24.862079
3	3	1	2016-07-17 02:46:46.549526	2016-09-15 02:46:46.549555	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-07-17 02:46:46.553539	2016-07-17 02:46:46.553539
4	4	1	2016-08-06 10:58:17.218761	2016-10-05 10:58:17.218784	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-08-06 10:58:17.220955	2016-08-06 10:58:17.220955
5	5	1	2016-08-11 07:40:48.650575	2016-10-10 07:40:48.650598	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-08-11 07:40:48.653759	2016-08-11 07:40:48.653759
6	6	1	2016-08-13 08:31:08.790032	2016-10-12 08:31:08.790055	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-08-13 08:31:08.792304	2016-08-13 08:31:08.792304
7	7	1	2016-08-19 02:26:45.252482	2016-10-18 02:26:45.252532	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-08-19 02:26:45.254462	2016-08-19 02:26:45.254462
8	8	1	2016-08-24 05:28:59.281761	2016-10-23 05:28:59.281781	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-08-24 05:28:59.283638	2016-08-24 05:28:59.283638
9	9	1	2016-12-20 08:13:31.323821	2017-02-18 08:13:31.323858	Active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-12-20 08:13:31.356246	2016-12-20 08:13:31.356246
13	2	3	2017-08-24 13:25:11.242726	2018-08-24 13:25:11.242771	Suspended	A979FXHAL7YHA	I-GUT5LGJ86USA	chezca1228@yahoo.com	EC-6G4517551N832824W	2017-08-13 13:52:47	2017-08-14 10:00:00	2	yearly	799.98	0.00	2017-07-10 05:58:47.144137	2017-08-24 13:35:15.075985
11	2	3	2017-04-25 06:56:37.944128	2018-04-25 06:56:37.944195	Suspended	A979FXHAL7YHA	I-83UUV1266BNS	chezca1228@yahoo.com	EC-5AV22111GA584064X	2017-04-24 19:02:47	2017-04-25 10:00:00	2	yearly	799.98	0.00	2017-03-06 09:16:22.017564	2017-04-25 17:58:59.677416
10	1	2	2017-04-24 10:53:44.630685	2017-05-24 10:53:44.630734	Suspended	A979FXHAL7YHA	I-ASXJDAURKJJV	chezca1228@yahoo.com	EC-9AJ760987V5790825	2017-04-24 10:40:46	2017-04-25 10:00:00	3	monthly	119.97	0.00	2017-03-06 09:03:03.126025	2017-04-25 18:00:22.341118
12	2	3	2017-08-24 19:29:51.254307	2018-08-24 19:29:51.254355	Processing	A979FXHAL7YHA	I-BC9L3UJTV3SF	chezca1228@yahoo.com	EC-7DV473465J8262130	2017-08-14 11:20:42	2017-08-15 10:00:00	2	yearly	799.98	0.00	2017-04-04 02:53:23.567225	2017-08-24 19:29:51.258923
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('subscriptions_id_seq', 13, true);


--
-- Data for Name: supplier_item_prices; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY supplier_item_prices (id, supplier_id, item_id, supplier_amount, created_at, updated_at, supplier_item_unit, packaging) FROM stdin;
1	35	2	35.00	2017-08-14 02:54:48.029007	2017-08-14 02:54:48.029007	\N	\N
2	11	1	195.00	2017-08-15 06:43:09.678719	2017-08-15 06:43:09.678719	\N	\N
\.


--
-- Name: supplier_item_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('supplier_item_prices_id_seq', 2, true);


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY suppliers (id, brand_id, client_id, branch_id, name, address, email, contact_person, contact_title, tin, mobile_no, fax_no, landline_no, is_active, assigned_to, is_deleted, created_at, updated_at) FROM stdin;
1	4	4	\N	Meat Co		\N							\N	1	f	2016-08-06 11:01:04.972243	2016-08-06 11:01:04.972243
2	7	7	\N	Coca Cola	Quezon City	\N	Carlo Sandoval	General Manager	3242	098827	234324	234234	\N	1	f	2016-08-19 02:27:54.242902	2016-08-19 02:27:54.242902
3	7	7	\N	Amadeo Coffee	Cavite City	\N	Anthony Sarios	General Manager	12313	09123123	213213	1232131	\N	1	f	2016-08-19 02:46:57.668124	2016-08-19 02:46:57.668124
4	6	6	\N	Meat Co.		\N							\N	2	f	2016-08-22 08:55:19.219041	2016-08-22 08:55:19.219041
5	2	2	\N	Abmarac Corp.		\N							\N	1	f	2017-03-01 13:29:56.405024	2017-03-01 13:29:56.405024
6	2	2	\N	Weblend Inc.		\N							\N	1	f	2017-03-01 13:30:07.247702	2017-03-01 13:30:07.247702
7	2	2	\N	Alternatives Food Corp.		\N							\N	1	f	2017-03-01 13:30:27.818163	2017-03-01 13:30:27.818163
8	2	2	\N	Booze Online Inc.		\N							\N	1	f	2017-03-01 13:31:06.004955	2017-03-01 13:31:06.004955
9	2	2	\N	Consolidated Dairy & Frozen Foods Corp.		\N							\N	1	f	2017-03-01 13:31:38.872422	2017-03-01 13:31:38.872422
10	2	2	\N	Coolspot Inc.		\N							\N	1	f	2017-03-01 13:31:58.706318	2017-03-01 13:31:58.706318
11	2	2	\N	ESV International Inc.		\N							\N	1	f	2017-03-01 13:32:16.034438	2017-03-01 13:32:16.034438
12	2	2	\N	Fil Fresh		\N							\N	1	f	2017-03-01 13:32:29.688639	2017-03-01 13:32:29.688639
13	2	2	\N	Foster Foods Inc.		\N							\N	1	f	2017-03-01 13:32:46.315624	2017-03-01 13:32:46.315624
14	2	2	\N	Genosi Inc.		\N							\N	1	f	2017-03-01 13:33:03.768327	2017-03-01 13:33:03.768327
15	2	2	\N	Getz Bros Inc.		\N							\N	1	f	2017-03-01 13:34:23.903511	2017-03-01 13:34:23.903511
16	2	2	\N	Innovasia Inc.		\N							\N	1	f	2017-03-01 13:34:48.127961	2017-03-01 13:34:48.127961
17	2	2	\N	JBO Trading Inc.		\N							\N	1	f	2017-03-01 13:35:07.290333	2017-03-01 13:35:07.290333
18	2	2	\N	LLRJ		\N							\N	1	f	2017-03-01 13:35:24.431286	2017-03-01 13:35:24.431286
19	2	2	\N	Lord's Printshoppe		\N							\N	1	f	2017-03-01 13:38:45.646471	2017-03-01 13:38:45.646471
20	2	2	\N	Middleby Philippines Inc.		\N							\N	1	f	2017-03-01 13:39:08.23639	2017-03-01 13:39:08.23639
21	2	2	\N	Oleolipo Inc.		\N							\N	1	f	2017-03-01 13:39:31.122484	2017-03-01 13:39:31.122484
22	2	2	\N	Pepsi Cola Philippines Inc.		\N							\N	1	f	2017-03-01 13:39:56.708676	2017-03-01 13:39:56.708676
23	2	2	\N	PL Aguila Manufacturing Inc.		\N							\N	1	f	2017-03-01 13:40:20.212248	2017-03-01 13:40:20.212248
24	2	2	\N	Tiptop Distribution Inc.		\N							\N	1	f	2017-03-01 13:40:51.855339	2017-03-01 13:40:51.855339
25	2	2	\N	Tortilleria El Mexicano		\N							\N	1	f	2017-03-01 13:41:31.008344	2017-03-01 13:41:31.008344
26	2	2	\N	EDC Meat & Vegetables		\N							\N	1	f	2017-03-01 13:41:46.714101	2017-03-01 13:41:46.714101
27	2	2	\N	Gourmet Breadhouse		\N							\N	1	f	2017-03-01 13:41:56.368869	2017-03-01 13:41:56.368869
28	2	2	\N	LES Petty Cash		\N	Lors Carrido	Restaurant Chief					\N	1	f	2017-03-06 08:54:26.522935	2017-03-06 08:54:26.522935
29	2	2	\N	S1 Petty Cash	Solaris One	\N	Myrtle Redera						\N	1	f	2017-04-05 10:00:42.859577	2017-04-05 10:00:42.859577
30	2	2	\N	Garcia's General Merchandise		\N	Edward Garcia						\N	1	f	2017-04-05 10:01:09.397852	2017-04-05 10:01:09.397852
31	2	2	\N	San Miguel Brewery Inc.	Ortigas	\N							\N	1	f	2017-04-18 15:04:32.838908	2017-04-18 15:04:32.838908
32	2	2	\N	Absolute Sales Corp.		\N							\N	1	f	2017-04-18 15:04:52.898173	2017-04-18 15:04:52.898173
33	2	2	\N	First Liquid Energy		\N							\N	1	f	2017-04-18 15:05:08.91664	2017-04-18 15:05:08.91664
34	2	2	\N	Nacho King		\N							\N	1	f	2017-05-22 00:14:14.710553	2017-05-22 00:14:14.710553
35	2	2	\N	Multi M		\N							\N	1	f	2017-05-22 00:14:26.168889	2017-05-22 00:14:26.168889
\.


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('suppliers_id_seq', 35, true);


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY units (id, brand_id, name, symbol, remarks, is_active, track_as_sales, is_deleted, created_at, updated_at) FROM stdin;
1	2	Kilogram	Kg	TEST	t	f	f	2017-02-20 03:13:15.248809	2017-02-20 03:13:15.248809
2	2	Pound	Lb		t	f	f	2017-02-20 06:38:05.618366	2017-02-20 06:38:05.618366
3	1	Kilogram	Kg	Kilogram	t	f	f	2017-02-22 03:36:20.487052	2017-02-22 03:36:20.487052
4	2	Cup	C		t	f	f	2017-03-01 13:43:26.079518	2017-03-01 13:43:26.079518
5	2	Gallon	Gal		t	f	f	2017-03-01 13:43:36.652177	2017-03-01 13:43:36.652177
6	2	Quart	Qrt		t	f	f	2017-03-01 13:43:47.13663	2017-03-01 13:43:47.13663
7	2	Can	Can		t	f	f	2017-03-01 13:44:00.363974	2017-03-01 13:44:00.363974
8	2	Each	Ea		t	f	f	2017-03-01 13:44:07.783114	2017-03-01 13:44:07.783114
9	2	Bottle	Btl		t	f	f	2017-03-01 13:44:15.456972	2017-03-01 13:44:15.456972
10	2	Piece	Pc		t	f	f	2017-03-01 13:44:31.07926	2017-03-01 13:44:31.07926
11	2	Ounce (Weight)	Oz (Wt)		t	f	f	2017-03-01 13:44:52.171765	2017-03-01 13:44:52.171765
12	2	Ounce (Volume)	Oz (Vol)		t	f	f	2017-03-01 13:45:08.926594	2017-03-01 13:45:08.926594
13	2	#10 Can	#10 Can		t	f	f	2017-03-01 14:13:38.490025	2017-03-01 14:13:38.490025
14	2	Keg	Keg		t	f	f	2017-03-01 15:09:58.448263	2017-03-01 15:09:58.448263
\.


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('units_id_seq', 14, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: appsource
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, first_name, last_name, mobile, username, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, daily_sales_recipient, created_at, updated_at, flag) FROM stdin;
16	jwaynesandoval@gmail.com	$2a$10$UKkQaR6Fzsw/zs58rPWoauZwjOWMzDKLN1MP0CYnLAq3u1VDlTjKG	\N	\N	\N	1	2017-03-02 05:04:14.54739	2017-03-02 05:04:14.54739	180.190.90.226	180.190.90.226	\N	2017-03-02 04:48:44.612337	\N	\N	0	\N	\N	John Wayne	Sandoval	\N	jwaynesandoval	\N	\N	\N	\N	f	2017-03-02 04:48:44.784759	2017-03-02 05:04:14.549493	6
11	stabalong@appsource.biz	$2a$10$lmyFsttJSQlOOOXHPbFL6OaHO9KXVpIXprKVTEt1UAcwXgYV/dfDK	\N	\N	\N	1	2016-12-20 08:11:18.743248	2016-12-20 08:11:18.743248	203.87.251.221	203.87.251.221	\N	2016-12-20 08:11:10.617614	2016-12-20 08:10:22.04192	\N	0	\N	\N	Steff	Tabalong	\N	steffjoy	\N	\N	\N	\N	f	2016-12-20 08:10:22.038772	2016-12-20 08:13:31.142605	6
9	rb1test@yopmail.com	$2a$10$u4ICFBbhRT0AxPcMQOPZuOseyqz/IxNZmOpIsR.LJ0HClT/a6W.96	\N	\N	\N	3	2016-08-19 06:53:54.026235	2016-08-19 02:59:43.202058	180.191.138.203	180.191.138.203	\N	2016-08-19 02:25:06.467215	2016-08-19 02:24:47.764222	\N	0	\N	\N	Charlie	Bambi	\N	testing1	\N	\N	\N	\N	f	2016-08-19 02:24:47.757574	2016-08-19 06:53:54.028097	6
22	smmegamall@getbuffaloed.com	$2a$10$v/OyFbl841284PHqbJvvBes9.thDhpemi1u6ep7B6gTT75m69cAli	\N	\N	\N	0	\N	\N	\N	\N	\N	2017-07-10 06:00:14.20081	\N	\N	0	\N	\N	BWnT	Megamall	\N	megamall	\N	\N	\N	\N	f	2017-07-10 06:00:14.359464	2017-07-10 06:00:14.359464	6
3	appsource1@yopmail.com	$2a$10$QHzEs91lRRhlNXYMDHLakOPOXYisUBqqTQNLCiErM2aqrogYuFvHW	\N	\N	\N	0	\N	\N	\N	\N	b6563aa6b2216baeb0baab6f4afcbc19096a9fe06b3a14fd6b3fbec38ccbebcd	\N	2016-07-17 02:32:07.113734	\N	0	\N	\N	\N	\N	\N	appsource	\N	\N	\N	\N	f	2016-07-17 02:32:06.56288	2016-07-17 02:32:06.56288	1
4	testing@yopmail.com	$2a$10$TBrxP6PddTkXXZA1JDOQc.IXFDle8M2mos8JOsrw79ADyulT12DqC	\N	\N	\N	0	\N	\N	\N	\N	cffad9d9cfd31b06086261e6c6290860954384b025e574475b966dddbf7e9e89	\N	2016-07-17 02:43:25.123656	\N	0	\N	\N	\N	\N	\N	testing	\N	\N	\N	\N	f	2016-07-17 02:43:25.121603	2016-07-17 02:43:25.121603	1
19	jwsandoval2014@yahoo.com	$2a$10$w4JRJiqqgslXxV5/zEuP7OGz8xhwvnfhZe58/664itpPjfx0peyN2	\N	\N	\N	1	2017-03-02 05:22:44.592154	2017-03-02 05:22:44.592154	180.190.90.226	180.190.90.226	\N	2017-03-02 05:21:32.648253	2017-03-02 05:19:37.736382	\N	0	\N	\N	\N	\N	\N	jwsandoval	\N	\N	\N	\N	f	2017-03-02 05:19:37.151366	2017-03-02 05:22:44.599501	1
7	ryu@appsource.biz	$2a$10$.r1sBzh7rvccZxfX/rn4EOE7kSO7MfSt8mZE7dQoXuXNmREiG.mLi	\N	\N	\N	1	2016-08-11 07:38:04.41555	2016-08-11 07:38:04.41555	122.53.75.112	122.53.75.112	\N	2016-08-11 07:37:54.915538	2016-08-11 07:36:36.019284	\N	0	\N	\N	Raine	Yu	\N	ryuappsource	\N	\N	\N	\N	f	2016-08-11 07:36:36.017085	2016-08-11 07:40:48.563666	6
5	resto17_1@yopmail.com	$2a$10$zzc9t1mQCCDrx1K3Uh/BdOjEm7TGMOJJ4q3Ybcyqco6eLplsszD/q	\N	\N	\N	1	2016-07-17 02:45:27.265057	2016-07-17 02:45:27.265057	203.87.129.150	203.87.129.150	\N	2016-07-17 02:45:14.764206	2016-07-17 02:44:59.438911	\N	0	\N	\N	Resto	Bot	\N	resto17	\N	\N	\N	\N	f	2016-07-17 02:44:59.436704	2016-07-17 02:46:46.463058	6
23	chubbys.megamall@gmail.com	$2a$10$uX6EzjK12uftfFfr49LwzOLkvYDpD8mrtb4l753/oa642AQx4Ca0i	\N	\N	\N	0	\N	\N	\N	\N	\N	2017-07-10 06:01:27.278932	\N	\N	0	\N	\N	CRS	Megamall	\N	crsmega	\N	\N	\N	\N	f	2017-07-10 06:01:27.423844	2017-07-10 06:01:27.423844	6
25	chezca1228@yahoo.com	$2a$10$IX410KKF9wAHnZddC1rRzurT2iA4mTI6B0/ZMPJLEet4dCg7RZ3NK	\N	\N	\N	0	\N	\N	\N	\N	\N	2017-07-10 06:58:08.530616	\N	\N	0	\N	\N	Reynan	Albaredo	\N	chezca1228	\N	\N	\N	\N	f	2017-07-10 06:58:08.680849	2017-07-10 06:58:08.680849	6
10	adminrb1@yopmail.com	$2a$10$6SqjiMUbJJa29TnGoiB9cOIRGXHGR7168jj/xwTsYGYFvt01AJb7W	\N	\N	\N	2	2016-09-09 07:26:15.640883	2016-08-24 05:27:38.288927	180.190.90.242	122.53.75.112	\N	2016-08-24 05:27:32.954932	2016-08-24 05:27:11.620928	\N	0	\N	\N	Admin	Admin	\N	adminrb1	\N	\N	\N	\N	f	2016-08-24 05:27:11.614907	2016-09-09 07:26:15.646669	6
6	stefftabalong@gmail.com	$2a$10$q2HRBM.k5FA5ZvYIFJgcf.c/nFvoo8AvOhR6kGdPSxGXuWgWV0Eue	cfb3791553ef5f354f30f11f28a3ffae224df4ff4a56b7d9a2f297f506d76534	2016-10-12 09:48:55.339786	\N	2	2016-08-06 10:57:18.163936	2016-08-03 15:32:23.561779	111.235.90.204	111.235.90.204	\N	2016-08-03 15:31:55.602917	2016-08-03 15:30:47.445025	\N	0	\N	\N	Steff	Tabalong	\N	stefftabalong	\N	\N	\N	\N	f	2016-08-03 15:30:47.442136	2016-10-12 09:48:55.340685	6
8	apeiron.jmunts@gmail.com	$2a$10$5SGqYdAKtdcOgxkVh28S6u0dpnjgIQuUIQhSpG3MICR3mArvcqi22	\N	\N	\N	3	2017-03-28 08:09:39.833924	2016-08-22 08:49:37.750335	122.53.75.112	122.53.75.112	\N	2016-08-13 08:29:13.071474	2016-08-13 08:28:51.859418	\N	0	\N	\N	JM	Untalan	\N	jmunts	\N	\N	\N	\N	f	2016-08-13 08:28:51.857397	2017-03-28 08:09:39.837538	6
15	ralbaredo@talentium.com	$2a$10$agHk3DalMTUbzyfL.sLSIeXLlhoeQenuEmvroQkbLtXAIW8BnWS56	\N	\N	\N	0	\N	\N	\N	\N	\N	2017-03-02 04:45:19.593417	\N	\N	0	\N	\N	Thomas	Wayne	\N	ralbaredo2017	\N	\N	\N	\N	f	2017-03-02 04:45:19.765852	2017-03-02 04:45:19.765852	6
2	appsourcev1@yopmail.com	$2a$10$odg5ddudnLctDmtCQg4RiOW8bNVobltRbNEGRXFksrQx1njCoNxzi	\N	\N	\N	57	2017-09-04 02:10:40.84371	2017-08-29 07:19:03.851651	122.3.7.133	180.190.94.27	\N	2016-05-05 00:55:20.99246	2016-05-05 00:54:24.809062	\N	0	\N	\N	Reynan	Albaredo	\N	appsourcev1	\N	\N	\N	\N	f	2016-05-05 00:54:24.269601	2017-09-04 02:10:40.85006	6
17	vincep@getbuffaloed.com	$2a$10$lvYu23xK0tYyNlnaLOeG0.4.Inq1SbfkTsDfwGrufMjpd1bG3aWXC	\N	\N	\N	2	2017-03-06 03:41:34.811731	2017-03-02 05:35:45.083157	112.209.96.38	112.198.98.191	\N	2017-03-02 04:59:31.639616	\N	\N	0	\N	\N	Vincent Martin	Punto	\N	vincep	\N	\N	\N	\N	f	2017-03-02 04:59:31.793663	2017-03-06 03:41:34.818017	6
1	foodserv@yopmail.com	$2a$10$uDEGdppm.UvCSHBTEUmISenikTQQKIUUx87OJOAcK/jeV4/aRMClS	\N	\N	\N	8	2017-03-06 08:56:28.292771	2017-03-06 05:26:31.873081	122.53.75.112	122.53.75.112	\N	2016-04-18 01:33:44.501599	2016-04-18 01:33:16.024311	\N	0	\N	\N	Christina	Aguilera	\N	foodserv	\N	\N	\N	\N	f	2016-04-18 01:33:15.477079	2017-03-06 08:56:28.2952	6
24	purchasing@getbuffaloed.com	$2a$10$tpCnwtL0EFLLQGMDxGv8K.qcm6yxyr69TrmBQHNgvE5uW.8laDvtC	\N	\N	\N	4	2017-07-24 07:13:15.403426	2017-07-24 03:19:29.951524	122.3.7.133	122.3.7.133	\N	2017-07-10 06:09:25.161589	\N	\N	0	\N	\N	BWnT 	Purchasing	\N	bwntpurchasing	\N	\N	\N	\N	f	2017-07-10 06:09:25.32074	2017-07-24 07:13:15.409493	6
20	brixton@getbuffaloed.com	$2a$10$Pb/HSSQjgijl7SO2vEF3we1uQFupyb5m6k1OoJvFHvVuYjFqVxrse	\N	\N	\N	12	2017-07-21 07:29:22.55497	2017-04-20 08:35:29.482889	122.3.7.133	203.87.156.163	\N	2017-03-02 07:53:35.073705	\N	\N	0	\N	\N	BWnT	Brixton	\N	brixton	\N	\N	\N	\N	f	2017-03-02 07:53:35.243927	2017-07-21 07:29:22.561329	6
21	solarisone@getbuffaloed.com	$2a$10$Y/Lvn7oWRiIAETzJJQ4LHOG3pI4Aikh0ijc.0sufA7nLqzOJ3QJqu	\N	\N	\N	188	2017-09-20 10:35:28.415416	2017-09-20 07:59:47.290336	49.144.28.242	49.144.28.242	\N	2017-03-31 05:55:14.431484	\N	\N	0	\N	\N	BWnT	Solaris One	\N	solarisone	\N	\N	\N	\N	f	2017-03-31 05:55:14.610001	2017-09-20 10:35:28.417584	6
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appsource
--

SELECT pg_catalog.setval('users_id_seq', 25, true);


--
-- Name: bills_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- Name: branch_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY branch_subscriptions
    ADD CONSTRAINT branch_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: branches_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: client_user_accesses_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY client_user_accesses
    ADD CONSTRAINT client_user_accesses_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: conversions_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY conversions
    ADD CONSTRAINT conversions_pkey PRIMARY KEY (id);


--
-- Name: dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: employee_types_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY employee_types
    ADD CONSTRAINT employee_types_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY inventories
    ADD CONSTRAINT inventories_pkey PRIMARY KEY (id);


--
-- Name: inventory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY inventory_items
    ADD CONSTRAINT inventory_items_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: labor_hours_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY labor_hours_entries
    ADD CONSTRAINT labor_hours_entries_pkey PRIMARY KEY (id);


--
-- Name: labor_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY labor_hours
    ADD CONSTRAINT labor_hours_pkey PRIMARY KEY (id);


--
-- Name: manifolds_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY manifolds
    ADD CONSTRAINT manifolds_pkey PRIMARY KEY (id);


--
-- Name: order_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY order_lists
    ADD CONSTRAINT order_lists_pkey PRIMARY KEY (id);


--
-- Name: order_per_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY order_per_suppliers
    ADD CONSTRAINT order_per_suppliers_pkey PRIMARY KEY (id);


--
-- Name: payment_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY payment_notifications
    ADD CONSTRAINT payment_notifications_pkey PRIMARY KEY (id);


--
-- Name: per_brand_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY per_brand_orders
    ADD CONSTRAINT per_brand_orders_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: purchase_items_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY purchase_items
    ADD CONSTRAINT purchase_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY purchase_order_items
    ADD CONSTRAINT purchase_order_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sale_by_category_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY sale_by_category_entries
    ADD CONSTRAINT sale_by_category_entries_pkey PRIMARY KEY (id);


--
-- Name: sale_by_settlement_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY sale_by_settlement_entries
    ADD CONSTRAINT sale_by_settlement_entries_pkey PRIMARY KEY (id);


--
-- Name: sales_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: settlements_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY settlements
    ADD CONSTRAINT settlements_pkey PRIMARY KEY (id);


--
-- Name: shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: supplier_item_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY supplier_item_prices
    ADD CONSTRAINT supplier_item_prices_pkey PRIMARY KEY (id);


--
-- Name: suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: units_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: appsource; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_bills_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_bills_on_client_id ON bills USING btree (client_id);


--
-- Name: index_bills_on_subscription_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_bills_on_subscription_id ON bills USING btree (subscription_id);


--
-- Name: index_branch_subscriptions_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_branch_subscriptions_on_branch_id ON branch_subscriptions USING btree (branch_id);


--
-- Name: index_branch_subscriptions_on_subscription_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_branch_subscriptions_on_subscription_id ON branch_subscriptions USING btree (subscription_id);


--
-- Name: index_branches_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_branches_on_brand_id ON branches USING btree (brand_id);


--
-- Name: index_brands_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_brands_on_client_id ON brands USING btree (client_id);


--
-- Name: index_categories_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_categories_on_brand_id ON categories USING btree (brand_id);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_categories_on_parent_id ON categories USING btree (parent_id);


--
-- Name: index_client_user_accesses_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_client_user_accesses_on_branch_id ON client_user_accesses USING btree (branch_id);


--
-- Name: index_client_user_accesses_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_client_user_accesses_on_brand_id ON client_user_accesses USING btree (brand_id);


--
-- Name: index_client_user_accesses_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_client_user_accesses_on_client_id ON client_user_accesses USING btree (client_id);


--
-- Name: index_client_user_accesses_on_role_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_client_user_accesses_on_role_id ON client_user_accesses USING btree (role_id);


--
-- Name: index_client_user_accesses_on_user_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_client_user_accesses_on_user_id ON client_user_accesses USING btree (user_id);


--
-- Name: index_conversions_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_conversions_on_brand_id ON conversions USING btree (brand_id);


--
-- Name: index_dashboards_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_dashboards_on_branch_id ON dashboards USING btree (branch_id);


--
-- Name: index_dashboards_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_dashboards_on_brand_id ON dashboards USING btree (brand_id);


--
-- Name: index_dashboards_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_dashboards_on_client_id ON dashboards USING btree (client_id);


--
-- Name: index_employees_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_employees_on_branch_id ON employees USING btree (branch_id);


--
-- Name: index_employees_on_employee_type_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_employees_on_employee_type_id ON employees USING btree (employee_type_id);


--
-- Name: index_inventories_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_inventories_on_branch_id ON inventories USING btree (branch_id);


--
-- Name: index_inventories_on_user_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_inventories_on_user_id ON inventories USING btree (user_id);


--
-- Name: index_inventory_items_on_inventory_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_inventory_items_on_inventory_id ON inventory_items USING btree (inventory_id);


--
-- Name: index_inventory_items_on_item_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_inventory_items_on_item_id ON inventory_items USING btree (item_id);


--
-- Name: index_items_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_items_on_brand_id ON items USING btree (brand_id);


--
-- Name: index_items_on_category_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_items_on_category_id ON items USING btree (category_id);


--
-- Name: index_items_on_unit_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_items_on_unit_id ON items USING btree (unit_id);


--
-- Name: index_labor_hours_on_employee_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_labor_hours_on_employee_id ON labor_hours USING btree (employee_id);


--
-- Name: index_manifolds_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_manifolds_on_client_id ON manifolds USING btree (client_id);


--
-- Name: index_payment_notifications_on_subscription_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_payment_notifications_on_subscription_id ON payment_notifications USING btree (subscription_id);


--
-- Name: index_permissions_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_permissions_on_client_id ON permissions USING btree (client_id);


--
-- Name: index_permissions_on_role_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_permissions_on_role_id ON permissions USING btree (role_id);


--
-- Name: index_permissions_on_section_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_permissions_on_section_id ON permissions USING btree (section_id);


--
-- Name: index_purchase_items_on_item_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchase_items_on_item_id ON purchase_items USING btree (item_id);


--
-- Name: index_purchase_items_on_purchase_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchase_items_on_purchase_id ON purchase_items USING btree (purchase_id);


--
-- Name: index_purchase_items_on_unit_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchase_items_on_unit_id ON purchase_items USING btree (unit_id);


--
-- Name: index_purchases_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchases_on_branch_id ON purchases USING btree (branch_id);


--
-- Name: index_purchases_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchases_on_brand_id ON purchases USING btree (brand_id);


--
-- Name: index_purchases_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchases_on_client_id ON purchases USING btree (client_id);


--
-- Name: index_purchases_on_supplier_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_purchases_on_supplier_id ON purchases USING btree (supplier_id);


--
-- Name: index_roles_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_roles_on_client_id ON roles USING btree (client_id);


--
-- Name: index_sale_by_category_entries_on_category_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_sale_by_category_entries_on_category_id ON sale_by_category_entries USING btree (category_id);


--
-- Name: index_sale_by_category_entries_on_sale_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_sale_by_category_entries_on_sale_id ON sale_by_category_entries USING btree (sale_id);


--
-- Name: index_sale_by_settlement_entries_on_sale_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_sale_by_settlement_entries_on_sale_id ON sale_by_settlement_entries USING btree (sale_id);


--
-- Name: index_sale_by_settlement_entries_on_settlement_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_sale_by_settlement_entries_on_settlement_id ON sale_by_settlement_entries USING btree (settlement_id);


--
-- Name: index_sales_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_sales_on_branch_id ON sales USING btree (branch_id);


--
-- Name: index_settings_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_settings_on_client_id ON settings USING btree (client_id);


--
-- Name: index_settlements_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_settlements_on_client_id ON settlements USING btree (client_id);


--
-- Name: index_shifts_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_shifts_on_brand_id ON shifts USING btree (brand_id);


--
-- Name: index_subscriptions_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_subscriptions_on_client_id ON subscriptions USING btree (client_id);


--
-- Name: index_subscriptions_on_plan_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_subscriptions_on_plan_id ON subscriptions USING btree (plan_id);


--
-- Name: index_suppliers_on_branch_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_suppliers_on_branch_id ON suppliers USING btree (branch_id);


--
-- Name: index_suppliers_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_suppliers_on_brand_id ON suppliers USING btree (brand_id);


--
-- Name: index_suppliers_on_client_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_suppliers_on_client_id ON suppliers USING btree (client_id);


--
-- Name: index_units_on_brand_id; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE INDEX index_units_on_brand_id ON units USING btree (brand_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: appsource; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_013433372c; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT fk_rails_013433372c FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_0471848c97; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sale_by_settlement_entries
    ADD CONSTRAINT fk_rails_0471848c97 FOREIGN KEY (settlement_id) REFERENCES settlements(id);


--
-- Name: fk_rails_04bb72eeee; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY client_user_accesses
    ADD CONSTRAINT fk_rails_04bb72eeee FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_0a0c2d3429; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_rails_0a0c2d3429 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_0cc1e2c592; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY payment_notifications
    ADD CONSTRAINT fk_rails_0cc1e2c592 FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: fk_rails_0eef55ed34; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY labor_hours
    ADD CONSTRAINT fk_rails_0eef55ed34 FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: fk_rails_125ca55cab; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchase_items
    ADD CONSTRAINT fk_rails_125ca55cab FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: fk_rails_19fca7085f; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_19fca7085f FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_1b777ea115; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY client_user_accesses
    ADD CONSTRAINT fk_rails_1b777ea115 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_29393f5802; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY branch_subscriptions
    ADD CONSTRAINT fk_rails_29393f5802 FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_2c0486887d; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_rails_2c0486887d FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_329bba7a75; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT fk_rails_329bba7a75 FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_36708b3aa6; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_36708b3aa6 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_38eb763c1f; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT fk_rails_38eb763c1f FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_3cefa997dd; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY inventories
    ADD CONSTRAINT fk_rails_3cefa997dd FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_401d4f68e0; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT fk_rails_401d4f68e0 FOREIGN KEY (section_id) REFERENCES sections(id);


--
-- Name: fk_rails_4a7bf0e43f; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY settlements
    ADD CONSTRAINT fk_rails_4a7bf0e43f FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_533d9592fc; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT fk_rails_533d9592fc FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_58d9301466; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_58d9301466 FOREIGN KEY (unit_id) REFERENCES units(id);


--
-- Name: fk_rails_62c1aa0bbe; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchase_items
    ADD CONSTRAINT fk_rails_62c1aa0bbe FOREIGN KEY (purchase_id) REFERENCES purchases(id);


--
-- Name: fk_rails_63d3df128b; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_63d3df128b FOREIGN KEY (plan_id) REFERENCES plans(id);


--
-- Name: fk_rails_6642cbdd87; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY inventories
    ADD CONSTRAINT fk_rails_6642cbdd87 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_6742f066e1; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT fk_rails_6742f066e1 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_6d2f51cec4; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT fk_rails_6d2f51cec4 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_80231bd601; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY branch_subscriptions
    ADD CONSTRAINT fk_rails_80231bd601 FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: fk_rails_8242ecf92f; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY conversions
    ADD CONSTRAINT fk_rails_8242ecf92f FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_82feddc7ff; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT fk_rails_82feddc7ff FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_8604ac23f2; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fk_rails_8604ac23f2 FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_89fb86dc8b; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_89fb86dc8b FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_8e0e824bbc; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT fk_rails_8e0e824bbc FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: fk_rails_93c739e1a2; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT fk_rails_93c739e1a2 FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk_rails_9c204e661f; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY manifolds
    ADD CONSTRAINT fk_rails_9c204e661f FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_9e3fcbb375; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchase_items
    ADD CONSTRAINT fk_rails_9e3fcbb375 FOREIGN KEY (unit_id) REFERENCES units(id);


--
-- Name: fk_rails_9ecfc1de90; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sale_by_category_entries
    ADD CONSTRAINT fk_rails_9ecfc1de90 FOREIGN KEY (sale_id) REFERENCES sales(id);


--
-- Name: fk_rails_a7dc109dcc; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY inventory_items
    ADD CONSTRAINT fk_rails_a7dc109dcc FOREIGN KEY (inventory_id) REFERENCES inventories(id);


--
-- Name: fk_rails_aeafa21032; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY client_user_accesses
    ADD CONSTRAINT fk_rails_aeafa21032 FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_b3236d6d4b; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT fk_rails_b3236d6d4b FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_b6f9f42741; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sale_by_category_entries
    ADD CONSTRAINT fk_rails_b6f9f42741 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_ba7f213e23; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY inventory_items
    ADD CONSTRAINT fk_rails_ba7f213e23 FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: fk_rails_bd48a7487e; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY client_user_accesses
    ADD CONSTRAINT fk_rails_bd48a7487e FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_c23cfd2cab; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT fk_rails_c23cfd2cab FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_c2b63fe38b; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT fk_rails_c2b63fe38b FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_c399da09e1; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT fk_rails_c399da09e1 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_c3ceaae2da; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fk_rails_c3ceaae2da FOREIGN KEY (employee_type_id) REFERENCES employee_types(id);


--
-- Name: fk_rails_c86b4dba59; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT fk_rails_c86b4dba59 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_d242d35c13; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk_rails_d242d35c13 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_db61e61072; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT fk_rails_db61e61072 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_e2379d3017; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sales
    ADD CONSTRAINT fk_rails_e2379d3017 FOREIGN KEY (branch_id) REFERENCES branches(id);


--
-- Name: fk_rails_e254b284ff; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY sale_by_settlement_entries
    ADD CONSTRAINT fk_rails_e254b284ff FOREIGN KEY (sale_id) REFERENCES sales(id);


--
-- Name: fk_rails_e3c8ba49fc; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY client_user_accesses
    ADD CONSTRAINT fk_rails_e3c8ba49fc FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk_rails_e4831ab830; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT fk_rails_e4831ab830 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_e948f51ef8; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY shifts
    ADD CONSTRAINT fk_rails_e948f51ef8 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_fd0b101ea2; Type: FK CONSTRAINT; Schema: public; Owner: appsource
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT fk_rails_fd0b101ea2 FOREIGN KEY (supplier_id) REFERENCES suppliers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: appsource
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM appsource;
GRANT ALL ON SCHEMA public TO appsource;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

