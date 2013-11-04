@massively_confusing_file_hash =
{
  # ----- SOURCE XML (production data store) -----------------------------------------------------------
  # File: xmlsoccer-sources-all-xml-files.json
  # Desc:  'source-xml-files', XMLSoccerAPI-name.xml, 'soccer/raw-data'
  'source-xml' => { data_type: 'source', name_str: 'sources', group: 'all', file_type: 'xml', },

  # ----- APPLICATION XML (active data store) ----------------------------------------------------------
  # File: xmlsoccer-results-00-xml-files.json
  # Desc:  'result-xml-files', xmlsoccer-match-xxxxxx.xml, 'soccer/matches'
  'result-xml' => { data_type: 'result',  name_str: 'results', group: 'lid', file_type: 'xml', },

  # ----- XML (usage tbd) ------------------------------------------------------------------------------
  # File; xmlsoccer-leagues-all-xml-files.json
  # Desc:  'league-xml-files', xmlsoccer-league-00.xml, 'soccer/leagues'
  'league-xml' => { data_type: 'league', name_str: 'leagues', group: 'all', file_type: 'xml', },

  # File: xmlsoccer-teams-00-xml-files.json
  # Desc:  'team-xml-files', xmlsoccer-team-000.xml, 'soccer/teams'
  'team-xml' => { data_type: 'team', name_str: 'teams', group: 'lid', file_type: 'xml', },

  # File: xmlsoccer-teams-all-xml-files.json
  # Desc:  'team-xml-files', xmlsoccer-team-000.xml, 'soccer/teams'
  'team-all-xml' => { data_type: 'team', name_str: 'teams', group: 'all', file_type: 'xml', },

  # File: xmlsoccer-fixtures-00-xml-files.json
  # Desc:  'fixture-xml-files', xmlsoccer-fixture-xxxxxx.xml, 'soccer/fixtures'
  'fixture-xml' => { data_type: 'fixture', name_str: 'fixtures', group: 'lid', file_type: 'xml', },

  # ----- noDB DATA ------------------------------------------------------------------------------------
  # File: xmlsoccer-leagues-all-nodb-files.json
  # Desc:  'league-nodb-files', xmlsoccer-leagues-create-a1-records.json, 'soccer/nodb'
  #        'league-nodb-files', xmlsoccer-leagues-update-a1-records.json, 'soccer/nodb'
  'league-nodb' => { data_type: 'league', name_str: 'leagues', group: 'all', file_type: 'nodb', },

  # File: xmlsoccer-teams-all-nodb-files.json
  # Desc:  'team-nodb-files', xmlsoccer-teams-create-t1-records.json, 'soccer/nodb'
  'team-all-nodb' => { data_type: 'team', name_str: 'teams', group: 'all', file_type: 'nodb', },

  # File: xmlsoccer-teams-league-nodb-files.json
  # Desc:  'team-nodb-files', xmlsoccer-teams-00-create-t1-records.json, 'soccer/nodb'
  #        'team-nodb-files', xmlsoccer-teams-00-update-t1-records.json, 'soccer/nodb'
  'team-nodb' => { data_type: 'team', name_str: 'teams', group: 'league', file_type: 'nodb', },

  # File: xmlsoccer-fixtures-all-nodb-files.json
  # Desc:  'fixture-nodb-files', xmlsoccer-fixtures-00-create-f1-records.json, 'soccer/nodb'
  #        'fixture-nodb-files', xmlsoccer-fixtures-00-update-f1-records.json, 'soccer/nodb'
  #        'fixture-nodb-files', xmlsoccer-leagues-00-create-f1-records.json,  'soccer/nodb'
  #        'fixture-nodb-files', xmlsoccer-leagues-00-update-f1-records.json,  'soccer/nodb'
  'fixture-nodb' => { data_type: 'fixture', name_str: 'fixtures', group: 'all', file_type: 'nodb', },

  # File: xmlsoccer-results-all-nodb-files.json
  # Desc:  'result-nodb-files', xmlsoccer-fixtures-00-update-r1-records.json, 'soccer/nodb'
  'result-nodb' => { data_type: 'result', name_str: 'results', group: 'all', file_type: 'nodb', },

  # ----- Thank you ------------------------------------------------------------------------------------
}