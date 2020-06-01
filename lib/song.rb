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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song_array|
      song_array.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song|song.name}
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ") #["Thundercat", "For Love I Come.mp3"]
    parsed_filename_array = filename_array.map {|song_name| song_name.gsub(/.mp3/, '')}
    song = self.new
    song.name = parsed_filename_array[1]
    song.artist_name = parsed_filename_array[0]
    song
  end

  def self.create_from_filename(filename)
    filename_array = filename.split(" - ") #["Thundercat", "For Love I Come.mp3"]
    parsed_filename_array = filename_array.map {|song_name| song_name.gsub(/.mp3/, '')}
    song = self.create
    song.name = parsed_filename_array[1]
    song.artist_name = parsed_filename_array[0]
  end
  
  def self.destroy_all
    self.all.clear
  end
end
