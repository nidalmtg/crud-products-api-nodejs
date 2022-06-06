-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 05 juin 2022 à 17:36
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `catalogue`
--

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` varchar(36) NOT NULL,
  `description` varchar(512) NOT NULL,
  `image` varchar(256) NOT NULL,
  `type` varchar(255) NOT NULL,
  `quantite` int NOT NULL,
  `libelle` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `description`, `image`, `type`, `quantite`, `libelle`) VALUES
('0894efa7-8787-4987-91b7-816cd8c0a84a', 'Le Asus Zenbook 13 OLED (UX325EA) est la version Intel 11e gen de l\'itération du Zenbook 13 2021 avec un écran IPS LCD. Il est équipé d\'une batterie de 67 Wh qui se recharge par USB C 65W. Il est disponible en plusieurs configurations CPU/RAM/Stockage.', 'asus-zenbook-13-oled-um325.png', 'Ordinateur', 136, 'Asus ZenBook 13 OLED (UX325EA)'),
('38d96419-d21f-4c7f-ad80-4a0bb950187a', 'Les Fire HD d’Amazon proposent depuis plusieurs années des alternatives pas chères. Disponibles pour une centaine d’euros en fonction des configurations, elles permettent de remplir les fonctions basiques que l’on attend d’une tablette : du multimédia et de la navigation web.', 'amazon-fire-hd-8-2020.png', 'Tablette', 726, 'Amazon Fire HD 8 2020'),
('3f7422b9-1282-4130-a292-ee072528565a', 'Sur sa cuvée 2022, l’iPad Air voit sa comparaison avec l’iPad Pro être encore plus pertinente. La nouvelle version de la tablette est équipée d’un processeur Apple M1 venant remplacer la puce Bionic. La promesse est de vous offrir une puissance déjà aperçue sur les MacBook ou même les iPad Pro.', 'ipad-air-m1-2022.png', 'Tablette', 308, 'Apple iPad Air M1 (2022)'),
('3f7f1e9c-93d1-451b-8ba1-3fb9974f6bf9', 'Le Xiaomi Redmi Note 11 est l\'un des 4 smartphones de la gamme Note 11 de Xiaomi Redmi. Il se positionne comme une version plus accessible du Redmi Note 11 5G avec un SoC Qualcomm Snapdragon 680 4G épaulé par 4 Go ou 6 Go de RAM et 64 ou 128 Go de stockage, un écran AMOLED de 6,43 pouces 90Hz et un module photo polyvalent avec un capteur principal de 50 mégapixels. Il dispose également d\'une batterie de 5000 mAh compatible recharge rapide 33W.', 'xiaomi-redmi-note-11_1654378168048.png', 'Téléphone', 197, 'Xiaomi Redmi Note 11'),
('4a7a2e62-29f1-4a28-97e0-e0d2903507cd', 'La gamme des Yoga Tab propose une toute nouvelle version avec un écran de 13 pouces. La Lenovo Yoga Tab 13 pouces, mise sur un usage très polyvalent tourné vers le multimédia.', 'xiaomi-mi-pad-5.png', 'Tablette', 169, 'Xiaomi Pad 5'),
('51931b0d-d717-431d-a9c3-b3301156f9b0', 'Le Samsung Galaxy S22 Ultra est l\'un 3 smartphones de la gamme Galaxy S22 annoncé le 9 février 2022. Il est équipé d\'un SoC Exynos 2200 épaulé par 8 ou 12 Go de RAM et 128, 256 ou 512 Go de stockage. Il est équipé d\'un écran AMOLED 120 Hz de 6,8 pouces et d\'un quadruple capteur photo polyvalent de 108+10+10+12 mégapixels. Il dispose également d\'une batterie de 5000 mAh compatible recharge rapide 45W et recharge sans fil 15W.', 'samsung-galaxy-s22-ultra.png', 'Téléphone', 132, 'Samsung Galaxy S22 Ultra'),
('754ceb2f-1aae-495b-8b5d-ba7674cc2358', 'La gamme des Yoga Tab propose une toute nouvelle version avec un écran de 13 pouces. La Lenovo Yoga Tab 13 pouces, mise sur un usage très polyvalent tourné vers le multimédia.', 'lenovo-yoga-tab-13.png', 'Tablette', 505, 'Lenovo Yoga Tab 13'),
('850b94d8-8d65-4920-b028-d383de33f7da', 'iPad description écran Full HD', 'ipad_1654378227102.png', 'Tablette', 150, 'Apple iPad Pro 2021'),
('995dd58b-5e81-4e5b-9e74-1054043cf92a', 'Galaxy Tab S8 description écran superbe HDR10 et éclairage OLED', 'tab-s8_1654376829288.png', 'Tablette', 200, 'Galaxy Tab S8'),
('9ecbaf38-3510-4c1f-a442-db4aee9a885d', 'La nouvelle itération de Apple est exceptionnelle. Dotée d\'un écran rétina et d\'une puce A9X', 'iphone13.png', 'Téléphone', 500, 'iPhone 13'),
('acbe68e6-646d-4f83-bf90-6765af8ea6e0', 'MacBook Pro 2021 avec sa nouvelle puce M1. Très performante pour lorem ipsum', 'macbook-pro.png', 'Ordinateur', 300, 'Macbook Pro 2021'),
('afb2a140-e031-4fff-8960-ce23845e8148', 'Le PC portable Samsung Galaxy Book 2 Pro 360 annoncé en 2022, successeur du modèle \"Samsung Galaxy Book Pro 360\" de 2021 se munit d\'un écran super AMOLED de 15.6 pouces, processeur Intel i7 de 12ème génération et GPU Intel Iris Xe, le tout couplé jusqu\'à 16 Go de RAM et 512 Go de SSD. Côté connectivité, de la Wi-Fi 6E, la compatibilité S-Pen et sa fonction 2-en-1 sont de la partie. La marque assure une autonomie maximale de 21 heures.', 'samsung-galaxy-book-2-pro-360.png', 'Ordinateur', 236, 'Samsung Galaxy Book 2 Pro 360 (2022)'),
('c0a5ac57-4d3d-48ec-926f-32e2a9ca2057', 'Avec ses deux écrans, le Samgsung Galaxy 7 fold 3 est le summum de l\'innovation avec son écran large pliable', 'zfold3.png', 'Téléphone', 600, 'Galaxy Z Fold 3'),
('c1a86fca-2693-4d92-aa7d-261c305a81f9', 'Annoncé en 2022, le OnePlus 10 Pro, fleuron de la marque s\'équipe d\'un écran AMOLED de 6.7 pouces rafraîchi à 120 Hz compatible HDR10+. Il est animé par un SoC Qualcomm Snapdragon 8 Gen1 couplé jusqu\'à 12 Go de RAM et 256 Go de stockage. Il possède un bloc de trois capteurs photo à l\'arrière : un grand-angle de 48 mégapixels, un téléobjectif de 8 mégapixels avec un zoom optique x3.3 et un ultra grand-angle de 50 mégapixels (le tout signé Hasselblad). Sa batterie de 5000 mAh est compatible charge rapide (80 ', 'oneplus-10-pro.png', 'Téléphone', 485, 'OnePlus 10 Pro'),
('d0420acf-a2ae-467d-a6d9-2dbc036f63f4', 'Annoncé au CES 2022 de Las Vegas, le PC portable Dell Alienware x14 propose un écran FHD de 14 pouces avec un taux de rafraîchissement de 144 Hz, compatible NVIDIA G-Sync et Dolby Vision. Il est alimenté par un processeur Intel Core i7 de 12ème génération et un GPU NVIDIA GeForce RTX 3060 (pour sa version la plus musclée), le tout couplé jusqu\'à 32 Go de RAM et 2 To de SSD.', 'dell-alienware-x14.png', 'Ordinateur', 458, 'Dell Alienware x14'),
('e50eefda-a118-4d25-81c3-3fcc29b92dfd', 'L\'Acer Chromebook CB317 annoncé en 2021 est le premier Chromebook au format 17 pouces. Son écran LCD peut être tactile selon la version choisie. Côté autonomie, la marque assure 10 heures d\'utilisation. Côté connectique il dispose de 2 ports USB 3.2 Type-C ainsi que d\'autres ports supplémentaires pour diversifier son utilisation.', 'acer-chromebook-cb317-2021.png', 'Ordinateur', 363, 'Acer Chromebook 317 2021 (CB317-1H)'),
('f68d96c5-285c-4900-91d1-df1ecbcc8c82', 'Annoncé en février 2022, l\'Oppo Find X5 Pro, le modèle plus haut de gamme de la famille \"Oppo Find X5\" se présente comme un smartphone ultra premium avec un écran WQHD+ AMOLED LTPO de 6.7 pouces rafraîchi à 120 Hz, animé par un SoC Qualcomm Snapdragon 8 Gen1, couplé à 12 Go de RAM et 256 Go de stockage. A l\'arrière se trouve un bloc photo signé Hasselblad avec 3 capteurs : un grand-angle de 50 mégapixels, un ultra grand-angle de 50 mégapixels et un téléobjectif de 13 mégapixels avec un zoom optique x2 et...', 'oppo-find-x5-pro.png', 'Téléphone', 282, 'Oppo Find X5 Pro');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
('1167de9a-ef7b-4e4d-8ee9-6356e4364b87', 'nidalmtg', '$2b$10$SpHLNQ5UyGkxRgY6AYFyqObRQ0xGn5/ejQ8bj2MWhPJ1o3ZQhOmey'),
('4c71cec3-cab8-4bb7-acae-c2e303dce7b7', 'nidalmtg2', '$2b$10$bFzlwvAf1acIk8sLino1/uzRZPENa8e5qt/axg5X3Tbk5S0Z5WCDi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
