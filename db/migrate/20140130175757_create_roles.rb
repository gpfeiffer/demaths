class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :profile_id
      t.string :profile_type

      t.timestamps
    end
  end
end
