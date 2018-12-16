class AddTutorIdToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :tutor_id, :integer, foreign_key: true
    add_index :posts, :tutor_id

  end
end
