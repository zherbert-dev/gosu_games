require "./lib/assets"
require 'gosu'
require_relative 'bag'
require_relative 'food'
require_relative 'monster'
require_relative 'player'

class DungeonRaider < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Dungeon Scroller"

        #init dungeon map
        @map = DungeonMap.new("assets/map/map.txt")
        
        #init player object
        @player = Player.new(Assets::PLAYER, 100, 10, 0)
        @player.warp(320, 240)

        #init camera
        @camera_x = @camera_y = 0
    end
  
    def update
        if Gosu.button_down? Gosu::KB_LEFT
          @player.move_left
        end
    
        if Gosu.button_down? Gosu::KB_RIGHT
          @player.move_right
        end
    
        if Gosu.button_down? Gosu::KB_UP 
          @player.move_forward
        end

        if Gosu.button_down? Gosu::KB_DOWN 
          @player.move_backward
        end

        #camera following player
        @camera_x = [[@player.x - WIDTH / 2, 0].max, @map.width * 50 - WIDTH].min
        @camera_y = [[@player.y - HEIGHT / 2, 0].max, @map.height * 50 - HEIGHT].min
    end
  
    def draw
      #fires 60 x per sec
      @player.draw
    end

    # Helpers
    def button_down(id)
        if id == Gosu::KB_ESCAPE
          close
        else
          super
        end
    end
end

DungeonRaider.new.show