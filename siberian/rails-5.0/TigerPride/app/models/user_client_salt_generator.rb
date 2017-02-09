class UserRegistrar
  def initialize(version=nil)
    case version
    when '1.0.0'
      cs = SecureRandom.hex(UserAuthenticationData.version_data(:client_salt_size,'1.0.0'))
      min = UserAuthenticationData.version_data(:iterations_min,'1.0.0')
      max = UserAuthenticationData.version_data(:iterations_max,'1.0.0')
      range = max - min
      it = min + SecureRandom.random_number( 1 + range )
      @salt = cs
      @iterations = it
      @size = UserAuthenticationData.version_data(:pkcs5_key_length,'1.0.0')
    end
  end
  def salt
    @salt
  end
  def iterations
    @iterations
  end
  def size
    @size
  end
end