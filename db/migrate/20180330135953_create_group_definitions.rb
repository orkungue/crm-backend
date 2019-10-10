class CreateGroupDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :group_definitions do |t|
      t.string :name
      t.string :uuid
      t.string :action
      t.string :model



      t.string :group_headline
      t.string :group_controller_name
      t.string :enabled
      t.string :unified_group_id
      t.string :group_type
      t.timestamps
    end
  end
end
