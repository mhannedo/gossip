require 'gossip'

class ApplicationController < Sinatra::Base
 
    attr_accessor :id 

    get '/' do
        erb :index, locals: {gossips: Gossip.all} 
    end

    get '/gossip/:id/' do
        
        erb :show, locals: {gossip: Gossip.find(params[:id].to_i),id: params[:id]}

    end

    get '/gossips/new/' do
        erb :new_gossip 
    end
       
    post '/gossips/new/' do
        Gossip.new(params["gossip_author"],params["gossip_content"] ).save
        redirect '/'
    end

    get '/gossips/:id/edit/' do 

        erb :edit, locals: {gossip: Gossip.find(params[:id].to_i),id: params[:id]}

    end

    post  '/gossips/:id/edit/' do 

        Gossip.update(params["gossip_author"],params["gossip_content"],params[:id])
        redirect '/'

    end


end