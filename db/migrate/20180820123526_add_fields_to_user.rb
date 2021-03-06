class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :super_admin, :boolean, default: false
    add_column :users, :activated, :boolean, default: false
    add_column :users, :qualification, :string
    add_column :users, :specialization, :string
    add_column :users, :about_me, :text
  end
end
