require "./parserV2"
require 'ap'

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

def browsing
    puts "Browse by artist or genre (a/g): "
    browse_choice = gets.chomp

    parser = Parser.new
    catalogue = parser.parse_files
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
    artist_song = catalogue.collect do |file|
        if file[0] == which_artist
            file[1]
            end
    end
    ap artist_song.compact
    puts "#{which_artist} has #{artist_song.compact.length} songs"

    #browse genres
    elsif browse_choice == "g"
        genre_catalogue = []
        catalogue.each do |mp3|
            genre_catalogue << mp3[2]
        end
        ap genre_catalogue.uniq!
        puts "there are a total of #{genre_catalogue.length} genres." 

        #more detail on genres
        puts "would you like to see songs and artists in a genre? y/n?"
        response = gets.chomp
            if response == "y"
                puts "which genre?"
                which_genre = gets.chomp.downcase
                genre_songs = catalogue.collect do |file|
                    if file[2] == which_genre
                        file[0]
                    end
                end
                ap genre_songs
            end

    else
            puts "Sorry, invalid entry."
    end
end
browsing




