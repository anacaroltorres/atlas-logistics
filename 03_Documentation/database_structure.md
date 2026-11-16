# Database Structure — Atlas Logistics

## 1. Visão geral

O banco de dados `atlas_logistics` foi desenvolvido para representar as operações de uma empresa fictícia de logística, permitindo o armazenamento e a consulta de informações sobre clientes, motoristas, veículos e envios.

O banco possui quatro tabelas: `clients`, `drivers`, `vehicles` e `shipments`. A tabela `shipments` concentra os registros das operações de transporte e se relaciona com as demais tabelas por meio de chaves estrangeiras.

## 2. Estrutura das tabelas

### 2.1. Clients

Armazena os dados cadastrais dos clientes da empresa.

- `id_client`: identificador único do cliente (chave primária).
- `client_name`: nome do cliente.
- `company_name`: nome da empresa.
- `cnpj`: CNPJ da empresa.
- `segment`: segmento de atuação do cliente.

### 2.2. Drivers

Armazena as informações dos motoristas responsáveis pelos transportes.

- `id_driver`: identificador único do motorista (chave primária).
- `driver_name`: nome do motorista.
- `phone`: telefone para contato.
- `license_number`: número da carteira de habilitação.
- `license_category`: categoria da habilitação.

### 2.3. Vehicles

Contém os dados dos veículos utilizados nas operações de transporte.

- `id_vehicle`: identificador único do veículo (chave primária).
- `vehicle_model`: modelo do veículo.
- `vehicle_type`: tipo de veículo.
- `license_plate`: placa do veículo.
- `capacity_kg`: capacidade máxima de carga em kg.
- `vehicle_status`: situação atual do veículo.

### 2.4. Shipments

Registra os envios realizados pela empresa, incluindo informações sobre origem, destino, datas, carga, custos e situação da entrega.

- `id_shipment`: identificador único do envio (chave primária).
- `id_client`: identificador do cliente relacionado ao envio (chave estrangeira).
- `id_driver`: identificador do motorista responsável (chave estrangeira).
- `id_vehicle`: identificador do veículo utilizado (chave estrangeira).
- `origin`: local de origem do envio.
- `destination`: local de destino.
- `shipment_date`: data de realização do envio.
- `expected_delivery`: data prevista para entrega.
- `actual_delivery`: data efetiva da entrega.
- `weight_kg`: peso da carga em kg.
- `shipment_status`: situação do envio.
- `shipping_cost`: valor cobrado pelo transporte.

## 3. Relacionamentos entre as tabelas

A tabela `shipments` funciona como a tabela central do banco de dados, pois reúne as informações de cada operação de transporte e faz referência às outras três tabelas.

Os relacionamentos são:

- `clients` → `shipments`: um cliente pode estar associado a vários envios.
- `drivers` → `shipments`: um motorista pode ser responsável por vários envios.
- `vehicles` → `shipments`: um veículo pode ser utilizado em vários envios.

As relações são estabelecidas pelas seguintes chaves:

- `shipments.id_client` → `clients.id_client`
- `shipments.id_driver` → `drivers.id_driver`
- `shipments.id_vehicle` → `vehicles.id_vehicle`