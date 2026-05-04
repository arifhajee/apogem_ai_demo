CREATE DATABASE DEMO_DB;
CREATE SCHEMA DEMO_DB.APOGEM;

USE DATABASE DEMO_DB;
USE SCHEMA APOGEM;

CREATE OR REPLACE TABLE DEMO_DB.APOGEM.PORTFOLIO_INVESTMENTS (
    deal_id VARCHAR,
    deal_name VARCHAR,
    borrower_name VARCHAR,
    sector VARCHAR,          -- Healthcare, Technology, Industrials, etc.
    strategy VARCHAR,        -- Senior Credit, CLO, Private Equity, Mezzanine
    fund_name VARCHAR,
    vintage_year INT,
    commitment_amount NUMBER(18,2),
    funded_amount NUMBER(18,2),
    unfunded_commitment NUMBER(18,2),
    fair_value NUMBER(18,2),
    cost_basis NUMBER(18,2),
    moic NUMBER(10,4),
    gross_irr NUMBER(10,4),
    net_irr NUMBER(10,4),
    spread_bps INT,
    maturity_date DATE,
    investment_date DATE,
    status VARCHAR           -- Active, Realized, Written Off
);
