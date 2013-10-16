class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :name
      t.string :country
      t.string :stadium
      t.string :home_page_url
      t.string :wiki_link
      t.integer :data_file_id

      t.timestamps
    end
  end
end
