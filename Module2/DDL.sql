-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';
-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders ( row_id int4 NOT NULL, order_id varchar(14) NOT NULL, order_date date NOT NULL, ship_date date NOT NULL, ship_mode varchar(14) NOT NULL, customer_id varchar(8) NOT NULL, customer_name varchar(22) NOT NULL, segment varchar(11) NOT NULL, country varchar(13) NOT NULL, city varchar(17) NOT NULL, state varchar(20) NOT NULL, postal_code int4 NULL, region varchar(7) NOT NULL, product_id varchar(15) NOT NULL, category varchar(15) NOT NULL, subcategory varchar(11) NOT NULL, product_name varchar(127) NOT NULL, sales numeric(9, 4) NOT NULL, quantity int4 NOT NULL, discount numeric(4, 2) NOT NULL, profit numeric(21, 16) NOT NULL, CONSTRAINT orders_pkey PRIMARY KEY (row_id));

-- Permissions

ALTER TABLE public.orders OWNER TO "admin";
GRANT ALL ON TABLE public.orders TO "admin";


-- public.people definition

-- Drop table

-- DROP TABLE public.people;

CREATE TABLE public.people ( person varchar(17) NOT NULL, region varchar(7) NOT NULL, CONSTRAINT people_pkey PRIMARY KEY (person));

-- Permissions

ALTER TABLE public.people OWNER TO "admin";
GRANT ALL ON TABLE public.people TO "admin";


-- public."returns" definition

-- Drop table

-- DROP TABLE public."returns";

CREATE TABLE public."returns" ( person varchar(17) NOT NULL, region varchar(20) NOT NULL);

-- Permissions

ALTER TABLE public."returns" OWNER TO "admin";
GRANT ALL ON TABLE public."returns" TO "admin";


-- public.category source

CREATE OR REPLACE VIEW public.category
AS SELECT category,
    sum(sales) AS total_sales,
    sum(profit) AS total_profit,
    sum(quantity) AS total_quantity
   FROM orders
  GROUP BY category;

-- Permissions

ALTER TABLE public.category OWNER TO "admin";
GRANT ALL ON TABLE public.category TO "admin";




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;
GRANT ALL ON SCHEMA public TO "admin";