class Condition < ApplicationRecord
    belongs_to :card, required: false
end
