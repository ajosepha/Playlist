require './lib/artist'
require './lib/genres'
require './lib/songs'

class Parser

    attr_accessor :artist, :songs, :genre, :directory

    def initialize
        @artists = []
        @genres = []
        @songs = []
        @data = data
        @mp3_files = collect_songs
    end

    #pull file names from direcotory




    #use regex to split files into different parts

    
    #need to use regex



    #notes.  first part of data is artists. after the - is the song name, and in  [] is the genre.
    #parser will be able to sort through the data to relay this information.

end
