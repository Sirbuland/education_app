class AddNativeLanguageForStudentToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :native_language, :integer
  end
end
