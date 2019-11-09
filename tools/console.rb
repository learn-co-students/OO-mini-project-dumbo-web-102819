require_relative '../config/environment.rb'






i1 = Ingredient.new
i2 = Ingredient.new
i3 = Ingredient.new
iallergic = Ingredient.new

u1 = User.new 
u2 = User.new
u3 = User.new
uallergic = User.new

r1 = Recipe.new 
r2 = Recipe.new
r3 = Recipe.new
rallergic = Recipe.new

a1 = Allergy.new(u1, i1)
a2 = Allergy.new(u1, i2)
a3 = Allergy.new(u3, i3)
aallergic = Allergy.new(uallergic, iallergic)

rc1 = RecipeCard.new("date1", 3, u2, r1) 
rc2 = RecipeCard.new("date2", 4, u2, r2) 
rc3 = RecipeCard.new("date3", 5, u3, r2) 
rcallergic = RecipeCard.new("date4", 3, uallergic, rallergic)

ri1 = RecipeIngredient.new(i1, r2)
ri2 = RecipeIngredient.new(i3, r1)
ri3 = RecipeIngredient.new(i2, r3)
riallergic = RecipeIngredient.new(iallergic, rallergic)

binding.pry
0