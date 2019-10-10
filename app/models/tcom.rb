class Tcom < ActiveRecord::Base

  #acts_as_lockable()
  #acts_as_paranoid()
  #acts_with_userstamps()

  #validates_presence_of(:tcom)
  has_one(:customer_tcom)
  has_one(:contact_person_tcom)


  def self.stand_alone
    false
  end
end
