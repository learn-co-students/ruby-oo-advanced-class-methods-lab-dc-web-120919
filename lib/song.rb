require "pry"

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)

    @name, @artist_name = name, artist_name 

  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 

    new_song = Song.new 
    new_song.save 
    return new_song 
  end 

  def self.new_by_name(name)

    song = Song.new(name)
    return song 
  end 

  def self.create_by_name(name)

    song = self.create 
    song.name = name 
    return song 
  end 

  def self.find_by_name(name)

    exists = Song.all.find{|song| song.name == name}
    
    if exists == nil 
      return nil
    else
      return exists 
    end
  end 

  def self.find_or_create_by_name(name)

    found = Song.find_by_name(name)

    if found == nil 
      new_song = Song.create_by_name(name)
      return new_song 
    else
      return found
    end 
  end 

  def self.alphabetical 

    return Song.all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(filename)

    file_split = filename.split(' - ')
    title_split = file_split[1].split ('.')
    song = Song.new(title_split[0], file_split[0])
    return song 
  end 

  def self.create_from_filename(filename)

    song = Song.new_from_filename(filename)
    song.save 
    return song 
  end

  def self.destroy_all

    return @@all.clear 
  end 

end
