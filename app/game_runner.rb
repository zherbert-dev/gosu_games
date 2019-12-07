require "player"
require "star"
require "tutorial"

module GameRunner

  def self.init
    begin
      $game = SimplelogicaTheGame::Tutorial.new
      $game.begin!
    rescue Interrupt => e
      puts "\r Something goes wrong! :("
    end
  end

end

SimplelogicaTheGame.init