class UserAuthenticator
  def initialize(user)
    @user = user
  end
  
  def authenticate(client_hash)
    case @user.version
    when '1.0.0'
      sh = OpenSSL::HMAC.hexdigest( eval(UserAuthenticationData.version_data(:hmac_digest_method,'1.0.0')), UserAuthenticationData.version_data(:hmac_key,'1.0.0'), client_hash + @user.server_salt )
      @success = sh == @user.passhash
      if @success
        session[:user] = @user.user.id
        session[:account] = @user.account.id
      end
      @success
    end
  end
end