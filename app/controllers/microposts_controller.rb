class MicropostsController < ApplicationController
<<<<<<< HEAD
  before_action :signed_in_user, only: [:destroy, :create]
  before_action :correct_user,   only: :destroy
=======
  before_action :signed_in_user
 before_action :correct_user,   only: :destroy
>>>>>>> updating-users
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
<<<<<<< HEAD
      flash[:success] = "Микросообщение создано!"
=======
      flash[:success] = "Micropost created!"
>>>>>>> updating-users
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
<<<<<<< HEAD
=======
    flash[:success]="Deletetd"
>>>>>>> updating-users
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
<<<<<<< HEAD
  
  
    def correct_user
=======
   def correct_user
>>>>>>> updating-users
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
  
end
