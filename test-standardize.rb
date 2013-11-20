require "nokogiri"
require "json"
require "./transform-utils"

puts "-- leagues --"
get_league_ids.each do |id|
	puts "'#{id}'"
  # puts standardize_id_str(id, :league)
end

# puts "-- teams --"
# get_team_ids.each do |id|
# 	break if id.to_i > 100
# 	puts id
#   puts standardize_id_str(id, :team)
# end

# puts "-- fixtures --"
# get_fixture_ids.sort.each do |id|
#   puts standardize_id_str(id, :fixture)
# end
# puts get_fixture_ids.length

# puts "-- results --"
# get_result_ids.sort.each do |id|
#   puts standardize_id_str(id, :fixture)
# end

# puts get_result_ids.length