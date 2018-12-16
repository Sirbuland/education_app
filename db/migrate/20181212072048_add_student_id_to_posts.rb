class AddStudentIdToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :student_id, :integer, foreign_key: true
    add_index :posts, :student_id
  end
end
