class Card < ApplicationRecord
    belongs_to :listing
    has_many :clans
    has_many :conditions
    has_many :orders
end
