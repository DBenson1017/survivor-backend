require 'byebug'

class Superfund < ApplicationRecord
    belongs_to :location
end


# def self.generate()
  
# response_url = Faraday.get("https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/06062/JSON/rows/1:19")
# superfund_response = RestClient.get(response_url)
# superfund_data = JSON.parse(superfund_response) #["results"]
# byebug
#     end 
    

# Superfund.create(location_id: ziptest.id, name:s["SITE_NAME"], address:s["SITE_STRT_ADRS1"], city:s["SITE_CITY_NAME"], zipcode: s["SITE_ZIP_CODE"], state:s["RSTATE_CODE"])   
