class CreateFieldDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :field_definitions do |t|
      t.string :name
      t.string :uuid
      t.string :bduuid
      t.string :field_name
      t.string :field_type
      t.string :template_path
      t.string :id_column
      t.string :value_column
      t.string :lookup
      t.integer :min
      t.integer :max
      t.boolean :is_required, default: false
      t.timestamps
    end
  end
end
