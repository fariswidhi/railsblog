class UsersController < ApplicationController
	skip_before_action :require_valid_user!
	# before_action :reset_session
  def new

  	if !current_user.nil?

  		redirect_to root_path
  	else
  		  	@user = User.new
  	end

  end

  def create

  	@user = User.new(user_params)

  	if @user.save
  		session[:user_id] = @user.id
  		flash[:success] = 'Sukses'
  		redirect_to root_path
  		
  	else
  		render :new
  	end
  end

  def user_params
  	params.require(:user).permit(:email,:password,:password_confirmation)
  	
  end
end
