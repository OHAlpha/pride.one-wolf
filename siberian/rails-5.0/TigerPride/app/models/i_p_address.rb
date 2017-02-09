class IPAddress
  def initialize(ip)
    if ip.responds_to? :split
      @ip = ip.split('.').map { |s| s.to_i }
    else
      @ip = []
      (0..3).each do |i|
        @ip[i] = ip[i].to_i
      end
    end
  end
  def to_i
    256*256*256*@ip[0]+256*256*@ip[1]+256*@ip[2]+@ip[3]
  end
end