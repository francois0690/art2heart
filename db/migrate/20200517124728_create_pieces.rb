class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :artist
      t.integer :price
      t.string :status
      t.string :category
      t.timestamps
    end
  end
end
