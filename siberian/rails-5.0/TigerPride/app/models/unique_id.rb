class UniqueId
    def generate(record)
        r = SecureRandom.hex(self.key_size)
        while eval( "#{self.record_class}.exists? #{self.record_field}: r")
            r = SecureRandom.hex(self.key_size)
        end
        eval "record.#{self.record_field} = r"
    end
end