CREATE DATABASE autosale_car_sales;

USE autosale_car_sales;

CREATE TABLE car
(
	car_id INTEGER NOT NULL PRIMARY KEY,
	model_id INTEGER NOT NULL,
	body_type_id INTEGER NOT NULL,
	year INTEGER NOT NULL,
	fuel_type VARCHAR(40),
	engine_size DECIMAL(3,1),
	fuel_consumption INTEGER,
	emission INTEGER,
	mileage INTEGER,
	registration_number VARCHAR(20),
	colour VARCHAR(40)
);

CREATE TABLE car_model
(
	model_id INTEGER NOT NULL PRIMARY KEY,
	model_name VARCHAR(100) NOT NULL,
	make_id INTEGER NOT NULL
);

CREATE TABLE car_make
(
	make_id INTEGER NOT NULL PRIMARY KEY,
	make_name VARCHAR (100) NOT NULL
);

CREATE TABLE body_type
(
	body_type_id INTEGER NOT NULL PRIMARY KEY,
	doors INTEGER
);

CREATE TABLE customer
(
	customer_id INTEGER NOT NULL PRIMARY KEY,
	first_name VARCHAR(256),
	surname VARCHAR(256),
	postcode VARCHAR(50) NOT NULL,
	contact_number VARCHAR(30)
);

CREATE TABLE seller
(
	seller_id INTEGER NOT NULL PRIMARY KEY,
	first_name VARCHAR(256),
	surname VARCHAR(256),
	postcode VARCHAR(50) NOT NULL,
	contact_number VARCHAR(30)
);

CREATE TABLE payment
(
	payment_id INTEGER NOT NULL PRIMARY KEY,
	sale_price INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	seller_id INTEGER NOT NULL
);

CREATE TABLE transactions
(
	transaction_id INTEGER NOT NULL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	payment_id INTEGER NOT NULL,
	transaction_date DATE
);

CREATE TABLE town
(
	town_id INTEGER NOT NULL PRIMARY KEY,
	town_name VARCHAR(256)
);

CREATE TABLE address
(
	postcode VARCHAR(50) NOT NULL PRIMARY KEY,
	town_id INTEGER NOT NULL,
	street_name VARCHAR(256),
	door_number INTEGER
);

ALTER TABLE car_model
ADD CONSTRAINT fk_car_model_car_make
FOREIGN KEY (make_id)
REFERENCES car_make (make_ID);

ALTER TABLE car
ADD CONSTRAINT fk_car_car_model
FOREIGN KEY (model_id)
REFERENCES car_model (model_id);

ALTER TABLE car
ADD CONSTRAINT fk_car_body_type
FOREIGN KEY (body_type_id)
REFERENCES body_type (body_type_id);

ALTER TABLE customer
ADD CONSTRAINT fk_customer_address
FOREIGN KEY (postcode)
REFERENCES address (postcode);

ALTER TABLE seller
ADD CONSTRAINT fk_seller_address
FOREIGN KEY (postcode)
REFERENCES address (postcode);

ALTER TABLE address
ADD CONSTRAINT fk_address_town
FOREIGN KEY (town_id)
REFERENCES town (town_id);

ALTER TABLE payment
ADD CONSTRAINT fk_payment_customer_id
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id);

ALTER TABLE payment
ADD CONSTRAINT fk_payment_seller_id
FOREIGN KEY (seller_id)
REFERENCES seller (seller_id);

ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_car
FOREIGN KEY (car_id)
REFERENCES car (car_id);

ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_payment
FOREIGN KEY (payment_id)
REFERENCES payment (payment_id);

INSERT INTO body_type
(body_type_id, doors)
VALUES
	(10, 3),
	(11, 4),
	(12, 5);
    
INSERT INTO town
(town_id, town_name)
VALUES
(900, "Corley_Ash"),
(901, "Taverham"),
(902, "Yarkhill"),
(903, "Chrisswell"),
(904, "North_Hill"),
(905, "Hillockhead"),
(906, "Great_Hucklow"),
(907, "Thwait"),
(908, "Murton"),
(909, "Sherborne"),
(910, "Treherbert"),
(911, "Galashiels"),
(912, "Auchenmalg"),
(913, "Ashtead"),
(914, "Bognor_Regis"),
(915, "Kenmore"),
(916, "Baycliff"),
(917, "Croxton");

INSERT INTO address
(postcode, town_id, street_name, door_number)
VALUES
("CV7_9PT", 900, "Mill_Lane", 39),
("NR8_0PB", 901, "Essex_Road", 75),
("HR1_5XQ", 902, "Ermin_Street", 52),
("PA16_4TY", 903, "Lincoln_Green_Lane", 56),
("PL15_7EA", 904, "Southern_Way", 91),
("AB33_1YN", 905, "Consett_Road", 72),
("SK17_4QG", 906, "Manor_Way", 44),
("DL11_1XT", 907, "Brackley_Road", 20),
("TD15_2DS", 908, "Ilchester_Road", 59),
("GL54_7UE", 909, "Russell_Road", 68),
("CF42_7AW", 910, "Glandovey_Terrace", 2),
("TD1_0SA", 911, "Sandyhill_Road", 52),
("DG8_9YB", 912, "Main_Road", 13),
("KT21_3FJ", 913, "High_Street", 76),
("PO21_8LU", 914, "Thames_Street", 12),
("IV54_3QF", 915, "Prince_Consort_Road", 82),
("LA12_9EZ", 916, "Annfield_Road", 15),
("DN39_3RS", 917, "Sloe_Lane", 47);

