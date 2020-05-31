require_relative 'model/test/test.rb'

require 'sinatra'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'

get "/" do
  @email = params["email"]

   erb:create, :locals => { host: request.host }
end

post "/" do 
  @email = params["email"]
  "This is the"
end

get '/admin' do
 erb:admin, :locals => { host: request.host }
end

get '/trips' do 
  erb:trips, :locals => { host: request.host }
end

require_relative 'console-implementation/ConsoleImplementation.rb'

ConsoleImplementation.new
