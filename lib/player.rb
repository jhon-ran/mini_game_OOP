
#require 'pry'

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



  
  # A new class for humans
  class HumanPlayer < Player
    attr_accessor :weapon_level

    # A human player starts with 100 pts of life & a weapon level of 1
    def initialize(name)
      super(name)
      @weapon_level = 1
      @life_points = 100
    end

    # It shows the current level of life
    def show_state
      puts "#{@name} has #{@life_points} points of life and a weapon of level of #{@weapon_level}"
    end

    # Randomly calculates damage of attack based on weapon
    def compute_damage
      rand(1..6) * @weapon_level
    end

    # Allows player to select a weapon
    def search_weapon
      new_weapon = rand(1..6)
      puts "You've found a level #{new_weapon} weapon"

      if new_weapon > @weapon_level
        @weapon_level = new_weapon
        puts "You're lucky, this weapon is more powerful than your current weapon. You select this one."
      else
        puts "This weapon is no better than what you had"
      end
    end

    # Allows player to get more life points
    def search_health_pack
      pack_of_life = rand(1..6)
    
      if pack_of_life == 1
        puts "You ain't find anything"
      elsif pack_of_life >= 2 && pack_of_life  <=5
        puts "Congrats! You've found 50 pts of life !"
      
      # To make sure life doesn't go above 100
      if @life_points >= 50
            @life_points = 100
      else
            @life_points = @life_points + 50
      end 

      else
        puts "Wow! You've found 80 pts of life !"
        # To make sure life doesn't go above 100
        if @life_points >= 20
          @life_points = 100
        else 
          @life_points = @life_points + 80
        end
      end

    end

   # binding.pry

  end 
