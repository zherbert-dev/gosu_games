require "./lib/sprites"

class Bag
    def initialize(capacity)
        Array.new(capacity)
    end

    def add_item(item)
        self.push(item)
    end
    
    def remove_item(item)
        self.pop(item)
    end
end

