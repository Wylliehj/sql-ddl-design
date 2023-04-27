DROP DATABASE soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    city TEXT
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT,
    birthday DATE,
    height TEXT,
    current_team_id INTEGER REFERENCES teams
);

CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    location TEXT,
    date DATE,
    start_time TIMESTAMP,
    season_id INTEGER REFERENCES season,
    head_referee_id INTEGER REFERENCES referees,
    assistant_referee1_id INTEGER REFERENCES referees,
    assistant_referee2_id INTEGER REFERENCES referees
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE lineups(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE results(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT CHECK (result IN ('win', 'loss', 'draw'))
);