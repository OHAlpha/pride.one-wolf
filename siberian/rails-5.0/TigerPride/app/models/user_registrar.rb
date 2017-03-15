class UserRegistrar
  def initialize(client_hash,ip,options)
    @options = {
      padd: 0,
      prem: 0,
      povr: {},
      version: UserAuthenticationData.current_version
    }
    @options = @options.merge options
    if @options[:user].nil?
      @name = name
      @email = email
      @client_salt = salt
      @iterations = iterations
    else
      @name = @options[:user].name
      @email = @options[:user].email
      @client_salt = @options[:user].salt
      @iterations = @options[:user].iterations
    end
    @client_hash = client_hash
    @ip = ip
    @padd = @options[:padd]
    @prem = @options[:prem]
    @povr = @options[:povr]
    @version = @options[:version]
    if Rails.env.development?
      @password = @options[:password]
    end
  end
  
  def register
    passhash
    person = Person.create do |s|
      s.added_by = Account.admin
      s.state = PersonStates.registered_user[:state]
      s.status = PersonStates.registered_user[:status]
    end
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
      u.state = UserStates.must_validate[:state]
      u.status = UserStates.must_validate[:status]
    end
    account = user.accounts.create do |a|
      a.name = 'main'
      a.display = @name
    end
    person.added_by = account
    person.save
    account.create_credential do |c|
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
      l.version = @version
      l.primary = true
    end
    if Rails.env.development?
      r = Development::Register.find_by name: @name, email: @email
      r.password = @password
      r.client_hash = @client_hash
      r.server_salt = @server_salt
      r.server_hash = @passhash
      r.save
    end
    AccountMailer.welcome(user).deliver_later
    AccountMailer.validate(email).deliver_later
    user
  end
  
  def passhash
    case @version
    when '1.0.0'
      ss = SecureRandom.hex(UserAuthenticationData.version_data(:server_salt_size,@version))
      sh = OpenSSL::HMAC.hexdigest( eval(UserAuthenticationData.version_data(:hmac_digest_method,@version)), UserAuthenticationData.version_data(:hmac_key,@version), @client_hash + ss )
      @server_salt = ss
      @passhash = sh
    end
  end
end