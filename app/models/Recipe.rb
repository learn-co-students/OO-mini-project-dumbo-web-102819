class Recipe

attr_reader :user 
@@all = []
@ingredients = []

def initialize(name, ingredients)
    @name = name
    @ingredients = ingredients
    @@all << self


def self.all
    @@all
end

def users
    all_recipe_cards_with_recipe = RecipeCard.all.select do |recipe_card|
        recipe_card.recipe == self
    end

    all_recipe_cards_with_recipe.map do |recipe|
        recipe.user
    end
end




