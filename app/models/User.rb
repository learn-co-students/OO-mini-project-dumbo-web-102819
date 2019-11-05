class User
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def recipes
        recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.user == self}
        recipe_cards.map{|recipe_card| recipe_card.recipe}
    end
    def add_recipe_card(date, rating, recipe)
        RecipeCard.new(date, rating, self, recipe)
    end
    def declare_allergy(ingredient)
        Allergy.new(self,ingredient)
    end
    def allergens
        Allergy.all.select { |allergy| allergy.user == self }
    end
    def top_three_recipes
        recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.user == self}
        recipe_cards.sort_by{|recipe_card| recipe_card.rating}.reverse[0..2].map{|rc| rc.recipe}
    end
    def most_recent_recipe
        recipe_cards = RecipeCard.all.select {|recipe_card| recipe_card.user == self}
        sorted_cards = recipe_cards.sort_by { |recipe_card| recipe_card.date}
        sorted_cards.map{|card| card.recipe}.last
    end
    def allergic_ingredients
        allergens.map{|allergy|
            allergy.ingredient
        }
    end
    def safe_recipes
        allergic_recipe_ingredients = RecipeIngredient.all.select{|recipe_ingredient|
            allergic_ingredients.include?(recipe_ingredient.ingredient)
        }
        allergic_recipes = allergic_recipe_ingredients.map{|ri|
            ri.recipe
        }
        binding.pry
        good_recipes = []
        Recipe.all.select{|recipe|
            !allergic_recipes.include?(recipe)
        }
    end

 end
 