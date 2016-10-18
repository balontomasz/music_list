class TracksController < ApplicationController
  def index
    filter_type = params[:filter_type].to_s
    @tracks =  case filter_type.to_sym
               when :accepted
                 Track.accepted.order(created_at: :desc)
               when :rejected
                 Track.rejected.order(created_at: :desc)
               else
                 Track.pending.order(created_at: :desc)
               end
  end

  def create
    Track.create!(track_params)
    redirect_to root_path
  end

  def destroy
    Track.destroy(params[:id])
    redirect_to root_path
  end

  private

  def track_params
    params.require(:track).permit(:link)
  end
end
