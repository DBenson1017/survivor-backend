class AirSerializer < ActiveModel::Serializer
  attributes :id, :air_quality, :quality_code, :quality_index, :city, :state
  has_one :location
end
