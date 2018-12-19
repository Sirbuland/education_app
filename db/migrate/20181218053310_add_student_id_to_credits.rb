class AddStudentIdToCredits < ActiveRecord::Migration[5.1]
  def change
    add_column :credits, :student_id, :integer, foreign_key: true
    add_index :credits, :student_id
  end
end
