DROP TABLE IF EXISTS apps, apps_categories, categories, pricing_plan, reviews;

CREATE TABLE apps (
	appId VARCHAR(100) PRIMARY KEY,
	url VARCHAR(200),
	title VARCHAR(100),
	developer VARCHAR(100),
	developer_link VARCHAR(200),
	icon VARCHAR(200),
	rating DECIMAL(2,1),
	reviews_count INTEGER,
	description TEXT,
	tagline VARCHAR(150),
	lastmod DATE
);


CREATE TABLE categories(
	categoryId VARCHAR(100) PRIMARY KEY,
	title VARCHAR(50)
);

CREATE TABLE apps_categories (
	appId VARCHAR(100),
	categoryId VARCHAR(100),
	CONSTRAINT fk_apps
		FOREIGN KEY (appId)
		REFERENCES apps(appId),
	CONSTRAINT fk_categories
		FOREIGN KEY (categoryId)
		REFERENCES categories
);

CREATE TABLE pricing_plan (
	princingId VARCHAR(100) PRIMARY KEY,
	appId VARCHAR(100),
	title VARCHAR(50),
	price DECIMAL(6,2),
	one_time_charge BOOLEAN,
	CONSTRAINT fk_apps
		FOREIGN KEY(appId)
		REFERENCES apps(appId)
);

CREATE TABLE reviews (
	reviewId SERIAL PRIMARY KEY,
	appId VARCHAR(100),
	author VARCHAR(500),
	rating INTEGER,
	posted_at DATE,
	body TEXT,
	helpful_count INTEGER,
	developer_reply TEXT,
	developer_rely_posted_at DATE,
	CONSTRAINT fk_apps_key
		FOREIGN KEY (appId)
		REFERENCES apps(appId)
);