require 'ostruct'

class BoardGame < OpenStruct
  def to_s
    "#{rank} - #{title} (#{year}) [#{avg_rating}]"
  end
end
