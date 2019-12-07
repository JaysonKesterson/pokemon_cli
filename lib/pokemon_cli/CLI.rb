
class CLI
  
  def self.interaction
    CLI.welcome_trainer
    CLI.first_wild_pokemon(@trainer)
    CLI.catch_6_pokemon(@trainer)
    CLI.list_of_pokemon_team(@trainer)
    CLI.learn_more(@trainer)
  end
  
  def self.welcome_trainer
    puts "Welcome to the world of Pokemon, your journey as a Pokemon trainer begins today.What is your name?"
    trainer_name = gets.strip
    @trainer = Trainer.new(trainer_name)
  end
  
  
  def self.first_wild_pokemon(trainer_obj)
    puts "Welcome #{trainer_obj.name}! It is time for you to catch your first wild Pokemon and add it"
    puts "to your team!"
    puts "Pokemon can be found while searching in tall grass, type 'search'"
    puts "to find a Pokemon."
    input = gets.strip
    
    while input != "search"
      puts "You must search for wild pokemon to become a great trainer. Type 'search' to find a Pokemon to capture!"
      input = gets.strip
    end
    
      wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
      pokemon = Pokemon.new(wild_pokemon.name,wild_pokemon.types[0].type.name,trainer_obj.name,wild_pokemon.abilities[0].ability.name)
      puts "You encountered a wild #{pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{pokemon.name}."
      input = gets.strip
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
      trainer_obj.catch_pokemon(pokemon)
    end
  
  def self.catch_6_pokemon(trainer_obj)
    puts "Pokemon teams consist of 6 pokemon, once you have 6 pokemon you can learn more about them!"
    sleep(2)
    puts "If you are ready to catch 5 more pokemon to have a full team, type 'go'!"
    input = gets.strip
    
    while input != "go"
      puts "Whenever you are ready, type 'go' to catch 5 more Pokemon!"
      input = gets.strip
    end
    
    until trainer_obj.pokemon_owned.length == 6 do
      wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
      pokemon = Pokemon.new(wild_pokemon.name,wild_pokemon.types[0].type.name,trainer_obj.name,wild_pokemon.abilities[0].ability.name)
      puts "You have caught #{trainer_obj.pokemon_owned.length} out of 6 pokemon!"
      sleep(2)
      puts "You encountered a wild #{pokemon.name}!!"
      trainer_obj.catch_pokemon(pokemon)
     end
  end
      
    def self.list_of_pokemon_team(trainer_obj)
      puts "Your Pokemon team consists of these 6 pokemon:"
      trainer_obj.list_pokemon_by_name(trainer_obj)
    end
    
    def self.learn_more(trainer_obj)
      puts "Type the index number next to the Pokemon you wish to learn more about, 'list' to see the list of pokemon again or 'exit' to leave."
      
      input = gets.strip
      
       
      until input == "exit" do
        
        if input == 'list'
        CLI.list_of_pokemon_team(@trainer)
        input = gets.strip
      
        elsif input.to_i.between?(1,6)
        trainer_obj.find_out_more(input.to_i)
        input = gets.strip
        
        else
        puts "Invalid input! Type an index number to learn about that pokemon, 'list' to see the list of pokemon owned or 'exit' to leave"
        input = gets.strip
      end
     end
       CLI.goodbye
    end
    
    def self.goodbye
      puts "Thanks for playing and learning more about Pokemon!"
    end
    
end



