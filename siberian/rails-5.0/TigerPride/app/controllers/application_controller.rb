class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  skip_before_action :require_login, only: [:root, :join, :signin]
  before_action :logged_in, only: [:root, :join, :signin]
  
  def root
    redirect_to signin_path
  end
  
  def join
    @user_id = params[:user]
    @user = QueuedUser.find_by queued_user: @user_id
    if @user_id.nil? or @user.nil?
      @user = QueuedUser.create
      redirect_to "#{join_path}?user=#{@user.queued_user}"
    end
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
 
  def require_login
    puts "require_login()"
    if session[:user].nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
  
  def logged_in
    puts "logged_in()"
    if not session[:user].nil?
      puts session[:user]
      redirect_to dashboard_path
    else
      puts "not logged in"
    end
  end
  
  def redirect_url
    if params[:url].nil?
      if params[:action] == 'join'
        signin_path
      else
        dashboard_path
      end
    else
      params[:url]
    end
  end
end
