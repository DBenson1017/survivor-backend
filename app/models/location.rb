require 'rubygems'
require 'unirest'
require 'dotenv'
require 'dotenv/load'
require 'json'
require 'ostruct'
require 'byebug'


class Location < ApplicationRecord
    has_many :airs    
    
    def self.generateAirCard(id, zip)
        response = Unirest.get "https://us-air-quality-by-zip-code.p.rapidapi.com/getairqualityzipcode?zip=#{zip}",
        headers:{
          "X-RapidAPI-Host" => "us-air-quality-by-zip-code.p.rapidapi.com",
          "X-RapidAPI-Key"=> ENV['AIR_QUALITY']
        }
        # byebug
        data = JSON.parse(response.raw_body) 
        city= data['City']
        state= data['State']
        index= data['AirQualityIndex']
        code= data['AirQualityCode']
        quality= data['AirQuality']

        Air.create(air_quality: quality, quality_code: code, quality_index: index, city: city, state: state, location_id: id)
    end

    def self.generateSuperfundCard()
      response = Faraday.get "https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/43017/JSON/rows/1:19"
      # response = Faraday.get("https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/06062/JSON/rows/1:19")
      # superfund_response = RestClient.get(response)
      byebug
      # superfund_data = JSON.parse(response)
      Superfund.create(location_id: id, name: response["SITE_NAME"], address:s["SITE_STRT_ADRS1"], city:s["SITE_CITY_NAME"], zipcode: s["SITE_ZIP_CODE"], state:s["RSTATE_CODE"])
    end 

    # def self.generateSuperfund(id, zip)

    # end 

end # end of class
