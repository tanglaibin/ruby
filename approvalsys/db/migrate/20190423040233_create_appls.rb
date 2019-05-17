class CreateAppls < ActiveRecord::Migration[5.1]
  def change
    create_table :appls do |t|
      t.string :user_id
      t.string :title
      t.integer :state
      t.text :description

      t.timestamps
    end
  end
end
