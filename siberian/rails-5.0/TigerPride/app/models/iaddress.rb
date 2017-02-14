class Iaddress
  def initialize(ip)
    @ip = 
      begin
        ip.split('.').map { |s| s.to_i }
      rescue
        begin
          ipi = Integer(ip)
          @ip = []
          (0..3).each do |i|
            @ip[i] = ipi % 256
            ipi = ipi / 256
          end
        rescue
          @ip = []
          (0..3).each do |i|
            @ip[i] = ip[i].to_i
          end
        end
      end
  end
  def to_i
    256*256*256*@ip[0]+256*256*@ip[1]+256*@ip[2]+@ip[3]
  end
end