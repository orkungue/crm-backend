class Document < ApplicationRecord
  has_many(:uploads)
  belongs_to(:customer)
  validates_presence_of(:doc_type)
  has_one(:document_note)

#  acts_as_views()

end
