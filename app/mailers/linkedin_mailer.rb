class LinkedinMailer < ApplicationMailer
  default from: 'sandy.3ahirwar@gmail.com'

  def greetings(user)
    # @url = 'Link not initialized'
    mail(to: user.email, subject: "Hi there, Come on yrrr!")
  end
  
end
