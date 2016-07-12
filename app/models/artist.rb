class Artist < OpenStruct

  def self.service
    @@service ||= ArtistService.new
  end

  def self.all
    artists_hash = service.get_artists

    artists_hash.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end

  def self.find(id)
    artist_hash = service.get_artist(id)
    Artist.new(artist_hash)
  end

  def self.create(artist_hash)
    new_artist_hash = service.post_artist(artist_hash)
    Artist.new(new_artist_hash)
  end

  def update(artist_hash)
    updated_artist_hash = Artist.service.patch_artist(id, artist_hash)
    Artist.new(updated_artist_hash)
  end

end
