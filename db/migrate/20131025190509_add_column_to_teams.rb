class AddColumnToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :competitions, :text
  end
end
