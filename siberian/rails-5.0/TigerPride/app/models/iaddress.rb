class Iaddress
  def initialize(ip)
    @ip = 
      begin
        ip.split('.').map { |s| s.to_i }
      rescue
        begin
          ipi = Integer(ip)
          (0..3).collect do
            t = ipi % 256
            ipi = ipi / 256
            t
          end.reverse
        rescue
          @ip = []
          (0..3).map do |i|
            ip[i].to_i
          end
        end
      end
  end
  def to_i
    256*256*256*@ip[0]+256*256*@ip[1]+256*@ip[2]+@ip[3]
  end
end