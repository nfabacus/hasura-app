
create table address (id uuid, street text, zip text, city text, country text, author_id int);


alter table "public"."address"
    add constraint "address_pkey"
    primary key ("id");
