class ActionDefinition < ApplicationRecord
  belongs_to :group_definition, foreign_key: 'gduuid', primary_key: "uuid"
end
