require_relative '../config/environment.rb'
john = User.new("John")
karen = User.new("Karen")

m_c = Recipe.new("macaroni & cheese")
s_m = Recipe.new("spaghetti & meatballs")
s_p = Recipe.new("sausage & peppers")
t_b = Recipe.new("tofu & beef")

r_c_s_m = RecipeCard.new("09/12/19", 4, john, s_m)
r_c_m_c = RecipeCard.new("05/12/18", 3, john, m_c)
r_c_m_c2 = RecipeCard.new("05/12/18", 3, john, m_c)
r_c_m_c3 = RecipeCard.new("05/12/18", 3, karen, m_c)
r_c_m_c4 = RecipeCard.new("05/12/18", 3, john, m_c)
r_c_m_c5 = RecipeCard.new("05/12/18", 3, john, m_c)
r_c_m_c6 = RecipeCard.new("05/12/18", 3, john, m_c)
r_c_s_p = RecipeCard.new("03/23/18", 2, karen, s_p)
r_c_t_b = RecipeCard.new("02/23/18", 5, karen, t_b)

i_macaroni = Ingredient.new("macaroni")
i_cheese = Ingredient.new("cheese")
i_spaghetti = Ingredient.new("spaghetti")
i_meatball = Ingredient.new("meatball")
i_sausage = Ingredient.new("sausage")
i_peppers = Ingredient.new("peppers")
i_tofu = Ingredient.new("tofu")
i_beef = Ingredient.new("beef")

r_i_mac = RecipeIngredient.new(m_c, i_macaroni)
r_i_cheese = RecipeIngredient.new(m_c, i_cheese)
r_i_spaghetti = RecipeIngredient.new(s_m, i_spaghetti)
r_i_meatball = RecipeIngredient.new(s_m, i_meatball)
r_i_sausage = RecipeIngredient.new(s_p, i_sausage)
r_i_peppers = RecipeIngredient.new(s_p, i_peppers)
r_i_tofu = RecipeIngredient.new(t_b,i_tofu)
r_i_beef = RecipeIngredient.new(t_b,i_beef)

john_a1 = Allergy.new(john,i_meatball)
karen_a2 = Allergy.new(karen,i_cheese)
karen_a3 = Allergy.new(karen,i_tofu)










binding.pry
