class SessionsController < ApplicationController
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end
  def new

  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:email])
       sign_in user
      redirect_to user
    else
      flash.now[:error] ="Неверный логин или пароль"
      render 'new'
  end
    def destroy
      sign_out
      redirect_to root_url
  end
