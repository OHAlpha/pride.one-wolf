class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def join
    @redirect_url = redirect_url
  end
  
  def signin
    @redirect_url = redirect_url
  end
  
  def signout
  end
  
  def leave
  end
  
  def welcome
  end
  
  def dashboard
  end
  
  def settings
  end
  
  private
  
  def redirect_url
    if params[:url].nil?
      dashboard_path
    else
      params[:url]
    end
  end
end
