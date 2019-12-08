require 'gosu'
require_relative 'bag'
require_relative 'food'
require_relative 'monster'
require_relative 'player'
require "./lib/assets"

class DungeonRaider < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Dungeon Scroller"

        #init player object
        @player = Player.new(Assets::KNIGHT, 100, 10, 0)
        @player.warp(320, 240)
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