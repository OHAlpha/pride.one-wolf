class AssignmentUniqueId < UniqueId
    def record_class
        'Assignment'
    end
    def record_field
        'assignment'
    end
    def key_size
        64
    end
    def before_save(record)
        generate(record)
    end
end