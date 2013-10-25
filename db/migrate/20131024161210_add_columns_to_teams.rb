class AddColumnsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :league, :string
    add_column :teams, :league_id, :integer
  end
end
