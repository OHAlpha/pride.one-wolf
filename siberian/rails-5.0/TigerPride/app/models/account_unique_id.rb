class AccountUniqueId < UniqueId
    def record_class
        'Account'
    end
    def record_field
        'account'
    end
    def key_size
        64
    end
    def before_save(record)
        generate(record)
    end
end