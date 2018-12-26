class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.references :user, foreign_key: true
      t.string :number,  null: false
      t.string :issuer,  null: false
      t.string :state,  null: false
      t.date :expiration,  null: false

      t.timestamps
    end
    add_index :recommendations, :number
    add_index :recommendations, :issuer
    add_index :recommendations, :state
  end
end
