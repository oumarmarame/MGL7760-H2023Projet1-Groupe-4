USE `biblio`;

--
-- Base de données : `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id_auteur` int(11) NOT NULL,
  `nom_auteur` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auteur_livre`
--

CREATE TABLE `auteur_livre` (
  `id` int(11) NOT NULL,
  `id_auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_cat` int(11) NOT NULL,
  `code_cat` varchar(15) NOT NULL,
  `nom_cat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_livre`
--

CREATE TABLE `categorie_livre` (
  `id` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `id_editeur` int(11) NOT NULL,
  `nom_editeur` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `titre` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `annee_apparition` year NOT NULL,
  `image` varchar(100) NOT NULL,
  `categorie` varchar(15) NOT NULL,
  `date_creation` year NOT NULL,
  `date_modification` year NOT NULL,
  `id_editeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT INTO `livre` (`titre`, `description`, `isbn`, `annee_apparition`, `image`) VALUES ('The Pragmatic Programmer', '', '135957052', 'STR_TO_DATE("10-17-2021 15:40:10", "%m-%d-%Y %H:%i:%s")', '');

-- BEGIN;
--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id_auteur`);

--
-- Index pour la table `auteur_livre`
--
ALTER TABLE `auteur_livre`
  ADD PRIMARY KEY (`id`,`id_auteur`),
  ADD KEY `id_auteur` (`id_auteur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_cat`);

--
-- Index pour la table `categorie_livre`
--
ALTER TABLE `categorie_livre`
  ADD PRIMARY KEY (`id`,`id_cat`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`id_editeur`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_editeur` (`id_editeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id_auteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `editeur`
--
ALTER TABLE `editeur`
  MODIFY `id_editeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auteur_livre`
--
ALTER TABLE `auteur_livre`
  ADD CONSTRAINT `auteur_livre_ibfk_1` FOREIGN KEY (`id`) REFERENCES `livre` (`id`),
  ADD CONSTRAINT `auteur_livre_ibfk_2` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id_auteur`);

--
-- Contraintes pour la table `categorie_livre`
--
ALTER TABLE `categorie_livre`
  ADD CONSTRAINT `categorie_livre_ibfk_1` FOREIGN KEY (`id`) REFERENCES `livre` (`id`),
  ADD CONSTRAINT `categorie_livre_ibfk_2` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id_cat`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_editeur`) REFERENCES `editeur` (`id_editeur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
COMMIT;
