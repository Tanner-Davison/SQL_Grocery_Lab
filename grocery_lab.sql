CREATE TABLE profile (
profile_id SERIAL PRIMARY KEY
 ,email VARCHAR(40)
 ,password VARCHAR(20)
);

CREATE TABLE recipe (
recipe_id SERIAL PRIMARY KEY
  ,private BOOLEAN NOT NULL
  ,owner INTEGER NOT NULL
  ,instructions VARCHAR(200)
  ,FOREIGN KEY (owner)
  	REFERENCES profile (profile_id)
);

CREATE TABLE user_recipe (
profile_id INTEGER 
,recipe_id INTEGER 
, FOREIGN KEY (profile_id) 
  		REFERENCES profile (profile_id)
  ,FOREIGN KEY (recipe_id)
  		REFERENCES recipe (recipe_id)
);

CREATE TABLE recipe_ingredients(
recipe_id INTEGER
  ,ingredients_id INTEGER
  , FOREIGN KEY (recipe_id)
  		REFERENCES recipe (recipe_id)
  , FOREIGN KEY (ingredients_id)
  		REFERENCES ingredients (ingredients_id)
);

CREATE TABLE ingredients (
ingredients_id SERIAL PRIMARY KEY
  ,body VARCHAR(400) 
)

CREATE TABLE grocery_list(
profile_id INTEGER
  ,ingredients_id INTEGER
  , FOREIGN KEY (profile_id)
  		REFERENCES profile (profile_id)
  , FOREIGN KEY (ingredients_id)
  		REFERENCES ingredients (ingredients_id)
);

CREATE TABLE occasion (
occasion_id SERIAL PRIMARY KEY
  , occasion_name VARCHAR (20)
  , recipe_id INTEGER
  , profile_id INTEGER
  , FOREIGN KEY (recipe_id)
  		REFERENCES recipe (recipe_id)
  , FOREIGN KEY (profile_id)
  		REFERENCES profile (profile_id)
);

INSERT INTO PROFILE (email, password)
VALUES('Tboydavison@gmail.com', 'Luliann465$')

SELECT *
FROM profile
JOIN recipe ON profile.profile_id = recipe.owner

INSERT INTO recipe (private, owner, instructions)
VALUES(true, 1, 'mix the milk in the bag')

ALTER TABLE recipe 
add name VARCHAR(200)

SELECT *
FROM profile
JOIN recipe ON profile.profile_id = recipe.owner

UPDATE recipe 
SET name = 'Bag of milk'
WHERE owner = 1


INSERT INTO ingredients (body)
VALUES('milk'),('bag')

INSERT INTO recipe_ingredients (recipe_id, ingredients_id)
VALUES (1, 1), (1,2)

SELECT *
FROM recipe r
JOIN recipe_ingredients ri
ON r.recipe_id = ri.recipe_id
JOIN ingredients ing ON ing.ingredients_id = ri.ingredients_id

SELECT *
FROM ingredients