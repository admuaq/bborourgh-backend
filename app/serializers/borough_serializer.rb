class BoroughSerializer < ActiveModel::Serializer
  attributes :id, :name, :postcodes, :towns
end
