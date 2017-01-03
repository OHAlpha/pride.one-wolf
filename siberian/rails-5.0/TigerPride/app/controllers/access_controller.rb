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
  end

  def register
  end

  def primary_name
  end

  def client_salt
  end

  def login
  end

  def logout
  end

  def deregister
  end
end
