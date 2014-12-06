CREATE DATABASE web2014 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

﻿set character_set_results=euckr;
set character_set_client=euckr;

GRANT ALL ON web2014.* TO 'web' IDENTIFIED BY 'asdf';

use web2014;

CREATE TABLE users (
   Userid INT AUTO_INCREMENT PRIMARY KEY, 
   id VARCHAR(100) NOT NULL UNIQUE,
   pass VARCHAR(100) NOT NULL UNIQUE,
   name VARCHAR(100) NOT NULL,
   photo VARCHAR(255)
);

CREATE TABLE keyword (
	id INT AUTO_INCREMENT PRIMARY KEY,
	keyword VARCHAR(50) UNIQUE,
	count INT
)ENGINE=innodb;

CREATE TABLE posts (
   post_id INT AUTO_INCREMENT PRIMARY KEY, 
   title VARCHAR(100) NOT NULL,
   writer VARCHAR(100) NOT NULL,
   content TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   count INT,
   post_like INT,
   post_dislike INT,
   keyword VARCHAR(50) NOT NULL,
   FOREIGN KEY(keyword) REFERENCES keyword(keyword) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=innodb;

CREATE TABLE reply (
   id INT AUTO_INCREMENT PRIMARY KEY,   
   post_ids INT NOT NULL,
   FOREIGN KEY(post_ids) REFERENCES posts(post_id) ON UPDATE CASCADE ON DELETE CASCADE,
   content TEXT,
   user_ids VARCHAR(100) NOT NULL
);