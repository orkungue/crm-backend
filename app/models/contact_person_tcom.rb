class ContactPersonTcom < ActiveRecord::Base

  #acts_as_lockable()
  #acts_as_paranoid()
  #acts_with_userstamps()

  belongs_to(:contact_person)
  belongs_to(:tcom, :dependent => :destroy)

  validates_presence_of(:tcom)

  def self.stand_alone
    false
  end
end
