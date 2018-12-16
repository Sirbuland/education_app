class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.text :orignal_text
    	t.text :edited_text
    	t.integer :status
    end
  end
end
