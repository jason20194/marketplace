class AddCardToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :card, foreign_key: true
  end
end
