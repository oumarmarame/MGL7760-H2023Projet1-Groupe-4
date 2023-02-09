USE `biblio`;

DROP TABLE IF EXISTS `livre`;

-- CREATE TABLE `auteur` (
--   `id_auteur` int(11) NOT NULL,
--   `nom_auteur` varchar(30) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `annee_apparition` date NOT NULL,
  `image` varchar(100) NOT NULL,
  `categorie` varchar(15) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  `id_editeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `livre` (titre, description, isbn, annee_apparition, image, categorie, date_creation, date_modification, id_editeur)