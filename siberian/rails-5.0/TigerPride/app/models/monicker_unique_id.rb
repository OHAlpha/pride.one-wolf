class MonickerUniqueId < UniqueId
    def record_class
        'Monicker'
    end
    def record_field
        'monicker'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end