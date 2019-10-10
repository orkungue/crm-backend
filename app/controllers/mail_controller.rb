class MailController < ApplicationController
  def index
  end


  def new
    mail = Mail.new do
      from 'orkun.guenes.logoconsult@gmail.com'
      to       'guenes@logo-consult.com'
      subject  'Here is the image you wanted'
      body     "döfjkösdakfsdöalf"
    end
    mail.deliver!
  end
end
