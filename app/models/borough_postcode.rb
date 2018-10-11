class BoroughPostcode < ApplicationRecord
    belongs_to :postcode
    belongs_to :borough
end
