class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|
      t.references :user, foreign_key: true
      t.string :number, null: false
      t.string :state, null: false
      t.date :expiration, null: false

      t.timestamps
    end
    add_index :identifications, :number
    add_index :identifications, :state
  end
end
