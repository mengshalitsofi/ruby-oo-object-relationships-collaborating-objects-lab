class Song
    attr_accessor :artist, :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      save
    end
  
    def save
      @@all << self
    end
  
    def self.all
      @@all
    end

    def self.new_by_filename(filename)
        parts = filename.split(" - ")
        song = Song.new(parts[1])
        song.artist_name = parts[0]
        song
    end
    
    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

end
