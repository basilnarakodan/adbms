use emp;
create table product(product_id int primary key,product_name varchar(20),price int,quantity_in_stock int);
create table sale(sale_id int primary key,delivery_address varchar(20));
create table saleItem(sale_id int,product_id int,quantity int,primary key(sale_id,product_id),foreign key (sale_id) references sale(sale_id),foreign key (product_id) references product(product_id));
insert into saleItem values
(1,2,500),(2,1,100);