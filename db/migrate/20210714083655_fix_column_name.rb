class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :tips, :name, :title
  end
end
