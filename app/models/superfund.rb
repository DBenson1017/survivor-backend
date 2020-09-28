require 'byebug'

class Superfund < ApplicationRecord

    belongs_to :location

    #zip and string interpolate zip
    #get info and return resp
     def self.search(06062) #will later be replaced by zip interpolated from location
        response= Faraday.get("https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/06062/JSON/rows/1:19")

        puts response.status, response.body
        
        superfunds_api.each do |s|
            Superfund.create(name:s.site_name, address:s.site_strt_adrs1, city:s.site_city_name, zipcode: s.site_zip_code, state:s.rstate_code)
        end

     end 

    
        
    
end
