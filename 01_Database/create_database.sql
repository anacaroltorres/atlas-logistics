CREATE DATABASE IF NOT EXISTS atlas_logistics;

USE atlas_logistics;
SELECT DATABASE();

SHOW CREATE TABLE clients;
SHOW CREATE TABLE drivers;
SHOW CREATE TABLE vehicles;
SHOW CREATE TABLE shipments;


INSERT INTO shipments (
    id_client,
    id_driver,
    id_vehicle,
    origin,
    destination,
    shipment_date,
    expected_delivery,
    actual_delivery,
    weight_kg,
    shipment_status,
    shipping_cost
) VALUES
(1, 2, 1, 'Sao Paulo', 'Campinas', '2026-10-01', '2026-10-03', '2026-10-03', 8500, 'Delivered', 850.00),
(2, 3, 2, 'Rio de Janeiro', 'Belo Horizonte', '2026-10-02', '2026-10-05', '2026-10-06', 12000, 'Delivered', 1450.00),
(3, 5, 3, 'Curitiba', 'Sao Paulo', '2026-10-03', '2026-10-06', '2026-10-06', 15000, 'Delivered', 1800.00),
(4, 6, 4, 'Santos', 'Campinas', '2026-11-03', '2026-11-07', NULL, 9500, 'In Transit', 920.00),
(5, 8, 5, 'Belo Horizonte', 'Rio de Janeiro', '2026-10-20', '2026-10-23', NULL, 8000, 'Delayed', 1300.00),
(6, 1, 6, 'Sao Paulo', 'Santos', '2026-10-05', '2026-10-06', '2026-10-06', 900, 'Delivered', 380.00),
(7, 4, 7, 'Campinas', 'Ribeirao Preto', '2026-10-06', '2026-10-08', '2026-10-09', 1300, 'Delivered', 520.00),
(8, 7, 8, 'Sao Paulo', 'Sao Jose dos Campos', '2026-10-07', '2026-10-08', '2026-10-08', 1100, 'Delivered', 420.00),
(9, 1, 9, 'Curitiba', 'Florianopolis', '2026-10-10', '2026-10-12', '2026-10-12', 1400, 'Delivered', 680.00),
(10, 9, 13, 'Sao Paulo', 'Goiania', '2026-10-11', '2026-10-15', '2026-10-16', 21000, 'Delivered', 2300.00),
(11, 10, 14, 'Porto Alegre', 'Sao Paulo', '2026-10-12', '2026-10-17', NULL, 27000, 'Delayed', 3100.00),
(12, 2, 1, 'Campinas', 'Sao Paulo', '2026-10-13', '2026-10-14', '2026-10-14', 10000, 'Delivered', 750.00),
(13, 3, 2, 'Rio de Janeiro', 'Vitoria', '2026-10-14', '2026-10-17', '2026-10-17', 16000, 'Delivered', 1250.00),
(14, 4, 6, 'Sao Paulo', 'Jundiai', '2026-10-15', '2026-10-16', '2026-10-16', 1200, 'Delivered', 350.00),
(15, 5, 4, 'Belo Horizonte', 'Uberlandia', '2026-10-16', '2026-10-19', '2026-10-20', 9000, 'Delivered', 1100.00),
(16, 6, 5, 'Santos', 'Sao Paulo', '2026-10-17', '2026-10-18', NULL, 7500, 'Cancelled', 600.00),
(17, 7, 10, 'Curitiba', 'Londrina', '2026-10-18', '2026-10-20', '2026-10-20', 800, 'Delivered', 490.00),
(18, 8, 11, 'Sao Paulo', 'Sorocaba', '2026-10-19', '2026-10-21', NULL, 950, 'Delayed', 560.00),
(19, 9, 13, 'Goiania', 'Brasilia', '2026-10-20', '2026-10-22', '2026-10-22', 22000, 'Delivered', 980.00),
(20, 10, 14, 'Porto Alegre', 'Florianopolis', '2026-10-21', '2026-10-24', '2026-10-25', 26000, 'Delivered', 1750.00),
(1, 2, 1, 'Sao Paulo', 'Ribeirao Preto', '2026-10-22', '2026-10-25', '2026-10-25', 14000, 'Delivered', 1200.00),
(2, 3, 2, 'Belo Horizonte', 'Sao Paulo', '2026-10-23', '2026-10-26', NULL, 17000, 'Delayed', 1600.00),
(3, 5, 3, 'Curitiba', 'Joinville', '2026-10-24', '2026-10-26', '2026-10-26', 18000, 'Delivered', 850.00),
(4, 6, 4, 'Santos', 'Campinas', '2026-10-25', '2026-10-27', '2026-10-27', 11000, 'Delivered', 700.00),
(5, 1, 7, 'Sao Paulo', 'Santos', '2026-10-26', '2026-10-27', '2026-10-27', 1500, 'Delivered', 390.00),
(6, 4, 8, 'Campinas', 'Sao Paulo', '2026-10-27', '2026-10-28', NULL, 1000, 'Cancelled', 320.00),
(7, 7, 12, 'Sao Paulo', 'Piracicaba', '2026-10-28', '2026-10-30', '2026-10-30', 900, 'Delivered', 450.00),
(8, 8, 11, 'Rio de Janeiro', 'Niteroi', '2026-10-29', '2026-10-30', '2026-10-31', 1000, 'Delivered', 400.00),
(9, 9, 13, 'Sao Paulo', 'Curitiba', '2026-11-01', '2026-11-04', NULL, 23000, 'In Transit', 1900.00),
(10, 10, 14, 'Belo Horizonte', 'Goiania', '2026-11-02', '2026-11-06', NULL, 28000, 'In Transit', 2400.00);

-- Quantidade de registros 
-- Quantos clientes existem?
-- Quantos motoristas?
-- Quantos veículos?
-- Quantos envios?

-- Integridade dos envios- Existem envios sem cliente?
-- Existem envios sem motorista?
-- Existem envios sem veículo?

-- Consistência das entregas- Quantos envios estão Delivered?
-- Quantos estão Delayed?
-- Quantos estão In Transit?
-- Quantos estão Cancelled?
-- Existem entregas realizadas depois da data prevista?
-- Existem envios Delivered sem actual_delivery?

