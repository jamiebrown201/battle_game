class Game
  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  def attack(player)
    player.receive_damage
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch
    @players.reverse!
  end

  def death_occurred?
    is_dead?(player_1) || is_dead?(player_2) ? true : false
  end

  private

  def is_dead?(player)
    player.hp <= 0
  end

end
