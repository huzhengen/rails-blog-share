class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://blog.com'
    mail(to: @user.email, subject: '欢迎您！')
  end
end
