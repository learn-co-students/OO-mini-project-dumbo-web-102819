class RecipeIngredient

    attr_accessor :ingredient, :recipe 

    def initialize(ingredient, recipe)
        @ingredient = ingredient
        @recipe = recipe
        @@all << self
    end

    @@all = []

    def self.all
        @@all
    end





end