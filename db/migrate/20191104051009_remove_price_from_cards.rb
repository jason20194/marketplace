class RemovePriceFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :price, :integer
  end
end
