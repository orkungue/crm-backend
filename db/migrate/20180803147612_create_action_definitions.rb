class CreateActionDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :action_definitions do |t|
      t.string :name
      t.string :link_attributes
      t.string :uuid
      t.string :gduuid
      t.string :js_function
      t.string :href

      t.timestamps
    end
  end
end
