class PersonUniqueId < UniqueId
    def record_class
        'Person'
    end
    def record_field
        'person'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end