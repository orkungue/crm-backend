class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :salt
      t.string :firstname
      t.string :lastname
      t.string :birth_day
      t.string :login_disabled
      t.string :eos_entity_id
      t.string :gender
      t.timestamps
    end
  end
end
