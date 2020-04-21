
require 'pry'

class Player
  attr_accessor :name, :life_points

  #Every player starts with 10 points
  def initialize(name)
    @name = name
    @life_points = 10
  end

  # It shows the current level of life
  def show_state
    puts "#{@name} has #{@life_points} points of life"
  end

  # It substracts points of life & shows remaining points
  def gets_damage(damage)
    @life_points = @life_points - damage

    if @life_points <= 0
      puts "Player #{@name} is dead!"
    #else
      #puts "#{@name} has #{@life_points} points of life"
    end 
  end

  # Player attacks other player
  def attacks(player)
    puts "#{self.name} attacks #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    puts "He was damaged with #{damage} points"
    puts "#{player.name} has now #{player.life_points} points of life"
  end

  # Randomly calculates damage of attack
  def compute_damage
    return rand(1..6)
  end

end