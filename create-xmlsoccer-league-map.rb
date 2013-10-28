#!/Users/jimcar/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -w
#coding:utf-8

require 'nokogiri'

def create_xmlsoccer_league_map
	xml_doc = Nokogiri::XML(open("./XML/AllLeagues.xml"))

  f = open("xmlsoccer-league-map.rb", "w")
  f.puts '@xmlsoccer_league_map = {'
  xml_doc.xpath("//League").each do |node|
  	f.puts "\"#{node.xpath("Name").text}\" => \"#{node.xpath("Id").text}\","
  end
  xml_doc.xpath("//League").each do |node|
  	f.puts "\"#{node.xpath("Id").text}\" => \"#{node.xpath("Name").text}\","
  end
  f.puts '}'
  f.close
end

create_xmlsoccer_league_map