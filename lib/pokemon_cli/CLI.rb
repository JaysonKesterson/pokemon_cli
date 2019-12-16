
class CLI
  
  def initialize
    
  end
  
  
  def interaction
    welcome_trainer
    first_wild_pokemon
    catch_6_pokemon
    list_of_pokemon_team
    learn_more
  end
  
  def welcome_trainer
    puts "Welcome to the world of Pokemon, your journey as a Pokemon trainer begins today.What is your name?"
    trainer_name = gets.strip
    @trainer = Trainer.new(trainer_name)
  end
  
  
  def first_wild_pokemon
    puts "Welcome #{@trainer.name}! It is time for you to catch your first wild Pokemon and add it"
    puts "to your team!"
    puts "Pokemon can be found while searching in tall grass, type 'search'"
    puts "to find a Pokemon."
    input = gets.strip
    
    while input != "search"
      puts "You must search for wild pokemon to become a great trainer. Type 'search' to find a Pokemon to capture!"
      input = gets.strip
    end

      pokemon = API.generate_pokemon(@trainer)
      puts "You encountered a wild #{pokemon.name}!!"
      puts "Type 'pokeball' to attempt to capture the #{pokemon.name}."
      input = gets.strip
      
    while input != "pokeball"
      puts "Throw a pokeball by typing 'pokeball'!"
      input = gets.strip
    end
      @trainer.catch_pokemon(pokemon)
    end
  
  def catch_6_pokemon
    puts "Pokemon teams consist of 6 pokemon, once you have 6 pokemon you can learn more about them!"
    sleep(2)
    puts "If you are ready to catch 5 more pokemon to have a full team, type 'go'!"
    input = gets.strip
    
    while input != "go"
      puts "Whenever you are ready, type 'go' to catch 5 more Pokemon!"
      input = gets.strip
    end
    
    until @trainer.pokemon_owned.length == 6 do
      pokemon = API.generate_pokemon(@trainer)
      puts "You have caught #{@trainer.pokemon_owned.length} out of 6 pokemon!"
      sleep(2)
      puts "You encountered a wild #{pokemon.name}!!"
      @trainer.catch_pokemon(pokemon)
     end
  end
      
    def list_of_pokemon_team
      puts "Your Pokemon team consists of these 6 pokemon:"
      @trainer.list_pokemon_by_name
    end
    
    def learn_more
      puts "Type the index number next to the Pokemon you wish to learn more about, 'list' to see the list of pokemon again or 'exit' to leave."
      
      input = gets.strip
      
       
      until input == "exit" do
        
        if input == 'list'
          list_of_pokemon_team
          input = gets.strip
      
        elsif input.to_i.between?(1,6)
          @trainer.find_out_more(input.to_i)
          input = gets.strip
        
        else
          puts "Invalid input! Type an index number to learn about that pokemon, 'list' to see the list of pokemon owned or 'exit' to leave"
          input = gets.strip
        end
        
     end
       goodbye
    end
    
    def goodbye
      puts "Thanks for playing and learning more about Pokemon!"
    end
    
end



