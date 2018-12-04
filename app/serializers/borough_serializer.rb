class BoroughSerializer < ActiveModel::Serializer
  attributes :id, :name, :averageIncomeBorough, :health, :happiness, :population, :education, :logoLink, :postcodes
end
