class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :report_id
      t.integer :fixture_match_id
      t.string :date
      t.integer :round
      t.string :league
      t.integer :league_id
      t.string :home_team
      t.integer :home_team_id
      t.string :away_team
      t.integer :away_team_id
      t.integer :data_file_id

      t.timestamps
    end
  end
end
