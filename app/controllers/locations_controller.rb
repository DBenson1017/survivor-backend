class LocationsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
        @locations = Location.all
        render json: @locations
    end 

    def create
        @location = Location.create(zip: params[:zip])
        if @location.valid?
            render json: {location: @location}, status: :created
        else 
            render json: { error: 'failed to create location'}, status: :not_acceptable 
        end 
        # add another method in model to run SF search by location zip 
    end 

    private 

    def location_params
    params.require(:location).permit(:zip)
    end 

end
