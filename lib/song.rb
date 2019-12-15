require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    #instantiates and saves the song, and it returns the new song that was created
    song = self.new
    song.save 
    song
  end 

  def self.new_by_name(song_name)
    #instantiates a song with a name property
    song = self.new 
    song.name = song_name 
    song
  end

  def self.create_by_name(song_name)
    #instantiates and saves a song with a name property
    song = self.create 
    song.name = song_name 
    song
  end

  def self.find_by_name(song_name)
    #can find a song present in @@all by name
    #detect stops iterating after the condition returns true for the first time. 
    #select will iterate until the end of the input list is reached and returns 
    #all of the items where the block returned true.
    self.all.detect{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    #invokes .find_by_name and .create_by_name instead of repeating code
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    #returns all the song instances in alphabetical order by song name 
    self.all.sort_by{|song| song.name}

  end

  def self.new_from_filename(filename)
    #initializes a song and artist_name based on the filename format
    parts = filename.split(" - ") #.split will split off what comes after the " - " in 
    #this case: "Thundercat - For Love I Come.mp3" will return ["Thundercat", "For Love I Come.mp3"]
    artist_name = parts[0] #here we are creating a variable that singles out the artist name in our new split array,
    #so in this case we are saying parts at the index of [0] which would be "Thundercat"
    song_name = parts[1].gsub(".mp3", "") #in this case, gsub replaces the .mp3 with "" in the string For Love I Come

    song = self.new #initializes a new song 
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create #instantiates and saves the song, and it returns the new song that was created
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    #clears all the song instances from the @@all array
    self.all.clear 
  end

end
