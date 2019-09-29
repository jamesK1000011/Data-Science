DROP SCHEMA IF EXISTS transaction;
CREATE SCHEMA transaction;

USE transaction;

SET AUTOCOMMIT = 0;

CREATE TABLE customer(
customer_id varchar(10),
customer_name varchar(20),
customer_age int(10),
customer_city varchar(20),
CONSTRAINT pk_customer PRIMARY KEY(customer_id));

CREATE TABLE item(
item_id int(10),
item_name varchar(20),
unit_price float(10),
CONSTRAINT pk_item PRIMARY KEY(item_id));

CREATE TABLE orders(
orders_id int(10),
customer_id varchar(10),
item_id int(10),
quantity int(10),
price float(10),
CONSTRAINT pk_orders PRIMARY KEY(orders_id),
CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
CONSTRAINT fk_item FOREIGN KEY(item_id) REFERENCES item(item_id));


INSERT INTO item(item_id, item_name, unit_price) VALUES(001, "pen", 1.43);
INSERT INTO item(item_id, item_name, unit_price) VALUES(002, "notebook", 2.45);
INSERT INTO item(item_id, item_name, unit_price) VALUES(003, "waterbottle", 8.99);
INSERT INTO item(item_id, item_name, unit_price) VALUES(004, "coffee mug", 3.67);
INSERT INTO item(item_id, item_name, unit_price) VALUES(005, "spoon", 0.43);

INSERT INTO customer(customer_id, customer_name, customer_age, customer_city) VALUES("DC101", "Jack", 36, "Washington DC"); 
INSERT INTO customer(customer_id, customer_name, customer_age, customer_city) VALUES("MD109", "Monica", 28, "Baltimore"); 
INSERT INTO customer(customer_id, customer_name, customer_age, customer_city) VALUES("LA675", "Sara", 19, "Falls Church"); 
INSERT INTO customer(customer_id, customer_name, customer_age, customer_city) VALUES("UT898", "Jim", 61, "New Jersey"); 
INSERT INTO customer(customer_id, customer_name, customer_age, customer_city) VALUES("PX132", "Jess", 23, "Philadelphia"); 

INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(1100, "DC101", 001, 2, 2.86);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(1110, "DC101", 002, 1, 2.45);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(2330, "MD109", 005, 5, 3.56);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(9877, "LA675", 004, 2, 7.44);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(1232, "UT898", 003, 4, 20.92);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(1190, "DC101", 003, 10, 89.90);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(2312, "PX132", 001, 2, 2.86);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(3456, "PX132", 002, 8, 19.46);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(4546, "PX132", 003, 3, 26.99);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(1234, "PX132", 004, 1, 3.67);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(6767, "PX132", 005, 2, 0.86);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(9878, "PX132", 001, 10, 14.30);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(3343, "MD109", 001, 3, 4.34);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(1123, "MD109", 001, 4, 5.67);
INSERT INTO orders(orders_id, customer_id, item_id, quantity, price) VALUES(6544, "DC101", 001, 6, 15.56);


SET AUTOCOMMIT = 1;

