class PermissionSetUniqueId < UniqueId
    def record_class
        'PermissionSet'
    end
    def record_field
        'permission_set'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end