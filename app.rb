######################
### PLAYLISTER APP ###
######################
require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile

require './lib/artist.rb'
require './lib/genre.rb'
require './lib/song.rb'
require './lib/parser.rb'

class Playlister_App < Sinatra::Application

	before do 
		parse_directory("./data")
	end

	get '/playlister' do
		erb :playlister
	end

	get '/playlister/:type' do
		user_input = params[:type].to_s
		if user_input == "artist"
			@artist_list = Artist.list
			erb :artists
		end
	end

end