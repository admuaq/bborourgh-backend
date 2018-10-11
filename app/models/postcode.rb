class Postcode < ApplicationRecord
    has_many :borough_postcodes
    has_many :boroughs, through: :borough_postcodes
end
