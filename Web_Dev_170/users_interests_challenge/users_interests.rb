require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = YAML.load_file 'users.yaml'
end

helpers do
  def count_interests(users)
    users.values.reduce(0) do |sum, info|
      sum + info[:interests].size
    end
  end
end

get '/' do
  redirect "/users"
end

get "/users" do
  erb :home
end

get "/:user_name" do
  @name = params[:user_name]
  @email = @users[@name.to_sym][:email]
  @interests = @users[@name.to_sym][:interests]
  @other_users = @users.keys.reject { |name| name == @name.to_sym }

  erb :user
end
