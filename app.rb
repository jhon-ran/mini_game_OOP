
require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

# Game continues untill one player dies
def fight (player1, player2)

  round = 0

  while player1.life_points > 0 && player2.life_points > 0
    round += 1
    puts "This is the current state of each player:"
    player1.show_state
    player2.show_state

    puts "\n"
    puts "ROUND #{round}...FIGHT!"
    player1.attacks (player2)

   
    if player2.life_points <= 0
      break
    end
    round += 1
    puts "\n"
    puts "ROUND #{round}...FIGHT!"
    player2.attacks (player1)

   
    if player2.life_points <= 0
      break
    end
    puts "\n"
    puts "------------------------"
    puts "------------------------"
    puts "\n"
  end
end


def perform
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  fight(player1, player2)
end

perform



binding.pry

