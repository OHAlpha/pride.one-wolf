class UserStates
    def self.lngibson
        {
            state: 0,
            status: 'lngibson'
        }
    end
    def self.seed_registered
        {
            state: 1,
            status: 'seed registered'
        }
    end
    def self.ok
        {
            state: 2,
            status: 'standard user'
        }
    end
    def self.must_validate
        {
            state: 3,
            status: 'must validate'
        }
    end
end