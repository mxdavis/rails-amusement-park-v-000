class AttractionsController < ApplicationController

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def create
    a = Attraction.new(attraction_params)
    if a.save
      redirect_to attraction_path(a), alert: "You have successfully created #{a.name}"
    else
      redirect_to root_path, alert: "There was an error"
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    attraction = Attraction.find_by(id: params[:id])
    if attraction.update(attraction_params)
      redirect_to attraction_path(attraction), alert: "You have successfully updated #{attraction.name}"
    else 
      redirect_to root_path, alert: "There was an error"
    end
  end

  private 

  def attraction_params
     params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets, :user_id)
  end
end
