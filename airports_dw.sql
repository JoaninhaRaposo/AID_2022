
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
    day INT,
    month INT,
    year INT,
    PRIMARY KEY (from_time_id)
);

CREATE TABLE dim_to_time (
    to_time_id DATETIME,
    day INT,
    month INT,
    year INT,
    PRIMARY KEY (to_time_id)
);

CREATE TABLE dim_airplane (
    airplane_id INT,
    type_id INT, /*not sure about if should be string or INT... According to slack it seems to be type_i*/
    PRIMARY KEY (airplane_id)
);

CREATE TABLE dim_airline (
    airline_id INT,
    airline_name VARCHAR(30),
    PRIMARY KEY (airline_id)
);


CREATE TABLE fact_flight (
    flight_id INT,
    passenger_no INT,
    total_revenue INT,
    from_airport_id INT,
    to_airport_id INT,
    from_time_id DATETIME,
    to_time_id DATETIME,
    airline_id INT,
    airplane_id INT,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (from_airport_id) REFERENCES dim_from_airport (from_airport_id),
    FOREIGN KEY (to_airport_id) REFERENCES dim_to_airport (to_airport_id),
    FOREIGN KEY (from_time_id) REFERENCES dim_from_time (from_time_id),
    FOREIGN KEY (to_time_id) REFERENCES dim_to_time (to_time_id),
    FOREIGN KEY (airline_id) REFERENCES dim_airline (airline_id),
    FOREIGN KEY (airplane_id) REFERENCES dim_airplane (airplane_id)
);
