require 'rubygems'
require 'unirest'
require 'dotenv'
require 'dotenv/load'
require 'json'
require 'ostruct'


class Location < ApplicationRecord
    has_many :airs    
    
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

  def self.generateClimateCard()

    response = Unirest.get "https://climate-score.p.rapidapi.com/40.6499541/-73.8512693",
    headers:{
      "X-RapidAPI-Host" => "climate-score.p.rapidapi.com",
      "X-RapidAPI-Key" => "daab7205b6msh337f11b766ca16fp1b9fd9jsn1c4df39e00bc"
    }
  # puts response 
  end

  def self.generateWorldBankData()
    response = Unirest.get "http://climatedataapi.worldbank.org/climateweb/rest/v1/country/mavg/pr/2020/2039/USA"

  end 

end # end of class
