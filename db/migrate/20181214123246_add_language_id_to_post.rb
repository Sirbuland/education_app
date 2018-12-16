class AddLanguageIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :language_id, :integer, foreign_key: true
    add_index :posts, :language_id

  end
end
