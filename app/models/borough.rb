class Borough < ApplicationRecord
    has_many :borough_postcodes
    has_many :postcodes, through: :borough_postcodes
end
