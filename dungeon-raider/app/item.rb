class Item
    module Type
        CONSUMABLE = 'consumable'
        WEAPON = 'weapon'
        ARMOR = 'armor'
        POTION = 'potion'
    end
    
    def initialize(name, type)
        @name = name
        @type = type
    end
end