class CreatePurchasedPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :purchased_packages do |t|
      t.references :user, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
