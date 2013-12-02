require '../Playlist_partA/lib*'

class Parser

    attr_accessor :artist, :songs, :genre

    def initialize
        @artists = []
        @genres = []
        @songs = []

    end

end
