# Part 1: Object Models
# Create a lib directory and put the classes you create in there.
# Create a Class for song, artist, and genre. Use an individual file for each class.
# These files should be placed within a lib directory and required on the top of
# any script that utilizes them (including this test script). Once required
# all the tests within this suite should pass.
# Before you start trying to make tests pass, think through how artists, songs and genres are related in the real world.
# Our goal is to model the real world using classes and relationships between objects.  Any relationship you
# create should intuitively make sense to you.  

class Artist

    attr_accessor :name, :songs, :genre

    @@count = 0
    ARTISTS = []


    def initialize
    @@count += 1
    @name = name
    @songs = []
    @genre = []
    ARTISTS << self
    end

    def songs_count
        @songs.length
    end

    def add_song(song)
        @songs << song
        @genre << song.genre
         if song.genre 
            unless song.genre.artists.include? self
        song.genre.artists << self
      end
    end
    end

    def genres
    songs.map{|song| song.genre}.uniq
    end

    def self.count
        @@count
    end

    def self.reset_artists
        @@count = 0
    end

    def self.all
        ARTISTS
    end
  
end