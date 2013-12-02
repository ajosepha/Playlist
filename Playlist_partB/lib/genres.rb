

class Genre

    @@all = []

    attr_accessor :name, :songs, :artists

    def initialize
    @name = name
    @songs = []
    @artists = []
    @@all << self

    end


    def self.reset_genres
     @@all = []
    end

    def self.all
    @@all
    end

end