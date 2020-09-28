class AirsController < ApplicationController

def index
    @airs = Air.all
    render json: @airs 
end 


end
