class UserRegistrar
  def initialize(name,email,salt,iterations,client_hash,ip,padd=0,prem=0,povr={},version=nil)
    @name = name
    @email = email
    @salt = salt
    @iterations = iterations
    @client_hash = client_hash
    @ip = ip
    @padd = padd
    @prem = prem
    @povr = povr
    @version = version
  end
  
  def register
    passhash
    User.create do |u|
      u.name = @name
      u.email = @email
      u.client_salt = @salt
      u.server_salt = @server_salt
      u.iterations = @iterations
      u.passhash = @passhash
      u.perm_override_add = @padd
      u.perm_override_remove = @prem
      u.perm_override = @povr
      u.reg_date = Time.now.to_i
      u.reg_ip = @ip
    end
  end
  
  def passhash
    case version
    when '1.0.0'
      ss = SecureRandom.hex(UserAuthenticationData.version_data(:server_salt_size,@version))
      sh = OpenSSL::HMAC.hexdigest( eval(UserAuthenticationData.version_data(:hmac_digest_method,@version)), UserAuthenticationData.version_data(:hmac_key,@version), @client_hash + ss )
      @server_salt = ss
      @passhash = sh
    end
  end
end