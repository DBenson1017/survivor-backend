class LocationsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
        @locations = Location.all
        render json: @locations
    end 

    def create
        zip = params[:zip]
        response = Unirest.get "https://anywhichway-postal-codes.p.rapidapi.com/US/#{zip}",
        headers:{
        "X-RapidAPI-Host" => "anywhichway-postal-codes.p.rapidapi.com",
        "X-RapidAPI-Key" => ENV['LOCATION_KEY']
        }
        lat = response.body['lat']
        lon = response.body['lon']
        city= response.body['placeName']
        state = response.body['state']
        @location = Location.create(zip: zip, lon: lon, lat: lat, city: city, state: state)

    #     Location.buildLocation(params[:zip])

    #     @location = Location.create(zip: params[:zip])
        if @location.valid?
            render json: {location: @location}, status: :created
        else 
            render json: { error: 'failed to create location'}, status: :not_acceptable 
        end 
       Location.generateAirCard(@location.id, @location.zip)
       
    end 

    private 

    def location_params
    params.require(:location).permit(:zip)
    end 

end
