class AddUserIdToPackages < ActiveRecord::Migration[5.1]
  def change
    add_reference :packages, :user, foreign_key: true
  end
end
