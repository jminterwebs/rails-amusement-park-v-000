class RidesController < ApplicationController

  def new
    @ride = Ride.new
    @ride.user_id = current_user.id
    @ride.attraction_id = params[:attraction_id]
    @ride.save

    flash[:alert] = @ride.take_ride
    redirect_to user_path(current_user)
  end


  private

  def attraction_name
    attraction = Attraction.find(params[:attraction_id])
    attraction.name
  end


end
