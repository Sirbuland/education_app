class AddAdminIdToCredits < ActiveRecord::Migration[5.1]
  def change
    add_column :credits, :admin_id, :integer, foreign_key: true
    add_index :credits, :admin_id
  end
end
