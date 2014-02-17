class AddIrisUrlToMembers < ActiveRecord::Migration
  def change
    add_column :members, :iris_url, :string
  end
end
