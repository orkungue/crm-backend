class DocType < ApplicationRecord
  has_many(:documents, :dependent => :destroy)
end
