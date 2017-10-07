require 'sinatra/base'
require 'pry'

class StoryLine < Sinatra::Base

  enable :sessions

  get '/' do
    session[:story] ||= Array.new(6)
    @story = session[:story]
    erb :index
  end

  post '/add_line' do
    session[:story][params[:idx].to_i] = params[:part]
    redirect '/'
  end

  run!
end
