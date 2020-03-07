 require "sinatra"
 require "sinatra/reloader"
 require "sinatra/activerecord"
  
set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/user'

get '/' do
 @users = User.all
 erb :user_list
end

get '/new' do
 erb :user_form
end 

get '/remove' do
 erb :user_delete
end 

post '/create' do
 user = User.new
 user.email = params[:email]
 user.save
 "User created. id: #{user.id}  email: #{user.email}"
end 


post '/delete' do
 user = User.find_by(email: params[:email])
 if !user.nil?
  user.destroy
  "User #{params[:email]} Deleted"
 else 
  "User #{params[:email]} Not Found"
 end 
end 

# once i have a name field, it should be:


# post '/create' do
#  user = User.new
# # user.name = params[:name]
#  user.email = params[:email]
#  user.save
#  "User created. id: #{user.id}  name: #{user.name}  email: #{user.email}"
# end 

# post '/delete' do
#  user = User.find_by(name: params[name])
#  if !user.nil?
#   user.destroy
#   "User #{params[:name]} Deleted"
#  else 
#   "User #{params[:name]} Not Found"
#  end 
# end 