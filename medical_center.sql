DROP DATABASE medical_center;
CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    firstname TEXT,
    lastname TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    firstname TEXT,
    lastname TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    visit_date DATE
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases
);