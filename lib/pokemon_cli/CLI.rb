
class CLI
  
  @trainer = nil
  
  def self.interaction
    CLI.welcome_trainer
    CLI.first_wild_pokemon(@trainer)
    CLI.catch_6_pokemon(@trainer)
    CLI.list_of_pokemon_team(@trainer)
    
    #CLI.decision
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
      pokemon = Pokemon.new(wild_pokemon.name,wild_pokemon.types,trainer_obj.name,wild_pokemon.height,wild_pokemon.weight)
      puts "You encountered a wild #{pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{pokemon.name}."
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
    trainer_obj.catch_pokemon(pokemon)
  end
  
  def self.catch_6_pokemon(trainer_obj)
    puts "If you are ready to catch another pokemon, type 'go' to find another one!"
    input = gets.strip
    
    puts "Pokemon teams consist of 6 pokemon, so lets catch 6 pokemon and then learn more about them!"
    
    while input != "go"
      puts "Whenever you are ready, type 'go' to find a Pokemon to capture!"
      input = gets.strip
    end
    
    until trainer_obj.pokemon_owned.length == 6 do
    wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
    pokemon = Pokemon.new(wild_pokemon.name,wild_pokemon.types,trainer_obj.name,wild_pokemon.height,wild_pokemon.weight)
      puts "You have #{trainer_obj.pokemon_owned.length} Pokemon in your team. Catch 6 pokemon!"
      puts "You encountered a wild #{pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{pokemon.name}."
      
      input = gets.strip
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
    trainer_obj.catch_pokemon(pokemon)
  end
end
      
    def self.list_of_pokemon_team(trainer_obj)
      puts "Your Pokemon team consists of these 6 pokemon:"
      trainer_obj.list_pokemon_by_name(trainer_obj)
    end
    
    def self.learn_more(trainer_obj)
      puts "Type the index number next to the Pokemon you wish to learn more about, or 'exit' to leave."
      
      input = gets.strip
      
      until input == "exit" do
      case input
      when "1"
        
      when "2"
        
      when "3"
        
      when "4"
        
      when "5"
        
      when "6"
      end
     end
    end
    
    def self.goodbye
      puts "Thanks for playing and learning more about Pokemon!"
    end
    
end



