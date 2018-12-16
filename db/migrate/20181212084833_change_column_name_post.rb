class ChangeColumnNamePost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :orignal_text, :original_text
  end
end
