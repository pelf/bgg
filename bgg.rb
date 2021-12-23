require_relative './parser'

require 'open-uri'

module BGG
  PARAMS_MAPPING = {
    'name'  => 'geekitemname',
    'sort'  => 'sort',
    'advanced'  => 'advsearch',
    'year_min'  => 'range[yearpublished][min]',
    'year_max'  => 'range[yearpublished][max]',
    'players_min'  => 'range[minplayers][max]',
    'players_max'  => 'range[maxplayers][min]',
    'player_range_type'  => 'playerrangetype',
    'rating_min'  => 'floatrange[avgrating][min]',
    'rating_max'  => 'floatrange[avgrating][max]',
    'weight_min'  => 'floatrange[avgweight][min]',
    'weight_max'  => 'floatrange[avgweight][max]',
    'voters_min'  => 'range[numvoters][min]',
    'weights_min'  => 'range[numweights][min]',
    'play_time_min'  => 'range[leastplaytime][min]',
    'play_time_max'  => 'range[playtime][max]',
    'exclude_types'  => 'nosubtypes[0]'
  }.freeze

  def self.search(params={})
    params = {
      'geekitemname' => '',
      'sort' => 'rank',
      'advsearch' => '1',
      'range[yearpublished][min]' => '',
      'range[yearpublished][max]' => '',
      'range[minplayers][max]' => '',
      'range[maxplayers][min]' => '',
      'playerrangetype' => 'normal',
      'floatrange[avgrating][min]' => '',
      'floatrange[avgrating][max]' => '',
      'floatrange[avgweight][min]' => '',
      'floatrange[avgweight][max]' => '',
      'range[numvoters][min]' => '',
      'range[numweights][min]' => '',
      'range[leastplaytime][min]' => '',
      'range[playtime][max]' => '',
      'nosubtypes[0]' => 'boardgameexpansion'
    }.merge(map(params))

    url = URI::HTTPS.build(host: 'boardgamegeek.com', path: '/search/boardgame', query: params.to_query)
    html = Nokogiri::HTML(URI.open(url))
    Parser.games(html)
  end

  def self.map(original_params)
    original_params.each_with_object({}) do |(key, value), mapped_params|
      mapped_key = PARAMS_MAPPING[key]
      mapped_params[mapped_key || key] = value
    end
  end
end

