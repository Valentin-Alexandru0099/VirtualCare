CREATE TABLE users(
    id serial PRIMARY KEY NOT NULL,
    username varchar UNIQUE,
    email varchar UNIQUE,
    password varchar
);

CREATE TABLE doctors(
    id serial PRIMARY KEY NOT NULL,
    name text DEFAULT '',
    specialization text DEFAULT '',
    contact varchar NOT NULL,
    email varchar UNIQUE
);

CREATE TABLE patients(
    id serial PRIMARY KEY NOT NULL,
    name text DEFAULT '',
    contact varchar NOT NULL,
    age integer,
    disease varchar NOT NULL,
    surgery varchar NOT NULL
);

CREATE TABLE disease(
    id serial PRIMARY KEY NOT NULL,
    name text DEFAULT '',
    detail text DEFAULT ''
);