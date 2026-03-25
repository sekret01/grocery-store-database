

BEGIN TRANSACTION;

-- DROP

DROP TABLE IF EXISTS "sale_product";
DROP TABLE IF EXISTS "order_product";
DROP TABLE IF EXISTS "order";
DROP TABLE IF EXISTS "provider";
DROP TABLE IF EXISTS "sale";
DROP TABLE IF EXISTS "product";
DROP TABLE IF EXISTS "shelf";
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "role";
DROP TABLE IF EXISTS "auth_data";


-- CREATE

CREATE TABLE IF NOT EXISTS "auth_data" (
	"id"	INTEGER NOT NULL,
	"login"	TEXT NOT NULL,
	"password_hash"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "order" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	"date" datetime NOT NULL,
	"provider" INTEGER REFERENCES "provider"("id") NOT NULL,
	"employee" INTEGER REFERENCES "auth_data"("id") NOT NULL,
	"is_active" INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS "product" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	"name" TEXT NOT NULL,
	"unit_of_meas" TEXT NOT NULL,
	"unit_price" NUMERIC NOT NULL,
	"amount" INTEGER NOT NULL,
	"is_active" INTEGER NOT NULL,
	"shelf" INTEGER REFERENCES "shelf"("id") NOT NULL
);
CREATE TABLE IF NOT EXISTS "provider" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"phone"	TEXT NOT NULL,
	"is_active" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "role" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "sale" (
	"id"	INTEGER NOT NULL,
	"date"	datetime NOT NULL,
	"is_active" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sale_product" (
	"id" INTEGER,
	"sale"	INTEGER,
	"product"	INTEGER,
	"amount"	INTEGER NOT NULL,
	"unit_price"	NUMERIC NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("product") REFERENCES "product"("id"),
	FOREIGN KEY("sale") REFERENCES "sale"("id")
);
CREATE TABLE IF NOT EXISTS "shelf" (
	"id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "user" (
	"id" INTEGER REFERENCES "auth_data"("id") NOT NULL,
	"full_name" TEXT NOT NULL,
	"phone" TEXT NOT NULL,
	"is_active" INTEGER NOT NULL,
	"role" INTEGER REFERENCES "role"("id")
);

CREATE TABLE IF NOT EXISTS "order_product" (
	"id" INTEGER NOT NULL,
	"order" INTEGER,
	"product" INTEGER,
	"amount" INTEGER NOT NULL,
	"unit_price"	NUMERIC NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("product") REFERENCES "product"("id"),
	FOREIGN KEY("order") REFERENCES "order"("id")
);


-- INSERT

INSERT INTO "role" ("id","name") VALUES (0,'ADMIN');
INSERT INTO "role" ("id","name") VALUES (1,'STOREKEEPER');
INSERT INTO "role" ("id","name") VALUES (2,'CASHIER');


COMMIT;
