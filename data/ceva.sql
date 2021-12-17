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
    affect varchar NOT NULL,
    surgery varchar NOT NULL
);