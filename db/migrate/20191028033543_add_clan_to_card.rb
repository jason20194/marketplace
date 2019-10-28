class AddClanToCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :clan, foreign_key: true
  end
end
