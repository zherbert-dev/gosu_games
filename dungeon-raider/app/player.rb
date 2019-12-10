class Player
  attr_reader :x, :y

  def initialize(map, x, y, sprite_skin, health, bag_capacity, items_count)
    @map = map
    @health = health
    @bag_capacity = bag_capacity
    @items_count = items_count
    @bag = Bag.new(@bag_capacity)
    @score = 0

    #positional and direction initilization
    @x, @y = x, y
    @dir = :right
    
    # Load all animation/skin frames
    # refer to https://github.com/gosu/gosu-examples/blob/master/examples/cptn_ruby.rb
    # @standing, @walk1, @walk2 = *Gosu::Image.load_tiles("assets/sprite_skins.png", 50, 50)
    
    #set starting sprite frame
    # once the above is implemented this will change to @standing/@idle_down
    @cur_image = sprite_skin
  end

  def draw
    # Flip vertically when facing to the left.
    if @dir == :right
      offs_x = -25
      factor = 1.0
    else
      offs_x = 25
      factor = -1.0
    end
    @cur_image.draw(@x + offs_x, @y - 49, 0, factor, 1.0)
  end

  def update(move_x, move_y)
    # Select image depending on action
    # if (move_x == 0)
    #   @cur_image = @standing
    # else
    #   @cur_image = (Gosu.milliseconds / 175 % 2 == 0) ? @walk1 : @walk2
    # end
    # if (@vy < 0)
    #   @cur_image = @jump
    # end
    
    # Directional walking, horizontal movement
    if move_x > 0
      @dir = :right
      move_x.times { if can_fit?(1, 0) then @x += 1 end }
    end

    if move_x < 0
      @dir = :left
      (-move_x).times { if can_fit?(-1, 0) then @x -= 1 end }
    end

    if move_y > 0
      @dir = @dir
      move_y.times { if can_fit?(0, 0) then @y += 1 end }
    end

    if move_y < 0
      @dir = @dir
      (-move_y).times { if can_fit?(0, 0) then @y -= 1 end }
    end

  end

  ### HELPERS #####
  
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