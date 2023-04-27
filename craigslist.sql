DROP DATABASE craigslist;
CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    password TEXT,
    preferred_region_id INTEGER REFERENCES regions
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    text TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);