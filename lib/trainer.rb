
class Trainer
  
  attr_accessor :name, :pokemon_owned
  
  def initialize(name)
    @name = name
    @pokemon_owned = []
  end
  
  def catch_pokemon(pokemon)
    puts "You throw a pokeball...You caught the wild pokemon!"
    @pokemon_owned << pokemon
  end
  
  def list_pokemon_by_name(trainer)
    trainer.pokemon_owned.each_with_index do |pokemon, index|
      puts "#{index +1}. #{pokemon.name}"
    end
  end
  
  
end