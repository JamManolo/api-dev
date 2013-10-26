class Team < ActiveRecord::Base

	# COMPETITIONS = [15, 16, 17, 34, 35]
	# validates :league_id,    exclusion: { in: COMPETITIONS }

	# # validates :competitions, inclusion: { in: [15, 16, 17, 34, 35] }
	# validate :competition_check
	# # attr_accessible :competitions
	# serialize :competitions

	# protected

	# 	def competition_check
	# 		competitions.each do |c|
	# 			unless COMPETITIONS.include?(c)
	# 				errors.add(:competitions, "#{c} is not a valid competition")
	# 			end
	# 		end
	# 	end

end
