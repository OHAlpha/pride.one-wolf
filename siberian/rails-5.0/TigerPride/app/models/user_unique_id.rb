class UserUniqueId < UniqueId
    def record_class
        'User'
    end
    def record_field
        'user'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end