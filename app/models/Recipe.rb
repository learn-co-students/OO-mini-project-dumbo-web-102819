class Recipe
    attr_reader :ingredient, :user, :name
     

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
        # popular = RecipeCard.all.max_by{|popular| RecipeCard.count}
        # popular.recipe
        popular = RecipeCard.all.inject(Hash.new(0)) do |card,count|
            card[count] += 1
            card
        end
        RecipeCard.all.max_by{|num| popular[num]}.recipe
    end

    def allergens
        allergies = Allergy.all.map{|allergy| allergy.ingredient}
        this_recipe = self.ingredients
        # binding.pry
        allergies.select{|item| this_recipe.include?(item)}
      end

    def add_ingredients(ingredient_list)
        ingredient_list.map {|item| RecipeIngredient.new(item,self) }
    end





end
