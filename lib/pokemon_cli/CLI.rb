
class CLI
  
  @trainer = nil
  
  def self.interaction
    CLI.welcome_trainer
    CLI.first_wild_pokemon(@trainer)
    CLI.decision
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
  
  def self.encounter_pokemon(trainer_obj)
    puts "If you are ready to catch another pokemon, type 'go' to find another one!"
    input = gets.strip
    
    
    while input != "go"
      puts "Whenever you are ready, type 'go' to find a Pokemon to capture!"
      input = gets.strip
    end
    
    wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
    binding.pry
      puts "You encountered a wild #{wild_pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{wild_pokemon.name}."
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
    trainer_obj.catch_pokemon(wild_pokemon)
  end
      
    def self.decision
      puts "if you would like to capture another pokemon, type 'encounter'"
      puts "if you would like to see a list of the pokemon you own, type 'list'."
      input = gets.strip
      
      while input != "encounter" #need to check for list too?
        puts "Type 'encounter' to find another pokemon, or 'list' to see a list of pokemon owned."
        input = gets.strip
      end
    
    if input == "encounter" 
    CLI.encounter_pokemon(@trainer)
    elsif input == "list"
    @trainer.list_pokemon_by_name(@trainer)
    end
    end
end



