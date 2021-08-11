BRAINSTORMING

User name
User email
User password
User recipes
User saved recipes

Recipe name
Recipe occasion
Recipe private/public
Recipe ingredients
Recipe directions
Recipe duration
Recipe difficulty
Recipe quantity
Recipe popularity
Recipe kitchenware

Ingredient name
Ingredient type

List name
List user
List ingredients
List occasion
List timestamp
List public/private

Occasion name
Occasion recipes
Occasion list

TABLE IDEAS

user - contains user information and connected recipes and lists.
    name
    email
    password

recipe - contains details about recipe including creator, ingredients, and saves.
    name
    public
    directions
    duration
    difficulty
    quantity
    kitchenware

ingredients - a table to store ingredient names for use in lists and recipes.
    name
    type

lists - table to store users ingredients for specific recipes and occasions.
    name
    timestamp
    public

occasion - used for storing specific lists and recipes pertaining to different occasions.
    name


// add ons

user_saved - used to store relationships between users and saved recipes
    user
    recipe

user_recipe - used to store relationships between users and created recipes
    user
    recipe

user_list - used to store relationships between users and created lists
    user
    list

recipe_ingredient - used to store relationships between recipes and ingredients
    recipe
    ingredient

recipe_occasion - used to store relationships between recipes and occasions
    recipe
    occasion

list_ingredient - used to store relationships between recipes and ingredients
    list
    ingredient

substitutions - used to store relationships between ingredients and similar ingredients
    ingredient
    substitutions


Relationships

one to one
    occasion --> user       each occasion would have one creator
    recipe --> user         each recipe would have one creator 
    list --> user           each list would have one creator
one to many
    list --> ingredients    each list would have many ingredients
    recipe --> ingredients  each recipe would have many ingredients
    recipe --> saved        each recipe would have multiple saves
    occasion --> list       each occasion would relate to many lists
many to many
    user --> recipe         all users have multiple recipes
    user --> saved          all users save multiple recipes
    

Columns

user
    user_id             serial given to each user
    name                name of user
    email               email of user
    password            password of user

recipe
    recipe_id           serial given to each recipe
    name                name of recipe
    public              bool if public or not
    directions          directions given by creator
    duration            time in minutes the recipe requires
    difficulty          difficulty given by creator
    quantity            quantity of food in servings
    kitchenware         kitchenware required for dish
    date_created        timestamp of date created

ingredients
    ingredient_id       serial given to each ingredient
    name                name of ingredient

lists
    list_id             serial given to each list
    name                name of list given 
    date_created        timestamp of date created
    public              bool if public or not

occasion
    occasion_id         serial given to each occasion
    name                name of occasion

user_saved
    user_saved_id       serial given to user_saved
    user_id             id of user
    recipe_id           id of recipe

user_recipe
    user_recipe_id      serial given to user_recipe
    user_id             id of user
    recipe_id           id of recipe

user_list   
    user_list_id        serial given to user_list
    user_id             id of user
    list_id             id of list

recipe_ingredient
    recipe_ingredient_idserial given to recipe_ingredient
    recipe_id           id of recipe
    ingredient_id       id of ingredient

recipe_occasion
    recipe_occasion_id  serial given to recipe_occasion
    recipe_id           id of recipe
    occasion_id         id of occasions

list_ingredient
    list_ingredient_id  serial given to list_ingredient_id
    list_id             id of list
    ingredient_id       id of ingredient

substitutions
    substitutions_id    serial given to substitutions
    ingredient_id       id of ingredient
    substitution_id     id of substitution
    