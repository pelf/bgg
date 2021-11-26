require_relative './parser'

require 'open-uri'

module BGG
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
    }.merge(params)

    url = URI::HTTPS.build(host: 'boardgamegeek.com', path: '/search/boardgame', query: params.to_query)
    html = Nokogiri::HTML(URI.open(url))
    Parser.games(html)
  end
end
