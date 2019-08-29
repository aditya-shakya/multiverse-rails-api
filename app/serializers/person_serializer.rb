class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :power
  belongs_to :family
  belongs_to :universe
end
