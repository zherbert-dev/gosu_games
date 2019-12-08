require_relative 'item'

class Weapon < Item
    module Type 
        RANGED = 'ranged'
        MELEE = 'melee'
    end
    
    def initialize(damage)
        super
        @damage = damage

        case name
        when name == 'sword' || name == 'axe' || name == 'staff'
            @type = Type::MELEE
        when name == 'bow'
            @type = Type::RANGED
        end
    end
end