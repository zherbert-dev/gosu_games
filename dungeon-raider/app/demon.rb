require_relative 'monster'

class Demon < Monster
    def initialize
        super
        @type = demon
    end
end