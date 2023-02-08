PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;
  

CREATE TABLE questions (

    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
     -- #foreign_key
    FOREIGN KEY(author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (

    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    question_follower_id INTEGER NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id)
    FOREIGN KEY(question_follower_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (

    id INTEGER PRIMARY KEY, 
    question_id INTEGER NOT NULL, 
    parent_reply_id INTEGER,
    replier_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id)
    FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
    FOREIGN KEY(replier_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (

    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    liking_user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (liking_user_id) REFERENCES users(id)
);


INSERT INTO 
    users (fname, lname)
VALUES 
    ('Jordan', 'Bura'), 
    ('Michael', 'Shih'),
    ('Milner', 'Chen');

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('World', 'Is the world flat?', 2),
    ('Whales', 'Are orcas whales or dolphins?', 1);

INSERT INTO 
    question_follows(question_id, question_follower_id)
VALUES 
    (1, 3),
    (2, 3),
    (2, 1);

INSERT INTO 
    replies(question_id, parent_reply_id, replier_id,body)
VALUES 
    (1, null, 3, 'No it is not flat.'),
    (1, 1, 1, 'Yes it is, idiot.'),
    (2, null, 3, 'I heard they are dolphins now.'),
    (2, 3, 2, 'That sounds right.'),
    (2, 4, 1, 'I think you are both wrong.');

INSERT INTO 
    question_likes(question_id, liking_user_id)
VALUES 
    (2, 3),
    (2, 1);


