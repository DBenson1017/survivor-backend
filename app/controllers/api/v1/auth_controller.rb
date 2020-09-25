class Api::V1::AuthController < ApplicationController

    def create 
        @user = User.create(user_params)
        if @user.valid?
            render json: {user: UserSerializer.new(@user)}, status: :created
        else 
            render json: { error: 'failed to create user'}, status: :not_acceptable
        end 
    end 

    # def index 
    #     @users = User.all
    #     render json: @users
    # end 

    # def show
    #     @user = User.find(params[:id])
    #     render json: @user
    # end 

    private 
    def user_params 
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :zip)
    end
end