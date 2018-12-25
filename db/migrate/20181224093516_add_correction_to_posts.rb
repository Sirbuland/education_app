class AddCorrectionToPosts < ActiveRecord::Migration[5.1]
  def change
        add_column :posts, :correction,:boolean, :default => false
  end
end
