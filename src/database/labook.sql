-- Active: 1684250178662@@127.0.0.1@3306
CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL ,
  name TEXT  NOT NULL,
  email TEXT  NOT  NULL,
  password TEXT NOT  NULL,
  role TEXT NOT NULL ,
  created_at TEXT DEFAULT (DATETIME('now')) NOT NULL
);
DROP TABLE users;

CREATE TABLE posts (
  id TEXT PRIMARY KEY UNIQUE NOT  NULL,
  creator_id TEXT NOT  NULL,
  content TEXT NOT  NULL,
  likes INTEGER NOT  NULL,
  dislikes INTEGER NOT  NULL,
  created_at TEXT DEFAULT (DATETIME('now')) NOT NULL,
  updated_at TEXT DEFAULT (DATETIME('now')) NOT NULL,
  FOREIGN KEY (creator_id) REFERENCES users (id) ON UPDATE CASCADE

);
DROP TABLE posts;

CREATE TABLE likes_dislikes (
  user_id TEXT NOT  NULL,
  post_id TEXT NOT  NULL,
  like INTEGER NOT  NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE
  FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE
);

DROP TABLE likes_dislikes;

--populando as seguintes tabelas: users, posts e likes_dislikes


INSERT INTO users(id, name, email, password, role )
VALUES("u01", "Marcus", "marcus@email.com", "marcus12345", "ADMIN"),
("u02", " Celio", "celio@email.com", "celio12345", "NORMAL"),
("u03", "Rodrigo", "rodrigolima@email.com", "rodrigo12345", "NORMAL"),
("u04", "Paula", "paulinha@email.com", "paula12345", "NORMAL"), 
("u05", "Chayene", "chay@email.com", "chay12345", "NORMAL");
INSERT INTO users(id, name, email, password, role )
VALUES

("u06", "beltrano", "beltrano@email.com", "beltrano12345", "NORMAL");



INSERT INTO posts(id, creator_id,  content, likes, dislikes  )
VALUES("i01", "u01", "Foto de festa", 1, 0 ),
("i02", "u02", "Foto dia das mães", 0, 1 ),
("i03", "u03", "Foto na praia", 1, 0 ),
("i04", "u04", "Foto de doguinhos", 1, 0 ),
("i05", "u05", "Foto com amigos", 1 , 0 );

DROP TABLE posts;

INSERT INTO likes_dislikes( user_id,  post_id,  like  )
VALUES("u01", "i01", 300 ),
("u02", "i01", 101 ),
("u03", "i01", 800 ),
("u04", "i04", 505 ),
("u05", "i05", 700 )
;

DROP TABLE likes_dislikes;
--verificando as tabelas
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM likes_dislikes;

SELECT
    posts.id,
    posts.creator_id,
    posts.content,
    posts.likes,
    posts.dislikes,
    posts.created_at,
    posts.updated_at,
    users.name AS creator_name
FROM posts
JOIN users
ON posts.creator_id = users.id;