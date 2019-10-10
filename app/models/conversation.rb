class Conversation < ActiveRecord::Base
 belongs_to :from, :foreign_key => :from
 belongs_to :to, :foreign_key => :to
has_many :mails, dependent: :destroy
validates_uniqueness_of :from, :scope => :to
scope :between, -> (from_id,to_id) do
 where("(conversations.from = ? AND conversations.to =?) OR (conversations.from = ? AND conversations.to =?)", to,from, from, to)
 end
end
