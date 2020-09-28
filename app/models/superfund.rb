class Superfund < ApplicationRecord
    belongs_to :location

     def self.search(06062) #will later be replaced by zip interpolated from location
        @superfunds = "https://enviro.epa.gov/enviro/efservice/cer_site/site_zip_code/06062/JSON/rows/1:19"
     end 

     def superfund_instances
        @superfund_results = []

        @superfunds.each do |s|
            #info to initialize superfunds
            superfund_results << Superfund.create(name:s.site_name, address:s.site_strt_adrs1, city:s.site_city_name, zipcode: s.site_zip_code, state:s.rstate_code)
        end 
     end 

        
    
end
