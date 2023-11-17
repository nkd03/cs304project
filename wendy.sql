USE wworks_db;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS skills; 
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS session; 

create table session (
    id char(32) not null primary key,
    st timestamp,   
    ip char(15)
    )
    engine = InnoDB;

-- so for some reason this isn't working -- 
CREATE TABLE user (
  `uid` INT AUTO_INCREMENT PRIMARY KEY,
  id char(32)
  username VARCHAR(25) NOT NULL ,
  email VARCHAR(25) NOT NULL,
  f_name VARCHAR(20),
  l_name VARCHAR(50),
  `password` VARCHAR(50) NOT NULL, 
  foreign key (id) references session(id)
) 
engine=InnoDB;



CREATE TABLE skills (
  `uid` INT NOT NULL, 
  skill VARCHAR(30),
  foreign key (`uid`) references user(`uid`) 
)
engine=InnoDB;


CREATE TABLE post (
  pid INT AUTO_INCREMENT PRIMARY KEY,
  `uid` INT NOT NULL, 
  title VARCHAR(40) NOT NULL, 
  body TEXT NOT NULL, 
  post_date DATE NOT NULL,
  categories SET('clothing', 'fitness', 'beauty', 'crafts', 'transportation', 'photography', 'other') NOT NULL,
  `type` ENUM('request', 'provision'), 
  `status` ENUM('open', 'closed', 'in progress') NOT NULL, 
  foreign key (`uid`) references user(`uid`) 
        on update restrict 
        on delete restrict 
        ) 
engine=InnoDB;


CREATE TABLE replies (
  rid INT AUTO_INCREMENT PRIMARY KEY,
  pid INT NOT NULL,
  `uid` INT NOT NULL,
  body TEXT NOT NULL,
  foreign key (pid) references post(pid) 
    on update restrict 
    on delete restrict
) 
engine=InnoDB;