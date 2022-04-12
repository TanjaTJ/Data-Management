CREATE TABLE Cyclist
(
	cyclistNumber INTEGER NOT NULL, 
	familyName VARCHAR(50) NOT NULL, 
	givenName VARCHAR(50) NOT NULL,
	teamNumber INTEGER NOT NULL,
	CONSTRAINT PK_Cyclist PRIMARY KEY(cyclistNumber)
)
CREATE TABLE Team
(
	teamNumber INTEGER NOT NULL, 
	teamName VARCHAR(50) NOT NULL,
	cyclistNumber INTEGER NOT NULL,
	CONSTRAINT PK_Team PRIMARY KEY(teamNumber),
	CONSTRAINT FK_Team_Cyclist FOREIGN KEY(cyclistNumber) REFERENCES Cyclist(cyclistNumber)
)