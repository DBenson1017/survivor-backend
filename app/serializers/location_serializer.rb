class LocationSerializer < ActiveModel::Serializer
  attributes :id, :zip, :lon, :lat, :city, :state
end
