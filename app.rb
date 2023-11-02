require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require_relative "cookbook"
require_relative "recipe"

BOOK = Cookbook.new("recipes.csv")

get "/" do
  @book = BOOK
  erb :index
end

get "/about" do
  erb :about
end

get "/new" do
  @book = BOOK
  erb :form
  # binding.pry
end

post "/recipes" do
  @book = BOOK
  @book.create(@recipe)
end
