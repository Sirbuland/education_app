class AddApplicationToPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :application, :boolean
  end
end
