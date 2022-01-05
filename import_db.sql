DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
    -- question_id INTEGER NOT NULL    
);

-- DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

--join table
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,


    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO
    users (fname, lname)
VALUES
    ('Yaakov', 'Zaetz'),
    ('Kirby', 'Neaton');

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('Help', 'Cancel my subscription',(SELECT id FROM users WHERE fname = 'Yaakov')),
    ('Maintenance', 'Elevator not working', (SELECT id FROM users WHERE fname = 'Kirby'));

-- INSERT INTO
--     question_follows (user_id, question_id)
-- VALUES
--     (SELECT id 
--     FROM users 
--     WHERE fname = 'Yaakov', 
--     SELECT id 
--     FROM questions 
--     WHERE (
--         SELECT id FROM users WHERE fname = 'Yaakov'
--     )
--     ('Maintenance', 'Elevator not working', (SELECT id FROM users WHERE fname = 'Kirby'));

INSERT INTO 
    replies (question_id, parent_reply_id, user_id, body)
VALUES
    