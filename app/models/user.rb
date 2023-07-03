class User < ApplicationRecord
    @name
    @email
    @password

    def initialize(name, emial, password)

        @name = name
        @email = email
        @password = password

    end

    def to_s
        return @name + " " + @email + " " + @password
    end

end
