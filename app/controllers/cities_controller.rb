class CitiesController < ApplicationController
    
	before_action :authenticate_user!
    
    layout 'application'
    
    def index
        @cities = City.all
    end

    def new
        @city = City.new
    end

    def create
        @city = City.new city_params

        if @city.save
            redirect_to city_path(@city)
        else            
            render 'new'
        end
    end

    def edit
        @city = City.find params[:id]
    end

    def show
        @city = City.find params[:id]
    end

    def update
        @city = City.find params[:id]
        if @city.update(city_params)           
            redirect_to city_path(@city)
        else            
            render 'edit'
        end
    end

    def destroy
        @city = City.find params[:id]
        @city.destroy
        redirect_to cities_path
    end
  
    private
    def city_params
        params.require(:city).permit!
    end

end