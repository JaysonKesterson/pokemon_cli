class Pokemon
  
  attr_accessor :type, :trainer, :name, :ability
  
  def initialize(name,type,trainer,ability)
    @name = name
    @type = type
    @trainer = trainer
    @ability = ability
  end
end