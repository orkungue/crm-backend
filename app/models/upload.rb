class Upload < ApplicationRecord
    belongs_to(:customer)
    belongs_to(:document)
end
