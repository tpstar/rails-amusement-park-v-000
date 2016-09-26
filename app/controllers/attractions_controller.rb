class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update] #, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    # binding.pry
    redirect_to '/' unless logged_in?
  end

  def take_attraction
    # binding.pry
    if @attraction = Attraction.find(params[:attraction_id])
      ride = Ride.create(user_id: current_user.id, attraction_id: @attraction.id)
      flash[:notice] = ride.take_ride
      redirect_to current_user
    end
  end

  def new
    if current_user.admin
      @attraction = Attraction.new
    else
      redirect_to attractions_path
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    # binding.pry
    if current_user.admin
      @attraction.save
      redirect_to @attraction
    else
      redirect_to current_user
    end
  end

  def edit
  end

  def update
    if current_user.admin
      @attraction.update(attraction_params)
      redirect_to @attraction
    else
      redirect_to current_user
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
