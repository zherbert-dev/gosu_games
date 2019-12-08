require 'gosu'
require_relative 'bag'
require_relative 'food'
require_relative 'monster'
require_relative 'player'
require_relative 'z-order'
require "./lib/sprites"


class DungeonRaider < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Dungeon Scroller"

        #inti player object
        @player = Player.new(Sprites::PLAYER, 100, 10, 0)
        @player.warp(320, 240)
    end
  
    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
          @player.turn_left
        end
    
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
          @player.turn_right
        end
    
        if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
          @player.accelerate
        end
        
        @player.move
    end
  
    def draw
        @player.draw
        #redraw the background image every 60 secs
        #draw(x,y,z)
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