class BlockDefinition < ApplicationRecord
  belongs_to :group_definition, foreign_key: 'gduuid', primary_key: "uuid"
  has_many :field_definitions, foreign_key: "bduuid", primary_key: "uuid"
  has_many :filter_definitions, foreign_key: "bduuid", primary_key: "uuid"
end
