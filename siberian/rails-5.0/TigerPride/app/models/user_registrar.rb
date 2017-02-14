class UserRegistrar
  def initialize(name,email,salt,iterations,client_hash,ip,options)
    @options = {
      padd: 0,
      prem: 0,
      povr: {}
    }.merge options
    if @options.user.nil?
      @name = name
      @email = email
      @salt = salt
      @iterations = iterations
    else
      @name = @options[:user].name
      @email = @options[:user].email
      @salt = @options[:user].salt
      @iterations = @options[:user].iterations
    end
    @client_hash = client_hash
    @ip = ip
    @padd = @options[:padd]
    @prem = @options[:prem]
    @povr = @options[:povr]
    @version = @options[:version]
  end
  
  def register
    passhash
    person = Person.create
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
      u.reg_ip = @ip
      u.state = UserStates.must_validate[:id]
      u.status = UserStates.must_validate[:text]
    end
    account = user.accounts.create do |a|
      a.name = 'main'
    end
    person.added_by = account
    person.save
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
    AccountMailer.welcome(user).deliver_later
    AccountMailer.validate(email).deliver_later
    user
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