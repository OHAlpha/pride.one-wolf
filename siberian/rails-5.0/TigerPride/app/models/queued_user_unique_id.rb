class QueuedUserUniqueId < UniqueId
    def record_class
        'QueuedUser'
    end
    def record_field
        'queued_user'
    end
    def key_size
        16
    end
    def before_save(record)
        generate(record)
    end
end