CREATE TABLE Etudiant (
    Etudiant_ID integer,
    Nom varchar(25) NOT NULL,
    Prenom Varchar(25) NOT NULL,
    Date_Naissance date NOT NULL,
    Adresse Varchar(50) DEFAULT NULL,
    Ville Varchar(25) DEFAULT NULL,
    Code_Postal Varchar(9) DEFAULT NULL,
    Telephone Varchar(10) DEFAULT NULL,
    Fax Varchar(10) DEFAULT NULL,
    Email Varchar(100) DEFAULT NULL,
    CONSTRAINT PK_Etudiant PRIMARY KEY (Etudiant_ID)
);
create table salle (
    batiment varchar(1),
    numero_salle varchar(10),
    capacite integer,
    constraint PK_sale PRIMARY KEY (batiment, numero_salle)
);
create table departement (
    departement_id integer,
    nom_departement varchar(25),
    constraint PK_departement PRIMARY KEY (departement_id),
    constraint Uniq_nom UNIQUE (nom_departement)
);
create table enseignement (
    enseignement_id integer,
    departement_id integer,
    intitule varchar(60),
    description varchar(1000),
    constraint PK_enseignement primary key (enseignement_id, departement_id),
    constraint FK_departement_enseignement foreign key (departement_id) references departement (departement_id)
);
create table enseignant (
    enseignant_id integer,
    departement_id integer,
    nom varchar(25),
    prenom varchar(25),
    grade varchar(25),
    telephone varchar(10),
    fax varchar(10),
    email varchar(10),
    constraint PK_enseignant_id primary key (enseignant_id),
    constraint FK_enseignant_departement foreign key (departement_id) references departement (departement_id)
);
CREATE OR REPLACE VIEW Email_Etudiant AS
SELECT Nom,
    Prenom,
    Email
FROM Etudiant;

CREATE TABLE Reservation (
    Reservation_ID integer,
    Batiment varchar(1) NOT NULL,
    Numero_Salle varchar(10) NOT NULL,
    Enseignement_ID integer NOT NULL,
    Departement_ID integer NOT NULL,
    Enseignant_ID integer NOT NULL,
    Date_Resa date NOT NULL DEFAULT CURRENT_DATE,
    Heure_Debut time NOT NULL DEFAULT CURRENT_TIME,
    Heure_Fin time NOT NULL DEFAULT '23:00:00',
    Nombre_Heures integer NOT NULL,
    CONSTRAINT PK_Reservation PRIMARY KEY (Reservation_ID),
    CONSTRAINT "FK_Reservation_Salle" FOREIGN KEY (Batiment, Numero_Salle) REFERENCES Salle (Batiment, Numero_Salle) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT "FK_Reservation_Enseignement" FOREIGN KEY (Enseignement_ID, Departement_ID) REFERENCES Enseignement (Enseignement_ID, Departement_ID) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT "FK_Reservation_Enseignant" FOREIGN KEY (Enseignant_ID) REFERENCES Enseignant (Enseignant_ID) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT CK_Reservation_Nombre_Heures CHECK (Nombre_Heures >= 1),
    CONSTRAINT CK_Reservation_HeureDebFin CHECK (
        Heure_Debut < Heure_Fin
    )
);