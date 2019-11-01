class Order < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :card, required: false
end
