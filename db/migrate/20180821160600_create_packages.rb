class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :price
      t.string :total_number_of_characters
      t.string :total_credits
      t.string :bonus

      t.timestamps
    end
  end
end
