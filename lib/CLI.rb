require 'poke-api-v2'
#require 'pry'
require_relative 'trainer'
class Cli
  
  @trainer = nil
  
  def self.interaction
    Cli.welcome_trainer
    Cli.first_wild_pokemon(@trainer)
  end
  
  def self.welcome_trainer
    puts "Welcome to the world of Pokemon, your journey as a Pokemon trainer begins today. What is your name?"
    trainer_name = gets.strip
    @trainer = Trainer.new(trainer_name)
  end
  
  def self.first_wild_pokemon(trainer_obj)
    puts "#{trainer_obj.name}, it is time for you to catch your first wild Pokemon and add it to your team!"
    puts "Pokemon can be found while searching in tall grass, type 'search' to find a Pokemon."
    input = gets.strip
    
    while input != "search"
      puts "You must search for wild pokemon to become a great trainer. Type 'search' to find a Pokemon to capture!"
      input = gets.strip
    end
    
      wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
      puts "You encountered a wild #{wild_pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{wild_pokemon.name}."
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
    trainer_obj.catch_pokemon(wild_pokemon)
  end
  
  def encounter_pokemon
    puts "If you would like to catch another pokemon, type 'encounter' to find another one!"
    input = gets.strip
    
    
    while input != "encounter"
      puts "You must search for wild pokemon to become a great trainer. Type 'encounter' to find a Pokemon to capture!"
      input = gets.strip
    end
    
    wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
      puts "You encountered a wild #{wild_pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{wild_pokemon.name}."
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
    trainer_obj.catch_pokemon(wild_pokemon)
  end
      
end



Cli.interaction


