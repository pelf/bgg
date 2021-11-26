require_relative './bgg'

puts 'Light & quick big-group games'
puts BGG.search({
  'range[minplayers][max]' => '6',
  'range[maxplayers][min]' => '8',
  'floatrange[avgrating][min]' => '7',
  'floatrange[avgweight][min]' => '1.2',
  'floatrange[avgweight][max]' => '2.0',
  'range[numvoters][min]' => '500',
  'range[numweights][min]' => '50',
  'range[playtime][max]' => '45',
})

puts 'Recent light-mid 2-player games'
puts BGG.search({
  'range[minplayers][max]' => '2',
  'range[maxplayers][min]' => '2',
  'floatrange[avgrating][min]' => '7',
  'floatrange[avgweight][min]' => '1.5',
  'floatrange[avgweight][max]' => '2.5',
  'range[numvoters][min]' => '500',
  'range[numweights][min]' => '50',
  'range[yearpublished][min]' => '2019',
})

puts '3-5-player coop games'
puts BGG.search({
  'range[minplayers][max]' => '3',
  'range[maxplayers][min]' => '5',
  'floatrange[avgrating][min]' => '7',
  'floatrange[avgweight][min]' => '1.2',
  'floatrange[avgweight][max]' => '2.5',
  'range[numvoters][min]' => '500',
  'range[numweights][min]' => '50',
  'propertyids[]' => '2023' # coop mechanic (can't be included as empty in base search)
})
