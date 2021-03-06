class SessionsController < ApplicationController

  skip_before_action :require_valid_user!, except: [:destroy]

  def new

  	if !session[:user_id].blank?
  		redirect_to root_path
  		
  	end
  end

  def create

  	# reset session
  	# reset_session
  	# cari user by email
  	@user = User.find_by(email: session_params[:email])

  	if @user && @user.authenticate(session_params[:password])
  		session[:user_id] =@user.id
  		flash[:success] = "Welcome Back!"
  		redirect_to articles_path
  	else
  		flash[:error] = "Sorry, Does Not Password"
  		redirect_to login_path
  	end
  end

  def destroy
  	reset_session
  end

  def session_params
  	params.require(:session).permit(:email,:password)
  	
  end
end
