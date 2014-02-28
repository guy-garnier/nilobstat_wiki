CREATE DATABASE application CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON application.* TO 'app_user'@'%' IDENTIFIED BY 'app_user' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON application.* TO 'app_user'@'localhost' IDENTIFIED BY 'app_user' WITH GRANT OPTION;
FLUSH PRIVILEGES;
