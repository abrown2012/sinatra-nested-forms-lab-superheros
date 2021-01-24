require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    get '/' do 
        erb :root
    end 

    post '/teams' do 
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
  
        params[:team][:heros].each do |details|
          hero = Hero.new(details)
        end  
  
        @heros = Hero.all 
        
        erb :team
  
      end 

end
