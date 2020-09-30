class FavoriteSerializer < ActiveModel::Serializer
    attributes :id, :location_id, :user_id
    belongs_to :location
    belongs_to :user
  end