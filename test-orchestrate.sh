#!/bin/csh -f

# set echo

echo "WTF"

# curl -i "https://api.orchestrate.io/v0/soccer/leagues" -u"`cat o.io.txt`:"
# exit 0

curl -i "https://api.orchestrate.io/v0/leagues/01" \
  -v \
  -XPUT \
  -d'{ "league_id":"1","name":"English Premier League","country":"England", \
       "historical_data":"true","fixtures":"true","livescore":"true", \
       "number_of_matches":"5040","latest_match_date":"2013-11-03T17:00:00+01:00", \
       "latest_round":"0","final_round":"0","data_file_id":"0" }' \
  -H'Content-Type:application/json' \
  -u"`cat o.io.txt`:"


# curl -i "https://api.orchestrate.io/v0/leagues/league_id/1" \
#   -XPUT \
#   -d'{"league_id":"1","name":"league-1"}' \
#   -H'Content-Type:application/json' \
#   -u"`cat o.io.txt`:"

# curl -i "https://api.orchestrate.io/v0/leagues/20" \
#   -XPUT \
#   -d'{ "league_id":"20","name":"Major League Soccer","country":"USA", \
#   "historical_data":"true","fixtures":"true","livescore":"true", \
#   "number_of_matches":"313","latest_match_date":"2013-10-28T02:00:00+01:00", \
#   "latest_round":"0","final_round":"0","data_file_id":"0" }' \
#   -H'Content-Type:application/json' \
#   -u"`cat o.io.txt`:"


curl -i "https://api.orchestrate.io/v0/leagues/02" \
  -v \
  -XPUT \
  -d'{ \
"league_id":"2", \
"name":"English League Championship", \
"country":"England", \
"historical_data":"true", \
"fixtures":"true", \
"livescore":"true", \
"number_of_matches":"7434", \
"latest_match_date":"2013-11-02T16:00:00+01:00", \
"latest_round":"0", \
"final_round":"0", \
"data_file_id":"0" \
}' \
 -H'Content-Type:application/json' \
  -u"`cat o.io.txt`:" \
  --trace -
