require 'poke-api-v2'
class Cli
  
  def welcome_trainer
    puts "Welcome to the world of Pokemon, your journey as a Pokemon trainer begins today. What is your name?"
    trainer_name = gets.strip
    trainer = Trainer.new(trainer_name)
  end
  
  def first_wild_pokemon(trainer)
    puts "#{trainer.name}, it is time for you to catch your first wild Pokemon and add it to your team!"
    puts "Pokemon can be found while searching in tall grass, type 'search' to find a pokemon."
    input = gets.strip
    
    while input != "search"
      "You must search for wild pokemon to become a great trainer. Type search to find a Pokemon to capture!"
      input = gets.strip
    end
    
    if input == "search"
      wild_pokemon = PokeApi.get(pokemon: 'bulbasaur')
      puts "You encountered a wild #{pokemon.name}!!"
    else
    end
    
  end
  
  
  
  
  
  
  
end
