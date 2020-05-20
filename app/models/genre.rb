class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.size
  end

  def artist_count
    # return the number of artists associated with the genre
    artist_array = []
    self.songs.all.collect do |song|
      artist_array << song.artist
    end
    artist_array.uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name 
    artist_array = []
    self.songs.all.collect do |song|
      artist_array << song.artist
    end
    artist_array.name.uniq
    
  end
end
