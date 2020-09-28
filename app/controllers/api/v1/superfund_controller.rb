class Api::V1::SuperfundController < ApplicationController

    def index
        # if params[:search] == nil
        #     #does nothing
        # else params[:search]
        # @superfunds = Superfund.search(params[:search])
        # end 
        @superfunds = Superfund.all
    end 

    def create
        @superfund = Superfund.create(superfund_params)
        
    end
       
    private 
    def superfund_params
        params.require(:superfund).permit(:location_id , :name, :address, :city, :zipcode, :state)
    end 


end
