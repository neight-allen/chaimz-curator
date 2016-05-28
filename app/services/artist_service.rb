class ArtistService

  def initialize
    @connection = Faraday.new(url: "https://my-chaimz.herokuapp.com/api/v1/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_artists
    @connection.get "artists"
  end

  def get_artist(id)
    # Watch out for leading slashes in your URLs. They will be treated the same way hrefs are in <a> tags
    @connection.get "artists/#{id}"
  end

  def artists_hash
    parse(get_artists)
  end

  def artist_hash(id)
    parse(get_artist(id))
  end

  def post_artist
    @connection.post "artists"
  end

  def create_artist(new_artist_hash)
    @connection.params = new_artist_hash
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
