class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :object_id
      t.string :object_controller_name
      t.string :headline
      t.string :owner_id
      t.string :customer_id
      t.timestamps
    end
  end
end
