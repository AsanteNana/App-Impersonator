#This script mimmick a chess app on a mobile device

 CREATE DATABASE chess_app;

#When the app is opened this is the resulting query:
USE chess_app;

#These tables represent the menus on the screen when the app is opened
CREATE TABLE game_mode (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, position TEXT, color TEXT, user_id INTEGER);
INSERT INTO game_mode (name, position, color, user_id)
	VALUES ("Classical", "top", "blue", 1),
		("Timed", "middle", "red", 1),
		("Multiplayer", "bottom", "green", 1);

CREATE TABLE settings (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, position TEXT, color TEXT, user_id INTEGER);
INSERT INTO settings (name, position, color, user_id)
	VALUES ("Sound", "top", "blue", 1),
		("Display_name", "middle", "red", 1),
		("Theme", "bottom", "green", 1);

CREATE TABLE records (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, position TEXT, color TEXT, user_id INTEGER);
INSERT INTO records (name, position, color, user_id)
	VALUES ("Wins", "top", "green", 1),
		("Losses", "bottom", "red", 1);

# Creating table for the classical mode
CREATE TABLE classical (id INTEGER PRIMARY KEY AUTO_INCREMENT,options Text, user_id INTEGER);
INSERT INTO classical (options, user_id)
	VALUES ("display name", 1),
		("start color", 1),
		("difficulty", 1),
		("start", 1),
		("back", 1);

# Creating table for the timed mode
CREATE TABLE timed (id INTEGER PRIMARY KEY AUTO_INCREMENT,options Text, user_id INTEGER);
INSERT INTO timed (options, user_id)
	VALUES ("display name", 1),
		("start color", 1),
		("difficulty", 1),
		("start", 1),
		("back", 1);

# Creating table for the multiplayer mode
CREATE TABLE multiplayer (id INTEGER PRIMARY KEY AUTO_INCREMENT,options Text, user_id INTEGER);
INSERT INTO multiplayer (options, user_id)
	VALUES ("display name", 1),
		("streak", 1),
		("start", 1),
		("back", 1);

# Creating table for the sound settings
CREATE TABLE sound (id INTEGER PRIMARY KEY AUTO_INCREMENT,options Text, user_id INTEGER);
INSERT INTO sound (options, user_id)
	VALUES ("on", 1),
		("off", 1);


# Creating table for the theme settings
CREATE TABLE theme (id INTEGER PRIMARY KEY AUTO_INCREMENT,options Text, user_id INTEGER);
INSERT INTO theme (options, user_id)
	VALUES ("regular", 1),
		("christmas", 1),
		("dark", 1),
		("happy", 1),
		("nature", 1);

# Creating table for the display_name settings with a default name of geek2022
CREATE TABLE display_name (id INTEGER PRIMARY KEY AUTO_INCREMENT, username VARCHAR(255) DEFAULT "geek2022");


# Creating table for the wins
CREATE TABLE wins (id INTEGER PRIMARY KEY AUTO_INCREMENT,count VARCHAR (255), user_id INTEGER);
INSERT INTO wins (count, user_id)
	VALUES (0, 1);

# Creating table for the losses
CREATE TABLE losses (id INTEGER PRIMARY KEY AUTO_INCREMENT,count VARCHAR (255), user_id INTEGER);
INSERT INTO losses (count, user_id)
	VALUES (0, 1);

#Creating table for the start_color
CREATE TABLE start_color (id INTEGER PRIMARY KEY AUTO_INCREMENT, options TEXT, user_id INTEGER);
INSERT INTO start_color(options, user_id)
	VALUES ("black", 1),
		("white", 1);

#Creating table for the difficulty
CREATE TABLE difficulty (id INTEGER PRIMARY KEY AUTO_INCREMENT, options TEXT, user_id INTEGER);
INSERT INTO difficulty (options, user_id)
	VALUES ("Easy", 1),
		("Intermediate", 1),
		("Hard", 1),
		("Expert", 1);

# Creating table for the streak
CREATE TABLE streak (id INTEGER PRIMARY KEY AUTO_INCREMENT,count VARCHAR (255), user_id INTEGER);
INSERT INTO streak (count, user_id)
	VALUES (0, 1);

#Creating table for the in_game
CREATE TABLE in_game (id INTEGER PRIMARY KEY AUTO_INCREMENT, options TEXT, user_id INTEGER);
INSERT INTO in_game (options, user_id)
	VALUES ("Exit", 1),
		("Chat", 1),
		("white_pieces", 1),
		("black_pieces", 1);

