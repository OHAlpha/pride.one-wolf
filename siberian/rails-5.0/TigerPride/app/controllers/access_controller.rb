class AccessController < ApplicationController
  def name_exists
    @user_id = params[:user]
    @user = QueuedUser.where(queued_user: @user_id).first
    @user.name = params[:name]
    #@user = User.where( name: params[:name]).first
    #@exists = ! @user.nil?
    if @user.save
      render text: 'valid'
    else
      render text: 'invalid'
    end
  end

  def email_exists
    @user_id = params[:user]
    @user = QueuedUser.where(queued_user: @user_id).first
    @user.email = params[:email]
    #@user = User.where( email: params[:email]).first
    #@exists = ! @user.nil?
    if @user.save
      render text: 'valid'
    else
      render text: 'invalid'
    end
  end

  def generate_salt
    @user_id = params[:user]
    @user = QueuedUser.where(queued_user: @user_id).first
    #@nuser = User.where( name: params[:name]).first
    #@euser = User.where( email: params[:email]).first
    #@success = @nuser.nil? and @euser.nil?
    #if @success
    if not @user.name.nil? and not @user.email.nil? and @user.valid?
      salt = UserClientSaltGenerator.new
      @salt = salt.to_hash(@user)
      puts @salt.to_s
    end
  end

  def register
    @user_id = params[:user]
    @user = QueuedUser.where(queued_user: @user_id).first
    #@nuser = User.where( name: params[:name]).first
    #@euser = User.where( email: params[:email]).first
    #@success = @nuser.nil? and @euser.nil?
    #if @success
    @user.transaction do
      if not @user.name.nil? and not @user.email.nil? and not @user.salt.nil? and not @user.iterations.nil? and @user.valid?
        @success = true
        UserRegistrar.new(params[:passhash], request.remote_ip, user: @user).register
      else
        @success = false
      end
    end
  end

  def user_data
    @nl = Login.where( name: params[:identifier]).first
    @el = Login.where( email: params[:identifier]).first
    @login = 
      if @nl.nil?
        @el
      else
        @nl
      end
    if not @login.nil?
      @account = @login.account
      @user = @account.user
      @person = @user.person
    end
  end

  def login
    @user = Login.find params[:user]
    @success = UserAuthenticator.new(@user).authenticate params[:passhash]
  end

  def logout
    session.delete :user
    session.delete :account
  end

  def deregister
  end
end
