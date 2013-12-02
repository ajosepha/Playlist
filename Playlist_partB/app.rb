require '../Playlist_partA/lib*'
require 'ap'
require 'parser'

class Playlist

    def initialize
        parser = Parser.new
        @artists = parser.artists
        @genres = parser.genres
        @songs = parser.songs
    end


    def introduction
        puts "Type genre to browse by genre, or artist to browse by artist"
        response = gets.chomp
            if response = genre
                ap Genres.self.all
    end


    #initialize



end