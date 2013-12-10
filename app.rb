###############################
### ROCK PAPER SCISSORS APP ###
###############################

require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/game.rb'

class RPS_App < Sinatra::Application
	get '/throw/:type' do
		my_user = params[:type].to_s
		new_game = Game.new(my_user)
		my_computer = new_game.computer
		@my_image = new_game.image
		@my_image_2 = new_game.image_2
		my_winner = new_game.winner
		@message = "You chose #{my_user}, huh? I chose #{my_computer} so #{my_winner}"
		erb :game
	end
end