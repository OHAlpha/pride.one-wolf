class AutoLoginUniqueId < UniqueId
    def record_class
        'AutoLogin'
    end
    def record_field
        'auto_login'
    end
    def key_size
        64
    end
    def before_save(record)
        generate(record)
    end
end