require 'rubygems'
require 'unirest'
require 'dotenv'
require 'dotenv/load'


class Air < ApplicationRecord
  belongs_to :location

  def self.generate(zip)
    
    response = Unirest.get "https://us-air-quality-by-zip-code.p.rapidapi.com/getairqualityzipcode?zip=#{zip}",
    headers:{
      "X-RapidAPI-Host" => "us-air-quality-by-zip-code.p.rapidapi.com",
      "X-RapidAPI-Key"=> ENV['AIR_QUALITY']
    }
end

end #end of class 
