BEGIN TRANSACTION;

DELETE FROM "sale_product";
DELETE FROM "order_product";
DELETE FROM "product";
DELETE FROM "shelf";
DELETE FROM "sale";
DELETE FROM "order";
DELETE FROM "provider";
DELETE FROM "user";
DELETE FROM "auth_data";

-- Auth Data (Users Credentials)
INSERT INTO "auth_data" ("id", "login", "password_hash") VALUES
(1, 'admin', 'admin'),
(2, 'storekeeper', 'storekeeper'),
(3, 'cashier', 'cashier');

-- Users
INSERT INTO "user" ("id", "full_name", "phone", "role") VALUES
(1, 'Игорь Петров', '+79001234567', 0),
(2, 'Анна Иванова', '+79012345678', 1),
(3, 'Сергей Смирнов', '+79023456789', 2);

-- Providers
INSERT INTO "provider" ("id", "name", "phone") VALUES
(1, 'Компания ООО Фрукты', '+79034567890'),
(2, 'Фабрика молока', '+79045678901'),
(3, 'Магазин овощей', '+79056789012');

-- Shelves
INSERT INTO "shelf" ("id") VALUES
(1),
(2),
(3);

-- Products
INSERT INTO "product" ("id", "name", "unit_of_meas", "unit_price", "amount", "shelf") VALUES
(1, 'Апельсин', 'кг', 80, 1000, 1),
(2, 'Молоко пастеризованное', 'литр', 70, 2000, 2),
(3, 'Огурцы свежие', 'кг', 60, 800, 3);

-- Sales
INSERT INTO "sale" ("id", "date") VALUES
(1, '2023-01-01 10:00:00'),
(2, '2023-01-02 11:00:00'),
(3, '2023-01-03 12:00:00');

-- Sale_Product Relations
INSERT INTO "sale_product" ("id", "sale", "product", "amount", "unit_price") VALUES
(1, 1, 1, 10, 80),
(2, 2, 2, 5, 70),
(3, 3, 3, 20, 60);

-- Orders
INSERT INTO "order" ("id", "date", "provider", "employee") VALUES
(1, '2023-01-01 10:00:00', 1, 3),
(2, '2023-01-02 11:00:00', 2, 3),
(3, '2023-01-03 12:00:00', 3, 3);

-- Order_Product Relations
INSERT INTO "order_product" ("id", "order", "product", "amount") VALUES
(1, 1, 1, 100),
(2, 1, 2, 40),
(3, 1, 3, 10),
(4, 2, 1, 50),
(5, 2, 2, 5),
(6, 2, 3, 50),
(7, 3, 3, 140),
(8, 3, 2, 40);

COMMIT;




