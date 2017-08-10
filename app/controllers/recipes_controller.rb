require 'pry'
class RecipesController < ApplicationController
  get "/recipes" do
    @all_recipes = Recipe.all
    erb :"recipes/index"
  end

  get "/recipes/new" do
    erb :"recipes/new"
  end

  post "/recipes" do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by(id: params[:id])
    erb :"recipes/edit"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find_by(id: params[:id])
    erb :"recipes/show"
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id/delete" do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect "/recipes"
  end
end