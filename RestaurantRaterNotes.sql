--CREATE RestaurantRater
CREATE DATABASE RestaurantRater

--Restaurants
--Ratings
CREATE TABLE Restaurants(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100) NOT NULL,
    OptedIntoNetwork INT 
)

CREATE TABLE Ratings(
    Id INT PRIMARY KEY IDENTITY(1,1),
    RestaurantId INT NOT NULL,
    Score FLOAT NOT NULL CHECK (Score >= 0 AND Score <= 5.0)
)

ALTER TABLE Ratings ADD FOREIGN KEY (RestaurantId) REFERENCES Restaurants(id)

INSERT INTO Restaurants (Name, Location, OptedIntoNetwork) VALUES
('Patachou', 'Clay Terrace', 0),
('The Bistro', '12175 Visionary Way', 1),
('McDonald''s' , 'Around the corner', 1),
('Secret Place', 'No One Knows', 0)

INSERT INTO Ratings(RestaurantId, Score) VALUES
(1, 5), (1, 3.5), (1, 4.7), (1, 1.8),
(2, 2.5), (2, 3),(2, 4),
(3, 4)

SELECT Score FROM Ratings WHERE RestaurantId = 2

SELECT AVG(Score) FROM Ratings WHERE RestaurantId = 2

SELECT MIN(Score) FROM Ratings WHERE RestaurantId = 1

SELECT COUNT(Score) AS Count FROM Ratings WHERE RestaurantId = 3

SELECT R.Name, RA.Score FROM Restaurants R LEFT JOIN Ratings RA
ON R.Id = RA.RestaurantId