class AccessController < ApplicationController
  skip_before_action :require_login
  
  def name_exists
    @user_id = params[:user]
    @user = QueuedUser.find_by queued_user: @user_id
    @user.name = params[:name]
    if @user.save
      render text: 'valid'
    else
      render text: 'invalid'
    end
  end

  def email_exists
    @user_id = params[:user]
    @user = QueuedUser.find_by queued_user: @user_id
    @user.email = params[:email]
    if @user.save
      render text: 'valid'
    else
      render text: 'invalid'
    end
  end

  def generate_salt
    @user_id = params[:user]
    @user = QueuedUser.find_by queued_user: @user_id
    if not @user.name.nil? and not @user.email.nil? and @user.valid?
      salt = UserClientSaltGenerator.new
      @salt = salt.to_hash(@user)
      if Rails.env.development?
        puts @salt.to_s
        Development::Register.create do |r|
          r.name = @user.name
          r.email = @user.email
          r.client_salt = @user.salt
          r.iterations = @user.iterations
        end
      end
    end
  end

  def register
    @user_id = params[:user]
    @user = QueuedUser.find_by queued_user: @user_id
    @user.transaction do
      if not @user.name.nil? and not @user.email.nil? and not @user.salt.nil? and not @user.iterations.nil? and @user.valid?
        @success = true
        if Rails.env.development?
          UserRegistrar.new(params[:passhash], request.remote_ip, user: @user, password: params[:password]).register
        else
          UserRegistrar.new(params[:passhash], request.remote_ip, user: @user).register
        end
      else
        @success = false
      end
    end
  end

  def user_data
    if not params[:identifier].nil? and params[:identifier] != ''
      puts "checking identifier"
      @ul = User.find_by name: params[:identifier]
      @nl = Account.find_by name: params[:identifier]
      @el = Login.joins(:email).find_by emails: {email: params[:identifier]}
    elsif not params[:name].nil? and params[:name] != ''
      puts "checking name"
      @ul = User.find_by name: params[:identifier]
      @nl = Account.find_by name: params[:name]
    elsif not params[:email].nil? and params[:email] != ''
      puts "checking email"
      @el = Login.joins(:email).find_by emails: {email: params[:email]}
    end
    puts "identifier: #{params[:identifier]}, name: #{params[:name]}, email: #{params[:email]}"
    puts "user: #{@ul}, name: #{@nl}, email: #{@el}"
    @login = 
      if not @ul.nil?
        @ul.main_account.primary_login
      elsif not @nl.nil?
        @nl.primary_login
      else
        @el
      end
    if not @login.nil?
      @account = @login.account
      @user = @account.user
      @person = @user.person
    end
  end

  def login
    @user = Login.find_by login: params[:user]
    @success = UserAuthenticator.new(@user).authenticate params[:passhash]
    if @success
      session[:user] = @user.user.id
      session[:account] = @user.account.id
    end
  end

  def logout
    session.delete :user
    session.delete :account
  end

  def deregister
  end
end
