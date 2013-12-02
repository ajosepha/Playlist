class Song

    attr_accessor :name, :genre


    def initialize
        @genre
        @artist
        @name = name
    end

    def genre=(genre)
        @genre = genre
        genre.songs<< self 
    end


end