INSERT INTO car_make
(make_id, make_name)
VALUES
(301, "Volkswagen"),
(302, "Nissan"),
(303, "Vauxhall"),
(304, "Mercedes-benz"),
(305, "Kia"),
(306, "Ford");

INSERT INTO car_model
(model_id, model_name, make_id)
VALUES
(400, "Fiesta", 306),
(401, "Focus", 306),
(402, "Golf", 301),
(403, "Qashqai", 302),
(404, "Corsa", 303),
(405, "A-class", 304),
(406, "Polo", 301),
(407, "Kuga", 306),
(408, "Sportage", 305),
(409, "Insignia", 301);

INSERT INTO car
(car_id, model_id, body_type_id, year, fuel_type, engine_size, fuel_consumption, emission, mileage, registration_number, colour)
VALUES
(101, 400, 12, 2011, "Petrol", 1.6, 60, 80, 25000, "FS15_5BK", "grey"),
(102, 401, 12, 2009, "Diesel", 1.5, 75, 110, 50000, "HT76_5YR", "blue"),
(103, 402, 10, 2015, "Petrol", 1.8, 60, 130, 50000, "KU99_1GH", "blue"),
(104, 403, 12, 2011, "Diesel", 2, 50, 130, 35000, "SG53_7HR", "red"),
(105, 404, 11, 2014, "Petrol", 2, 45, 120, 20000, "TJ42_2TK", "yellow"),
(106, 405, 11, 2011, "Petrol", 2.4, 55, 100, 70000, "NW69_2JJ", "grey"),
(107, 406, 12, 2017, "Diesel", 2, 70, 100, 40000, "AP57_0KI", "white"),
(108, 407, 12, 2010, "Diesel", 2.1, 45, 160, 55000, "FP33_8UR", "black"),
(109, 408, 10, 2015, "Diesel", 2.5, 35, 170, 30000, "BN74_2ID", "red"),
(110, 409, 12, 2014, "Diesel", 1.8, 50, 110, 35000, "MC95_7TU", "white");

INSERT INTO customer
(customer_id, first_name, surname, postcode, contact_number)
VALUES
(10001, "Joe", "Biden", "CV7_9PT", "07396820594"),
(10002, "Bernie", "Sanders", "NR8_0PB", "07753462743"),
(10003, "Elizabeth", "Warren", "HR1_5XQ", "07914236549"),
(10004, "Beto", "O'Rourke", "PA16_4TY", "07010048579"),
(10005, "Kamala", "Harris", "PL15_7EA", "07765377291"),
(10006, "Amy", "Klobuchar", "AB33_1YN", "07940476658"),
(10007, "Tulsi", "Gabbard", "SK17_4QG", "07785957669"),
(10008, "Pete", "Buttigieg", "DL11_1XT", "07072445569"),
(10009, "Andrew", "Yang", "TD15_2DS", "07048203082"),
(10010, "Julian", "Castro", "GL54_7UE", "07829777760");

INSERT INTO seller
(seller_id, first_name, surname, postcode, contact_number)
VALUES
(20001, "Rick", "Sanchez", "CF42_7AW", "07707551101"),
(20002, "Manila", "Chan", "TD1_0SA", "07935525204"),
(20003, "Michele", "Greenstein", "DG8_9YB", "07864285724"),
(20004, "Michael", "Malouf", "KT21_3FJ", "07059629487"),
(20005, "Rachel", "Blevins", "PO21_8LU", "07946296570"),
(20006, "Ben", "Swann", "IV54_3QF", "07741450283"),
(20007, "Scottie", "Nell_Hughes", "LA12_9EZ", "07825174777"),
(20008, "Sara", "Montes_De_Oca", "DN39_3RS", "07873909821"),
(20009, "Bernie", "Sanders", "NR8_0PB", "07753462743"),
(20010, "Amy", "Klobuchar", "AB33_1YN", "07940476658");

INSERT INTO payment
(payment_id, sale_price, customer_id, seller_id)
VALUES
(700, 12000, 10001, 20001),
(701, 9000, 10002, 20002),
(702, 10000, 10003, 20003),
(703, 12000, 10004, 20004),
(704, 14000, 10005, 20005),
(705, 8000, 10006, 20006),
(706, 11000, 10007, 20007),
(707, 7000, 10008, 20008),
(708, 13000, 10009, 20009),
(709, 12000, 10010, 20010);

INSERT INTO transactions
(transaction_id, car_id, payment_id, transaction_date)
VALUES
(9000, 101, 700, "2017-06-03"), 
(9001, 102, 701, "2018-03-25"),
(9002, 103, 702, "2017-01-25"),
(9003, 104, 703, "2018-03-25"),
(9004, 105, 704, "2017-09-17"),
(9005, 106, 705, "2019-01-10"),
(9006, 107, 706, "2017-02-08"),
(9007, 108, 707, "2018-12-12"),
(9008, 109, 708, "2019-03-09"),
(9009, 110, 709, "2017-10-21");















