class User
    @@all = []
    def initialize 
        @@all << self
    end 
    def self.all
        @@all 
    end 

    def recipe_cards 
        RecipeCard.all.select do |instance|
            instance.user == self
        end 
    end 
    def recipes
        recipe_cards.map do |instance|
            instance.recipe 
        end 
    end 
    def add_recipe_card(date, rating, recipe_instance)
        RecipeCard.new(date, rating, self, recipe_instance)
    end 
    def declare_allergy(ingredient_instance)
        Allergy.new(self, ingredient_instance)
    end 
    def allergies
        Allergy.all.select do |instance|
            instance.user == self
        end 
    end 
    def allergens 
        allergies.map do |instance|
            instance.ingredient
        end 
    end 
    def recipe_cards 
        RecipeCard.all.select do |instance|
            instance.user == self
        end 
    end 
    def top_three_recipes
        newar = recipe_cards.sort_by do |instance| 
            instance.rating
        end 
        newar = newar.map do |instance|
            instance.recipe
        end 
        newar.first(3)
    end 
    def most_recent_recipe
        newar = recipe_cards.sort_by do |instance|
            instance.date
        end 
        newar[0].recipe
    end 

    def safe_recipes 
        recipe_ingredients_in_user = []
        unsafe_recipes = []
        allergens.each do |ingredient|
            RecipeIngredient.all.each do |recipeingredient|
                if recipeingredient.ingredient == ingredient 
                    recipe_ingredients_in_user << recipeingredient
                end 
            end
        end 
        recipe_ingredients_in_user.uniq!
        unsafe_recipes = recipe_ingredients_in_user.map do |ri|
            ri.recipe 
        end 
        unsafe_recipes.uniq!
        all_recipes = RecipeIngredient.all.map { |ri| ri.recipe }
        all_recipes.each do |recipe_instance|
            unsafe_recipes.each do |unsafe_instance|
                if recipe_instance == unsafe_instance
                    all_recipes.delete(recipe_instance)
                end
            end
        end 
        all_recipes






        # safe_recipes = []
        # allergic_ingredients = []
        # all_recipe_ingredients = RecipeIngredient.all
        # allergies.each do |allergy|
        #     all_recipe_ingredients.each do |ri|
        #         if ri.ingredient != allergy.ingredient
        #             allergic_ingredients << ri.ingredient
        #         end 
        #     end 
        # end 
        # allergic_ingredients = allergic_ingredients.uniq
        # all_recipe = Recipe.all
        # all_recipe.each do |recipe|
        #     if recipe.ingredients.include?(allergic_ingredients)
        #         safe_recipes.delete(recipe)
        #     else
        #         safe_recipes << recipe
        #     end 
        # end 
        # safe_recipes.uniq
        # safe_recipes


        # ##### BIG PROB FIX LATER WHEN YOU HAVE TIME
    end 



end 