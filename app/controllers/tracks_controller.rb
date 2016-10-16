class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def create
    Track.create!(track_params)
    redirect_to root_path
  end

  private

  def track_params
    params.require(:track).permit(:link)
  end
end
