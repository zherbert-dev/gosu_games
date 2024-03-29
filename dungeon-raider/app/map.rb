require "./lib/tiles"
require "./lib/assets"

class Map
    attr_reader :width, :height

    def initialize(map_file)
        # Load 60x60 tiles, 5px overlap in all four directions.
        @tileset = Gosu::Image.load_tiles("assets/temp_tileset.png", 60, 60, tileable: true)

        lines = File.readlines(map_file).map { |line| line.chomp }
        @height = lines.size
        @width = lines[0].size

        @tiles = Array.new(@width) do |x|
            Array.new(@height) do |y|
              case lines[y][x, 1]
              when '#'
                Tiles::WALL
              when '.'
                Tiles::PATH
              else
                nil
              end
            end
        end
    end

    def draw
        # Very primitive drawing function:
        # Draws all the tiles, some off-screen, some on-screen.
        @height.times do |y|
            @width.times do |x|
                tile = @tiles[x][y]
                if tile
                    # Draw the tile with an offset (tile images have some overlap)
                    # Scrolling is implemented here just as in the game objects.
                    @tileset[tile].draw(x * 50 - 5, y * 50 - 5, 0)
                end
            end
        end
    end

    # Solid at a given pixel position?
    def solid?(x, y)
        y < 0 || @tiles[x / 50][y / 50]
    end
end