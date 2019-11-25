class Pokemon
  
  attr_accessor :type, :ability, :trainer, :name
  
  def initialize(name,type,trainer,ability)
    @name = name
    @type = type
    @trainer = trainer
    @ability = ability
  end
end