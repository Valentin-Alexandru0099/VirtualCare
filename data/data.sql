DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS appointments;


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
    email varchar UNIQUE,
    username varchar,
);

CREATE TABLE appointments(
    id serial PRIMARY KEY NOT NULL,
    patient_id integer,
    doctor_id integer,
    message varchar,
    date timestamp
)


INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (1, 'Dr. Oancea', 'Orthopedist', '0742180108', 'doctor.oancea@gmail.com', 'Oancea');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (2, 'Dr. Ali', 'Neurologist', '0770837460', 'doctor.ali@gmail.com', 'Ali');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (3, 'Dr. Jhony', 'Gainecologist', '0732878234', 'doctor.jhony@gmail.com', 'Jhony');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (4, 'Dr. Schiopu', 'Dermatologist', '0765753159', 'doctor.schiopu@gmail.com', 'Shciopu');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (5, 'Dr. Mioara', 'Pediatrics', '0764125668', 'doctor.mioara@gmail.com', 'Mioara');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (6,  'Dr. Macovei', 'Obstetrics', '0742574162', 'doctor.macovei@gmail.com', 'Macovei');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (7,  'Dr. Cristescu', 'Urologist', '0770856741', 'doctor.cristescu@gmail.com', 'Cristescu');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (8,  'Dr. Zamfir', 'Cardiologist', '0732945687', 'doctor.zamfir@gmail.com', 'Zamfir');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (9,  'Dr. Pandele', 'Oncologist', '0721578913', 'doctor.pandele@gmail.com', 'Pandele');
INSERT INTO doctors (id, name, specialization, contact, email, username) VALUES (10,  'Dr. Olteanu', 'Geriatrics', '0724753951', 'doctor.olteanu@gmail.com', 'Olteanu');

INSERT INTO users(id, username, email, password) VALUES (1, 'Oancea', 'oancea@gmail.com', 'pbkdf2:sha256:260000$Mvr7vipPQTGBfReF$5b64243a425dbbd3b7483aa90572805784f961bff163ffe23e24e71dd794a865')
INSERT INTO users(id, username, email, password) VALUES (2, 'Ali', 'ali@gmail.com', 'pbkdf2:sha256:260000$rJQow1qykv6oDLXA$c841c90a68bfe90900dc87ab4e66f70c6117bab23aeb68dd5654649b3cf4a5d4')
INSERT INTO users(id, username, email, password) VALUES (3, 'Jhony', 'jhony@gmail.com', 'pbkdf2:sha256:260000$mtaWnlKppMtM56Zx$d9bf261a25da34b9bac6a844c2442f6788915d40b3ea1f687155bf47d7aacd3c')
INSERT INTO users(id, username, email, password) VALUES (4, 'Schiopu', 'schiopu@gmail.com', 'pbkdf2:sha256:260000$RL8Fivrg9Yj4kVTM$fb9c6a7c91add287e6dd5514a780581ea1112f1da2e38f1d614ddf9949e313fd')
INSERT INTO users(id, username, email, password) VALUES (5, 'Mioara', 'mioara@gmail.com', 'pbkdf2:sha256:260000$ZWxKCjSkWsis8KCL$9c3d7beb4194885326aeedec269bb915095eed164c91213d841023c2c2a2729d')
INSERT INTO users(id, username, email, password) VALUES (6, 'Macovei', 'macovei@gmail.com', 'pbkdf2:sha256:260000$5qj21nd6CDOyX7rV$d56348142f59b060f7f3d5477b2616fe26b90066f80667a09a83b7153211a49f')
INSERT INTO users(id, username, email, password) VALUES (7, 'Cristescu', 'cristescu@gmail.com', 'pbkdf2:sha256:260000$0dIu1xyKpqMrwvpM$af6a808f96241c98698a0ac9daf9ca9834329f273f0e2b8caff4c1613500f532')
INSERT INTO users(id, username, email, password) VALUES (8, 'Zamfir', 'zamfir@gmail.com', 'pbkdf2:sha256:260000$bZptteAgr6Lfk0Wy$c17d01466d7dcb2622fcf88b440110910ec3771ab675478948beb75d19e31215')
INSERT INTO users(id, username, email, password) VALUES (9, 'Pandele', 'pandele@gmail.com', 'pbkdf2:sha256:260000$jQtW9g8h7mNmD1hF$9f242ae61a767a553b23414fefc25c0a15b3863f735d077f2ad59a4f058f81c4')
INSERT INTO users(id, username, email, password) VALUES (10, 'Olteanu', 'olteau@gmail.com', 'pbkdf2:sha256:260000$QKQVeT5AZBbrC13u$14d7d629b75a8bf6330e5869df75e85d14ba28d08357b311fe9a822642328ee5')
