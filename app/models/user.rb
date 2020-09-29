class User < ApplicationRecord
    has_many :locations_users
    has_many :locations, :through :locations_users
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

end
