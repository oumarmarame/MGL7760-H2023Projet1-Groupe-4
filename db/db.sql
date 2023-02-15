
CREATE TABLE `Auteur` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `Auteur` (`id`, `nom`) VALUES
(1, 'Yvon'),
(2, 'Charle');



CREATE TABLE `Categorie` (
  `id` int(11) NOT NULL,
  `code` text NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `Categorie` (`id`, `code`, `nom`) VALUES
(1, 'fb', 'format broche'),
(2, 'fn', 'format Numérique');



CREATE TABLE `Editeur` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `Editeur` (`id`, `nom`) VALUES
(1, 'oumar'),
(2, 'Ahmat');



CREATE TABLE `Livre` (
  `id` int(11) NOT NULL,
  `titre` text NOT NULL,
  `description` text NOT NULL,
  `isbn` int(11) NOT NULL,
  `annee_apparition` text NOT NULL,
  `image` text NOT NULL,
  `categorie` text NOT NULL,
  `date_creation` text NOT NULL,
  `date_modification` text NOT NULL,
  `idediteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `Livre` (`id`, `titre`, `description`, `isbn`, `annee_apparition`, `image`, `categorie`, `date_creation`, `date_modification`, `idediteur`) VALUES
(1, 'Java', 'Programme', 231551, '2019', 'image', 'Oriente', '2012', '2018', 1),
(2, 'java ', 'programme', 23112, '2014', 'image', 'informatique', '2013', '2019', 1);



CREATE TABLE `LivreAuteur` (
  `idlivre` int(11) NOT NULL,
  `idauteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `LivreAuteur` (`idlivre`, `idauteur`) VALUES
(1, 2);



CREATE TABLE `LivreCategorie` (
  `idlivre` int(11) NOT NULL,
  `idcategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `LivreCategorie` (`idlivre`, `idcategorie`) VALUES
(1, 1),
(1, 2);


ALTER TABLE `Auteur`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `Editeur`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `Livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idediteur` (`idediteur`);


ALTER TABLE `LivreAuteur`
  ADD PRIMARY KEY (`idlivre`,`idauteur`),
  ADD KEY `idlivre` (`idlivre`,`idauteur`),
  ADD KEY `idauteur` (`idauteur`);


ALTER TABLE `LivreCategorie`
  ADD PRIMARY KEY (`idlivre`,`idcategorie`),
  ADD KEY `idlivre` (`idlivre`,`idcategorie`),
  ADD KEY `idcategorie` (`idcategorie`);


ALTER TABLE `Livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`idediteur`) REFERENCES `Editeur` (`id`) ON UPDATE CASCADE;


ALTER TABLE `LivreAuteur`
  ADD CONSTRAINT `livreauteur_ibfk_1` FOREIGN KEY (`idlivre`) REFERENCES `Livre` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `livreauteur_ibfk_2` FOREIGN KEY (`idauteur`) REFERENCES `Auteur` (`id`) ON UPDATE CASCADE;


ALTER TABLE `LivreCategorie`
  ADD CONSTRAINT `livrecategorie_ibfk_1` FOREIGN KEY (`idlivre`) REFERENCES `Livre` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `livrecategorie_ibfk_2` FOREIGN KEY (`idcategorie`) REFERENCES `Categorie` (`id`) ON UPDATE CASCADE;
COMMIT;

