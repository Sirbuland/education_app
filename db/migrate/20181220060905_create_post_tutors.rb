class CreatePostTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tutors do |t|
      t.integer :tutor_id
      t.integer :post_id
      t.boolean :flag, :default => true
    end
  end
end
