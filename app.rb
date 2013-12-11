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
		elsif user_input == "song"
			@song_list = Song.list
			erb :songs
		elsif user_input == "genre"
			@genre_list = Genre.list
			erb :genres
		end
	end

	get '/playlister/artist/:type' do
		user_artist = params[:type].to_s
		user_artist.downcase
		# remove special characters

		#  3.%20Adele
		# Adele

		# 90.%20Zoo%20Kid
		# Zoo Kid

		@l_songs = user_artist.list_songs
		erb :artists_song
	end

end