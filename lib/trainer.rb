require 'poke-api-v2'
bulbasaur = PokeApi.get(pokemon: 'bulbasaur')
puts bulbasaur.methods