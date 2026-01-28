/*
=============================================================
Create Database and Schemas (PostgreSQL)
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'.
    If the database exists, it is dropped and recreated.
    Then three schemas are created: bronze, silver, gold.
=============================================================
*/

-- psql:  psql -U postgres -d postgres -f create_db.sql

-- 1. Force existing connections to terminate
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

-- 2. Delete the database (if it exists)
DROP DATABASE IF EXISTS "datawarehouse";

-- 3. Create database
CREATE DATABASE "datawarehouse";

-- 4. Connect to the new database
\connect "datawarehouse"

-- 5. Create schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
