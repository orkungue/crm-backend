class Customer < ApplicationRecord

#  require 'find_by_sql_view'

  #FindBySqlView::UseSqlView.final_redirect_url?
  #äbelongs_to :customer_grade, optional: true

  has_many(:customer_tcoms, { :dependent => :destroy })
  has_many(:uploads)
  has_many(:contact_people)
  has_many(:documents, { :dependent => :destroy })

  def uuid
    return 'Customer'+id.to_s
  end

end
