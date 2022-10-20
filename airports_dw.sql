
DROP DATABASE IF EXISTS airports_dw;

CREATE DATABASE airports_dw;

USE airports_dw;

CREATE TABLE dim_from_airport (
    from_airport_id INT,
    from_airport_name VARCHAR(50),
    from_airport_city VARCHAR(100),
    from_airport_country VARCHAR(100),
    PRIMARY KEY (from_airport_id)
);

CREATE TABLE dim_to_airport (
    to_airport_id INT,
    to_airport_name VARCHAR(50),
    to_airport_city VARCHAR(100),
    to_airport_country VARCHAR(100),
    PRIMARY KEY (to_airport_id)
);


CREATE TABLE dim_from_time (
    from_time_id DATETIME,
    year INT,
    QTR_ID INT,
    QTR_NAME VARCHAR(255),
    MONTH_ID INT,
    MONTH_NAME VARCHAR(255),
    PRIMARY KEY (TIME_ID)
);

CREATE TABLE fact_order (
    ORDERNUMBER INT,
    ORDERLINENUMBER INT,
    QUANTITYORDERED INT,
    PRICEEACH DOUBLE,
    LINETOTAL DOUBLE,
    CUSTOMERNUMBER INT,
    PRODUCT_ID INT,
    TIME_ID DATETIME,
    PRIMARY KEY (ORDERNUMBER,ORDERLINENUMBER),
    FOREIGN KEY (CUSTOMERNUMBER) REFERENCES dim_customer (CUSTOMERNUMBER),
    FOREIGN KEY (PRODUCT_ID) REFERENCES dim_product (PRODUCT_ID),
    FOREIGN KEY (TIME_ID) REFERENCES dim_time (TIME_ID)
);
