class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :password
      t.string :email
      t.integer :phone
      t.boolean :is_driver?

      t.timestamps
    end
  end
end
