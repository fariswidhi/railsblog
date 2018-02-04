class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_valid_user!, except: [:home]


  def current_user
  	if !session[:user_id].blank?
  		@user ||=User.find(session[:user_id])
  		
  	end
  end

  def require_valid_user!
    if current_user.blank? 
      flash[:error] = 'You must be logged in to access that page!'
      redirect_to login_path
    end
  end

end
