class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :price
      t.integer :total_number_of_characters
      t.integer :total_credits
      t.integer :bonus

      t.timestamps
    end
  end
end
