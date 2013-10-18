class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

	def show
		@teams = Array.new
		@teams << Team.find(params[:id])
		@team = Team.find(params[:id])
	end

end
