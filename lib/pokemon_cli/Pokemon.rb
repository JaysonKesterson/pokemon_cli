class Pokemon
  
  attr_accessor :type, :height, :weight, :trainer, :name
  
  def initialize(name,type,trainer,height,weight)
    @name = name
    @type = type
    @trainer = trainer
    @height = height
    @weight = weight
  end
end