class Artist < OpenStruct

  def self.service
    ArtistService.new
  end

  def self.find(id)
    temp_artist_hash = service.artist_hash(id)
    Artist.new(temp_artist_hash)
  end

  def self.all
    temp_artists_hash = service.artists_hash
    temp_artists_hash.map do |temp_artist_hash|
      Artist.new(temp_artist_hash)
    end
  end

  def save
    # This save method will only work on creating new artists.
    # We still need to extend this method to update existing ones
    Artist.service.create_artist(self.to_h)
  end

  def albums
    Album.all.select { |album| album.artist_id == self.id }
  end


  
end
