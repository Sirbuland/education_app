class CreateCategoryTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :category_teachers do |t|
    	t.integer :category_id
    	t.integer :teacher_id
    end
  end
end
