module SessionsHelper
<<<<<<< HEAD
=======

def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end
    end
>>>>>>> updating-users
    
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  
<<<<<<< HEAD
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
  def signed_in?
    !current_user.nil?
  end
  
=======
  def signed_in?
    !current_user.nil?
  end

>>>>>>> updating-users
  def current_user?(user)
    user == current_user
  end
  
  def current_user=(user)
    @current_user = user
  end

<<<<<<< HEAD
  
=======
>>>>>>> updating-users
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end