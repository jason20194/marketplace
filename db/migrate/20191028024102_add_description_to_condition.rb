class AddDescriptionToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :description, :text
  end
end