#Creating table for the chat
CREATE TABLE chat(id INTEGER PRIMARY KEY AUTO_INCREMENT, message TEXT, user_id INTEGER);

#Creating table for white chess pieces 
CREATE TABLE white_pieces (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, position VARCHAR (255), user_id INTEGER);
INSERT INTO white_pieces (name, position, user_id)
	VALUES ("king", "e1", 1),
		("queen", "d1", 1),
		("bishop1", "c1", 1),
		("bishop2", "f1", 1),
		("knight1", "b1", 1),
		("knight2", "g1", 1),
		("rook1", "a1", 1),
		("rook2", "h1", 1),
		("pawn1", "a2", 1),
		("pawn2", "b2", 1),
		("pawn3", "c2", 1),
		("pawn4", "d2", 1),
		("pawn5", "e2", 1),
		("pawn6", "f2", 1),
		("pawn7", "g2", 1),
		("pawn8", "h2", 1);

#Creating table for black chess pieces 
CREATE TABLE black_pieces (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, position VARCHAR (255), user_id INTEGER);
INSERT INTO black_pieces (name, position, user_id)
	VALUES ("king", "e8", 1),
		("queen", "d8", 1),
		("bishop1", "c8", 1),
		("bishop2", "f8", 1),
		("knight1", "b8", 1),
		("knight2", "g8", 1),
		("rook1", "a8", 1),
		("rook2", "h8", 1),
		("pawn1", "a7", 1),
		("pawn2", "b7", 1),
		("pawn3", "c7", 1),
		("pawn4", "d7", 1),
		("pawn5", "e7", 1),
		("pawn6", "f7", 1),
		("pawn7", "g7", 1),
		("pawn8", "h7", 1);


#creating a user name in the chess app
SELECT name FROM settings WHERE color = "red";

# Entering the user name
INSERT INTO display_name (username) VALUES ("blossom");

# Turning sound off because we are playing during class
SELECT options AS sound_option FROM sound WHERE id =2;

# It is christmas and blossom wants to play with the christmas vibe
SELECT options  AS theme_selection FROM theme WHERE options REGEXP "mas";

#Entering the game mode menu
SELECT * FROM game_mode;

#blossom feels like playing another human
SELECT name AS mode FROM game_mode WHERE position LIKE "bot%";

#in the multiplayer menu he has the options to see:
SELECT * FROM multiplayer;

#blossom has a streak of zero because this is his first game
SELECT count FROM streak;

#to start the game he taps the start button
SELECT options FROM multiplayer WHERE id = 3;

#the game has started now and blossom is in the gaming zone
SELECT options AS in_game_features FROM in_game;

#blossom was assigned the white pieces and this is how his side looks
SELECT name AS piece, position FROM white_pieces;

#This is what the entire game board looks like
SELECT white_pieces.name AS piece, white_pieces.position AS white_position, black_pieces.position AS black_position 
FROM white_pieces JOIN black_pieces
ON white_pieces.name = black_pieces.name;

#The chessboard starts as below and will update with each move
CREATE TABLE chessboard AS SELECT white_pieces.name AS piece, white_pieces.position AS white_position, black_pieces.position AS black_position 
FROM white_pieces JOIN black_pieces
ON white_pieces.name = black_pieces.name;
SELECT * FROM chessboard;

#blossom makes his first move
UPDATE chessboard SET white_position = "d4" WHERE piece = "pawn4";
SELECT * FROM chessboard;

#his opponent makes his first move as well
UPDATE chessboard SET black_position = "f6" WHERE piece = "knight2";
SELECT * FROM chessboard;

#blossom plays his next move
UPDATE chessboard SET white_position = "d2" WHERE piece = "knight1";
SELECT * FROM chessboard;

#opponent plays his second move
UPDATE chessboard SET black_position = "e5" WHERE piece = "pawn5";
SELECT * FROM chessboard;

#blossom makes another move by going for his opponent's pawn
UPDATE chessboard SET white_position = "e5" WHERE piece = "pawn4";
SELECT * FROM chessboard;

#his opponent moves his knight again
UPDATE chessboard SET black_position = "g4" WHERE piece = "knight1";
SELECT * FROM chessboard;

#blossom plays his turn
UPDATE chessboard SET white_position = "h3" WHERE piece = "pawn8";
SELECT * FROM chessboard;

