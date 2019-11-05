class Ingredient

    @@all = []

    def initialize(ingredient)
        @ingredient = ingredient
        @@all << self
    end

    def self.most_common_allergen
      
    end

    def self.all
        @@all
    end


end
