class AddCategoryIdToTutor < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :category_id, :integer, foreign_key: true
    add_index :users, :category_id

  end
end
