CREATE table patient (
    num_p int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_p varchar(100) NOT NULL,
    no_ss varchar(100)
);

-- Ligne

CREATE TABLE medecin (
    matricule INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_medecin varchar(100) NOT NULL,
);

ALTER TABLE medecin

ADD PRIMARY KEY (`matricule`);

-- Ligne

CREATE TABLE consultation (
    n_consultation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_consultation date NOT NULL,
    medecin_matricule_id INT NOT NULL,
    patient_num_P_id int NOT NULL
    );

ALTER TABLE consultation

ADD PRIMARY KEY (`n_consultation`);
ADD CONSTRAINT `fk_doctor_id` FOREIGN KEY medecin_matricule_id REFERENCES medecin(matricule);
ADD CONSTRAINT `fk_patient_id` FOREIGN KEY patient_num_P_id REFERENCES patient(num_p);

-- Ligne

CREATE TABLE medicament (
    medicine_code INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    libelle varchar(255)
)

-- Ligne

CREATE TABLE prescrit (
    nb_prise int(50),
    medicine_code_id INT NOT NULL,
    consultation_id INT NOT NULL
)

ALTER TABLE prescrit 

ADD PRIMARY KEY (`n_consultation`);
ADD CONSTRAINT `fk_medecine_code_id` FOREIGN KEY medicine_code_id REFERENCES medicament(medicine_code);
ADD CONSTRAINT `fk_consultation` FOREIGN KEY consultation_id REFERENCES consultation(n_consultation) ON DELETE SET NULL;

-- Ligne