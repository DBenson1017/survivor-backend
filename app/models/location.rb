require 'rubygems'
require 'unirest'
require 'dotenv'
require 'dotenv/load'
require 'json'
require 'ostruct'
require 'byebug'


class Location < ApplicationRecord
    has_many :airs
    has_many :superfunds    
    
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

    def self.generateSuperfundCard(id, zip)  
      response_url = "https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/#{zip}/JSON/rows/1:19"
      superfund_response = RestClient.get(response_url)
      superfund_data = JSON.parse(superfund_response) #["results"]

      superfund_data.each do |site| 
          id= id
          name = site["SITE_NAME"]
          address = site["SITE_STRT_ADRS1"]
          city= site["SITE_CITY_NAME"]
          zipcode= site["SITE_ZIP_CODE"]
          state= site["RSTATE_CODE"]
          
          test = Superfund.create(location_id: id, name: name, address: address, city: city, zipcode: zipcode, state: state)
        end 
        byebug
      
    end 

    # def self.generateSuperfund(id, zip)

    # end 

end # end of class
