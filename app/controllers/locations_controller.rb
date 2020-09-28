class LocationsController < ApplicationController

    def index
        @locations = Location.all
        render json: @locations
    end 


    
    def create
        @location = Location.create(params[:zip])
        # add another method in model to run SF search by location zip 
    end 

    private 

    def location_params
    params.require(:location).permit(:zip)
    end 

end
