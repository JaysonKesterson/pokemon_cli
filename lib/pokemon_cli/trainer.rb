
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
  
  def list_pokemon_by_name
    pokemon_owned.each_with_index do |pokemon, index|
      puts "#{index +1}. #{pokemon.name}"
    end
  end
  
  def find_out_more(index)
    puts "This pokemon's species name is #{self.pokemon_owned[index-1].name}."
    puts "This pokemon's type is #{self.pokemon_owned[index-1].type}."
    puts "This pokemon's ability is #{self.pokemon_owned[index-1].ability}."
    puts "This pokemon's trainer is #{self.pokemon_owned[index-1].trainer}."
  end
  
  
end