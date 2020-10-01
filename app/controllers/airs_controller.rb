class AirsController < ApplicationController

    skip_before_action :authorized, only: [:create, :index]

def index
    @airs = Air.all
    render json: @airs 
end 


end
