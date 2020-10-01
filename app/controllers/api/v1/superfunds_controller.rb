class Api::V1::SuperfundsController < ApplicationController

    skip_before_action :authorized, only: [:create, :index]

    def index
        @superfunds = Superfund.all
        render json: @superfunds
    end 

    def create
        # @superfund = Superfund.create(superfund_params)
        # #using location_id
    end
       
    # private 
    # def superfund_params
    #     params.require(:superfund).permit(:location_id , :name, :address, :city, :zipcode, :state)
    # end 


end
