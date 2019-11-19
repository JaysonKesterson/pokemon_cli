
class Trainer
  
  attr_accessor :name, :team
  
  def initialize(name)
    @name = name
    @team = []
  end
  
  def catch_pokemon(pokemon)
    puts "You throw a pokeball...You caught the wild pokemon!"
    @team << pokemon
  end
  
  
end