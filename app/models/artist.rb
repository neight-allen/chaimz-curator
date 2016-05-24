class Artist < OpenStruct

  def self.service
    ChaimzService.new
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
    Artist.service.create_artist(self.to_h)
  end

end
