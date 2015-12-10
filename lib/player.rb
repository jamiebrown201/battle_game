class Player
  DEFAULT_HP = 100
  attr_reader :name, :hp

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = 100
  end

  def receive_damage
    @hp -= Kernel.rand(60)
  end

end
