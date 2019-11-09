class Recipe 

    @@all = []
    def initialize

        @@all << self
    end 
    def self.all
        @@all
    end 

    def recipe_cards 
        RecipeCard.all.select do |instance|
            instance.recipe == self
        end 
    end 

    def self.most_popular 
        new_hash = {}
        RecipeCard.all.each do |instance|
            new_hash[instance.recipe] ? new_hash[instance.recipe] += 1 : new_hash[instance.recipe] = 1

            # if new_hash[instance.recipe]
            #     new_hash[instance.recipe] += 1
            # else
            #     new_hash[instance.recipe] = 1
            # end
        end 
        new_hash.max_by{|key, value| value}.first
    end 
    
    def users 
        recipe_cards.map do |instance|
            instance.user
        end 
    end 

    def recipe_ingredients 
        RecipeIngredient.all.select do |instance|
            instance.recipe == self 
        end 
    end 

    def ingredients 
        recipe_ingredients.map do |instance|
            instance.ingredient 
        end 
    end 
    
    def allergens 
        #should return all ingredients in this recipe that are allergens for users in the system
        # all users? --> allergies --> ingredients 
        Allergy.all.map do |instance|
            instance.ingredient
        end 
    end 

    def add_ingredients(ingredient_instance_array)
        ingredient_instance_array.each do |instance|
            RecipeIngredient.new(instance, self)
        end 
    end 

end 