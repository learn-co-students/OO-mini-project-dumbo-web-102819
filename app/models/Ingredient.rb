class Ingredient

attr_reader :name

@@all = []

def intialize(name)
   @name = name
   @all << self
end

def self.all
    @@all
end



