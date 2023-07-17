create database part_table;
\c part_table

create table product (id int, product_name text, price float) PARTITION BY RANGE (price);

create table partition_product_1 PARTITION OF product for values from (1.00) to (3000.99);
create table partition_product_2 PARTITION OF product for values from (3001.00) to (6000.99);
create table partition_product_3 PARTITION OF product for values from (6001.00) to (10000.00);

alter table partition_product_1 add constraint particion_1_check check (price >= 1.00 and price <= 3000.99);
alter table partition_product_2 add constraint particion_2_check check (price >= 3001.00 and price <= 6000.99);
alter table partition_product_3 add constraint particion_3_check check (price >= 6001.00 and price <= 10000.00);

\i /var/lib/postgresql/product.sql

select count (*)from product;
select count (*)from partition_product_1;
select count (*)from partition_product_2;
select count (*)from partition_product_3;

create table client (id_client int, first_name text, last_name text, adreess text, country text, email text, cellphone text, telephone text, job_title text, gender text, college text) PARTITION BY LIST (gender);

create table client_partition_male PARTITION OF client for values in ('Male', 'male');
create table client_partition_female PARTITION OF client for values in ('Female', 'female');

alter table client_partition_male add constraint client_partition_male_check check (gender = 'Male' or gender = 'male');
alter table client_partition_female add constraint client_partition_female_check check (gender = 'Female' or gender = 'female');

\i /var/lib/postgresql/client.sql

select count (*)from client;
select count (*)from client_partition_male;
select count (*)from client_partition_female;
