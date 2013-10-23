#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'nokogiri'

def doit
	xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))

  f = open("xmlsoccer-league-map.rb", "w")
  f.puts '@xmlsoccer_league_map = {'
  xml_doc.xpath("//League").each do |node|
  	f.puts "\"#{node.xpath("Name").text}\" => \"#{node.xpath("Id").text}\","
  end
  f.puts '}'
  f.close
end

doit