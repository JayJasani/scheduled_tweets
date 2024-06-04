class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :authenticate_user!

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  private
  def authenticate_user!
    redirect_to sign_in_path unless Current.user 
  end

end
