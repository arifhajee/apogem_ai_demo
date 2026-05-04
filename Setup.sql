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

-- Sample Data CoCo Prompt
-- Populate PORTFOLIO_INVESTMENTS with ~500-1000 rows of realistic private credit data (CLOs, senior credit, PE deals across sectors like Healthcare, Technology, Industrials, Consumer)

-- Build Semantic View Prompt
/* Build be a semantic view off of DEMO_DB.APOGEM.  Include the following verified queries:

  - question: "In healthcare, what has been our MOIC and IRR?"
    sql: "      SELECT
        sector_Dim,
        AVG(moic_fact) as avg_moic,
        AVG(gross_irr_fact) as avg_gross_irr
      FROM
        portfolio_investments
      WHERE
        sector_dim = 'Healthcare'
        AND status_dim = 'Realized'
      GROUP BY
        sector_dim"
  - question: "How many borrowers took loans in healthcare and what did they commit?"
    sql: "      SELECT
        COUNT(DISTINCT borrower_dim) as num_borrowers,
        SUM(commitment_fact) as total_committed
      FROM
        portfolio_investments
      WHERE
        sector_dim = 'Healthcare'"
  - question: "What is unfunded across our active deals?"
    sql: "ELECT
        strategy_dim,
        SUM(unfunded_fact) as total_unfunded
      FROM
        portfolio_investments
      WHERE
        status_dim = 'Active'
      GROUP BY
        strategy_dim
      ORDER BY
        total_unfunded DESC"
*/
