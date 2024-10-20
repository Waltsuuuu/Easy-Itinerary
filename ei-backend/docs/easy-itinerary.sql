CREATEdb easy-itinerary;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE countries (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE itineraries (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    users_id BIGINT NOT NULL,
    country_id BIGINT NOT NULL,
    description VARCHAR(255) NOT NULL,
    days INT NOT NULL,
    nights INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

/* DummyData */

INSERT INTO users (name, email) VALUES 
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com'),
('Charlie Brown', 'charlie.brown@example.com'),
('Diana Prince', 'diana.prince@example.com'),
('Ethan Hunt', 'ethan.hunt@example.com'),
('Fiona Gallagher', 'fiona.gallagher@example.com');


INSERT INTO countries (name) VALUES 
('Afghanistan'),
('Albania'),
('Algeria'),
('Andorra'),
('Angola'),
('Antigua and Barbuda'),
('Argentina'),
('Armenia'),
('Australia'),
('Austria'),
('Azerbaijan'),
('Bahamas'),
('Bahrain'),
('Bangladesh'),
('Barbados'),
('Belarus'),
('Belgium'),
('Belize'),
('Benin'),
('Bhutan'),
('Bolivia'),
('Bosnia and Herzegovina'),
('Botswana'),
('Brazil'),
('Brunei'),
('Bulgaria'),
('Burkina Faso'),
('Burundi'),
('Cabo Verde'),
('Cambodia'),
('Cameroon'),
('Canada'),
('Central African Republic'),
('Chad'),
('Chile'),
('China'),
('Colombia'),
('Comoros'),
('Congo, Democratic Republic of the'),
('Congo, Republic of the'),
('Costa Rica'),
('Croatia'),
('Cuba'),
('Cyprus'),
('Czech Republic'),
('Denmark'),
('Djibouti'),
('Dominica'),
('Dominican Republic'),
('Ecuador'),
('Egypt'),
('El Salvador'),
('Equatorial Guinea'),
('Eritrea'),
('Estonia'),
('Eswatini'),
('Ethiopia'),
('Fiji'),
('Finland'),
('France'),
('Gabon'),
('Gambia'),
('Georgia'),
('Germany'),
('Ghana'),
('Greece'),
('Grenada'),
('Guatemala'),
('Guinea'),
('Guinea-Bissau'),
('Guyana'),
('Haiti'),
('Honduras'),
('Hungary'),
('Iceland'),
('India'),
('Indonesia'),
('Iran'),
('Iraq'),
('Ireland'),
('Israel'),
('Italy'),
('Jamaica'),
('Japan'),
('Jordan'),
('Kazakhstan'),
('Kenya'),
('Kiribati'),
('Korea, North'),
('Korea, South'),
('Kuwait'),
('Kyrgyzstan'),
('Laos'),
('Latvia'),
('Lebanon'),
('Lesotho'),
('Liberia'),
('Libya'),
('Liechtenstein'),
('Lithuania'),
('Luxembourg'),
('Madagascar'),
('Malawi'),
('Malaysia'),
('Maldives'),
('Mali'),
('Malta'),
('Marshall Islands'),
('Mauritania'),
('Mauritius'),
('Mexico'),
('Micronesia'),
('Moldova'),
('Monaco'),
('Mongolia'),
('Montenegro'),
('Morocco'),
('Mozambique'),
('Myanmar'),
('Namibia'),
('Nauru'),
('Nepal'),
('Netherlands'),
('New Zealand'),
('Nicaragua'),
('Niger'),
('Nigeria'),
('North Macedonia'),
('Norway'),
('Oman'),
('Pakistan'),
('Palau'),
('Palestine'),
('Panama'),
('Papua New Guinea'),
('Paraguay'),
('Peru'),
('Philippines'),
('Poland'),
('Portugal'),
('Qatar'),
('Romania'),
('Russia'),
('Rwanda'),
('Saint Kitts and Nevis'),
('Saint Lucia'),
('Saint Vincent and the Grenadines'),
('Samoa'),
('San Marino'),
('Sao Tome and Principe'),
('Saudi Arabia'),
('Senegal'),
('Serbia'),
('Seychelles'),
('Sierra Leone'),
('Singapore'),
('Slovakia'),
('Slovenia'),
('Solomon Islands'),
('Somalia'),
('South Africa'),
('South Sudan'),
('Spain'),
('Sri Lanka'),
('Sudan'),
('Suriname'),
('Sweden'),
('Switzerland'),
('Syria'),
('Tajikistan'),
('Tanzania'),
('Thailand'),
('Timor-Leste'),
('Togo'),
('Tonga'),
('Trinidad and Tobago'),
('Tunisia'),
('Turkey'),
('Turkmenistan'),
('Tuvalu'),
('Uganda'),
('Ukraine'),
('United Arab Emirates'),
('United Kingdom'),
('United States'),
('Uruguay'),
('Uzbekistan'),
('Vanuatu'),
('Vatican City'),
('Venezuela'),
('Vietnam'),
('Yemen'),
('Zambia'),
('Zimbabwe');


INSERT INTO itineraries (users_id, country_id, description, days, nights) VALUES
(1, 1, 'Explore the rugged mountains and vibrant culture of Afghanistan.', 7, 6),
(1, 2, 'Enjoy the beautiful beaches and rich history of Albania.', 5, 4),
(1, 3, 'Discover the stunning landscapes and culture of Algeria.', 8, 7),
(1, 4, 'Experience the breathtaking views of Andorra.', 3, 2),
(1, 5, 'Visit the diverse wildlife and scenery of Angola.', 10, 9),
(1, 6, 'Relax on the stunning beaches of Antigua and Barbuda.', 5, 4),

(2, 7, 'Experience the tango culture and beautiful cities of Argentina.', 6, 5),
(2, 8, 'Explore the ancient ruins and culture of Armenia.', 4, 3),
(2, 9, 'Discover the unique wildlife and landscapes of Australia.', 14, 13),
(2, 10, 'Enjoy the rich history and landscapes of Austria.', 7, 6),
(2, 11, 'Visit the diverse culture and beautiful landscapes of Azerbaijan.', 8, 7),
(2, 12, 'Relax in the stunning beaches of the Bahamas.', 5, 4),

(3, 13, 'Experience the unique culture and history of Bahrain.', 4, 3),
(3, 14, 'Discover the vibrant culture and landscapes of Bangladesh.', 7, 6),
(3, 15, 'Enjoy the tropical paradise of Barbados.', 5, 4),
(3, 16, 'Explore the rich culture and history of Belarus.', 6, 5),
(3, 17, 'Experience the beautiful cities and culture of Belgium.', 6, 5),
(3, 18, 'Visit the natural wonders and rich culture of Belize.', 5, 4),

(4, 19, 'Discover the cultural heritage and landscapes of Benin.', 5, 4),
(4, 20, 'Explore the breathtaking scenery and culture of Bhutan.', 6, 5),
(4, 21, 'Experience the rich history and landscapes of Bolivia.', 7, 6),
(4, 22, 'Visit the historic sites and nature of Bosnia and Herzegovina.', 4, 3),
(4, 23, 'Explore the beautiful landscapes and wildlife of Botswana.', 6, 5),
(4, 24, 'Experience the lively culture and history of Brazil.', 7, 6),

(5, 25, 'Discover the stunning beaches and culture of Brunei.', 5, 4),
(5, 26, 'Enjoy the rich history and beautiful landscapes of Bulgaria.', 6, 5),
(5, 27, 'Experience the unique culture and landscapes of Burkina Faso.', 6, 5),
(5, 28, 'Visit the diverse wildlife and stunning landscapes of Burundi.', 8, 7),
(5, 29, 'Explore the beautiful beaches and culture of Cabo Verde.', 5, 4),
(5, 30, 'Discover the rich history and culture of Cambodia.', 6, 5),

(6, 31, 'Experience the unique wildlife and culture of Cameroon.', 7, 6),
(6, 32, 'Visit the natural beauty and rich culture of Canada.', 10, 9),
(6, 33, 'Explore the stunning landscapes and history of the Central African Republic.', 8, 7),
(6, 34, 'Discover the cultural heritage and landscapes of Chad.', 5, 4),
(6, 35, 'Experience the beautiful nature and culture of Chile.', 7, 6),
(6, 36, 'Visit the Great Wall and rich culture of China.', 9, 8);
