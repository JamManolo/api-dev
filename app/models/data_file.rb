class DataFile < ActiveRecord::Base
	validates :name, presence: true
	validates :path, presence: true
	# validates :has_corrections, presence: true
	validates :format, presence: true
	validates :data_store, presence: true, inclusion: { in: ['aws', 'google', 'rackspace'] }
	validates :data_store_id, presence: true
	validates :timestamp, presence: true									
end
