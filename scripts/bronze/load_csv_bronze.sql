/* 
load_csv_bronze.sql
*/
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$

DECLARE
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
    start_time TIMESTAMP;
    end_time TIMESTAMP;

BEGIN
    batch_start_time := clock_timestamp();
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
    Truncate TABLE bronze.crm_cust_info;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
    COPY bronze.crm_cust_info
    from '/Users/yoonkyunglee/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
    delimiter ','
    csv header;
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM end_time - start_time) ::numeric, 2);
    RAISE NOTICE '>> -------------';


    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
    Truncate TABLE bronze.crm_prd_info;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
    COPY bronze.crm_prd_info
    from '/Users/yoonkyunglee/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
    delimiter ','
    csv header;
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM end_time - start_time) ::numeric, 2);
    RAISE NOTICE '>> -------------';


    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
    Truncate TABLE bronze.crm_sales_details;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
    COPY bronze.crm_sales_details
    from '/Users/yoonkyunglee/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
    delimiter ','
    csv header;
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM end_time - start_time) ::numeric, 2);
    RAISE NOTICE '>> -------------';

    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';


    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
    Truncate TABLE bronze.erp_cust_az12;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
    COPY bronze.erp_cust_az12
    from '/Users/yoonkyunglee/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
    delimiter ','
    csv header;
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM end_time - start_time) ::numeric, 2);
    RAISE NOTICE '>> -------------';

    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
    COPY bronze.erp_loc_a101
    from '/Users/yoonkyunglee/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
    delimiter ','
    csv header;
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM end_time - start_time) ::numeric, 2);
    RAISE NOTICE '>> -------------';

    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
    COPY bronze.erp_px_cat_g1v2
    from '/Users/yoonkyunglee/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
    delimiter ','
    csv header;
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM end_time - start_time) ::numeric, 2);
    RAISE NOTICE '>> -------------';
    batch_end_time := clock_timestamp();
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer Completed';
    RAISE NOTICE '  >> Total Batch Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM batch_end_time - batch_start_time) ::numeric, 2);
    RAISE NOTICE '================================================';


EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '------------------------------------------------';
        RAISE NOTICE 'ERROR OCCURED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'ERROR MESSAGE: %', SQLERRM;
        RAISE NOTICE '------------------------------------------------';



END;
$$;
