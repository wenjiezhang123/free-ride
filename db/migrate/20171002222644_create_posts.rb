class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :driver
      t.string :from
      t.string :to
      t.datetime :start_time
      t.boolean :split_gas?

      t.timestamps
    end
  end
end
