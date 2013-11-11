class CountriesController < ApplicationController

	def index
		if params[:country]
			@teams = Team.where(country: params[:country])
			render 'show'
		else
			countries = Array.new
			Team.all.each do |team|
				countries << team.country unless countries.include? team.country
			end

			@countries = Array.new
			countries.sort.each do |country|
				@countries << { name: country, link: countries_url(country: country) }
			end

		end
	end

end
