class User
    attr_reader :name 

    @@all = []

    def initialized(name)
        @name = name 
        @@all << all
    end

    def self.all
        @all
    end

    def recipies
        #Recipe card.all will grab all recipe card

        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
            
        end
    
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        all_allergy_user_is_allergic_to = Allergy.all.select do |allergy|
            allergy.user == self

        end

        all_allergy_user_is_allergic_to.map do |allergy|
            allergy.ingredient
        end

    end

    def top_three_recipies
        
    end



end



