require_relative '../config/environment.rb'


tacos = Recipe.new("tacos")
pizza = Recipe.new("pizza")

tomato = Ingredient.new("tomato")
flour = Ingredient.new("flour")
cheese = Ingredient.new("cheese")
beef = Ingredient.new("beef")


pizza_ingredients = [tomato,flour,cheese]
tacos_ingredients = [cheese, flour,cheese,beef]
pizza.add_ingredients(pizza_ingredients)
tacos.add_ingredients(tacos_ingredients)

jon = User.new("john")
jon.add_recipe_card(pizza, "11/1", 9)

# jon.add_recipe_card(tacos, "11/2", 6)

jon.declare_allergy(tomato)

kevin = User.new("Kevin")
kevin.declare_allergy(cheese)

kevin.add_recipe_card(tacos, "11/3", 5)

mark = User.new("marc")


binding.pry
