class Player
  DEFAULT_HP = 100
  attr_reader :name, :hp, :computer
  alias_method :computer?, :computer

  def initialize(name, hp = DEFAULT_HP, computer = false)
    @name = name
    @hp = 100
    @computer = computer
  end

  def receive_damage
    @hp -= Kernel.rand(60)
  end

end
