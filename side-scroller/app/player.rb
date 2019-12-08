class Player
  def initialize(sprite_skin, health, bag_capacity, items_count)
    @sprite_skin = sprite_skin
    @health = health
    @bag_capacity = bag_capacity
    @items_count = items_count
    @bag = Bag.new(@bag_capacity)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @sprite_skin.draw_rot(@x, @y, 1, @angle)
  end

  #HELPERS
  def add_item_to_bag(item)
    if @items_count < @bag_capacity
      @bag.add_item(item)
    end
  end

  def consume_item(item)
    if item.cosumable? && @health < 100
    end
  end
end