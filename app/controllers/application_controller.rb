require './config/environment'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "scatter"
    register Sinatra::Flash
  end


  get '/' do
    erb :index
  end



  helpers do
   def logged_in?
     !!current_user
   end
   def current_user
     User.find_by(id: session[:user_id])
   end
 end

end
