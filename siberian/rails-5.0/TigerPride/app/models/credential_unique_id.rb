class CredentialUniqueId < UniqueId
    def record_class
        'Credential'
    end
    def record_field
        'credential'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end