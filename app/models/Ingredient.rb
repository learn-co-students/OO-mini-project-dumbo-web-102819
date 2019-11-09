
class Ingredient 
    @@all = []
    def intialize 
        @@all << self
    end 
    def self.all
        @@all
    end 
    def allergies
        Allergy.all.select do |instance|
            instance.ingredient == self 
        end 
    end 
    def self.most_common_allergen
        new_hash = {}
        Allergy.all.each do |instance|
            if new_hash[instance.ingredient]
                new_hash[instance.ingredient] += 1
            else 
                new_hash[instance.ingredient] = 1
            end 
        end 
        new_hash.max_by { |key, value| value }.first
        # allergy - > user - > ingredient  
    end 
        
end 