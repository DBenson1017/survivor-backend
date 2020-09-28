class SuperfundController < ApplicationController

    def index
        if params[:search] == nil
            #does nothing
        else params[:search]
        @superfunds = Superfund.search(params[:search])
        end 
        @superfund_results = Superfund.all
    end 
       
    private 
    def superfund_params
        params.require(:superfund).permit(location_id: :search, :name, :address, :city, :zipcode, :state)
    end 


end
