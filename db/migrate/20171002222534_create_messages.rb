class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :receiver
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
