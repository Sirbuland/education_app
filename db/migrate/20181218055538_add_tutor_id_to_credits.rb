class AddTutorIdToCredits < ActiveRecord::Migration[5.1]
  def change
    add_column :credits, :tutor_id, :integer, foreign_key: true
    add_index :credits, :tutor_id
  end
end
