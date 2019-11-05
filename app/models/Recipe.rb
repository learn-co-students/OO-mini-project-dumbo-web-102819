class Recipe
    attr_reader :ingredient
    attr_accessor :user, :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def ingredients 

        recipe_ingr_list = RecipeIngredient.all.select {|food| food.recipe == self}
        recipe_ingr_list.map {|food|food.ingredient}
    end

    def self.most_popular
        #list of recipe cards
        #find most repeated "recipe" attribute
        popular = RecipeCard.all.max{|a, b| a.count <=> b.count}
        popular.recipe
    end

    def allergens
    end

    def add_ingredients(ingredient_list)
        ingredient_list.map {|item| RecipeIngredient.new(item,self) }
        
    end

    

    

end
