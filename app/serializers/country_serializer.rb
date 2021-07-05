class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name

  	has_many :states
	has_many :cities, through: :states
end
