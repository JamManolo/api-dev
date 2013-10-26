class CountriesController < ApplicationController

	def index
		@teams = Team.where(country: params[:country])
	end

	def show
		# @teams = Team.where(country: params[:country])
	end

end
