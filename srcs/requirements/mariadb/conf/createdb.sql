CREATE DATABASE IF NOT EXISTS db_name;

USE db_name;

CREATE TABLE IF NOT EXISTS users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO users (username, email, password) VALUES
('jrasser', 'jrasser@example.com', 'jrasser'),
('invite', 'invite@example.com', 'invite');


-- CREATE DATABASE JrasserDB;
-- CREATE USER 'jmr'@'%' IDENTIFIED BY 'password';
-- GRANT ALL PRIVILEGES ON DVSGroupDB.* TO 'jmr'@'%';
-- FLUSH PRIVILEGES;

-- ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';