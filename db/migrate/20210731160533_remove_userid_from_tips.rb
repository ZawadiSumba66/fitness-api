class RemoveUseridFromTips < ActiveRecord::Migration[6.1]
  def change
    remove_column :tips, :user_id, :integer
  end
end
