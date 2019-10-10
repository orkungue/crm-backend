class CreateBlockDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :block_definitions do |t|
      t.string :name
      t.string :blocktype
      t.string :uuid
      t.string :gduuid
      t.string :model
      t.string :template_path

      t.string :unified_block_id
      t.string :group_definition_id
      t.string :partial_path
      t.string :enabled
      t.string :partial_controller_name
      t.string :block_headline
      t.timestamps
    end
  end
end
