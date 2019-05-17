class AddApplColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :appls, :checked, :boolean
  end
end
