require "./parserV2"
require 'ap'
require 'debugger'

# def song_count
#       parser = Parser.new
#         catalogue = parser.parse_files
#     puts "would you like to select an artist? y/n"
#         response = gets.chomp.downcase
#         if response == "y"
#             puts "please type in the index of the artist you would like to see the songs for."
#             answer = gets.chomp
#             ap "#{catalogue[answer]}" 
#      end
# end

# class Parser

#     def catalogue
#         @catalogue
#     end

#     def parse
#         @catalogue = ["hello"]
#         # @catalogue = some_parsing_logic
#     end

#     def get_artist
#         @catalogue.each do |item|
#             puts item
#         end
#         # @catalogue.each do |key|

#         # end
#     end
# end


# # high level interface
class Playlister

    # attr_reader :parser

    def initialize(parser)
        @parser = []

    end

    def get_artist
        @parser.get_artist
        # delegate getting the artist to the parser
        # or we can have the playlister know the structure of the data in the parser
        # @parser.get_artist
    end



    def browsing
        puts "Browse by artist or genre (a/g): "
        browse_choice = gets.chomp
        @parser.catalogue
        #browse artists, to refactor later

        if browse_choice == "a"
            artist_catalogue = []
            catalogue.each do |mp3|
                artist_catalogue << mp3[0]  
                end
            ap artist_catalogue.uniq!

            puts "there are a total of #{artist_catalogue.length} artists"
            puts "select an artist"

        #browse an artist
        which_artist = gets.chomp

        choose_artist(which_artist)
        
        ap artist_song.compact
        puts "#{which_artist} has #{artist_song.compact.length} songs"

        artist_genre.each do |song, genre|
          puts "#{song} - #{genre}"
        end
        #browse genres
        elsif browse_choice == "g"
            genre_catalogue = []
            catalogue.each do |mp3|
                genre_catalogue << mp3[2]
            end
            ap genre_catalogue.uniq!
            puts "there are a total of #{genre_catalogue.length} genres." 

            #more detail on genres
            puts "would you like to see artists (a) or songs (s) in a genre? please type a or s"
            response = gets.chomp
                if response == "a"
                    puts "which genre?"
                    which_genre = gets.chomp.downcase
                    genre_artist = catalogue.collect do |file|
                        if file[2] == which_genre
                            file[0]
                        end
                    end
                    ap genre_artist.compact
                elsif response == "s"
                    puts "which genre?"
                    which_genre = gets.chomp.downcase
                    genre_song = catalogue.collect do |file|
                        if file[2]==which_genre
                            file[1]
                        end
                    end
                    ap genre_song.compact
                end

        else
                puts "Sorry, invalid entry."
        end
    end

    def choose_artist(which_artist)
        artist = ""
        artist_song = catalogue.collect do |file|
            some_method(file, which_artist)
        end
        artist
    end

    def some_method(file, which_artist)
        if file[0] == which_artist
            return file[1]
        end
    end
end

debugger
parser = Parser.new
parser.parse
playlister = Playlister.new(parser)

puts 'hi'




