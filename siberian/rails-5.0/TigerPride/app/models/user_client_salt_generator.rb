class UserClientSaltGenerator
  def initialize(version=UserAuthenticationData.current_version)
    case version
    when '1.0.0'
      cs = SecureRandom.hex(UserAuthenticationData.version_data(:client_salt_size,'1.0.0'))
      puts "UserClientSaltGenerator.cs initialized to: " + cs.to_s
      min = UserAuthenticationData.version_data(:iterations_min,'1.0.0')
      puts "UserClientSaltGenerator.min initialized to: " + min.to_s
      max = UserAuthenticationData.version_data(:iterations_max,'1.0.0')
      puts "UserClientSaltGenerator.max initialized to: " + max.to_s
      range = max - min
      puts "UserClientSaltGenerator.range initialized to: " + range.to_s
      it = min + SecureRandom.random_number( 1 + range )
      puts "UserClientSaltGenerator.it initialized to: " + it.to_s
      @salt = cs
      puts "UserClientSaltGenerator.@salt initialized to: " + @salt
      @iterations = it
      puts "UserClientSaltGenerator.@iterations initialized to: " + @iterations.to_s
      @size = UserAuthenticationData.version_data(:pkcs5_key_length,'1.0.0')
      puts "UserClientSaltGenerator.@size initialized to: " + @size.to_s
      h = {
        salt: @salt,
        iterations: @iterations,
        size: @size
      }
      puts "UserClientSaltGenerator initialized to: " + h.to_s
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
  def to_hash(user=nil)
    if not user.nil?
      user.salt = @salt
      user.iterations = @iterations
      user.save
    end
    {
      salt: @salt,
      iterations: @iterations,
      size: @size
    }
  end
end