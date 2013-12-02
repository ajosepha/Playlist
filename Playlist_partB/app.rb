require '../Playlist_partA/lib*'
require 'ap'
require 'parser'

class Playlist


    def introduction
        puts "Type genre to browse by genre, or artist to browse by artist"
        response = gets.chomp
            if response = genre
                ap Genres.self.all

    end


    #initialize



end