class Clan < ApplicationRecord
    belongs_to :card, required: false
end
