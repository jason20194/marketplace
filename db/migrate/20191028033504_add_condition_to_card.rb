class AddConditionToCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :condition, foreign_key: true, null:false
  end
end
