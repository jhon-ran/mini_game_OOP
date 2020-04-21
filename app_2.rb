require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


@human
@enemies = []
@player1
@player2


def welcome_message
  puts "******************************"
  puts "*Welcome to this awesome game*"
  puts "* The goal is to stay alive  *"
  puts "******************************"
end

# Creates a custom new player
def create_player
  puts "Choose a player name"
  return @humann = HumanPlayer.new(gets.chomp)
end

def create_bots
  @player1 = Player.new("Josiane")
  @player2 = Player.new("José")
  @enemies << @player1
  @enemies << @player2 
end

# Game continues untill you die or the 2 bots die
def fight
  
  while @human.life_points > 0 && (@player1.life_points > 0 || @player2.life_points > 0)
    puts "Select an option."

    option == gets.chomp.to_s
    if option == "a"
      @human.search_weapon
    elsif option == "s"
      @human.search_health_pack
    elsif option == "0"
      @human.attacks(@player1)
    elsif option == "1"
      @human.attacks(@player2)
    elsif option == "2"
      puts "You are going to b attack by other players"
      @enemies.each { |i| i.life_points <= 0 ? break : i.attacks(@human)}
      @human.show_state
    else
      puts "**********Menu**************"
      puts "a - find a better weapon"
      puts "s - find more points of life" 
      puts "0 - attack player 1"
      puts "1 - attack player 2"
      puts "2 - claim your surprise"
      puts "****************************"
    end
  end
  puts "Game over"
  puts "You won"
end


def perform
  welcome_message
  create_player
  create_bots
  fight
end

perform

binding.pry
