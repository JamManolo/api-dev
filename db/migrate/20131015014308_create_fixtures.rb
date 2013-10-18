class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :match_id
      t.string :date
      t.string :league
      t.integer :league_id
      t.integer :round
      t.string :home_team
      t.integer :home_team_id
      t.string :away_team
      t.integer :away_team_id
      t.string :location
      t.integer :report_id

      t.timestamps
    end
  end
end
