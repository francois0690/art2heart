class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :piece, foreign_key: true
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
