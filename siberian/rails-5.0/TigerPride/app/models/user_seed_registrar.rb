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
    person = Person.create added_by: Account.admin
    es = @email.split '@'
    email = person.emails.create do |e|
      e.address = es[0]
      e.provider = es[1]
      e.primary = true
      e.added_by = Account.admin
    end
    user = User.create do |u|
      u.person = person
      u.name = @name
      #u.reg_date = Time.now.to_i
      u.reg_ip = Iaddress.new('127.0.0.1').to_i
      u.state = UserStates.seed_registered[:id]
      u.status = UserStates.seed_registered[:text]
    end
    account = user.accounts.create do |a|
      a.name = 'main'
    end
    account.credentials.create do |c|
      c.perm_override_add = @padd
      c.perm_override_remove = @prem
      c.perm_override = @povr
    end
    account.logins.create do |l|
      l.email = email
      l.client_salt = @client_salt
      l.server_salt = @server_salt
      l.iterations = @iterations
      l.passhash = @passhash
      l.primary = true
    end
    user
  end
  
  def passhash
    if @version.nil?
      @version = UserAuthenticationData.current_version
    end
    case @version
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