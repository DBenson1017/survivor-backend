require 'rubygems'
require 'unirest'
require 'dotenv'
require 'dotenv/load'
require 'json'
require 'ostruct'


class Location < ApplicationRecord
    has_many :airs


    
    def self.buildLocation(zip)
           response = Unirest.get "https://anywhichway-postal-codes.p.rapidapi.com/US/#{zip}",
            headers:{
            "X-RapidAPI-Host" => "anywhichway-postal-codes.p.rapidapi.com",
            "X-RapidAPI-Key" => ENV['LOCATION_KEY']
            }
            lat = response.body['lat']
            lon = response.body['lon']
            city= response.body['placeName']
            state = response.body['state']
            
            puts lat
            puts lon
            puts city 
            puts state   
            
            Location.create(zip: zip, lon: lon, lat: lat, city: city, state: state)
      end 
                
    



    def self.generateAirCard(id, zip)
        response = Unirest.get "https://us-air-quality-by-zip-code.p.rapidapi.com/getairqualityzipcode?zip=#{zip}",
        headers:{
          "X-RapidAPI-Host" => "us-air-quality-by-zip-code.p.rapidapi.com",
          "X-RapidAPI-Key"=> ENV['AIR_QUALITY']
        }
        data = JSON.parse(response.raw_body) 
        city= data['City']
        state= data['State']
        index= data['AirQualityIndex']
        code= data['AirQualityCode']
        quality= data['AirQuality']

        Air.create(air_quality: quality, quality_code: code, quality_index: index, city: city, state: state, location_id: id)
    end

end
