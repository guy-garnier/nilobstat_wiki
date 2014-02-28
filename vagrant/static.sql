CREATE DATABASE nilobstat_wiki CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Création du compte utilisateur pour l'accès web.
CREATE USER 'wikiuser'@'localhost' IDENTIFIED BY 'wikiuser';
GRANT ALL PRIVILEGES ON nilobstat_wiki TO 'wikiuser'@'localhost';

-- Création du compte admin
CREATE USER 'wikiadmin'@'localhost' IDENTIFIED BY 'wikiadmin';
GRANT ALL PRIVILEGES ON nilobstat_wiki TO 'wikiadmin'@'localhost';
