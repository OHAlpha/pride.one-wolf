class RoleUniqueId < UniqueId
    def record_class
        'Role'
    end
    def record_field
        'role'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end