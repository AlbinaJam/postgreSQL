CREATE TABLE IF NOT EXISTS Жанр (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Исполнитель (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS АльбомИсполнителя (
	Жанр_id INTEGER REFERENCES Жанр(id),
	Исполнитель_id INTEGER REFERENCES Исполнитель(id),
	CONSTRAINT pk_ЖанрГруппы PRIMARY KEY (Genre_id, Band_id)
);


CREATE TABLE IF NOT EXISTS Альбом (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL
);


CREATE TABLE IF NOT EXISTS АльбомИсполнителя (
	Альбом_id INTEGER REFERENCES Альбом(id),
	Исполнитель_id INTEGER REFERENCES Исполнитель(id),
	CONSTRAINT pk_АльбомИсполнителя PRIMARY KEY (Альбом_id, Исполнитель_id)
);


CREATE TABLE IF NOT EXISTS Песни (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	duration INTEGER,
	Альбом_id INTEGER REFERENCES Альбом(id)
);

CREATE TABLE IF NOT EXISTS Сборник (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) unique NOT NULL,
);

CREATE TABLE IF NOT EXISTS Сборник песен (
	Песня_id INTEGER REFERENCES Песня(id),
	Сборник_id INTEGER REFERENCES Сборник(id),
	CONSTRAINT pk_СборникПесен PRIMARY KEY (Песня_id, Сборник_id)
);
