class StateSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :country
  has_many :cities
end
