class AddDefaultValueToSold < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :sold, :boolean, :default => false
  end
end
