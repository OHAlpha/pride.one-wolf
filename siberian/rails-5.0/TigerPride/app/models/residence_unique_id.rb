class ResidenceUniqueId < UniqueId
    def record_class
        'Residence'
    end
    def record_field
        'residence'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end