#blossom realizes he has made a mistake and sends his opponent a chat
INSERT INTO chat (message, user_id) VALUES ("Oof, I' have handed you the game", 1);
SELECT message FROM chat WHERE user_id =1;

# his opponent sends a reply back
INSERT INTO chat (message, user_id) VALUES ("haha, it is what it is!", 101);
SELECT message AS Reply FROM chat WHERE user_id =101;

# his opponent makes his move and has him, checkmate!
UPDATE chessboard SET black_position = "e3" WHERE piece = "knight1";
SELECT * FROM chessboard;

#blossom loses and the losses records are updated
UPDATE losses SET count = 1 WHERE user_id =1;
SELECT count FROM losses;

#blossom checks his record to see what things look like and what level he is on
SELECT wins.count/losses.count AS win_ratio, CASE
WHEN wins.count/losses.count = 0 THEN "Not enough data"
WHEN wins.count/losses.count > 3 THEN "Grand Master"
WHEN wins.count/losses.count > 2 THEN "Master"
WHEN wins.count/losses.count > 1 THEN "Intermediate"
ELSE "Newbie"
END AS level FROM losses JOIN wins ON losses.user_id=wins.user_id;

# the following day blossom picks up his phone to play another game of chess
USE chess_app;

#blossom selects his name from the display name list
SELECT username FROM display_name;

#blossom chooses a theme to match his mood
SELECT options AS theme FROM theme WHERE options ="happy";

#blossom heads to the game mode to select classical as he wants to play with computer
SELECT name AS "Game Modes" FROM game_mode;
SELECT name AS Mode FROM game_mode WHERE color = "blue";

#blossom selects white to start
SELECT options AS "Start Color" FROM start_color WHERE id =2;

#the difficulty blossom chooses is easy because why not
SELECT options AS "difficulty level" FROM difficulty WHERE options LIKE "__sy";

#to get into the game he taps on start
SELECT options AS button FROM classical WHERE id=4;

#blossom is in the game screen now
SELECT options AS "game features" FROM  in_game WHERE options NOT LIKE "ch__";

#the chessboard before the game commences:
CREATE TABLE chessboard_happy AS SELECT white_pieces.name AS piece, white_pieces.position AS white_position, black_pieces.position AS black_position 
FROM white_pieces JOIN black_pieces
ON white_pieces.name = black_pieces.name;
SELECT * FROM chessboard_happy;

# blossom makes his first play by moving a pawn
UPDATE chessboard_happy SET white_position = "d4" WHERE piece = "pawn4";
SELECT * FROM chessboard_happy;

#computer makes their first move too
UPDATE chessboard_happy SET black_position = "f5" WHERE piece = "pawn6";
SELECT * FROM chessboard_happy;

#blossom moves a bishop
UPDATE chessboard_happy SET white_position = "g5" WHERE piece = "bishop1";
SELECT * FROM chessboard_happy;

#computer plays a second move
UPDATE chessboard_happy SET black_position = "h6" WHERE piece = "pawn8";
SELECT * FROM chessboard_happy;

#blossom moves a bishop again for his third play
UPDATE chessboard_happy SET white_position = "h4" WHERE piece = "bishop1";
SELECT * FROM chessboard_happy;

#computer plays a third consecutive pawn
UPDATE chessboard_happy SET black_position = "g5" WHERE piece = "pawn7";
SELECT * FROM chessboard_happy;

#blossom makes his fourth play
UPDATE chessboard_happy SET white_position = "e4" WHERE piece = "pawn5";
SELECT * FROM chessboard_happy;

#computer takes a piece
UPDATE chessboard_happy SET black_position = "h4" WHERE piece = "pawn7";
SELECT * FROM chessboard_happy;

#blossom moves his queen high up and checkmate is delivered
UPDATE chessboard_happy SET white_position = "h5" WHERE piece = "queen";
SELECT * FROM chessboard_happy;

#Blossom wins his first game
UPDATE wins SET count = 1 WHERE id =1;
SELECT count AS wins FROM wins;

#blossom checks his record again to see what things look like and what level he is on
SELECT wins.count/losses.count AS win_ratio, CASE
WHEN wins.count/losses.count = 0 THEN "Not enough data"
WHEN wins.count/losses.count > 3 THEN "Grand Master"
WHEN wins.count/losses.count > 2 THEN "Master"
WHEN wins.count/losses.count > 1 THEN "Intermediate"
ELSE "Newbie"
END AS level FROM losses JOIN wins ON losses.user_id=wins.user_id;

