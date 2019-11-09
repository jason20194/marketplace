class Listing < ApplicationRecord
    validates :price, numericality: { :less_than_or_equal_to => 999 }
    belongs_to :user, required: false
    has_many :cards, dependent: :destroy
end
