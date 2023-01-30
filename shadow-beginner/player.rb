class Player
  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      if warrior.health == 20 && warrior.look.map(&:to_s).any?('Captive')
        p warrior.look.map(&:to_s)
        warrior.walk!
      elsif warrior.feel.enemy?
        warrior.attack!
      elsif warrior.look.map(&:to_s).any?('Wizard') || warrior.look.map(&:to_s).any?('Archer')
          warrior.shoot!
      else
        if warrior.health <= 16
          warrior.rest!
        elsif warrior.feel.empty?
         if 20 >= warrior.health
         warrior.walk!
         else
         warrior.rest!
         end
        end
      end
    end
  end
end

