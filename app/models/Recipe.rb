class Recipe
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def self.most_popular
        recipe_hash = {}
        RecipeCard.all.each do |recipe_card|
            recipe_hash[recipe_card.recipe] ? recipe_hash[recipe_card.recipe] += 1 : recipe_hash[recipe_card.recipe] = 1
        end
        recipe_hash.max_by {|recipe, count| count}.first
    end
    def recipe_cards
        RecipeCard.all.select do |recipe_card|
        recipe_card.recipe == self
        end
    end
    def users
        recipe_cards.map do |recipe_card|
            recipe_card.user
        end.uniq
    end
    def ingredients
        recipe_ingredient_array = RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
        recipe_ingredient_array
        recipe_ingredient_array.map{|recipe_ingredient| recipe_ingredient.ingredient }
    end
    def allergens
        allergen_array = []
         ingredients.each do |ingredient|
            Allergy.all.each do |allergy|
                allergy.ingredient == ingredient ? allergen_array << ingredient : next
            end
         end
         allergen_array
    end
    def add_ingredients(ingredient_array)
        ingredient_array.each {|ingredient| RecipeIngredient.new(self,ingredient) }
    end
 end