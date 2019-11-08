class Listing < ApplicationRecord
    belongs_to :user, required: false
    has_many :cards, dependent: :destroy
end
