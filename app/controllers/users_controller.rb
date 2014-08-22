class UsersController < ApplicationController
<<<<<<< HEAD
  
  before_action :signed_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Данные успешно обновлены!"
      redirect_to @user
    else
      render 'edit'
    end    
  end
  
  
=======
  before_action :signed_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def index
    @users = User.paginate(page: params[:page])
  end
>>>>>>> updating-users
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
<<<<<<< HEAD
  
  def new
    @user = User.new
  end
  
=======
  def update

    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
   end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
    def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
>>>>>>> updating-users
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Twitter!"
      redirect_to @user
    else
      render 'new'
   end
  end
<<<<<<< HEAD
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален."
    redirect_to users_url
  end
  
  
  private
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  
=======


    private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
# Before filters

    
>>>>>>> updating-users
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
<<<<<<< HEAD
  
end
=======
   end
>>>>>>> updating-users
