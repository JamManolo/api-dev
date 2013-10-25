class AddColumnsToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :latest_round, :integer
    add_column :leagues, :final_round, :integer
  end
end
