CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(30),
  "email" VARCHAR(50),
  "password" VARCHAR(1000)
);

CREATE TABLE "recipes" (
  "recipe_id" SERIAL PRIMARY KEY,
  "public" BOOLEAN DEFAULT True,
  "directions" TEXT,
  "duration" INT,
  "difficulty" VARCHAR(10),
  "quantity" INTEGER,
  "kitchenware" VARCHAR(200)
);

CREATE TABLE "ingredients" (
  "ingredient_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(30),
  "type" VARCHAR(30)
);

CREATE TABLE "lists" (
  "list_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(30),
  "date_created" timestamp,
  "public" BOOLEAN DEFAULT True
);

CREATE TABLE "occasions" (
  "occasion_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(30)
);

CREATE TABLE "user_recipe" (
  "user_recipe_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL,
  "recipe_id" INT NOT NULL
);

CREATE TABLE "user_saved" (
  "user_saved_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL,
  "recipe_id" INT NOT NULL
);

CREATE TABLE "user_list" (
  "user_list_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL,
  "list_id" INT NOT NULL
);

CREATE TABLE "recipe_ingredient" (
  "recipe_ingredient_id" SERIAL PRIMARY KEY,
  "recipe_id" INT NOT NULL,
  "ingredient_id" INT NOT NULL
);

CREATE TABLE "recipe_occasion" (
  "recipe_occasion_id" SERIAL PRIMARY KEY,
  "recipe_id" INT NOT NULL,
  "occasion_id" INT NOT NULL
);

CREATE TABLE "list_ingredient" (
  "list_ingredient_id" SERIAL PRIMARY KEY,
  "list_id" INT NOT NULL,
  "ingredient_id" INT NOT NULL
);

CREATE TABLE "substitutions" (
  "substitutions_id" SERIAL PRIMARY KEY,
  "ingredient_id" INT NOT NULL,
  "substitution_id" INT NOT NULL
);

ALTER TABLE "user_recipe" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "user_recipe" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "user_saved" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "user_saved" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "user_list" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "user_list" ADD FOREIGN KEY ("list_id") REFERENCES "lists" ("list_id");

ALTER TABLE "recipe_ingredient" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "recipe_ingredient" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "recipe_occasion" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "recipe_occasion" ADD FOREIGN KEY ("occasion_id") REFERENCES "occasions" ("occasion_id");

ALTER TABLE "list_ingredient" ADD FOREIGN KEY ("list_id") REFERENCES "lists" ("list_id");

ALTER TABLE "list_ingredient" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "substitutions" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "substitutions" ADD FOREIGN KEY ("substitution_id") REFERENCES "ingredients" ("ingredient_id");
