class ModifyFixturesColumnType < ActiveRecord::Migration
  def up
  	remove_column :fixtures, :time_x
  	add_column    :fixtures, :time_x, :string
  end
end