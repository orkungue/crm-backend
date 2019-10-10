class ListGroupDefinition < ApplicationRecord
  belongs_to :block_definition, foreign_key: 'bduuid', primary_key: "uuid"
end
