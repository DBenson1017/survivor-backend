class FavoritesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

def index
    @favortes = Favorite.all
    render json: @favorites  
end 

def create
    @favorite = Favorite.create(location_id: params[:location_id], user_id: params[:user_id])
    render json: @favorite 
end

private 

def favorite_params
params.require(:favorite).permit(:location_id, :user_id)
end 

