\c part_table
create table client (id_client int, first_name text, last_name text, adreess text, country text, email text, cellphone text, telephone text, job_title text, gender text, college text) PARTITION BY LIST (gender);

create table client_partition_male PARTITION OF client for values in ('Male', 'male');
create table client_partition_female PARTITION OF client for values in ('Female', 'female');

alter table client_partition_male add constraint client_partition_male_check check (gender = 'Male' or gender = 'male');
alter table client_partition_female add constraint client_partition_female_check check (gender = 'Female' or gender = 'female');

\i /var/lib/postgresql/client.sql

select count (*)from client;
select count (*)from client_partition_male;
select count (*)from client_partition_female;
