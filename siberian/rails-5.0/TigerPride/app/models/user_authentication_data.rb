class UserAuthenticationData
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
  
  def self.current_version
    @@version
  end
  
  def self.version_data(key,version=@@version)
    case version
    when '1.0.0'
      data = @@data_1_0_0
    else
      data = @@data_1_0_0
    end
    data[key]
  end
end