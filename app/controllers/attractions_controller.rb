class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

    def index
      @attractions = Attraction.all
    end
  
    def show
      @attraction = Attraction.find_by(id: params[:id])
      @ride = @attraction.rides.build(user_id: current_user.id)
    end
  
    def new
      @attraction = Attraction.new
    end
  
    def create
      @attraction = Attraction.create(attraction_params)
      if @attraction
        redirect_to attraction_path(@attraction)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      @attraction.update(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        render :edit
      end
    end
  
    private

    def find_attraction
      @attraction = Attraction.find_by(id: params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end
    
  end
