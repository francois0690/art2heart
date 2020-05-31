class AddStatusToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :status, :string, default: 'demande'
  end
end
