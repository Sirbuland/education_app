class CreateTagPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_posts do |t|
    	t.integer :tag_id
    	t.integer :post_id
    end
  end
end
