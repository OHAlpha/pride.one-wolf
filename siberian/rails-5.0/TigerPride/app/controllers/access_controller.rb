class AccessController < ApplicationController
  def name_exists
    @user = User.where( name: params[:name]).first
    @exists = ! @user.nil?
    render 'exists'
  end

  def email_exists
    @user = User.where( email: params[:email]).first
    @exists = ! @user.nil?
    render 'exists'
  end

  def generate_salt
    @nuser = User.where( name: params[:name]).first
    @euser = User.where( email: params[:email]).first
    @success = @nuser.nil? and @euser.nil?
    if @success
      @salt = User.generate_client_salt
    end
  end

  def register
    @nuser = User.where( name: params[:name]).first
    @euser = User.where( email: params[:email]).first
    @success = @nuser.nil? and @euser.nil?
    if @success
      @user = User.register params[:name], params[:email], params[:salt], params[:iterations], params[:passhash], request.remote_ip
    end
  end

  def primary_name
  end

  def client_salt
    @nuser = User.where( name: params[:identifier]).first
    @euser = User.where( email: params[:identifier]).first
    @exists = ! ( @nuser.nil? and @euser.nil? )
    @user = 
      if @nuser.nil?
        @euser
      else
        @nuser
      end
    if @exists
      @salt = User.retrieve_client_salt @user.id
    end
  end

  def login
    @user = User.find params[:user_id]
    @success = User.compare_passhash @user.id, params[:passhash]
  end

  def logout
  end

  def deregister
  end
end
