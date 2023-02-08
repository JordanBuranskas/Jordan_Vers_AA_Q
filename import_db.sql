PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY, 
    users TEXT NOT NULL,
    questions TEXT NOT NULL,
    question_follows TEXT,
    replies TEXT NOT NULL,
    question_likes INTEGER

)
