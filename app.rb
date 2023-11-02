require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require_relative "cookbook"
require_relative "recipe"

get "/" do
  @book = Cookbook.new("recipes.csv")
  erb :index
end

get "/about" do
  erb :about
end

get "/new" do
  erb :form
end
