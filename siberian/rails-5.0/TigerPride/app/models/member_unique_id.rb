class MemberUniqueId < UniqueId
    def record_class
        'Member'
    end
    def record_field
        'member'
    end
    def key_size
        64
    end
    def before_save(record)
        generate(record)
    end
end