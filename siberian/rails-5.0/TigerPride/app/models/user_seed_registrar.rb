class UserSeedRegistrar
  def initialize(name,email,password,padd=0,prem=0,povr={},version=nil)
    @name = name
    @email = email
    @password = password
    @padd = padd
    @prem = prem
    @povr = povr
    @version = version
  end
  
  def register()
    passhash
    User.create do |u|
      u.name = @name
      u.email = @email
      u.client_salt = @client_salt
      u.server_salt = @server_salt
      u.iterations = @iterations
      u.passhash = @passhash
      u.perm_override_add = @padd
      u.perm_override_remove = @prem
      u.perm_override = @povr
      u.reg_date = Time.now.to_i
      u.reg_ip = IPAddress.new('127.0.0.1').to_i
    end
  end
  
  def passhash
    case version
    when '1.0.0'
      cs = SecureRandom.hex(UserAuthenticationData.version_data(:client_salt_size,@version))
      ss = SecureRandom.hex(UserAuthenticationData.version_data(:server_salt_size,@version))
      min = UserAuthenticationData.version_data(:iterations_min,@version)
      max = UserAuthenticationData.version_data(:iterations_max,@version)
      range = max - min
      it = min + SecureRandom.random_number( 1 + range )
      ch = OpenSSL::PKCS5.pbkdf2_hmac( @password, cs, it, UserAuthenticationData.version_data(:pkcs5_key_length,@version), eval(UserAuthenticationData.version_data(:pkcs5_digest_method,@version))).each_byte.map { |b| b.to_s(16) }.join
      sh = OpenSSL::HMAC.hexdigest( eval(UserAuthenticationData.version_data(:hmac_digest_method,@version)), UserAuthenticationData.version_data(:hmac_key,@version), ch + ss )
      @client_salt = cs
      @server_salt = ss
      @iterations = it
      @passhash = sh
    end
  end
end