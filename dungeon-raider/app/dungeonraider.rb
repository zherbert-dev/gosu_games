require 'gosu'
require_relative 'bag'
require_relative 'food'
require_relative 'map'
require_relative 'monster'
require_relative 'player'
require "./lib/assets"

class DungeonRaider < Gosu::Window
    WIDTH, HEIGHT = 640, 480
    
    def initialize
      super WIDTH, HEIGHT
      self.caption = "Dungeon Explorer"

      #init menu
      #@menu = Menu.new(self) #instantiate the menu, passing the Window in the constructor
      #@menu.add_item(Gosu::Image.new(self, "item.png", false), 100, 200, 1, lambda { self.close }, Gosu::Image.new(self, "item_hover.png", false))
      #@menu.add_item(Gosu::Image.new(self, "item2.png", false), 100, 250, 1, lambda { puts "something" }, Gosu::Image.new(self, "item2_hover.png", false))

      #init map
      @map = Map.new("assets/dungeon_map.txt")

      #init player object
      @player = Player.new(@map, Assets::KNIGHT, 100, 10, 0)
      @player.warp(500, 500)
    
      #init camera
      @camera_x = @camera_y = 0

    end
  
    def update
        #fires 60 x per sec

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

        # Scrolling follows player
        @camera_x = [[@player.x - WIDTH / 2, 0].max, @map.width * 50 - WIDTH].min
        @camera_y = [[@player.y - HEIGHT / 2, 0].max, @map.height * 50 - HEIGHT].min
    end
  
    def draw
      Gosu.translate(-@camera_x, -@camera_y) do
        @map.draw
        @player.draw
      end
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