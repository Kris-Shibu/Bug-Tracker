-- Database: bug_tracker
-- DROP DATABASE IF EXISTS bug_tracker;

CREATE DATABASE bug_tracker;
    
    
-- Table: user
-- DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users ( user_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, user_name VARCHAR(20) NOT NULL, email_address VARCHAR(20), job_tittle VARCHAR(10));


-- Table: bugs 
-- DROP TABLE IF EXISTS "bugs";

CREATE TABLE IF NOT EXISTS bugs (bug_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, environment VARCHAR(20), project_name VARCHAR(20), status VARCHAR(10), summary VARCHAR(50), priority VARCHAR(10), opened_by VARCHAR(20), opened_dateTIME DATETIME, closed_by VARCHAR(20), closed_dateTIME DATETIME, created_by BIGINT NOT NULL REFERENCES users (user_id));
    

-- Table: comments
-- DROP TABLE IF EXISTS comments;

CREATE TABLE IF NOT EXISTS comments ( comment_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, user_id BIGINT NOT NULL REFERENCES users(user_id), bug_id BIGINT NOT NULL REFERENCES BUGS(BUG_id), USER_COMMENTS VARCHAR(50));
