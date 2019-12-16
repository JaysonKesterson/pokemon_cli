class API
  
  def self.generate_pokemon(trainer_obj)
      wild_pokemon = PokeApi.get(pokemon: rand(806)+1)
      pokemon = Pokemon.new(wild_pokemon.name,wild_pokemon.types[0].type.name,trainer_obj.name,wild_pokemon.abilities[0].ability.name)
  end
  
  
  
end