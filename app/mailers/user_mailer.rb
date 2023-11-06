class UserMailer < ApplicationMailer
  default from: 'sandy.3ahirwar@gmail.com'

	def welcome_email
  	  @user = params[:user]
      @url  = 'Link not initialized cause its just for testing'
      mail(to: @user.email, subject: 'Welcome to Linkedin')
	end

	def login_mail
	  @user = params[:user]
      @url  = 'Link not initialized cause its just for testing'
      mail(to: @user.email, subject: 'Welcome to Linkedin')
	end

end
