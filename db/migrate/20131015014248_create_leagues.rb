class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :league_id
      t.string :name
      t.string :country
      t.boolean :historical_data
      t.boolean :fixtures
      t.boolean :livescore
      t.integer :number_of_matches
      t.string :latest_match_date
      t.integer :data_file_id

      t.timestamps
    end
  end
end
