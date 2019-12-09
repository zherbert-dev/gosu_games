class Player
  attr_reader :x, :y

  def initialize(map, sprite_skin, health, bag_capacity, items_count)
    @map = map
    @sprite_skin = sprite_skin
    @health = health
    @bag_capacity = bag_capacity
    @items_count = items_count
    @bag = Bag.new(@bag_capacity)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0

    # Load all animation frames
    # Implement later
    # refer to https://github.com/gosu/gosu-examples/blob/master/examples/cptn_ruby.rb
    # @standing, @walk1, @walk2, @jump = *Gosu::Image.load_tiles("media/cptn_ruby.png", 50, 50)
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def move_left
    @x -= 1.0 if can_fit?(-1, 0)
  end
  
  def move_right
    @x += 1.0 if can_fit?(1, 0)
  end

  def move_forward
    @y -= 1.0 if can_fit?(0, -1)
  end

  def move_backward
    @y += 1.0 if can_fit?(0, 1)
  end

  def draw
    @sprite_skin.draw_rot(@x, @y, 1, @angle)
  end

  #HELPERS
  
  # Could the object be placed at x + offs_x/y + offs_y without being stuck?
  def can_fit?(offs_x, offs_y)
    # Check at the center/top and center/bottom for map collisions
    not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x, @y + offs_y - 45)
  end

  def add_item_to_bag(item)
    if @items_count < @bag_capacity
      @bag.add_item(item)
    end
  end

  def consume_item(food_item)
    addable_health = food_item.health_points
    if adable_health + @health > 100
      @health = 100
    else
      @health += addable_health
    end
  end
end