class AddListingToCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :listing, foreign_key: true
  end
end
