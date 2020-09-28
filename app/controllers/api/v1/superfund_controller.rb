class Api::V1::SuperfundController < ApplicationController

    def index
        @superfunds = Superfund.all
    end 

    def create
        @superfund = Superfund.create(superfund_params)
        #using location_id
    end
       
    private 
    def superfund_params
        params.require(:superfund).permit(:location_id , :name, :address, :city, :zipcode, :state)
    end 


end
