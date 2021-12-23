require_relative './bgg'

puts 'Light & quick big-group games'
puts BGG.search({
  'players_min' => '6',
  'players_max' => '8',
  'rating_min' => '7',
  'weight_min' => '1.2',
  'weight_max' => '2.0',
  'voters_min' => '500',
  'weights_min' => '50',
  'play_time_max' => '45',
})

puts 'Recent light-mid 2-player games'
puts BGG.search({
  'players_min' => '2',
  'players_max' => '2',
  'rating_min' => '7',
  'weight_min' => '1.5',
  'weight_max' => '2.5',
  'voters_min' => '500',
  'weights_min' => '50',
  'year_min' => '2019',
})

puts '3-5-player coop games'
puts BGG.search({
  'players_min' => '3',
  'players_max' => '5',
  'rating_min' => '7',
  'weight_min' => '1.2',
  'weight_max' => '2.5',
  'voters_min' => '500',
  'weights_min' => '50',
  'propertyids[]' => '2023' # coop mechanic (can't be included as empty in base search)
})
