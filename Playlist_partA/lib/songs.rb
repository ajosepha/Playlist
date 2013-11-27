class Song

    attr_accessor :genre

    def initialize
        @genre
        @artist
    end

    def genre=(genre)
        @genre
        genre.songs<< self   
    end

    def genre
        @genre
    end

end