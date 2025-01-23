

ALTER TABLE `users` ADD `ownedskills` LONGTEXT NOT NULL;

ALTER TABLE `users` ADD `skillsinfo` LONGTEXT NOT NULL;

UPDATE `users` SET `skillsinfo`='{"lastxp":1000, "skillxp":0, "skillpoints":0, "currentlevel":0}';
CREATE TABLE IF NOT EXISTS `lab_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(15) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `skillValue_1` varchar(50) NOT NULL,
  `skillValue_2` varchar(50) NOT NULL,
  `skillValue_3` varchar(50) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

DELETE FROM `lab_skills`;
INSERT INTO `lab_skills` (`id`, `identifier`, `skill_name`, `skillValue_1`, `skillValue_2`, `skillValue_3`) VALUES
	(4, 'char1:45235a43bcb339f938051de54185ab81b22e6504', 'AddStaminaSprint', '20', '0', '0'),
	(5, 'char1:45235a43bcb339f938051de54185ab81b22e6504', 'AddSpeed', '8.0', '0', '0');
