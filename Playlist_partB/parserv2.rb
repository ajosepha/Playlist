require './lib/artist'
require './lib/genres'
require './lib/songs'
require 'ap'
 
 class Parser
    def intialize
    end
    def parse_files
            files = Dir.entries('data').select {|f| !File.directory? f} #don't want . and .. defaults to get pulled
            artist = /((.*) (?=\-))/
            song = /(?<=\-\s).*(?=\s\[)/
            genre = /(?<=\[).*(?=\])/
            catalogue = []
            files.each do |item|
                    song_array = []
                    # we call strip b/c our regex results in some white space
                    m = item.match(artist).to_s.strip
                    z = item.match(song).to_s
                    x = item.match(genre).to_s
                    song_array << m << z << x
                    catalogue << song_array
            end
            catalogue
        end
end
# class Parser       
#     def initialize
#     end

    # artist = /((.*) (?=\-))/
    # song = /(?<=\-\s).*(?=\s\[)/
    # genre = /(?<=\[).*(?=\])/

    #m = files[0].match(artist)
    #z = files[0].match(song)
    #x = files[0].match(genre)

#     def parse_songs(files)
#         files = Dir.entries('data').select {|f| !File.directory? f}
#         artist = /((.*) (?=\-))/
#         song = /(?<=\-\s).*(?=\s\[)/
#         genre = /(?<=\[).*(?=\])/
#         catalogue = []
#         files.each do |item|
#             song_array = []
#             #strip removes whitespace from the front and back of a string
#             m = item.match(artist).to_s.strip
#             z = item.match(song).to_s
#             x = item.match(genre).to_s
#             song_array << m << z << x
#             catalogue << song_array
#         end
#         catalogue
#      end
# end


