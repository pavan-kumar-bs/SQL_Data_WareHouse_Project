
/*
==========================================================================================
Stored Procedure: Loading Bronze Layer Data (Source > Bronze)
==========================================================================================
Puropose of the script:
This stored procedure loads the data into bronze schema from csv files.

Actions performed:
- Truncates the table
- Bulk load the data from CSV files
- Provides Error details if occured
- Provides the Data loading time for each table and for overall bronze batch

Stored Procedure usage:
EXEC bronze.load_bronze;
==========================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @starttime DATETIME, @endtime DATETIME, @batchstarttime DATETIME, @batchendtime DATETIME;
	SET @batchstarttime = GETDATE();

	BEGIN TRY
		PRINT '====================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '====================================================================';


		PRINT '--------------------------------------------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '--------------------------------------------------------------------';
		
		SET @starttime = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\chand\OneDrive\Documents\Pavan\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();

		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + 'Seconds';
		PRINT '--------------------------------';

		SET @starttime = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\chand\OneDrive\Documents\Pavan\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + 'Seconds';
		PRINT '--------------------------------';


		SET @starttime = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\chand\OneDrive\Documents\Pavan\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + 'Seconds';
		PRINT '--------------------------------';

		PRINT '--------------------------------------------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '--------------------------------------------------------------------';

		SET @starttime = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\chand\OneDrive\Documents\Pavan\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + 'Seconds';
		PRINT '--------------------------------';

		SET @starttime = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\chand\OneDrive\Documents\Pavan\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + 'Seconds';
		PRINT '--------------------------------';

		SET @starttime = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\chand\OneDrive\Documents\Pavan\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + 'Seconds';
		PRINT '--------------------------------';

		SET @batchendtime = GETDATE();
		PRINT '====================================================='
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '  - Loading time: ' + CAST(DATEDIFF(SECOND, @batchstarttime, @batchendtime) AS NVARCHAR) + 'Seconds';
		PRINT '=====================================================';

	END TRY

	BEGIN CATCH
	PRINT '==========================================================';
	PRINT 'ERROR OCCUR DURING LOADING BRONZE LAYER';
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Number' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error State' + CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '==========================================================';
	END CATCH
END
