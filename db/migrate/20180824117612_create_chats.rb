class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :send_from
      t.string :send_to
      t.string :text
      t.timestamps
    end
  end
end
