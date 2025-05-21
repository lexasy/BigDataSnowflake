-- Analytics
select id, sale_customer_id, customer_email from public.mock_data
where sale_customer_id = 1;

select id, sale_seller_id, seller_email from public.mock_data
where sale_seller_id = 1;

select id, sale_product_id, product_name, product_brand from public.mock_data
where sale_product_id = 1;

select id, sale_product_id, product_name, product_brand from public.mock_data
where product_brand = 'Skajo';

-- Data transfer
insert into public.customer_dimension (first_name, last_name, age, email, country, postal_code, pet_type, pet_name, pet_breed)
select distinct customer_first_name, customer_last_name, customer_age, customer_email, customer_country, customer_postal_code, customer_pet_type, customer_pet_name, customer_pet_breed
from public.mock_data;

insert into public.seller_dimension (first_name, last_name, email, country, postal_code)
select distinct seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code
from public.mock_data;

insert into public.product_dimension (name, category, price, quantity, weight, color, size, brand, material, description, rating, reviews, release_date, expiry_date, pet_category)
select distinct product_name, product_category, product_price, product_quantity, product_weight, product_color, product_size, product_brand, product_material, product_description, product_rating, product_reviews, product_release_date, product_expiry_date, pet_category
from public.mock_data;

insert into public.store_dimension (name, location, city, state, country, phone, email)
select distinct store_name, store_location, store_city, store_state, store_country, store_phone, store_email
from public.mock_data;

insert into public.supplier_dimension (name, contact, email, phone, address, city, country)
select distinct supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
from public.mock_data;

insert into public.sales_fact (customer_id, seller_id, product_id, store_id, supplier_id, quantity, total_price, sale_date)
select 
    (select customer_id from public.customer_dimension where first_name = customer_first_name and last_name = customer_last_name limit 1) as customer_id,
    (select seller_id from public.seller_dimension where first_name = seller_first_name and last_name = seller_last_name limit 1) as seller_id,
    (select product_id from public.product_dimension where name = product_name limit 1) as product_id,
    (select store_id from public.store_dimension where name = store_name limit 1) as store_id,
    (select supplier_id from public.supplier_dimension where name = supplier_name limit 1) as supplier_id,
    sale_quantity as quantity,
    sale_total_price as total_price,
    sale_date
from public.mock_data;

select * from public.customer_dimension
where first_name = 'Chaunce';