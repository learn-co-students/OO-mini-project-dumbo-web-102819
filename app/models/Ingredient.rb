class Ingredient

    @@all = []

    def initialize(ingredient)
        @ingredient = ingredient
        @@all << self
    end

    def self.most_common_allergen
        # self.all.max_by {|food|food.}
        self.all.max_by{|item| Allergy.all.select{|aller| aller.ingredient == item}.count}
   end

    def self.all
        @@all
    end


end
