class Ingredient
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        allergy_hash = {}
        Allergy.all.each do |allergy|
            allergy_hash[allergy.ingredient] ? allergy_hash[allergy.ingredient] += 1 : allergy_hash[allergy.ingredient] = 1
        end

        allergy_hash.max_by {|ingredient, count| count}.first
    end

end


