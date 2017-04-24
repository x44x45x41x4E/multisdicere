class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id, foreign_key: true
      t.references :messageable, polymorphic: true

      t.timestamps
    end
  end
end
