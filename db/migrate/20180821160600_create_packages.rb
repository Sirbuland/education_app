class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.float :price
      t.float :total_number_of_characters
      t.float :total_credits
      t.string :bonus

      t.timestamps
    end
  end
end
