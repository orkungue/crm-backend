class ContactPerson < ApplicationRecord
  belongs_to :customer

  has_many(:contact_person_tcoms, :dependent => :destroy)
end
