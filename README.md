# Atlas Logistics

Projeto de banco de dados e análise de dados em MySQL, desenvolvido a partir de uma base fictícia de uma empresa de transporte de cargas.

Construí o banco de dados do zero e utilizei SQL para validar os registros e analisar diferentes aspectos da operação logística, como clientes, entregas, motoristas, veículos, rotas e custos de frete.

### Estrutura do banco

O banco `atlas_logistics` possui quatro tabelas relacionadas por meio de chaves primárias e estrangeiras:

- `clients`: informações dos clientes.
- `drivers`: informações dos motoristas.
- `vehicles`: dados dos veículos utilizados no transporte.
- `shipments`: registros dos envios, incluindo origem, destino, datas, peso, status e custo do frete.

### Etapas do projeto

**1. Criação do banco de dados**

Criação das tabelas, definição dos campos e relacionamentos e inserção dos dados fictícios.

**2. Validação dos dados**

Verificação da quantidade de registros, identificação de valores nulos, conferência dos status dos envios e análise de possíveis inconsistências, como entregas após o prazo previsto, pesos inválidos e custos não positivos.

**3. Análise de dados**

Desenvolvimento de consultas SQL para investigar questões relacionadas à operação, como:

- Quantos envios cada cliente e cada motorista possuem?
- Quanto cada cliente gerou em custos de frete?
- Quais veículos foram mais utilizados e quais não tiveram utilização?
- Quais rotas foram mais frequentes e quais geraram maior receita?
- Qual foi o peso total e o custo total registrados?
- Como a receita de frete variou entre os meses analisados?

### Resultados

Alguns resultados obtidos nas consultas:

- Média de 1,5 envios por cliente.
- Cinco veículos empatados como os mais utilizados, com três envios cada.
- Um veículo sem nenhum envio registrado.
- A rota Porto Alegre–São Paulo apresentou a maior receita em um único envio.
- Receita total registrada de R$ 31.760,00, com média de R$ 1.058,67 por envio.

Os valores financeiros incluem todos os registros da tabela, inclusive envios cancelados e em andamento.

### Ferramentas utilizadas

MySQL e MySQL Workbench

### Sobre o projeto

O Atlas Logistics foi desenvolvido como parte dos meus estudos em SQL e análise de dados. Ao longo do projeto, pratiquei modelagem de dados, relacionamento entre tabelas, validação de registros e elaboração de consultas para responder a perguntas de negócio.
