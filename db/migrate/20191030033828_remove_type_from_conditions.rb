class RemoveTypeFromConditions < ActiveRecord::Migration[5.2]
  def change
    remove_column :conditions, :type
    add_column :conditions, :card_type, :string
  end
end
