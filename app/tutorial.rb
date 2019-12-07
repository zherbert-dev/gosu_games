require 'app/gosu'
require 'app/player'
require 'app/star'

class Tutorial < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Tutorial Game"
  
        # background image/skin
        @background_image = Gosu::Image.new("media/space.png", :tileable => true)

        #inti player object
        @player = Player.new
        @player.warp(320, 240)

        @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
        @stars = Array.new

        @font = Gosu::Font.new(20)
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
        @player.collect_stars(@stars)

        if rand(100) < 4 and @stars.size < 25
          @stars.push(Star.new(@star_anim))
        end
    end
  
    def draw
        @player.draw
        #redraw the background image every 60 secs
        #draw(x,y,z)
        @background_image.draw(0, 0, 0)

        @stars.each { |star| star.draw }

        @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)

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