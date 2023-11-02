require "csv"
require_relative "recipe"

# TODO: Implement the Cookbook class that will be our repository
class Cookbook
  def initialize(csv_file_path)
    @path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def do!(recipe_index)
    @recipes[recipe_index].done = true
  end

  private

  def load_csv
    CSV.foreach(@path) do |row|
      rec = Recipe.new(*row)
      @recipes << rec
    end
  end

  def save_csv
    CSV.open(@path, "wb") do |csv|
      @recipes.each { |r| csv << [r.name, r.description, r.rating, r.prep_time] }
    end
  end
end
