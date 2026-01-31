
--Creating DataWarehouse Database and setting up three schemas within the Database "bronze, silver and gold"

USE MASTER;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
