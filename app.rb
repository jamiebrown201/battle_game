require './lib/player'
require './lib/game'
require 'sinatra/base'

class Battle < Sinatra::Base
  configure do
    enable :sessions
  end


  get '/' do
      erb :index
    end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name], Player::DEFAULT_HP, params[:computer])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @player_1 = @game.player_1
    @player_2 = @game.player_2
    @game.attack(@player_2)
    erb :attack
  end

  post '/switch' do
    $game.switch
    redirect '/play'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
