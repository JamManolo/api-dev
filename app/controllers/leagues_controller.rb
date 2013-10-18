class LeaguesController < ApplicationController

	def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @fixtures = Fixture.where(round: 1, league: @league.name)
    @teams = Array.new
    season = '1314'

   if @league.league_id == 3
    # xmlsoccer_client = XMLsoccerHTTP::RequestManager.new({
    #   api_key: JSON.parse(File.open('xmlsoccer_config.json').read)['api_key'],
    #   api_type: "Demo"
    # })
    
    # xml_doc = Nokogiri::XML(
    #   xmlsoccer_client.get_all_teams_by_league_and_season(params[:id], season).body)
    xml_doc = Nokogiri::XML(File.open("XML/Teams-league#{@league.league_id}-#{season}.xml").read)
    xml_doc.xpath("//XMLSOCCER.COM").first.add_namespace_definition(nil, "http://xmlsoccer.com/Team")
    namespace = 'xmlns:'

    xml_doc.xpath("//#{namespace}Team").each do |node|
      @teams << { team_id: node.xpath("#{namespace}Team_Id").text,
                  country: node.xpath("#{namespace}Country").text,
                  name: node.xpath("#{namespace}Name").text,
                  stadium: node.xpath("#{namespace}Stadium").text,
                  home_page_url: node.xpath("#{namespace}HomePageURL").text,
                  wiki_link: node.xpath("#{namespace}WIKILink").text }
      end

   end
  end
end
