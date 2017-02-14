class UniqueId
    def generate(record)
        r = SecureRandom.hex(self.key_size)
        while not eval( "#{self.record_class}.where(queued_user: r).first.nil?")
            r = SecureRandom.hex(self.key_size)
        end
        eval "record.#{self.record_field} = r"
    end
end