class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
    	t.text :description
    	t.timestamps
    end
  end
end
