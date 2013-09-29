class SoccerStatsController < ApplicationController
  def home
  end

  def index
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new(api_key: 'BTZXWQKMFDKHIBEYMIQWPENPKRZTPOGIMXGICHMGYXRIQGIJGY', 
  	 	                           api_type: "Demo")

  	 @leagues = xmlsoccer_client.get_all_leagues
  end

  def leagues
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new(api_key: 'BTZXWQKMFDKHIBEYMIQWPENPKRZTPOGIMXGICHMGYXRIQGIJGY', 
  	 	                           api_type: "Demo")

  	 @leagues = xmlsoccer_client.get_all_leagues
  end

  def scores
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new(api_key: 'BTZXWQKMFDKHIBEYMIQWPENPKRZTPOGIMXGICHMGYXRIQGIJGY', 
  	 	                           api_type: "Demo")

  	 @scores = xmlsoccer_client.get_live_score
  end

  def earliest_match_dates
  	xmlsoccer_client = 
  	 Xmlsoccer::RequestManager.new(api_key: 'BTZXWQKMFDKHIBEYMIQWPENPKRZTPOGIMXGICHMGYXRIQGIJGY', 
  	 	                           api_type: "Demo")

  	 @dates = xmlsoccer_client.get_earliest_match_date(3)
  end

end
