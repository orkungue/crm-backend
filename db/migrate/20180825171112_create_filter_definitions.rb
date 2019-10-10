class CreateFilterDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :filter_definitions do |t|
      t.string :uuid
      t.string :bduuid
      t.string :field_name
      t.string :field_type
      t.string :js_function
      t.timestamps
    end
  end
end
