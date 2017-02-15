class GroupUniqueId < UniqueId
    def record_class
        'Group'
    end
    def record_field
        'group'
    end
    def key_size
        64
    end
    def before_create(record)
        generate(record)
    end
end