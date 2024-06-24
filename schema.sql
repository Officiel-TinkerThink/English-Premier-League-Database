-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent players play in premier league
CREATE TABLE "players" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "dateofbirth" NUMERIC NOT NULL,
    PRIMARY KEY("id")
)

-- Represent clubs in England
CREATE TABLE "clubs" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "homebase" TEXT NOT NULL,
    PRIMARY KEY("id")
)

-- Represent Player Registration
CREATE TABLE "player_registrations" (
    "id" INTEGER,
    "player_id" INTEGER,
    "club_id" INTEGER,
    "Season" NUMERIC
    "dateofregistration" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("player_id") REFERENCES "players"("id"),
    FOREIGN KEY("club_id") REFERENCES "clubs"("id")
)

-- represent matchs in premier league
CREATE TABLE "matches" (
    "id" INTEGER,
    "home" INTEGER,
    "away" INTEGER,
    "match_date" NUMERIC NOT NULL,
    "season" NUMERIC NOT NULL,
    "matchday" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("home") REFERENCES "clubs"("id"),
    FOREIGN KEY("away") REFERENCES "clubs"("id")
)

-- represent scoring moment at premier league match
CREATE TABLE "scoring_moments" (
    "id" INTEGER,
    "match_id"
    "player_id" INTEGER,
    "scoring_for" INTEGER,
    "updated_score" NUMERIC,
    "minute" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("match_id") REFERENCES "matchs"("id"),
    FOREIGN KEY("player_id") REFERENCES "player_registration"("id"),
    FOREIGN KEY("scoring_for") REFERENCES "clubs"("id")
)

-- Create indexes to speed common searches
CREATE INDEX "player_name_search" ON "players" ("first_name", "last_name");
CREATE INDEX "match_search" ON "scoring_moments"("match_id");
CREATE INDEX "home_away_search" ON "matchs"("home", "away");

