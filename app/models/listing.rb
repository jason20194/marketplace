class Listing < ApplicationRecord
    belongs_to :user, required: false
    has_many :cards, dependent: :destroy
    accepts_nested_attributes_for :cards
end
