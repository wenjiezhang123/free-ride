class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :sender_id
      t.string :receiver_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
