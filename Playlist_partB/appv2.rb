
def browsing
  puts "Browse by artist or genre"
  browse_choice = gets.chomp.downcase
  parser = Parser.new
  catalog = parser.parse_songs

  if browse_choice == "artist"
    #print list of all unique artists alphab with song count
    new_catalog = []
    artist_songs = {}
    catalog.each do |file|
      new_catalog << file[0]
      if artist_songs[file[0]].nil?
        artist_songs[file[0]] = 1
      else
        artist_songs[file[0]] += 1
      end
    end

    new_catalog.uniq!
    artist_songs.each do |artist, count|
      puts "#{artist} - #{count} song(s)"
    end
    puts "There are #{new_catalog.count} artists in this list."
    
    puts "Select an artist"
    which_artist = gets.chomp
    artist_genre = {}
     #print out a list of songs and genres for that artist
    catalog.each do |file|
      if file[0] == which_artist
        artist_genre[file[1]] = file[2]
      end
     
    end

    artist_genre.each do |song, genre|
      puts "#{song} - #{genre}"
    end
   
  elsif browse_choice == "genre"
    #print list of all genres sorted by the amount of songs
    genre_catalog = []
    catalog.each do |file|
      genre_catalog<< file[2]
    end
    genre_catalog.uniq!
    puts genre_catalog
    puts "There are #{genre_catalog.count} genres in this list."
    #the number of songs and number artists per genre should be included
    #user select genre
    #puts "Select a genre"
    #which_genre = gets.chomp
    #find genre that is == which_genre
    #they should be taken to the individual genre "page"
    #the genres page should list the name of the songs, linking to the individual song and artists 
    #Also include the total unique artists and song counts in the genre
    #a user should be able to type artist name M83 and be taken to M83's artist "page" 
    #or type song name Midnight City and get taken to the songs "page"
    #the song page should list all the available info on the song, it's artist and genre.
  else
    puts "Sorry I did not understand"
    browsing
  end
end

browsing