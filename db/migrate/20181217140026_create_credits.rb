class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.integer :total_credits
      t.timestamps
    end
  end
end
