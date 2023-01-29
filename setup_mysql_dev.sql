-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS bh_profile_db;
CREATE USER IF NOT EXISTS 'bh_profile_dev'@'localhost' IDENTIFIED BY 'bh_profile_pwd';
GRANT ALL ON `bh_profile_db`.* TO 'bh_profile_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bh_profile_dev'@'localhost';
FLUSH PRIVILEGES;

