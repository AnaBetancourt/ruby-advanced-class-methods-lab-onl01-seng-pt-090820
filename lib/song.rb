require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end
  
  def self.create
    song = self.new
    song.save
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
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_name)
    split_name = song_name.split(" - ")
    split_name[1] = split_name[1].chomp(".mp3")
    song_name = split_name[1]
    artist = split_name[0]
    
    song = self.new 
    song.name = song_name
    song.artist_name = artist 
    song
  end
  
  def self.create_from_filename(song_name)
    split_name = song_name.split(" - ")
    split_name[1] = split_name[1].chomp(".mp3")
    song_name = split_name[1]
    artist = split_name[0]
    
    song = self.new 
    song.name = song_name
    song.artist_name = artist 
    song.save
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
end