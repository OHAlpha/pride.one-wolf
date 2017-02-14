class LoginUniqueId < UniqueId
    def record_class
        'Login'
    end
    def record_field
        'login'
    end
    def key_size
        64
    end
    def before_save(record)
        generate(record)
    end
end