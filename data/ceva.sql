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
    email varchar UNIQUE,
    username varchar,
    d_id integer
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
INSERT INTO disease (id, name, detail) VALUES (6, 'Gorhams Disease', 'Gorhams disease is a rare bone disorder characterized by bone loss (osteolysis), often associated abnormal blood vessel growth (angiomatous proliferation). Bone loss can occur in just one bone, or spread to soft tissue and adjacent bones');
INSERT INTO disease (id, name, detail) VALUES (7, 'Rheumatoid Arthritis', 'Rheumatoid arthritis is a disease that causes chronic abnormal inflammation, primarily affecting the joints. The most common signs and symptoms are pain, swelling, and stiffness of the joints. Small joints in the hands and feet are involved most often, although larger joints (such as the shoulders, hips, and knees) may become involved later in the disease.');
INSERT INTO disease (id, name, detail) VALUES (8, 'Breast Osteosarcoma', 'A breast sarcoma that arises from bone.');
INSERT INTO disease (id, name, detail) VALUES (9, 'Broken Heart Syndrome', 'roken heart syndrome is a temporary condition that affects the heart. In people with this condition, extreme emotional or physical stress (i.e. intense grief, anger, surprise, illness or surgery) can lead to heart muscle failure. Signs and symptoms of the condition mimic those of a heart attack and may include sudden chest pain, shortness of breath, and an irregular heartbeat.');
INSERT INTO disease (id, name, detail) VALUES (10, 'Salih Myopathy', 'Early-onset myopathy with fatal cardiomyopathy (EOMFC) is an inherited muscle disease that affects the skeletal muscles, which are used for movement, and the heart (cardiac) muscle. This condition is characterized by skeletal muscle weakness that becomes apparent in early infancy. Affected individuals have delayed development of motor skills, such as sitting, standing, and walking.');
INSERT INTO disease (id, name, detail) VALUES (11, 'Tmem70 Defect', 'Tmem70 Defect, also known as mitochondrial encephalo-cardio-myopathy due to isolated mitochondrial respiratory chain complex v deficiency, is related to mitochondrial complex v deficiency, nuclear type 2. Affiliated tissues include kidney and heart, and related phenotypes are microcephaly and low-set ears');
INSERT INTO disease (id, name, detail) VALUES (12, 'Grange Syndrome', 'Grange syndrome is a rare condition that primarily affects the blood vessels. It is characterized by narrowing (stenosis) or blockage (occlusion) of arteries that supply blood to various organs and tissues, including the kidneys, brain, and heart.');
INSERT INTO disease (id, name, detail) VALUES (13, 'Eales Disease', 'Eales disease is a rare vision disorder that appears as an inflammation and white haze around the outercoat of the veins in the retina. This condition is most common among young males and normally affects both eyes. In most cases, vision becomes suddenly blurred because the vitreous, the clear jelly that fills the eyeball behind the lens of the eye, seeps out.');
INSERT INTO disease (id, name, detail) VALUES (14, 'Bjornstad Syndrome', 'Björnstad syndrome is a rare disorder characterized by abnormal hair and hearing problems. Affected individuals have a condition known as pili torti, which means "twisted hair," so named because the strands appear twisted when viewed under a microscope.');
INSERT INTO disease (id, name, detail) VALUES (15, 'Deaf1-Associated Disorders', 'DEAF1-related disorders are neurologic diseases that mainly present with intellectual disability, speech impairment and motor developmental delay. Additional features that have being described include seizures, brain malformations, behavioral problems, autism, stomach and/or intestinal problems, and skeletal problems (flat foot or hip dislocation). Some people with DEAF1-related disorders may also have some features that resemble another disease known as Smith-Magenis syndrome, such as intellectual disability, dysmorphic features, and sleep disturbances.');
INSERT INTO disease (id, name, detail) VALUES (16, 'Perrault Syndrome 1', 'Perrault syndrome is a sex-influenced disorder characterized by sensorineural deafness in both males and females and ovarian dysgenesis in females. Some patients also have neurologic manifestations, including mild mental retardation and cerebellar and peripheral nervous system involvement (summary by Pierce et al., 2010).');
INSERT INTO disease (id, name, detail) VALUES (17, 'Temporal Lobe Epilepsy', 'Temporal Lobe Epilepsy, also known as epilepsy, temporal lobe, is related to epilepsy, familial temporal lobe, 1 and epilepsy, familial temporal lobe, 7, and has symptoms including seizures An important gene associated with Temporal Lobe Epilepsy is UCA1 (Urothelial Cancer Associated 1), and among its related pathways/superpathways are Neuroscience and Ca, cAMP and Lipid Signaling.');
INSERT INTO disease (id, name, detail) VALUES (18, 'Pancreas, Dorsal, Agenesis of', 'Agenesis of the dorsal pancreas describes a congenital malformation of the pancreas in which either the entire dorsal pancreas or part of the dorsal pancreas fails to develop (complete agenesis or partial agenesis, respectively).');
INSERT INTO disease (id, name, detail) VALUES (19, 'Pancreatic Agenesis 1', 'Pancreatic agenesis 1: A disease characterized by isolated hypoplasia or agenesis of the pancreas, pancreatic beta-cell failure resulting in neonatal insulin- dependent diabetes mellitus, and exocrine pancreatic insufficiency.');
INSERT INTO disease (id, name, detail) VALUES (20, 'Hidradenoma', 'A sweat gland benign neoplasm that is located in an apical sweat gland.');
INSERT INTO disease (id, name, detail) VALUES (21, 'Sialolithiasis', 'Sialolithiasis, also known as stone of salivary gland or duct, is related to nephrolithiasis and nephrolithiasis, calcium oxalate.');
INSERT INTO disease (id, name, detail) VALUES (22, 'Behr Syndrome', 'Behr syndrome is a clinical term that refers to the constellation of early-onset optic atrophy accompanied by neurologic features, including ataxia, pyramidal signs, spasticity, and mental retardation (Behr, 1909; Thomas et al., 1984).');
INSERT INTO disease (id, name, detail) VALUES (23, 'Eye Disease', 'ome eye problems are minor and do not last long. But some can lead to a permanent loss of vision. Common eye problems include Refractive errors Cataracts - clouded lenses Optic nerve disorders, including glaucoma Retinal disorders - problems with the nerve layer at the back of the eye Macular degeneration');
INSERT INTO disease (id, name, detail) VALUES (24, 'Trichomegaly', 'Familial isolated trichomegaly is a rare genetic hair anomaly characterized by a prolonged anagen phase of the eyelash hairs, leading to extreme eyelash growth that may result in corneal irritation.');
INSERT INTO disease (id, name, detail) VALUES (25, 'Visual Agnosia', 'An agnosia that is a loss of the ability to visually recognize objects.');
INSERT INTO disease (id, name, detail) VALUES (26, 'Spastic Ataxia', 'A hereditary ataxia that is characterized by early onset of cerebellar ataxia, pyramidal tract signs and peripheral neuropathy.');
INSERT INTO disease (id, name, detail) VALUES (27, 'Melanoma', 'Melanoma is a type of skin cancer that begins in pigment-producing cells called melanocytes. This cancer typically occurs in areas that are only occasionally sun-exposed; tumors are most commonly found on the back in men and on the legs in women.');
INSERT INTO disease (id, name, detail) VALUES (28, 'Ocular Melanoma', 'Intraocular melanoma is a cancer of the pigment-producing cells (melanocytes) in the middle layer of the eye, called the uveal tract. The uveal tract has 3 main parts: (1) the choroid (the tissue layer filled with blood vessels).');
INSERT INTO disease (id, name, detail) VALUES (29, 'Amelanotic Melanoma', 'Amelanotic Melanoma, also known as melanoma, amelanotic, is related to albinism and oculocutaneous albinism. An important gene associated with Amelanotic Melanoma is TYR (Tyrosinase), and among its related pathways/superpathways are Senescence and Autophagy in Cancer and AIF Pathway.');
INSERT INTO disease (id, name, detail) VALUES (30, 'Momo Syndrome', 'MOMO syndrome was named for the features associated with the syndrome including macrosomia (being larger than expected from birth), obesity, macrocephaly (having a large head size) and ocular (eye) abnormalities.');


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


INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (11, 'Ciobanu', 28, 'Mihai', 0732878234, 'Str. Mihai Viteazu', 'Male', 1.75, 85, 'Romania', 'Bucuresti', '', '', 'mihai.ciobanu@gmail.com', 'MihaiC', 1);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (12, 'Feraru', 35, 'Andrei', 0770456852, 'Str. Mihai Viteazu', 'Male', 1.80, 95, 'Romania', 'Ilfov', '', '', 'andrei.25@gmail.com', 'Andrei', 1);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (13, 'Baciu', 49, 'Alexandru', 0764753984, 'Str. Mihai Viteazu', 'Male', 1.70, 74, 'Romania', 'Ilfov', '', '', 'alexandru67@gmail.com', 'Alexandru', 1);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (14, 'Amariei', 24, 'Maria', 0775143964, 'Str. Mihai Viteazu', 'Female', 1.67, 65, 'Romania', 'Ilfov', '', '', 'maria.ioana@gmail.com', 'Maria', 1);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (15, 'Burcea', 26, 'Alina', 0728941285, 'Str. Mihai Viteazu', 'Female', 1.71, 68, 'Romania', 'Bucuresti', '', '', 'alina.b@gmail.com', 'Alina', 3);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (16, 'Zefiru', 19, 'Mihaela', 0762180180, 'Str. Mihai Viteazu', 'Female', 1.60, 54, 'Romania', 'Constanta', '', '', 'mihaela.vasile@gmail.com', 'Mihaela', 3);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (17, 'Floroaei', 50, 'Ionut', 0736549108, 'Str. Mihai Viteazu', 'Male', 1.87, 72, 'Romania', 'Constanta', '', '', 'ionutcla@gmail.com', 'Ionut', 2);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (18, 'Filipescu', 68, 'Bogdan', 0770904760, 'Str. Mihai Viteazu', 'Male', 1.90, 105, 'Romania', 'Costinesti', '', '', 'bogdan.t@gmail.com', 'Bogdan', NULL);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (19, 'Mosneagu', 52, 'Flavia', 0734001009, 'Str. Mihai Viteazu', 'Female', 1.58, 49, 'Romania', 'Cluj', '', '', 'flavia95@gmail.com', 'Flavia', NULL);
INSERT INTO patients (id, name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery, email, username, d_id) VALUES (20, 'Petcu', 21, 'Florin', 0779002755, 'Str. Mihai Viteazu', 'Male', 1.98, 115, 'Romania', 'Cluj', '', '', 'florin.gheorghe@gmail.com', 'Florin', NULL);

