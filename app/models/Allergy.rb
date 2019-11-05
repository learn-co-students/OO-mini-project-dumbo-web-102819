class Allergy
    @@all = []

    attr_accessor :ingredient, :user, :ingredient

    def initialize(ingredient, user)
        @ingredient = ingredient
        @user = user
        @@all << self
    end

    def self.all
        @@all
    end

end
