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

    attr_reader :parser

    def initialize(parser)
        @parser = parser
    end

    # def get_artist
    #     @parser.get_artists
    # end

    def other_options
    puts "type 1 if would you like to see the artists associated with a genre?"
    puts "type 2 if you would like to see the songs associated with an artists"
    puts "type 3 if you would like to see how many songs are in the playlist"
    puts "type 4 if you would like to see how many artists are in the playlist"
    puts "type 5 if you would like to see the songs in a genre"
    puts "type 6 for a surprise!"
    response = gets.chomp
        if response == "1"
            artists_in_a_genre
        elsif response == "2"
            songs_of_an_artist
        elsif response == "3"
            ap @parser.get_songs.length
        elsif response == "4"
            ap @parser.get_artists.length
        elsif response == "5"
            songs_in_a_genre
        elsif response == "6"
            ap @parser.parse_files.sample
        else
            puts "no other options, goodbye!"
        end
    end

    def browsing
    puts "Browse by artist or genre (a/g/o for other): "
    choice = gets.chomp
    if choice == "a"
        ap @parser.get_artists
    elsif  choice == "g"
        ap @parser.get_genres
    elsif choice == "o"
        other_options
    else
        puts "not a valid answer, goodbye."
    end
    end



    def artists_in_a_genre
        ap @parser.get_genres
        puts "what genre?"
        my_genre = gets.chomp.downcase
        artists = @parser.parse_files.collect do |file|
            if file[2] == my_genre
                file[0]
            end
        end 
        ap artists.compact!
    end

    def songs_of_an_artist
        ap @parser.get_artists
        puts "what artist?"
        my_artist = gets.chomp
        songs = @parser.parse_files.collect do |file|
            if file[0] == my_artist
                file[1]
            end
        end
        ap songs.compact.uniq
    end

    def songs_in_a_genre
        ap @parser.get_genres
        puts "what genre"
        my_genre = gets.chomp.downcase
        songs = @parser.parse_files.collect do |file|
            if file[2]==my_genre
                file[1]
            end
        end
        ap songs.compact.uniq
        #use compact because this prints out a duplicate of the parse_files. Not sure why.
    end
end   

          #if response == "a"
    #                 puts "which genre?"
    #                 which_genre = gets.chomp.downcase
    #                 genre_artist = catalogue.collect do |file|
    #                     if file[2] == which_genre
    #                         file[0]
    #                     end
    #                 end


        #browse artists, to refactor later

    #     if browse_choice == "a"

    #     #browse an artist
    #     which_artist = gets.chomp

    #     choose_artist(which_artist)
        
    #     ap artist_song.compact
    #     puts "#{which_artist} has #{artist_song.compact.length} songs"

    #     artist_genre.each do |song, genre|
    #       puts "#{song} - #{genre}"
    #     end
    #     #browse genres
    #     elsif browse_choice == "g"
    #         genre_catalogue = []
    #         catalogue.each do |mp3|
    #             genre_catalogue << mp3[2]
    #         end
    #         ap genre_catalogue.uniq!
    #         puts "there are a total of #{genre_catalogue.length} genres." 

    #         #more detail on genres
    #         puts "would you like to see artists (a) or songs (s) in a genre? please type a or s"
    #         response = gets.chomp
    #             if response == "a"
    #                 puts "which genre?"
    #                 which_genre = gets.chomp.downcase
    #                 genre_artist = catalogue.collect do |file|
    #                     if file[2] == which_genre
    #                         file[0]
    #                     end
    #                 end
    #                 ap genre_artist.compact
    #             elsif response == "s"
    #                 puts "which genre?"
    #                 which_genre = gets.chomp.downcase
    #                 genre_song = catalogue.collect do |file|
    #                     if file[2]==which_genre
    #                         file[1]
    #                     end
    #                 end
    #                 ap genre_song.compact
    #             end

    #     else
    #             puts "Sorry, invalid entry."
    #     end
    # end

    # def choose_artist(which_artist)
    #     artist = ""
    #     artist_song = catalogue.collect do |file|
    #         some_method(file, which_artist)
    #     end
    #     artist
    # end

    # def some_method(file, which_artist)
    #     if file[0] == which_artist
    #         return file[1]
    #     end
    # end
#end


parser = Parser.new
#parser.parse
playlister = Playlister.new(parser)
playlister.browsing






