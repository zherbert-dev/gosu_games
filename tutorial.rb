require 'gosu'

class Tutorial < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Tutorial Game"
  
        # background image/skin
        @background_image = Gosu::Image.new("media/space.png", :tileable => true)

        #inti player object
        @player = Player.new
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
        @background_image.draw(0, 0, 0)
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

Tutorial.new.show