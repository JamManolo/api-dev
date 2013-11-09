
require "json"

puts ' -- JSON.load "test_config.json" -- '
puts JSON.load(open("test_config.json"))
puts

puts '-- JSON.parse "test_config.json" -- '
puts JSON.parse(open("test_config.json").read)
puts

puts '-- JSON.dump( JSON.parse "test_config.json" ) -- '
puts JSON.dump(JSON.parse(open("test_config.json").read))
puts

puts '-- JSON.dump my-hash -- '
puts JSON.dump({
	"test-project-name"=>"free-fantasy-football-info",
	"test-bucket-name"=>"fff-info-files", 
	"test-bucket-name-aws"=>"fff-info-test"
})
puts

puts '-- JSON.dump "test_config.json" -- '
puts JSON.dump(open("test_config.json").read)
