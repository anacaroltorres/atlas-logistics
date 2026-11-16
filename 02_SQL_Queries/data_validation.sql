USE atlas_logistics;

-- 1. QUANTIDADE DE REGISTROS
-- Verificação da quantidade de clientes cadastrados
SELECT COUNT(*) AS total_clients 
FROM clients;

-- Verificação da quantidade de motoristas cadastrados
SELECT COUNT(*) AS total_drivers
FROM drivers;

-- Verificação da quantidade de veículos cadastrados
SELECT COUNT(*) AS total_vehicles 
FROM vehicles;

-- Verificação da quantidade de envios cadastrados
SELECT COUNT(*) AS total_shipments
FROM shipments;


-- 2. INTEGRIDADE DOS ENVIOS
-- Existem envios sem cliente?
SELECT * FROM shipments
WHERE id_client IS NULL;

-- Existem envios sem motorista?
SELECT * FROM shipments
WHERE id_driver IS NULL;

-- Existem envios sem veículo?
SELECT * FROM shipments
WHERE id_vehicle IS NULL;


-- 3. CONSISTÊNCIA DAS ENTREGAS
-- Quantos envios foram entregues?
SELECT COUNT(*) FROM shipments
WHERE shipment_status = 'Delivered';

-- Quantos envios estão atrasados?
SELECT COUNT(*) FROM shipments
WHERE shipment_status = 'Delayed';

-- Quantos envios estão em trânsito/em transporte? 
SELECT COUNT(*) FROM shipments
WHERE shipment_status = 'In Transit';

-- Quantos envios estão cancelados?
SELECT COUNT(*) FROM shipments
WHERE shipment_status = 'Cancelled';

-- Há entregas realizadas depois da data prevista?
SELECT COUNT(*) FROM shipments 
WHERE actual_delivery > expected_delivery;

-- 4.CAPACIDADE DOS VEÍCULOS
-- Existem envios cujo peso (weight_kg) é maior que a capacidade (capacity_kg) do veículo utilizado?
SELECT * FROM shipments
JOIN vehicles
ON shipments.id_vehicle = vehicles.id_vehicle
WHERE weight_kg > capacity_kg;

-- 5.VERIFICAÇÃO DE VALORES E DATAS
-- Existem envios com peso menor ou igual a zero?
SELECT * FROM shipments
WHERE weight_kg <= 0;

-- Existem envios com custo de frete menor ou igual a zero?
SELECT * FROM shipments 
WHERE shipping_cost <= 0;

-- Existem entregas realizadas antes da data do envio?
SELECT * FROM shipments
WHERE shipment_date > actual_delivery;



