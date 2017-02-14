class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def root
    redirect_to signin_path
  end
  
  def join
    @user_id = params[:user]
    @user = QueuedUser.where(queued_user: @user_id).first
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
  
  def redirect_url
    if params[:url].nil?
      dashboard_path
    else
      params[:url]
    end
  end
end
