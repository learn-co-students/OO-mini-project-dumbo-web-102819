class RecipeCard

    attr_accessor :date, :rating, :user, :recipe 
    @@all = []


    def initialize(recipe, user, date, rate)
        @recipe = recipe
        @user = user
        @date = date 
        @rating = rate
        @@all << self
    end


    def self.all
        @@all
    end



end