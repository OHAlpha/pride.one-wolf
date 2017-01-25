class User < ApplicationRecord
  belongs_to :person
  has_many :auto_logins
  has_many :members
  has_many :groups, through: :members
  has_many :assignments
  has_many :roles, through: :assignments
  
  serialize :perm_override, Hash
  serialize :auxillary, Hash
  
  @@version = '1.0.0'
  
  @@data_1_0_0 = {
    client_salt_size: 16,
    server_salt_size: 32,
    iterations_min: 8000,
    iterations_max: 12000,
    pkcs5_key_length: 64,
    pkcs5_digest_method: 'OpenSSL::Digest.new("sha512")',
    hmac_digest_method: 'OpenSSL::Digest.new("sha512")',
    hmac_key: 'oalpha'
  }
  
  def self.version_data(key,version=@@version)
    case version
    when '1.0.0'
      data = @@data_1_0_0
    else
      data = @@data_1_0_0
    end
    data[key]
  end
  
  def self.ip_to_i(ip)
    if ip.is_a? String
      ip = ip.split('.').map { |s| s.to_i }
    end
    256*256*256*ip[0]+256*256*ip[1]+256*ip[2]+ip[3]
  end
  
  def self.seed_register(name,email,password,padd=0,prem=0,povr={},version=@@version)
    register = seed_passhash(password,version)
    create do |u|
      u.name = name
      u.email = email
      u.client_salt = register[:client_salt]
      u.server_salt = register[:server_salt]
      u.iterations = register[:iterations]
      u.passhash = register[:passhash]
      u.perm_override_add = padd
      u.perm_override_remove = prem
      u.perm_override = povr
      u.reg_date = Time.now.to_i
      u.reg_ip = ip_to_i '127.0.0.1'
    end
  end
  
  def self.seed_passhash(password,version=@@version)
    case version
    when '1.0.0'
      cs = SecureRandom.hex(version_data(:client_salt_size,version))
      ss = SecureRandom.hex(version_data(:server_salt_size,version))
      min = version_data(:iterations_min,version)
      max = version_data(:iterations_max,version)
      range = max - min
      it = min + SecureRandom.random_number( 1 + range )
      ch = OpenSSL::PKCS5.pbkdf2_hmac( password, cs, it, version_data(:pkcs5_key_length,version), eval(version_data(:pkcs5_digest_method,version))).each_byte.map { |b| b.to_s(16) }.join
      sh = OpenSSL::HMAC.hexdigest( eval(version_data(:hmac_digest_method,version)), version_data(:hmac_key,version), ch + ss )
      {client_salt: cs, server_salt: ss, iterations: it, passhash: sh}
    end
  end
  
  def self.register(name,email,salt,iterations,client_hash,ip,padd=0,prem=0,povr={},version=@@version)
    register = generate_passhash(client_hash,version)
    create do |u|
      u.name = name
      u.email = email
      u.client_salt = salt
      u.server_salt = register[:server_salt]
      u.iterations = iterations
      u.passhash = register[:passhash]
      u.perm_override_add = padd
      u.perm_override_remove = prem
      u.perm_override = povr
      u.reg_date = Time.now.to_i
      u.reg_ip = ip
    end
  end
  
  def self.generate_client_salt(version=@@version)
    case version
    when '1.0.0'
      cs = SecureRandom.hex(version_data(:client_salt_size,version))
      min = version_data(:iterations_min,version)
      max = version_data(:iterations_max,version)
      range = max - min
      it = min + SecureRandom.random_number( 1 + range )
      {client_salt: cs, iterations: it, key_size: version_data(:pkcs5_key_length,version)}
    end
  end
  
  def self.generate_passhash(client_hash,version=@@version)
    case version
    when '1.0.0'
      ss = SecureRandom.hex(version_data(:server_salt_size,version))
      sh = OpenSSL::HMAC.hexdigest( eval(version_data(:hmac_digest_method,version)), version_data(:hmac_key,version), client_hash + ss )
      {server_salt: ss, passhash: sh}
    end
  end
  
  def self.retrieve_client_salt(user_id,version=@@version)
    user = find(user_id)
    case version
    when '1.0.0'
      {user_id: user_id, client_salt: user.client_salt, iterations: user.iterations, key_size: version_data(:pkcs5_key_length,version)}
    end
  end
  
  def self.compare_passhash(user_id,client_hash,version=@@version)
    user = find(user_id)
    case version
    when '1.0.0'
      ss = user.server_salt
      sh = OpenSSL::HMAC.hexdigest( eval(version_data(:hmac_digest_method,version)), version_data(:hmac_key,version), client_hash + ss )
      sh == user.passhash
    end
  end
end
