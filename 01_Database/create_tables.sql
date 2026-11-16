-- Tabela: clients

CREATE TABLE `clients` (
    `id_client` int NOT NULL AUTO_INCREMENT,
    `client_name` varchar(100) DEFAULT NULL,
    `company_name` varchar(200) DEFAULT NULL,
    `cnpj` varchar(18) DEFAULT NULL,
    `segment` varchar(80) DEFAULT NULL,
    PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela: drivers

CREATE TABLE `drivers` (
   `id_driver` int NOT NULL AUTO_INCREMENT,
   `driver_name` varchar(100) DEFAULT NULL,
   `phone` varchar(20) DEFAULT NULL,
   `license_number` varchar(30) DEFAULT NULL,
   `license_category` varchar(5) DEFAULT NULL,
   PRIMARY KEY (`id_driver`)
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela: vehicles

CREATE TABLE `vehicles` (
    `id_vehicle` int NOT NULL AUTO_INCREMENT,
    `vehicle_model` varchar(50) DEFAULT NULL,
    `vehicle_type` varchar(30) DEFAULT NULL,
    `license_plate` varchar(15) DEFAULT NULL,
    `capacity_kg` int DEFAULT NULL,
    `vehicle_status` varchar(30) DEFAULT NULL,
    PRIMARY KEY (`id_vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela: shipments

CREATE TABLE `shipments` (
    `id_shipment` int NOT NULL AUTO_INCREMENT,
    `id_client` int DEFAULT NULL,
    `id_driver` int DEFAULT NULL,
    `id_vehicle` int DEFAULT NULL,
    `origin` varchar(100) DEFAULT NULL,
    `destination` varchar(100) DEFAULT NULL,
    `shipment_date` date DEFAULT NULL,
    `expected_delivery` date DEFAULT NULL,
    `actual_delivery` date DEFAULT NULL,
    `weight_kg` int DEFAULT NULL,
    `shipment_status` varchar(30) DEFAULT NULL,
    `shipping_cost` double DEFAULT NULL,
    PRIMARY KEY (`id_shipment`),
    KEY `id_client` (`id_client`),
    KEY `id_driver` (`id_driver`),
    KEY `id_vehicle` (`id_vehicle`),
    CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
    CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`id_driver`) REFERENCES `drivers` (`id_driver`),
    CONSTRAINT `shipments_ibfk_3` FOREIGN KEY (`id_vehicle`) REFERENCES `vehicles` (`id_vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;