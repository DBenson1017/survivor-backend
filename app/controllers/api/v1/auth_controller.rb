class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def create 
       
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            # render json: {user: @user, jwt: token }, status: :accepted
            render json: {user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else 
            render json: {message: 'invalid username or password (auth_controller)'}, status: :unauthorized
        end  
    end 
   

    private 
    def user_login_params 
        params.require(:user).permit(:username, :password)
    end
end