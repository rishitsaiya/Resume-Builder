SET DateStyle TO European;

DROP TABLE IF EXISTS users, user_profile, user_experience, user_education, user_project, user_skills,skills;

CREATE TABLE users (
   id   INT     PRIMARY KEY     NOT NULL,
   username VARCHAR(255) UNIQUE NOT NULL,
   password VARCHAR(255) NOT NULL,
   active BOOLEAN NOT NULL,
   roles VARCHAR(255)
);

CREATE TABLE user_profile (
   id   INT     PRIMARY KEY     NOT NULL,
   theme INT DEFAULT 1,
   user_name VARCHAR(255) UNIQUE NOT NULL,
   job_title VARCHAR(255)  NOT NULL,
   first_name VARCHAR(255)  NOT NULL,
   last_name VARCHAR(255)  NOT NULL,
   email VARCHAR(255)  NOT NULL,
   phone_num VARCHAR(255)  NOT NULL,
   summary VARCHAR(3000) NOT NULL,
   website VARCHAR(500),
   profile_pic VARCHAR(1000)
);

CREATE TABLE user_education (
   id   INT     PRIMARY KEY     NOT NULL,
   college VARCHAR(255) NOT NULL,
   degree VARCHAR(255) NOT NULL,
   grade VARCHAR(255) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   current_education BOOLEAN DEFAULT false,
   user_id INT,
   FOREIGN KEY (user_id) REFERENCES user_profile(id) ON DELETE CASCADE
);

CREATE TABLE user_experience (
   id   INT     PRIMARY KEY     NOT NULL,
   company VARCHAR(255) NOT NULL,
   position VARCHAR(255) NOT NULL,
   description VARCHAR(3000) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   current_job BOOLEAN DEFAULT false,
   user_id INT,
   FOREIGN KEY (user_id) REFERENCES user_profile(id) ON DELETE CASCADE
);

CREATE TABLE user_project (
   id   INT     PRIMARY KEY     NOT NULL,
   project_name VARCHAR(255) NOT NULL,
   tools VARCHAR(100) NOT NULL,
   description VARCHAR(3000) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   user_id INT,
   FOREIGN KEY (user_id) REFERENCES user_profile(id) ON DELETE CASCADE
);

CREATE TABLE skills(
   id INT     PRIMARY KEY     NOT NULL,  
   skill_name VARCHAR(255)
);

CREATE TABLE user_skills(
   user_id INT  NOT NULL,  
   skill_id INT  NOT NULL, 
   FOREIGN KEY (user_id) REFERENCES user_profile(id) ON DELETE CASCADE,
   FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);