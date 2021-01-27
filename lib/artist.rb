class Artist

attr_accessor :name
@@all = []  

def initialize(name)
      @name = name
      @@all << self
end

def add_song(song)
    song.artist = self
end

def songs
    Song.all.select {|song| song.artist == self}
end

def self.find_or_create_by_name(name)
    result = @@all.select{|artist| artist.name == name}
    if (result.length == 0)
        return Artist.new(name)
    else
        result[0]
    end
end

def print_songs
    songs.each do |song|
        puts song.name
    end
end

def self.all
    @@all 
end

end