drop table if exists films_2020;

CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` varchar(6),
  `rental_rate` varchar(8),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` varchar(10) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


desc films_2020;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Untitled spreadsheet - films_2020.csv' 
INTO TABLE films_2020
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"';

show variables like 'local_infile';
set global local_infile = 1;

show variables like 'secure_file_priv';

set sql_safe_updates = 0;

select *
from films_2020;