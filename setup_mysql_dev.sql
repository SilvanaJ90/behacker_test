-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS test_profile_db;
CREATE USER IF NOT EXISTS 'test_bh_dev'@'localhost' IDENTIFIED BY 'test_bh_pwd';
GRANT ALL ON `test_profile_db`.* TO 'test_bh_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'test_bh_dev'@'localhost';
FLUSH PRIVILEGES;

