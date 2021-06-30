class CreateTips < ActiveRecord::Migration[6.1]
  def change
    create_table :tips do |t|
      t.string :name
      t.text :description
      t.string :image
      t.text :benefits
      t.text :instructions
      t.integer :user_id
      t.timestamps
    end
  end
end
