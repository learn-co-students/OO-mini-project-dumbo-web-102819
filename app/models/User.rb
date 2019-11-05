class User

    @@all = []

    def initialize(user)
        @user = user
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        RecipeCard.all.select {|card| card.user == self }
    end 

    def add_recipe_card (recipe, date, rating)
        RecipeCard.new(recipe, self, date, rating)
    end

    def top_three_recipes 
        # User's recipe card Rating property is 
        #greater than the other recipe cards for this user
        self.recipes.max(3) {|a, b| a.rating <=> b.rating}
    end

    def most_recent_recipe 
        self.recipes.pop
    end

    def declare_allergy (ingredient)
        Allergy.new(ingredient, self)

    end

    def allergens 
        allergies= Allergy.all.select{|food| food.user == self}
        allergies.map {|allergy| allergy.ingredient}
    end

    # def safe_recipes
    #     # #list of recipes !include allergens
    #     #  Allergy.all.select{|food| food.user == self }
    #     allergies = self.allergens
    # end
                
end