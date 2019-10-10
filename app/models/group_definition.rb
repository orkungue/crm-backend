class GroupDefinition < ApplicationRecord
  has_many :block_definitions, foreign_key: "gduuid", primary_key: "uuid"
  has_many :action_definitions, foreign_key: "gduuid", primary_key: "uuid"
end
