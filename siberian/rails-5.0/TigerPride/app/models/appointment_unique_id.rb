class AppointmentUniqueId < UniqueId
    def record_class
        'Appointment'
    end
    def record_field
        'appointment'
    end
    def key_size
        64
    end
    def before_save(record)
        generate(record)
    end
end