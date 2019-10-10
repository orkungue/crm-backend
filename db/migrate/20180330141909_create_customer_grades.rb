class CreateCustomerGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_grades do |t|
      t.string :name

      t.timestamps
    end
  end
end
