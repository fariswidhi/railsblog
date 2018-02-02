class UsersController < ApplicationController
  skip_before_action :require_valid_user!


  def new
  	
  	if !session[:user_id].blank?
  		redirect_to root_path
  		
  	end
  	
  		  	@user = User.new

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
