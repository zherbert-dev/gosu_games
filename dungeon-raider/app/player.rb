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
  
  def move_left
    @x -= 1.0
  end
  
  def move_right
    @x += 1.0
  end

  def jump
    @y += 1.0
  end

  def land
    @y -= 1.0
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

  end
end