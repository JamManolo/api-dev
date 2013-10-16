#!/bin/csh -f

rails g controller DataFiles --no-test-framework
rails g model DataFile name:string \
                       path:string \
                       has_corrections:boolean \
                       format:string \
                       data_store:string \
                       data_store_id:integer \
                       timestamp:string

rails g controller Leagues --no-test-framework
rails g model League league_id:integer \
                     name:string \
                     country:string \
                     historical_data:boolean \
                     fixtures:boolean \
                     livescore:boolean \
                     number_of_matches:integer \
                     latest_match_date:string \
                     data_file_id:integer

rails g controller Teams --no-test-framework
rails g model Team   team_id:integer \
                     name:string \
                     country:string \
                     stadium:string \
                     home_page_url:string \
                     wiki_link:string \
                     data_file_id:integer 

rails g controller Fixtures --no-test-framework
rails g model Fixture match_id:integer \
                      date:string \
                      league:string \
                      league_id:integer \
                      round:integer \
                      home_team:string \
                      home_team_id:integer \
                      away_team:string \
                      away_team_id:integer \
                      location:string \
                      report_id:integer

rails g controller Reports --no-test-framework
rails g model Report report_id:integer \
                     fixture_match_id:integer \
                     date:string \
                     round:integer \
                     league:string \
                     league_id:integer \
                     home_team:string \
                     home_team_id:integer \
                     away_team:string \
                     away_team_id:integer \
                     data_file_id:integer












