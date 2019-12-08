require "./lib/assets"
require_relative 'item'

class Food < Item
    def initialize
        super
        case name
        when name == 'cheese'
            @food_skin = Assets::CHEESE
            @health_points = 5
        when name == 'grape'
            @food_skin = Assets::GRAPE
            @health_points = 5
        when name == 'green-apple'
            @food_skin = Assets::GREEN_APPLE
            @health_points = 5
        when name == 'shroom'
            @food_skin = Assets::SHROOM
            @health_points = 15
        when name == 'red apple'
            @food_skin = Assets::RED_APPLE
            @health_points = 20
        end

        def draw
        end
    end
end