require_relative './board_game'

require 'nokogiri'
require 'active_support/core_ext/object'

module Parser
  def self.games(html)
    html.css('#collectionitems tr').map do |row|
      next if row.css('td').empty?

      title_attrs = parse_title(row)
      rating_attrs = parse_ratings(row)
      attrs = title_attrs.merge(rating_attrs, {
        rank: get_text(row, 'td.collection_rank'),
      })

      BoardGame.new(attrs)
    end.compact
  end

  def self.get_text(el, css)
    el.css(css).text.strip
  end

  def self.parse_title(el, css='td.collection_objectname')
    title, year, desc = get_text(el, css).lines.map(&:strip).select(&:present?)

    {
      title: title,
      year: parse_year(year),
      description: desc
    }
  end

  def self.parse_ratings(el, css='td.collection_bggrating')
    geek, avg, voters = el.css(css).map { |td| td.text.strip }

    {
      geek_rating: geek,
      avg_rating: avg,
      voters_rating: voters
    }
  end

  def self.parse_year(y)
    m = /\((\d+)\)/i.match(y)
    m.captures.first
  end
end
