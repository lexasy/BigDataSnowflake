create public.mock_data (
				 id bigint generated always as identity primary key,
                 customer_first_name varchar(50) NULL,
                 customer_last_name varchar(50) NULL,
                 customer_age integer NULL,
                 customer_email varchar(50) NULL,
                 customer_country varchar(50) NULL,
                 customer_postal_code varchar(50) NULL,
                 customer_pet_type varchar(50) NULL,
                 customer_pet_name varchar(50) NULL,
                 customer_pet_breed varchar(50) NULL,
                 seller_first_name varchar(50) NULL,
                 seller_last_name varchar(50) NULL,
                 seller_email varchar(50) NULL,
                 seller_country varchar(50) NULL,
                 seller_postal_code varchar(50) NULL,
                 product_name varchar(50) NULL,
                 product_category varchar(50) NULL,
                 product_price real NULL,
                 product_quantity integer NULL,
                 sale_date varchar(50) NULL,
                 sale_customer_id bigint generated always as identity,
                 sale_seller_id bigint generated always as identity,
                 sale_product_id bigint generated always as identity,
                 sale_quantity integer NULL,
                 sale_total_price real NULL,
                 store_name varchar(50) NULL,
                 store_location varchar(50) NULL,
                 store_city varchar(50) NULL,
                 store_state varchar(50) NULL,
                 store_country varchar(50) NULL,
                 store_phone varchar(50) NULL,
                 store_email varchar(50) NULL,
                 pet_category varchar(50) NULL,
                 product_weight real NULL,
                 product_color varchar(50) NULL,
                 product_size varchar(50) NULL,
                 product_brand varchar(50) NULL,
                 product_material varchar(50) NULL,
                 product_description varchar(1024) NULL,
                 product_rating real NULL,
                 product_reviews integer NULL,
                 product_release_date varchar(50) NULL,
                 product_expiry_date varchar(50) NULL,
                 supplier_name varchar(50) NULL,
                 supplier_contact varchar(50) NULL,
                 supplier_email varchar(50) NULL,
                 supplier_phone varchar(50) NULL,
                 supplier_address varchar(50) NULL,
                 supplier_city varchar(50) NULL,
                 supplier_country varchar(50) null
);

create table public.customer_dimension (
	customer_id bigint generated always as identity primary key,
	first_name varchar(50),
	last_name varchar(50),
	age integer,
	email varchar(50),
	country varchar(50),
	postal_code varchar(50),
	pet_type varchar(50),
	pet_name varchar(50),
	pet_breed varchar(50)
);

create table public.seller_dimension (
	seller_id bigint generated always as identity primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	country varchar(50),
	postal_code varchar(50)
);

create table public.product_dimension (
    product_id bigint generated always as identity primary key,
    name varchar(50),
    category varchar(50),
    price real,
    quantity integer,
    weight real,
    color varchar(50),
    size varchar(50),
    brand varchar(50),
    material varchar(50),
    description varchar(1024),
    rating real,
    reviews integer,
    release_date varchar(50),
    expiry_date varchar(50),
    pet_category varchar(50)
);

create table public.store_dimension (
    store_id bigint generated always as identity primary key,
    name varchar(50),
    location varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    phone varchar(50),
    email varchar(50)
);

create table public.supplier_dimension (
    supplier_id bigint generated always as identity primary key,
    name varchar(50),
    contact varchar(50),
    email varchar(50),
    phone varchar(50),
    address varchar(50),
    city varchar(50),
    country varchar(50)
);

create table public.sales_fact (
    sale_id bigint generated always as identity primary key,
    customer_id bigint references public.customer_dimension(customer_id),
    seller_id bigint references public.seller_dimension(seller_id),
    product_id bigint references public.product_dimension(product_id),
    store_id bigint references public.store_dimension(store_id),
    supplier_id bigint references public.supplier_dimension(supplier_id),
    quantity integer,
    total_price real,
    sale_date varchar(50)
);