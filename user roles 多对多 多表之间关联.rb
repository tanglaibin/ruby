class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true
      t.timestamps
    end
  end
end

或这样实现：多对多  多表之间关联实现

class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
    add_index :user_roles, :user_id
    add_index :user_roles, :role_id
  end
end


