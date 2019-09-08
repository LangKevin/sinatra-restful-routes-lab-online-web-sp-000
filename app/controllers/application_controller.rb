class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
# index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
# show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
end
