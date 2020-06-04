class RenameEndStartToDateEndStart < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :end, :date_end
    rename_column :transactions, :start, :date_start
  end
end
