-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 27 juin 2021 à 16:48
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pfa_con`
--

-- --------------------------------------------------------

--
-- Structure de la table `covoiturage`
--

CREATE TABLE `covoiturage` (
  `id` bigint(20) NOT NULL,
  `nbr_places` int(11) NOT NULL,
  `trajet_id` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

CREATE TABLE `trajet` (
  `id` bigint(20) NOT NULL,
  `type_trajet` varchar(20) NOT NULL,
  `villarrive` varchar(64) NOT NULL,
  `cout` int(11) NOT NULL,
  `date_arrivee` datetime DEFAULT NULL,
  `datedepart` datetime DEFAULT NULL,
  `nbr_places` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `villedepart` varchar(45) NOT NULL,
  `id_user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`id`, `type_trajet`, `villarrive`, `cout`, `date_arrivee`, `datedepart`, `nbr_places`, `status`, `villedepart`, `id_user`) VALUES
(4, 'Ponctuel', 'Bni Drar', 11, '2021-06-30 11:55:42', '2021-06-30 11:55:39', 1, 0, 'Oujda', 1),
(6, 'Ponctuel', 'Agadir', 10, '2021-06-24 03:00:00', '2021-06-24 11:35:50', 4, 0, 'Oujda', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `roole` varchar(255) DEFAULT NULL,
  `state` bit(1) NOT NULL,
  `tel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `gender`, `nom`, `pass`, `prenom`, `roole`, `state`, `tel`) VALUES
(1, 'youness@gmail.com', 'femme', 'bahi', '$2a$10$GarHPGSEoh.pG12ADdeywOkwLpdl6G/NM.5wvuKNRoiRz3qI91dAW', 'YOUNESS', NULL, b'0', '0606223344'),
(2, 'imades@gmail.com', 'femme', 'AAAA', '$2a$10$Jp2b2SHDy9xWi2/PAQqu5eGuDs/0XSim8JEXWqAvCC8qMmIX7KfmS', 'IMADES', NULL, b'0', '0606443322'),
(3, 'im@gmail.com', 'homme', 'IMAD', '$2a$10$SQI6TBvU88AJW74bsqdR.ONqLr4iNk88r.J53uqVKRrF1aUXiKKfC', 'IMAD', 'ROLE_USER', b'1', '0606331122');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `covoiturage`
--
ALTER TABLE `covoiturage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlo4sqimwhoknekbqay74ee5c6` (`trajet_id`),
  ADD KEY `FKarqfccqkwp0hn1eyqtkerp0tj` (`id_user`);

--
-- Index pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgn9mnmylurs6y3wck84ovp4pm` (`id_user`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `covoiturage`
--
ALTER TABLE `covoiturage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `covoiturage`
--
ALTER TABLE `covoiturage`
  ADD CONSTRAINT `FKarqfccqkwp0hn1eyqtkerp0tj` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKlo4sqimwhoknekbqay74ee5c6` FOREIGN KEY (`trajet_id`) REFERENCES `trajet` (`id`);

--
-- Contraintes pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `FKgn9mnmylurs6y3wck84ovp4pm` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
