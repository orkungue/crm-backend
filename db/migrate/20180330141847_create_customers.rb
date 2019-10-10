class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.text :comment
      t.integer :employees
      t.boolean :is_broke
      t.integer :customer_grade_id
      t.tinyint :customer_type_id

      t.timestamps
    end
  end
end
