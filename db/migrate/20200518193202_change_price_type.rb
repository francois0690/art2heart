class ChangePriceType < ActiveRecord::Migration[6.0]
  def change
    remove_column :pieces, :price, :string
    add_column :pieces, :price, :integer
  end
end
