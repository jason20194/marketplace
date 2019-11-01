class Card < ApplicationRecord
    belongs_to :listing, required: false
    has_many :clans
    has_many :conditions
    has_many :orders
    has_one_attached :picture
end
