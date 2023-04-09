SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;

--
-- Adatbázis: `scripting_mysql`
--
CREATE DATABASE scripting_mysql;

-- --------------------------------------------------------

CREATE TABLE `address` (
`serial` int(4) NOT NULL AUTO_INCREMENT,
`name_first` varchar(30) NOT NULL,
`name_last` varchar(30) NOT NULL,
`address_01` varchar(40) NOT NULL,
`address_02` varchar(40) NOT NULL,
`address_city` varchar(30) NOT NULL,
`address_state` varchar(2) NOT NULL,
`address_postal_code` varchar(10) NOT NULL,
PRIMARY KEY (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

insert into `address` values('1','Clark','Kent','344 Clinton St','Apt. #3B','Metropolis','NY','10001'),
('2','Dave','Jones','500 Second Avenue','Suite 100','Atlanta','GA','30303'),
('3','Tom','Watson','123 Golf Course Lane','Suite A','Macon','GA','31066'),
('4','Jack','Nicklaus','400 Laurel Oak Dr','Suite 49','Suwanee','GA','31044'),
('5','Betty','Smith','100 Main Street','Suite 500','Buffalo','NY','14201'),
('6','Bruce','Wayne','1007 Mountain Drive','','Gotham City','NY','10000');

SET FOREIGN_KEY_CHECKS = 1;