class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    # No view implimented
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
  end


  private

    def artist_params
      params.require(:artist).permit(:name)
    end


end
