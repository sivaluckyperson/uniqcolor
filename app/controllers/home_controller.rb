class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
 
  def index
    @user = User.new
    @latest_colors=User.where('sign_in_count > ?',0).order('id desc').limit(10)
  end
  def edit
   @user = current_user
  end
  def show
 
   @user = User.find_by_user_color(params[:home_perma_link])
      
  end
  def create
    @user = User.create( params[:user] )
  end
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:comment])
         flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(home_index_path) }
      end
    end
  end
  def upload_image
   @user = User.find(current_user.id)
   @user.update_attributes(params[:user])
   redirect_to root_path
  end
  def userdetails
   @user = current_user
  end

  def friend_invite
  Invite.welcome_email(current_user,params[:email],params[:color]).deliver
flash[:notice] = 'Friend invited successfully'
redirect_to root_path
  end
  
end

