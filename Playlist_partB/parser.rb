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

    def collect_songs
    songs_array = Dir.entries("data").select {|f| !File.data? f}
    end

     def match_song mp3_file
        mp3_to_match = mp3_file.gsub(" [", "*")
        song_regex = /-\s(.*)\*/
        m = song_regex.match(mp3_to_match)
         m[1]   #this will be equal to the song title
    end

     def match_genre mp3_file
    genre_regex = /\[(.+)\]/
    m = genre_regex.match(mp3_file)
    m[1]
  end

  def parse
    mp3_files.each do |mp3|
      m_artist = match_artist(mp3)
      m_song = match_song(mp3)
      m_genre = match_genre(mp3)
      
      existing_artist = Artist.search_all(m_artist)

      artist = existing_artist|| Artist.new(m_artist)
      
      existing_genre = Genre.search_all(m_genre)

      song = Song.new(m_song)
      song.genre = existing_genre || Genre.new(m_genre)
    
      artist.add_song(song)

      unless existing_genre
        @genres << song.genre
      end

      unless existing_artist
        @artists << artist
      end

      @songs << song
    end
  end



    #use regex to split files into different parts

    
    #need to use regex



    #notes.  first part of data is artists. after the - is the song namae, and in  [] is the genre.
    #parser will be able to sort through the data to relay this information.

end
