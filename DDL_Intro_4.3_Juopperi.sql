SELECT Cyclist.familyName, Cyclist.givenName 
FROM Cyclist
JOIN Team ON Cyclist.teamNumber = Team.teamName;