class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  # index
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  # new
  get "/recipes/new" do
    @recipe = Recipe.new
    erb :new
  end

  # create
  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/articles/#{ @recipe.id }"
  end

  # show
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end
