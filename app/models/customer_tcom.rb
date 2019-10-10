class CustomerTcom < ActiveRecord::Base

  #acts_as_lockable()
  #acts_as_paranoid()
  #acts_with_userstamps()

  belongs_to(:customer)
  belongs_to(:tcom, :dependent => :destroy)

  def self.stand_alone
    true
  end
end
