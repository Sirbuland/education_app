class ChangeColumnTotalCreditsInCredits < ActiveRecord::Migration[5.1]
  def change
    change_column :credits, :total_credits, :float
  end
end
