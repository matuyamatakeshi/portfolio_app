class AddCnameColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cname, :string
  end
end
