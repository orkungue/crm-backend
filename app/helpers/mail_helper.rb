module MailHelper
  require 'mail'

  options = {
              :address =>              'smtp.gmail.com',
              :port =>                 587,
              :user_name =>            'orkun.guenes.logoconsult@gmail.com',
              :password =>             'ogu.djg_1994',
              :authentication       => 'plain',
              :enable_starttls_auto => true

            }



  Mail.defaults do
    delivery_method :smtp, options
  end

  Mail.deliver do
         to 'their@email.com'
       from 'your@email.com'
    subject 'test email'
       body 'This is a test.'
  end


end
