

require 'rest-client'
require 'JSON'
require 'byebug'

# User.destroy_all()
# Location.destroy_all()
# Air.destroy_all()
# Superfund.destroy_all()


################working super fund generator 

# ziptest = Location.create(zip: 11215)
# response_url = "https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/80216/JSON/rows/1:19"
# superfund_response = RestClient.get(response_url)
# superfund_data = JSON.parse(superfund_response) #["results"]
# byebug    
# superfund_data.each do |s|
#     Superfund.create(location_id:ziptest.id, name:s["SITE_NAME"], address:s["SITE_STRT_ADRS1"], city:s["SITE_CITY_NAME"], zipcode: s["SITE_ZIP_CODE"], state:s["RSTATE_CODE"])
# end

#################################


LocationUser.create(location_id: 1, user_id: 1)
 




