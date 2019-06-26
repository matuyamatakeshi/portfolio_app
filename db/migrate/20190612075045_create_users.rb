class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :mail, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :mail, unique: true
    end
  end
end
