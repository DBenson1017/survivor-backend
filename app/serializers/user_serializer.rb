# class UserSerializer < ActiveModel::Serializer
class UserSerializer < ActiveModel::Serializer
    include FastJsonapi::ObjectSerializer 

    attributes :id, :username, :first_name, :last_name, :email, :zip
    has_many :favorites

    # attribute :favorites do |user|
    #   favorites_array = []
    #   user.favorites.each do |favorite|
    #     obj = {'location_id' => favorite.location_id}

    #     favorites_array << obj 
    #   end 
        
    #     favorites_array
    # end 
end
