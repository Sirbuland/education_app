class AddCategoryIdToPosts < ActiveRecord::Migration[5.1]
 def change
  	add_column :posts, :category_id, :integer, foreign_key: true
    add_index :posts, :category_id
  end
end

