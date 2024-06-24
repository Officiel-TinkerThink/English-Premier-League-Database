-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find all scoring_moments given the player first and last name
SELECT *
FROM "scoring_moments"
WHERE "player_id" IN (
    SELECT "id"
    FROM "player_registrations"
    WHERE "player_id" = (
        SELECT "id"
        FROM "players"
        WHERE "first_name" = "Erling"
        AND "last_name" = "Haaland"
    )
);

-- Find all goals given the match id
SELECT *
FROM "scoring_moments"
WHERE "match_id" == 19
;

-- Find all match given home team name and away
SELECT *
FROM "scoring_moments"
WHERE "match_id" IN (
    SELECT "id"
    FROM "matches"
    WHERE "home" = (
        SELECT "id"
        FROM "clubs"
        WHERE "name" = "Liverpool FC"
    )
    AND "away" = (
        SELECT "id"
        FROM "clubs"
        WHERE "name" = "Manchester City FC"
    )
);


-- add new player
INSERT INTO "players" ("first_name", "last_name", "nationality", "dateofbirth")
VALUES ("Alejandro", "Garnacho", "Argentine", "30081999");

-- add new match
INSERT INTO "matches" ("home", "away", "match_date", "season", "matchday")
VALUES ("3", "5", "12032023", "2022/2023", "21");

-- add new scoring_moments
INSERT INTO "scoring_moments" ("match_id", "player_id", "scoring_for", "updated_score", "minute")
VALUES ("121", "2022171", "5", "1-0", "21");


