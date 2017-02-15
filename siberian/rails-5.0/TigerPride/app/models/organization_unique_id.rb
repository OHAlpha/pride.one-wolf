class OrganizationUniqueId < UniqueId
    def record_class
        'Organization'
    end
    def record_field
        'organization'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end