class AddSoldToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :sold, :boolean
  end
end
