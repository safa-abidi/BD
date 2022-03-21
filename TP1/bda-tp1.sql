-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 09 fév. 2022 à 17:36
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bda-tp1`
--

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `departement_id` int(11) NOT NULL,
  `nom_departement` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`departement_id`, `nom_departement`) VALUES
(1, 'IRT'),
(2, 'IGL'),
(3, 'ILA');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `email_etudiant`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `email_etudiant` (
`Nom` varchar(25)
,`Prenom` varchar(25)
,`Email` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `enseignant_id` int(11) NOT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `grade` varchar(25) DEFAULT NULL CHECK (`grade` in ('vacataire','moniteur','ater','MCF','PROF')),
  `telephone` varchar(10) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`enseignant_id`, `departement_id`, `nom`, `prenom`, `grade`, `telephone`, `fax`, `email`) VALUES
(1, 1, 'ousteith', 'ouahed', 'MCF', '4185', '4091', 'ousteith@gmail.com'),
(2, 1, 'ousteitha', 'wahida', 'PROF', NULL, NULL, 'wahida@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

CREATE TABLE `enseignement` (
  `enseignement_id` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  `intitule` varchar(60) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`enseignement_id`, `departement_id`, `intitule`, `description`) VALUES
(1, 1, 'Bases de Données\r\nRelationnelles', 'Niveau Licence (L3) : Modélisation E/A et UML, Modèle\r\nrelationnel, Algèbre Relationnelle, Calcul relationel, SQL, dépendances\r\nfonctionnelles et formes normales'),
(2, 1, 'Langage C++', 'Niveau Master 1'),
(3, 1, 'Mise à Niveau Bases de\r\nDonnées', 'Niveau Master 2 - Programme Licence et Master 1 en Bases de\r\nDonnées');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `Etudiant_ID` int(11) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Date_Naissance` date NOT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Ville` varchar(25) DEFAULT NULL,
  `Code_Postal` varchar(9) DEFAULT NULL,
  `Telephone` varchar(10) DEFAULT NULL,
  `Fax` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`Etudiant_ID`, `Nom`, `Prenom`, `Date_Naissance`, `Adresse`, `Ville`, `Code_Postal`, `Telephone`, `Fax`, `Email`) VALUES
(1, 'ben foulen', 'foulen', '1979-02-18', '50,Rue des alouettes', 'TUNIS', '75021', '0143567890', NULL, 'foulen@gmail.com'),
(2, 'tounsi', 'ahmed', '1980-08-23', '10, Avenue\r\ndes marguerites', 'bardo', '40000', '0678567801', NULL, 'pat@yahoo.fr'),
(3, 'tounsi', 'Jamal', '1978-05-12', '25,\r\nBoulevard des\r\nfleurs', 'TUNIS', '75022', '0145678956', '0145678956', 'odent@free.fr'),
(4, 'benmard', 'ahmed', '1979-07-15', '56,\r\nBoulevard des\r\nfleurs', 'TUNIS', '75022', '0678905645', NULL, 'deby@hotmail.com'),
(5, 'foulana', 'tounsia', '1979-08-15', '45,\r\nAvenue des abeilles', 'ariana', '75022', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `Reservation_ID` int(11) NOT NULL,
  `Batiment` varchar(1) NOT NULL,
  `Numero_Salle` varchar(10) NOT NULL,
  `enseignement_id` int(11) NOT NULL,
  `Departement_ID` int(11) NOT NULL,
  `enseignant_id` int(11) NOT NULL,
  `Date_Resa` date NOT NULL DEFAULT curdate(),
  `Heure_Debut` time NOT NULL DEFAULT curtime(),
  `Heure_Fin` time NOT NULL DEFAULT '23:00:00',
  `Nombre_Heures` int(11) NOT NULL CHECK (`Nombre_Heures` >= 1)
) ;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`Reservation_ID`, `Batiment`, `Numero_Salle`, `enseignement_id`, `Departement_ID`, `enseignant_id`, `Date_Resa`, `Heure_Debut`, `Heure_Fin`, `Nombre_Heures`) VALUES
(1, 'B', '022', 1, 1, 1, '2008-10-15', '08:30:00', '11:45:00', 3),
(2, 'B', '022', 1, 1, 2, '2008-11-04', '08:30:00', '11:45:00', 3),
(3, 'B', '022', 1, 1, 2, '2008-11-07', '08:30:00', '11:45:00', 3),
(4, 'B', '020', 1, 1, 1, '2008-10-15', '08:30:00', '11:45:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `batiment` varchar(1) NOT NULL,
  `numero_salle` varchar(10) NOT NULL,
  `capacite` int(11) DEFAULT NULL CHECK (`capacite` > 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`batiment`, `numero_salle`, `capacite`) VALUES
('A', '301', 45),
('B', '020', 15),
('B', '022', 15),
('C', 'Amphi 4', 200),
('C', 'Amphi 8', 500);

-- --------------------------------------------------------

--
-- Structure de la vue `email_etudiant`
--
DROP TABLE IF EXISTS `email_etudiant`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `email_etudiant`  AS SELECT `etudiant`.`Nom` AS `Nom`, `etudiant`.`Prenom` AS `Prenom`, `etudiant`.`Email` AS `Email` FROM `etudiant` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`departement_id`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`enseignant_id`),
  ADD KEY `departement_id` (`departement_id`);

--
-- Index pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD PRIMARY KEY (`enseignement_id`,`departement_id`),
  ADD KEY `FK_departement` (`departement_id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`Etudiant_ID`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_ID`),
  ADD KEY `FK_Reservation_Salle` (`Batiment`,`Numero_Salle`),
  ADD KEY `FK_Reservation_Enseignement` (`enseignement_id`,`Departement_ID`),
  ADD KEY `FK_Reservation_Enseignant` (`enseignant_id`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`batiment`,`numero_salle`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `FK_enseignant` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`departement_id`),
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`departement_id`);

--
-- Contraintes pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `FK_departement` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`departement_id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_Reservation_Enseignant` FOREIGN KEY (`Enseignant_ID`) REFERENCES `enseignant` (`enseignant_id`),
  ADD CONSTRAINT `FK_Reservation_Enseignement` FOREIGN KEY (`Enseignement_ID`,`Departement_ID`) REFERENCES `enseignement` (`enseignement_id`, `departement_id`),
  ADD CONSTRAINT `FK_Reservation_Salle` FOREIGN KEY (`Batiment`,`Numero_Salle`) REFERENCES `salle` (`batiment`, `numero_salle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
