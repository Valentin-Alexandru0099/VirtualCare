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
    email varchar UNIQUE,
    username text DEFAULT '',
    p_id integer
);

CREATE TABLE patients(
    id serial PRIMARY KEY NOT NULL,
    name text DEFAULT '',
    age integer,
    surname varchar,
    contact varchar DEFAULT '',
    adress_line varchar,
    gender text,
    height float,
    weight float,
    country varchar,
    region varchar,
    disease varchar DEFAULT '',
    surgery varchar DEFAULT '',
    email varchar UNIQUE
);

CREATE TABLE disease(
    id serial PRIMARY KEY NOT NULL,
    name text DEFAULT '',
    detail text DEFAULT ''
);



INSERT INTO disease (id, name, detail) VALUES (1, 'Thrombosis', 'A vascular disease caused by the formation of a blood clot inside a blood vessel, obstructing the flow of blood through the circulatory system.');
INSERT INTO disease (id, name, detail) VALUES (2, 'Depression', 'Depression (also known as major depression or major depressive disorder) is a psychiatric disorder that affects mood, behavior, and overall health. It causes prolonged feelings of sadness, emptiness, or hopelessness, and a loss of interest in activities that were once enjoyed. People with depression may also have changes in appetite (leading to overeating or not eating enough), changes in sleeping patterns (sleeping too much or not being able to sleep), loss of energy, and difficulty concentrating.');
INSERT INTO disease (id, name, detail) VALUES (3, 'Oral Cancer', 'Oral Cancer, also known as lip and oral cavity carcinoma, is related to oral leukoplakia and leukoplakia, and has symptoms including snoring and halitosis. An important gene associated with Oral Cancer is MIR31 (MicroRNA 31), and among its related pathways/superpathways are Integrated Breast Cancer Pathway and Spinal Cord Injury.');
INSERT INTO disease (id, name, detail) VALUES (4, 'Ovarian Cancer', 'Ovarian cancer is a disease that affects women. In this form of cancer, certain cells in the ovary become abnormal and multiply uncontrollably to form a tumor. The ovaries are the female reproductive organs in which egg cells are produced. In about 90 percent of cases, ovarian cancer occurs after age 40, and most cases occur after age 60.');
INSERT INTO disease (id, name, detail) VALUES (5, 'Heart Disease', 'If you are like most people, you think that heart disease is a problem for others. But heart disease is the number one killer in the U.S. It is also a major cause of disability. There are many different forms of heart disease.');

INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (1, 'Dr. Oancea', 'Orthopedist', '0742180108', 'doctor.oancea@gmail.com', 'Oancea');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (2, 'Dr. Ali', 'Neurologist', '0770837460', 'doctor.ali@gmail.com', 'Ali');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (3, 'Dr. Jhony', 'Gainecologist', '0732878234', 'doctor.jhony@gmail.com', 'Jhony');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (4, 'Dr. Schiopu', 'Dermatologist', '0765753159', 'doctor.schiopu@gmail.com', 'Shciopu');

-- DE INSERAT PACIENTI MINIM 10