class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :name
      t.string :path
      t.boolean :has_corrections
      t.string :format
      t.string :data_store
      t.integer :data_store_id
      t.string :timestamp

      t.timestamps
    end
  end
end
