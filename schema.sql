CREATE TABLE IF NOT EXISTS `members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `BP` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
