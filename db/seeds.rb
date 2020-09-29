# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'JSON'
require 'byebug'

# User.destroy_all()
Location.destroy_all

# cat = User.create(username: 'cathjime', first_name: 'cat', last_name: 'jimenez', email: 'test@gmail.com', zip: '07093', password: 'passw0rd')

ziptest = Location.create(zip: 11215)


response_url = "https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/06062/JSON/rows/1:19"
superfund_response = RestClient.get(response_url)
superfund_data = JSON.parse(superfund_response) #["results"]

# puts superfund_data
# byebug
# "something"
    
superfund_data.each do |s|
    Superfund.create(location_id:ziptest.id, name:s["SITE_NAME"], address:s["SITE_STRT_ADRS1"], city:s["SITE_CITY_NAME"], zipcode: s["SITE_ZIP_CODE"], state:s["RSTATE_CODE"])
end




