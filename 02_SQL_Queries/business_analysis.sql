USE atlas_logistics;

-- 1. ANÁLISE DE CLIENTES
-- 1.1. Quais clientes realizaram envios e quantos envios cada um realizou?
-- Listagem dos clientes em ordem decrescente pela ordem de envios.

SELECT 
    clients.id_client,
    clients.client_name,
    COUNT(shipments.id_shipment) AS total_envios
FROM
    clients
        JOIN
    shipments ON shipments.id_client = clients.id_client
GROUP BY clients.id_client , clients.client_name
ORDER BY total_envios DESC;

 
-- 1.2 Quais clientes geraram maior receita de frete?
-- Apresentação dos clientes em ordem decrescente pelo valor total de fretes.
SELECT 
    clients.id_client,
    clients.client_name,
    SUM(shipments.shipping_cost) AS total_shipping_cost
FROM
    clients
        JOIN
    shipments ON clients.id_client = shipments.id_client
GROUP BY clients.id_client , clients.client_name
ORDER BY total_shipping_cost DESC;
   
-- 1.3 Qual é a média de envios por cliente?
SELECT 
    AVG(average_result.shipment_quantity) AS average_shipment_per_client
FROM
    (SELECT 
        clients.id_client,
            clients.client_name,
            COUNT(shipments.id_shipment) AS shipment_quantity
    FROM
        clients
    LEFT JOIN shipments ON shipments.id_client = clients.id_client
    GROUP BY clients.id_client , clients.client_name) AS average_result;
 
-- 2. ANÁLISE DE ENTREGAS
-- 2.1 Quantos envios foram realizados por cada motorista?
-- Relação: shipments VS drivers

SELECT 
    shipments.id_driver,
    drivers.driver_name,
    COUNT(shipments.id_shipment) AS shipment_per_motorist
FROM
    drivers
        JOIN
    shipments ON shipments.id_driver = drivers.id_driver
GROUP BY shipments.id_driver , drivers.driver_name
ORDER BY shipment_per_motorist DESC;

-- 2.2 Quais motoristas possuem mais entregas atrasadas?
SELECT 
    drivers.id_driver,
    drivers.driver_name,
    COUNT(shipments.shipment_status) AS entregas_atrasadas
FROM
    drivers
        JOIN
    shipments ON shipments.id_driver = drivers.id_driver
WHERE
    shipments.shipment_status = 'Delayed'
GROUP BY drivers.id_driver , drivers.driver_name
ORDER BY entregas_atrasadas DESC;
  
-- 2.3 Qual é o percentual de entregas realizadas com atraso?
SELECT
    SUM(
        CASE
            WHEN shipment_status = 'Delayed' THEN 1
            ELSE 0
        END
    ) AS delayed_shipments
FROM shipments;


-- 3. ANÁLISE DE VEÍCULOS
-- 3.1 Quais veículos foram utilizados com maior frequência?
SELECT 
    vehicles.id_vehicle,
    vehicles.vehicle_model,
    COUNT(shipments.id_shipment) AS higher_use_frequency
FROM
    vehicles
        JOIN
    shipments ON shipments.id_vehicle = vehicles.id_vehicle
GROUP BY vehicles.id_vehicle , vehicles.vehicle_model
ORDER BY higher_use_frequency DESC;

-- 3.2 Qual é a quantidade de envios por tipo de veículo?
-- Relação: shipments e vehicles (tipo de veículo!)
SELECT 
    vehicles.vehicle_type,
    COUNT(shipments.id_shipment) AS shipment_per_vehicle
FROM
    shipments
        JOIN
    vehicles ON shipments.id_vehicle = vehicles.id_vehicle
GROUP BY vehicles.vehicle_type
ORDER BY shipment_per_vehicle DESC;

-- 3.3 Existem veículos que nunca foram utilizados?
SELECT 
    vehicles.id_vehicle,
    vehicles.vehicle_type,
    COUNT(shipments.id_shipment) AS not_used_vehicles
FROM
    vehicles
        LEFT JOIN
    shipments ON shipments.id_vehicle = vehicles.id_vehicle
GROUP BY vehicles.id_vehicle , vehicles.vehicle_type
HAVING not_used_vehicles = 0;

-- 4. ANÁLISE DE ROTAS
-- 4.1 Quais são as rotas mais utilizadas?

SELECT 
    origin,
    destination,
    COUNT(shipments.id_shipment) AS total_shipments
FROM
    shipments
GROUP BY origin , destination
ORDER BY total_shipments DESC;


-- 4.2 Quais rotas geraram maior receita de frete?
SELECT 
    origin,
    destination,
    SUM(shipments.shipping_cost) AS total_shipping_cost_routes
FROM
    shipments
GROUP BY origin , destination
ORDER BY total_shipping_cost_routes DESC;


-- 5. ANÁLISE FINANCEIRA E OPERACIONAL
-- 5.1 Qual é o valor total arrecadado com fretes?
SELECT 
   SUM(shipments.shipping_cost) AS total_freight_revenue
FROM shipments;

-- 5.2 Qual é o valor médio cobrado por envio?
SELECT 
    ROUND(AVG(shipments.shipping_cost),2) AS shipping_media
FROM
    shipments;

-- 5.3 Qual foi o volume total de peso transportado?
SELECT
SUM(shipments.weight_kg) as total_weight_kg
FROM shipments;

-- 5.4 Qual foi a receita de frete por mês?
SELECT 
    MONTH(shipments.shipment_date) AS month,
    SUM(shipments.shipping_cost) AS shipping_cost
FROM
    shipments
GROUP BY MONTH(shipments.shipment_date);



