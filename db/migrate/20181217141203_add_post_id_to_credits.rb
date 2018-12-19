class AddPostIdToCredits < ActiveRecord::Migration[5.1]
  def change
     add_column :credits, :post_id, :integer, foreign_key: true
    add_index :credits, :post_id
  end
end
